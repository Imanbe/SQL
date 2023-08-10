-- list of ready tables
-- READY: 1, 2, 3, 4, 5, 6, 7
-- 
-- NEED TO THINK:

-- 1. Peers table 

create or replace procedure peers(fill boolean) as
$$
begin
    CREATE TABLE Peers
    (
        Nickname TEXT PRIMARY KEY,
        Birthday DATE NOT NULL
    );

    if (fill = true) then
        INSERT INTO Peers VALUES('Marcelit', '2003-08-14');
        INSERT INTO Peers VALUES('Tonitaga', '2002-12-27');
        INSERT INTO Peers VALUES('Grandpat', '1998-04-01');
        INSERT INTO Peers VALUES('Jerlenem', '2001-03-16');
        INSERT INTO Peers VALUES('Zoomdeni', '2000-06-23');
    end if;
end;
$$ language plpgsql;

-- 2. TaskStatus type

do
$create_enum$
begin
    CREATE TYPE TaskStatus AS ENUM
    (
        'Start',
        'Success',
        'Failure'
    );
exception
    when duplicate_object then null;
end;
$create_enum$;

-- 3. Tasks table

create or replace procedure tasks(fill boolean) as
$$
begin
    CREATE TABLE Tasks
    (
        Title TEXT PRIMARY KEY,
        ParentTask TEXT REFERENCES Tasks(Title),
        MaxXP int NOT NULL
    );

    if (fill = true) then
        INSERT INTO Tasks VALUES('C1', Null, '2200');
        INSERT INTO Tasks VALUES('C2', 'C1', '250');
        INSERT INTO Tasks VALUES('C3', 'C1', '750');
        INSERT INTO Tasks VALUES('C4', 'C2', '300');
        INSERT INTO Tasks VALUES('C5','C2', '350');
        INSERT INTO Tasks VALUES('C6', 'C5', '200');
        INSERT INTO Tasks VALUES('C7', 'C6', '650');
        INSERT INTO Tasks VALUES('C8', 'C7', '1043');

        INSERT INTO Tasks VALUES('DO1', 'C2', '300');
        INSERT INTO Tasks VALUES('DO2', 'DO1', '250');
        INSERT INTO Tasks VALUES('DO3', 'DO2', '350');
        INSERT INTO Tasks VALUES('DO4', 'DO3', '350');
        INSERT INTO Tasks VALUES('DO5', 'DO3', '300');
        INSERT INTO Tasks VALUES('DO6', 'DO5', '300');
        INSERT INTO Tasks VALUES('D0E-T', 'DO6', '200');

        INSERT INTO Tasks VALUES('CPP1', 'C8', '2200');
        INSERT INTO Tasks VALUES('CPP2', 'CPP1', '350');
        INSERT INTO Tasks VALUES('CPP3', 'CPP2', '600');
        INSERT INTO Tasks VALUES('CPP4', 'CPP3', '750');
        INSERT INTO Tasks VALUES('CPP6', 'CPP3', '800');
        INSERT INTO Tasks VALUES('CPP7', 'CPP4', '700');
        INSERT INTO Tasks VALUES('CPP8', 'CPP4', '450');
        INSERT INTO Tasks VALUES('CPP9', 'CPP3', '1000');
        INSERT INTO Tasks VALUES('CPPE', 'CPP7', '400');

        INSERT INTO Tasks VALUES('SQL1', 'C8', '1500');
        INSERT INTO Tasks VALUES('SQL2', 'SQL1', '500');
        INSERT INTO Tasks VALUES('SQL3', 'SQL2', '1500');
        
        INSERT INTO Tasks VALUES('A1', 'CPP4', '300');
        INSERT INTO Tasks VALUES('A2', 'A1', '400');
        INSERT INTO Tasks VALUES('A3', 'A2', '300');
        INSERT INTO Tasks VALUES('A4', 'A2', '350');
        INSERT INTO Tasks VALUES('A5', 'A2', '400');
        INSERT INTO Tasks VALUES('A6', 'A2', '700');
        INSERT INTO Tasks VALUES('A7', 'A2', '800');
        INSERT INTO Tasks VALUES('A8', 'A2', '800');
    end if;
