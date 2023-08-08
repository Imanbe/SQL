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
        INSERT INTO Peers VALUES('Tonitaga', '2003-08-14');
        INSERT INTO Peers VALUES('Grandpat', '2003-08-14');
        INSERT INTO Peers VALUES('Jerlenem', '2003-08-14');
        INSERT INTO Peers VALUES('Zoomdeni', '2003-08-14');
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
        INSERT INTO Tasks VALUES('C1_Pool', Null, '2200');
        INSERT INTO Tasks VALUES('C2_SimpleBashUtils', 'C1_Pool', '250');
        INSERT INTO Tasks VALUES('C3_s21_string+', 'C1_Pool', '750');
        INSERT INTO Tasks VALUES('C4_s21_math', 'C2_SimpleBashUtils', '300');
        INSERT INTO Tasks VALUES('C5_s21_decimal','C2_SimpleBashUtils', '350');
        INSERT INTO Tasks VALUES('C6_s21_matrix', 'C5_s21_decimal', '200');
        INSERT INTO Tasks VALUES('C7_SmartCalc_v1.0', 'C6_s21_matrix', '650');
        INSERT INTO Tasks VALUES('C8_3DViewer_v1.0', 'C7_SmartCalc_v1.0', '1043');
        INSERT INTO Tasks VALUES('CPP1_s21_matrix+', 'C8_3DViewer_v1.0', '2200');
        INSERT INTO Tasks VALUES('SQL1_Bootcamp', 'C8_3DViewer_v1.0', '1500');
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
        INSERT INTO Checks(Peer, Task, Date) VALUES('Marcelit', 'C1_Pool', '2023-08-08');
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
        Time DATE NOT NULL
    );

    if (fill = true) then
        INSERT INTO Verter("Check", "State", Time) VALUES(1, "Start", '14:35');
        INSERT INTO Verter("Check", "State", Time) VALUES(1, "Success", '14:40');
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
        INSERT INTO TimeTracking(Peer, Date, Time, State) VALUES('Jerlenem', '08.08.22', '02:30', 1);
        INSERT INTO TimeTracking(Peer, Date, Time, State) VALUES('Jerlenem', '08.08.22', '06:12', 2);
        INSERT INTO TimeTracking(Peer, Date, Time, State) VALUES('Marcelit', '08.08.22', '11:23', 1);
        INSERT INTO TimeTracking(Peer, Date, Time, State) VALUES('Zoomdeni', '08.08.22', '13:01', 1);
        INSERT INTO TimeTracking(Peer, Date, Time, State) VALUES('Grandpat', '08.08.22', '14:03', 1);
        INSERT INTO TimeTracking(Peer, Date, Time, State) VALUES('Grandpat', '08.08.22', '14:33', 2);
        INSERT INTO TimeTracking(Peer, Date, Time, State) VALUES('Tonitaga', '08.08.22', '15:26', 1);
        INSERT INTO TimeTracking(Peer, Date, Time, State) VALUES('Zoomdeni', '08.08.22', '16:45', 2);
        INSERT INTO TimeTracking(Peer, Date, Time, State) VALUES('Tonitaga', '08.08.22', '19:36', 2);
        INSERT INTO TimeTracking(Peer, Date, Time, State) VALUES('Marcelit', '08.08.22', '23:51', 2);
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
        INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Zoomdeni', 'Marcelit', 1);
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
        "State" TaskStatus DEFAULT('Start'),
        Time TIME NOT NULL
    );

    if (fill = true) then
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(1, 'Zoomdeni', 'Start', '14:02');
        INSERT INTO P2P("Check", CheckingPeer, "State", Time) VALUES(1, 'Zoomdeni', 'Success', '14:30');
    end if;
end;
$$ language plpgsql;

create or replace procedure restart_tables(fill boolean) as
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
