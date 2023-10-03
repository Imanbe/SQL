create or replace procedure AddP2P(
    Checked varchar,
    Checker varchar,
    TaskName varchar,
    State TaskStatus,
    TimeCurrent date
)
as $$
    declare
        lastCheckID int;
        currentTime time;
    begin
        if (Status == 'Start') then
            INSERT INTO Checks(Peer, Task, Date)
            VALUES (Checked, TaskName, current_date);
            SELECT LASTVAL() INTO lastCheckID;
        else
            SELECT Checks.id INTO lastCheckID
            FROM P2P
            JOIN Checks ON Checks.id = P2P.CheckID
            WHERE Checks.peer = Checked
                AND Checks.Task = TaskName
                AND P2P.CheckingPeer = Checker
            ORDER BY Checks.id
            LIMIT 1;
        end if;
    
    currentTime := time '00:00:00' + TimeCurrent;
    INSERT INTO P2P (CheckID, CheckingPeer, Status, Time)
    VALUES (lastCheckID, Checker, State, currentTime);
end;
$$ language plpgsql;

create or replace function CheckP2P()
    returns trigger
as $$
    declare
        lastCheckID int;
    begin
        SELECT LASTVAL() into lastCheckID;

        if new.Status = 'Start' then
            UPDATE TransferredPoints trp
            SET PointsAmount = PointsAmount + 1
            WHERE new.CheckingPeer = trp.checkingpeer
                AND Checks.Peer = trp.CheckedPeer;
                AND Checks.id = lastCheckID
        end if;
        return new;
    end;
$$ language plpgsql;

create trigger AfterInsertP2P after insert on P2P
for each row execute procedure CheckP2P();

create or replace procedure AddVerter(
    Checked varchar,
    TaskName varchar,
    State TaskStatus,
    TimeCurrent time
)
as $$
    declare
        lastCheckID int;
    begin
        lastCheckID := (SELECT c.id FROM P2P
            JOIN Checks c ON c.id = P2P.CheckID
            WHERE Checks.Task = TaskName
                AND Checks.Peer = Checked
                AND P2P.Status = 'Success'
                ORDER BY P2P.Time desc
                limit 1);
        INSERT INTO Verter(CheckID, Status, Time)
        VALUES (lastCheckID, State, TimeCurrent)
    end;
$$ language plpgsql;

create or replace function CheckXP()
    returns trigger
as $$
    declare
        maxXP int;
        Status TaskStatus;
        verterStatus TaskStatus;
    begin
        maxXP := (SELECT t.MaxXP
            FROM XP
            JOIN Checks ON Checks.id = XP.checkid
            JOIN Tasks t ON Checks.task = t.title
            limit 1);
        Status := (SELECT Status
            FROM P2P
            JOIN Checks ON Check.id = P2P.checkid
            JOIN P2P ON P2P.checkid = check.id
            limit 1);
        verterStatus := (SELECT Verter.status
            FROM Verter
            JOIN Checks ON checks.id = verter.checkid
            limit 1);
        if (new.xpamount <= maxXP and (Status == 'Success' and
                                    (verterStatus = 'Success' or
                                    (verterStatus != 'Failure' and verterStatus != 'Start') )) then
            return new;
        else
            return null;
        end if;
    end;
$$ language plpgsql;


create trigger BeforeInsertXP before insert on XP
for each row execute procedure CheckXP();