end;
$$ language plpgsql;

-- 4. Checks table (1, 3)

create or replace procedure checks(fill boolean) as
$$
begin
    CREATE TABLE Checks
    (
        ID SERIAL PRIMARY KEY,
        Peer text REFERENCES Peers(Nickname),
        Task text REFERENCES Tasks(Title),
        Date DATE NOT NULL
    );

    if (fill = true) then
        INSERT INTO Checks(Peer, Task, Date) VALUES('Marcelit', 'C1', '2023-08-01');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'C1', '2023-08-04');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Tonitaga', 'C1', '2023-08-06');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Jerlenem', 'C1', '2023-08-08');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Grandpat', 'C1', '2023-08-09');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Marcelit', 'C2', '2023-08-10');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'C2', '2023-08-11');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Jerlenem', 'C2', '2023-08-12');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Tonitaga', 'C2', '2023-08-13'); 
        INSERT INTO Checks(Peer, Task, Date) VALUES('Grandpat', 'C2', '2023-08-14');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'C3', '2023-08-15');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Grandpat', 'DO1', '2023-08-17');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Tonitaga', 'DO1', '2023-08-18');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Grandpat', 'DO2', '2023-08-19');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Marcelit', 'C3', '2023-08-20');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Tonitaga', 'DO2', '2023-08-22');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Grandpat', 'DO3', '2023-08-23');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'C4', '2023-08-25');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Marcelit', 'C4', '2023-08-26');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Tonitaga', 'DO3', '2023-08-29');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'C5', '2023-09-05');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Marcelit', 'C5', '2023-09-07');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'C6', '2023-09-16');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Marcelit', 'C6', '2023-09-18');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'C7', '2023-09-23');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Marcelit', 'C7', '2023-09-29');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'C8', '2023-09-30');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Marcelit', 'C8', '2023-10-08');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'CPP1', '2023-10-15');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Marcelit', 'SQL1', '2023-10-16');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'SQL1', '2023-10-26');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Marcelit', 'CPP1', '2023-10-25');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'SQL2', '2023-11-01');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Marcelit', 'SQL2', '2023-11-06');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'SQL3', '2023-11-10');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'CPP2', '2023-11-14');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Marcelit', 'CPP2', '2023-11-24');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'CPP3', '2023-11-29');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Marcelit', 'CPP3', '2023-12-03');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'CPP4', '2023-12-12');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Marcelit', 'CPP4', '2023-12-15');
        INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'A1', '2023-12-20');
    end if;
end;
$$ language plpgsql;

-- 5. Check table depentions (2, 4)

create or replace procedure xp(fill boolean) as
$$
begin
    CREATE TABLE XP
    (
        ID SERIAL PRIMARY KEY,
        "Check" bigint REFERENCES Checks(ID),
        XPAmount int NOT NULL
    );

    if (fill = true) then
        INSERT INTO XP("Check", XPAmount) VALUES(1, 2200);
    end if;
end;
$$ language plpgsql;

create or replace procedure verter(fill boolean) as
$$
begin
    CREATE TABLE Verter
    (
        ID SERIAL PRIMARY KEY,
        "Check" bigint REFERENCES Checks(ID),
        "State" TaskStatus NOT NULL,
        Time TIME NOT NULL
    );

    if (fill = true) then
        INSERT INTO Verter("Check", "State", Time) VALUES(1, 'Start', '14:35');
        INSERT INTO Verter("Check", "State", Time) VALUES(1, 'Success', '14:40');

        INSERT INTO Verter("Check", "State", Time) VALUES(2, 'Start', '15:35');
        INSERT INTO Verter("Check", "State", Time) VALUES(2, 'Success', '15:40');

        INSERT INTO Verter("Check", "State", Time) VALUES(3, 'Start', '19:40');
        INSERT INTO Verter("Check", "State", Time) VALUES(3, 'Success', '19:43');

        INSERT INTO Verter("Check", "State", Time) VALUES(4, 'Start', '02:35');
        INSERT INTO Verter("Check", "State", Time) VALUES(4, 'Success', '02:40');

        INSERT INTO Verter("Check", "State", Time) VALUES(5, 'Start', '14:27');
        INSERT INTO Verter("Check", "State", Time) VALUES(5, 'Success', '14:30');

        INSERT INTO Verter("Check", "State", Time) VALUES(6, 'Start', '01:35');
        INSERT INTO Verter("Check", "State", Time) VALUES(6, 'Success', '01:40');

        INSERT INTO Verter("Check", "State", Time) VALUES(7, 'Start', '05:30');
        INSERT INTO Verter("Check", "State", Time) VALUES(7, 'Success', '05:40');

        INSERT INTO Verter("Check", "State", Time) VALUES(8, 'Start', '17:15');
        INSERT INTO Verter("Check", "State", Time) VALUES(8, 'Success', '17:21');

        INSERT INTO Verter("Check", "State", Time) VALUES(9, 'Start', '23:43');
        INSERT INTO Verter("Check", "State", Time) VALUES(9, 'Success', '23:45');

        INSERT INTO Verter("Check", "State", Time) VALUES(10, 'Start', '18:28');
        INSERT INTO Verter("Check", "State", Time) VALUES(10, 'Success', '18:35');

        INSERT INTO Verter("Check", "State", Time) VALUES(14, 'Start', '04:31');
        INSERT INTO Verter("Check", "State", Time) VALUES(14, 'Success', '04:34');

        INSERT INTO Verter("Check", "State", Time) VALUES(17, 'Start', '22:36');
        INSERT INTO Verter("Check", "State", Time) VALUES(17, 'Success', '22:40');

        INSERT INTO Verter("Check", "State", Time) VALUES(18, 'Start', '13:35');
        INSERT INTO Verter("Check", "State", Time) VALUES(18, 'Success', '13:45');

        INSERT INTO Verter("Check", "State", Time) VALUES(20, 'Start', '17:46');
        INSERT INTO Verter("Check", "State", Time) VALUES(20, 'Success', '17:50');
        
        INSERT INTO Verter("Check", "State", Time) VALUES(21, 'Start', '14:32');
        INSERT INTO Verter("Check", "State", Time) VALUES(21, 'Success', '14:35');

        INSERT INTO Verter("Check", "State", Time) VALUES(22, 'Start', '02:07');
        INSERT INTO Verter("Check", "State", Time) VALUES(22, 'Success', '02:10');

        INSERT INTO Verter("Check", "State", Time) VALUES(23, 'Start', '12:40');
        INSERT INTO Verter("Check", "State", Time) VALUES(23, 'Success', '12:51');

        INSERT INTO Verter("Check", "State", Time) VALUES(24, 'Start', '10:43');
        INSERT INTO Verter("Check", "State", Time) VALUES(24, 'Success', '10:48');

        INSERT INTO Verter("Check", "State", Time) VALUES(25, 'Start', '14:28');
        INSERT INTO Verter("Check", "State", Time) VALUES(25, 'Success', '14:32');

        INSERT INTO Verter("Check", "State", Time) VALUES(26, 'Start', '02:09');
        INSERT INTO Verter("Check", "State", Time) VALUES(26, 'Success', '02:14');

        INSERT INTO Verter("Check", "State", Time) VALUES(27, 'Start', '04:33');
        INSERT INTO Verter("Check", "State", Time) VALUES(27, 'Success', '04:51');
        


        -- 14, 17, 18, 20-27
    end if;
end;
$$ language plpgsql;

-- 6. Peers table depentions (1, 2)

create or replace procedure time_tracking(fill boolean) as
$$
begin
    CREATE TABLE TimeTracking
    (
        ID SERIAL PRIMARY KEY,
        Peer TEXT REFERENCES Peers(Nickname),
        Date DATE NOT NULL,
        Time TIME NOT NULL,
        "State" int CHECK ("State" = 1 OR "State" = 2)
    );

    if (fill = true) then
        INSERT INTO TimeTracking(Peer, Date, Time, "State") VALUES('Jerlenem', '08.08.22', '02:30', 1);
        INSERT INTO TimeTracking(Peer, Date, Time, "State") VALUES('Jerlenem', '08.08.22', '06:12', 2);
        INSERT INTO TimeTracking(Peer, Date, Time, "State") VALUES('Marcelit', '08.08.22', '11:23', 1);
        INSERT INTO TimeTracking(Peer, Date, Time, "State") VALUES('Zoomdeni', '08.08.22', '13:01', 1);
        INSERT INTO TimeTracking(Peer, Date, Time, "State") VALUES('Grandpat', '08.08.22', '14:03', 1);
        INSERT INTO TimeTracking(Peer, Date, Time, "State") VALUES('Grandpat', '08.08.22', '14:33', 2);
        INSERT INTO TimeTracking(Peer, Date, Time, "State") VALUES('Tonitaga', '08.08.22', '15:26', 1);
        INSERT INTO TimeTracking(Peer, Date, Time, "State") VALUES('Zoomdeni', '08.08.22', '16:45', 2);
        INSERT INTO TimeTracking(Peer, Date, Time, "State") VALUES('Tonitaga', '08.08.22', '19:36', 2);
        INSERT INTO TimeTracking(Peer, Date, Time, "State") VALUES('Marcelit', '08.08.22', '23:51', 2);
    end if;
end;
$$ language plpgsql;

create or replace procedure recommendations(fill boolean) as
$$
begin
    CREATE TABLE Recommendations
    (
        ID SERIAL PRIMARY KEY,
        Peer text REFERENCES Peers(Nickname),
        RecommendedPeer text REFERENCES Peers(Nickname)
    );

    if (fill = true) then
        INSERT INTO Recommendations(Peer, RecommendedPeer) VALUES('Marcelit', 'Tonitaga');
        INSERT INTO Recommendations(Peer, RecommendedPeer) VALUES('Marcelit', 'Zoomdeni');
        INSERT INTO Recommendations(Peer, RecommendedPeer) VALUES('Zoomdeni', 'Jerlenem');
        INSERT INTO Recommendations(Peer, RecommendedPeer) VALUES('Zoomdeni', 'Grandpat');
        INSERT INTO Recommendations(Peer, RecommendedPeer) VALUES('Grandpat', 'Marcelit');
        INSERT INTO Recommendations(Peer, RecommendedPeer) VALUES('Jerlenem', 'Tonitaga');
        INSERT INTO Recommendations(Peer, RecommendedPeer) VALUES('Tonitaga', 'Zoomdeni');

    end if;
end;
$$ language plpgsql;

create or replace procedure frineds(fill boolean) as
$$
begin
    CREATE TABLE Friends
    (
        ID SERIAL PRIMARY KEY,
        Peer1 text REFERENCES Peers(Nickname),
        Peer2 text REFERENCES Peers(Nickname) CHECK (Peer1 != Peer2)
    );

    if (fill = true) then
        INSERT INTO Friends(Peer1, Peer2) Values('Marcelit', 'Grandpat');
        INSERT INTO Friends(Peer1, Peer2) Values('Marcelit', 'Jerlenem');
        INSERT INTO Friends(Peer1, Peer2) Values('Marcelit', 'Zoomdeni');
        INSERT INTO Friends(Peer1, Peer2) Values('Zoomdeni', 'Marcelit');
        INSERT INTO Friends(Peer1, Peer2) Values('Tonitaga', 'Grandpat');
        INSERT INTO Friends(Peer1, Peer2) Values('Tonitaga', 'Jerlenem');
        INSERT INTO Friends(Peer1, Peer2) Values('Jerlenem', 'Tonitaga');
        INSERT INTO Friends(Peer1, Peer2) Values('Jerlenem', 'Marcelit');
        INSERT INTO Friends(Peer1, Peer2) Values('Grandpat', 'Tonitaga');
        INSERT INTO Friends(Peer1, Peer2) Values('Grandpat', 'Marcelit');

    end if;
end;
$$ language plpgsql;

create or replace procedure transferred_points(fill boolean) as
$$
begin
    CREATE TABLE TransferredPoints
    (
        ID SERIAL PRIMARY KEY,
        CheckingPeer text REFERENCES Peers(Nickname),
        CheckedPeer text REFERENCES Peers(Nickname),
        PointsAmount int NOT NULL
    );

    if (fill = true) then
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Marcelit', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Zoomdeni', 'Marcelit', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Zoomdeni', 'Marcelit', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Zoomdeni', 'Marcelit', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
        -- INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 1);
    end if;
end;
$$ language plpgsql;

-- 7. Peers and Checks tables depention (1, 2, 4)

create or replace procedure p2p(fill boolean) as
$$
begin
    CREATE TABLE P2P
    (
        ID SERIAL PRIMARY KEY,
        "Check" int REFERENCES Checks(ID),
        CheckingPeer text REFERENCES Peers(Nickname),
        "State" TaskStatus,
        Time TIME NOT NULL
    );

    if (fill = true) then
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(1, 'Zoomdeni', 'Start', '14:02');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(1, 'Zoomdeni', 'Success', '14:30');

        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(2, 'Marcelit', 'Start', '15:03');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(2, 'Marcelit', 'Success', '15:33');

        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(3, 'Zoomdeni', 'Start', '19:09');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(3, 'Zoomdeni', 'Success', '19:39');

        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(4, 'Grandpat', 'Start', '02:03');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(4, 'Grandpat', 'Success', '02:33');
        
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(5, 'Tonitaga', 'Start', '14:23');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(5, 'Tonitaga', 'Success', '14:53');

        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(6, 'Zoomdeni', 'Start', '00:44');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(6, 'Zoomdeni', 'Success', '01:23');
        
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(7, 'Marcelit', 'Start', '04:53');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(7, 'Marcelit', 'Success', '05:23');
        
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(8, 'Grandpat', 'Start', '16:43');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(8, 'Grandpat', 'Success', '17:13');
    
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(9, 'Marcelit', 'Start', '23:03');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(9, 'Marcelit', 'Success', '23:33');
        
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(10, 'Jerlenem', 'Start', '17:51');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(10, 'Jerlenem', 'Success', '18:21');

        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(11, 'Tonitaga', 'Start', '20:21'); 
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(11, 'Tonitaga', 'Success', '20:51');

        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(12, 'Jerlenem', 'Start', '22:13');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(12, 'Jerlenem', 'Success', '22:43');

        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(13, 'Zoomdeni', 'Start', '16:09');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(13, 'Zoomdeni', 'Success', '16:39');

        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(14, 'Tonitaga', 'Start', '03:55');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(14, 'Tonitaga', 'Success', '04:25');
        
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(15, 'Tonitaga', 'Start', '06:43');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(15, 'Tonitaga', 'Success', '07:13');

        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(16, 'Grandpat', 'Start', '16:32');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(16, 'Grandpat', 'Success', '17:02');

        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(17, 'Tonitaga', 'Start', '22:04');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(17, 'Tonitaga', 'Success', '22:34');
        
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(18, 'Marcelit', 'Start', '13:03');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(18, 'Marcelit', 'Success', '13:33');
        
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(19, 'Zoomdeni', 'Start', '02:03');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(19, 'Zoomdeni', 'Success', '02:33');
    
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(20, 'Grandpat', 'Start', '17:13');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(20, 'Grandpat', 'Success', '17:43');

        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(21, 'Marcelit', 'Start', '14:02');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(21, 'Marcelit', 'Success', '14:30');

        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(22, 'Zoomdeni', 'Start', '01:33');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(22, 'Zoomdeni', 'Success', '02:03');

        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(23, 'Marcelit', 'Start', '12:09');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(23, 'Marcelit', 'Success', '12:39');

        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(24, 'Zoomdeni', 'Start', '10:05');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(24, 'Zoomdeni', 'Success', '10:35');
        
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(25, 'Marcelit', 'Start', '13:44');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(25, 'Marcelit', 'Success', '14:24');

        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(26, 'Zoomdeni', 'Start', '01:34');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(26, 'Zoomdeni', 'Success', '02:04');

        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(27, 'Marcelit', 'Start', '04:02');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(27, 'Marcelit', 'Success', '04:32');
        
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(28, 'Zoomdeni', 'Start', '05:10');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(28, 'Zoomdeni', 'Success', '05:40');
        
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(29, 'Marcelit', 'Start', '09:12');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(29, 'Marcelit', 'Success', '09:42');
    
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(30, 'Zoomdeni', 'Start', '02:03');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(30, 'Zoomdeni', 'Success', '02:33');

        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(31, 'Marcelit', 'Start', '14:02');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(31, 'Marcelit', 'Success', '14:30');

        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(32, 'Zoomdeni', 'Start', '01:33');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(32, 'Zoomdeni', 'Success', '02:03');

        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(33, 'Marcelit', 'Start', '12:09');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(33, 'Marcelit', 'Success', '12:39');

        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(34, 'Zoomdeni', 'Start', '02:06');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(34, 'Zoomdeni', 'Success', '02:36');
        
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(35, 'Marcelit', 'Start', '13:25');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(35, 'Marcelit', 'Success', '13:55');

        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(36, 'Marcelit', 'Start', '14:52');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(36, 'Marcelit', 'Success', '15:12');
        
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(37, 'Zoomdeni', 'Start', '02:03');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(37, 'Zoomdeni', 'Success', '02:33');
        
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(38, 'Marcelit', 'Start', '06:02');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(38, 'Marcelit', 'Success', '06:32');
    
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(39, 'Zoomdeni', 'Start', '02:41');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(39, 'Zoomdeni', 'Success', '03:11');

        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(40, 'Marcelit', 'Start', '12:09');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(40, 'Marcelit', 'Success', '12:39');
        
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(41, 'Zoomdeni', 'Start', '14:07');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(41, 'Zoomdeni', 'Success', '14:37');

        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(42, 'Marcelit', 'Start', '07:41');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(42, 'Marcelit', 'Success', '08:11');
    end if;
end;
$$ language plpgsql;

create or replace procedure restart_tables(fill boolean) as
$$
begin
    CALL delete_tables();

    CALL peers(fill);
    CALL tasks(fill);
    CALL checks(fill);
    CALL xp(fill);
    CALL verter(fill);
    CALL time_tracking(fill);
    CALL recommendations(fill);
    CALL frineds(fill);
    CALL transferred_points(fill);
    CALL p2p(fill);
end;
$$ language plpgsql;

create or replace procedure delete_tables() as 
$$
begin
    DROP TABLE P2P;
    DROP TABLE TransferredPoints;
    DROP TABLE Friends;
    DROP TABLE Recommendations;
    DROP TABLE TimeTracking;
    DROP TABLE Verter;
    DROP TABLE XP;
    DROP TABLE Checks;
    DROP TABLE Tasks;
    DROP TABLE Peers;
end;
$$ language plpgsql;

DO
$create_tables$
DECLARE fill boolean := true;
BEGIN
    CALL peers(fill);
    CALL tasks(fill);
    CALL checks(fill);
    CALL xp(fill);
    CALL verter(fill);
    CALL time_tracking(fill);
    CALL recommendations(fill);
    CALL frineds(fill);
    CALL transferred_points(fill);
    CALL p2p(fill);
END;
$create_tables$
