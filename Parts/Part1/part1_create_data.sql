create or replace procedure CreateData() as
$$
begin
    -- Peers
    INSERT INTO Peers VALUES('Marcelit', '2003-08-14');
    INSERT INTO Peers VALUES('Tonitaga', '2002-12-27');
    INSERT INTO Peers VALUES('Grandpat', '1998-04-01');
    INSERT INTO Peers VALUES('Jerlenem', '2001-03-16');
    INSERT INTO Peers VALUES('Zoomdeni', '2000-06-23');
    
    -- Tasks
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

    INSERT INTO Tasks VALUES('CPP1', 'C8', '300');
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

    -- Checks
    INSERT INTO Checks(Peer, Task, Date) VALUES('Marcelit', 'C1', '2023-08-01');
    INSERT INTO Checks(Peer, Task, Date) VALUES('Marcelit', 'C1', '2023-08-03');
    INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'C1', '2023-08-04');
    INSERT INTO Checks(Peer, Task, Date) VALUES('Tonitaga', 'C1', '2023-08-06');
    INSERT INTO Checks(Peer, Task, Date) VALUES('Jerlenem', 'C1', '2023-08-08'); -- 5
    INSERT INTO Checks(Peer, Task, Date) VALUES('Grandpat', 'C1', '2023-08-09');
    INSERT INTO Checks(Peer, Task, Date) VALUES('Marcelit', 'C2', '2023-08-10');
    INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'C2', '2023-08-11'); -- 8
    INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'C2', '2023-08-11');
    INSERT INTO Checks(Peer, Task, Date) VALUES('Jerlenem', 'C2', '2023-08-12'); -- 10
    INSERT INTO Checks(Peer, Task, Date) VALUES('Tonitaga', 'C2', '2023-08-13'); 
    INSERT INTO Checks(Peer, Task, Date) VALUES('Grandpat', 'C2', '2023-08-14');
    INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'C3', '2023-08-15'); -- 13
    INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'C3', '2023-08-16'); -- 14
    INSERT INTO Checks(Peer, Task, Date) VALUES('Grandpat', 'DO1', '2023-08-17');-- 15
    INSERT INTO Checks(Peer, Task, Date) VALUES('Grandpat', 'DO1', '2023-08-17');
    INSERT INTO Checks(Peer, Task, Date) VALUES('Grandpat', 'DO1', '2023-08-17');-- 17
    INSERT INTO Checks(Peer, Task, Date) VALUES('Tonitaga', 'DO1', '2023-08-18');
    INSERT INTO Checks(Peer, Task, Date) VALUES('Grandpat', 'DO2', '2023-08-19');-- 19
    INSERT INTO Checks(Peer, Task, Date) VALUES('Marcelit', 'C3', '2023-08-20'); -- 20
    INSERT INTO Checks(Peer, Task, Date) VALUES('Tonitaga', 'DO2', '2023-08-22');-- 21
    INSERT INTO Checks(Peer, Task, Date) VALUES('Tonitaga', 'DO2', '2023-08-22');-- 22
    INSERT INTO Checks(Peer, Task, Date) VALUES('Grandpat', 'DO3', '2023-08-23');-- 23
    INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'C4', '2023-08-25'); -- 24
    INSERT INTO Checks(Peer, Task, Date) VALUES('Marcelit', 'C4', '2023-08-26'); -- 25
    INSERT INTO Checks(Peer, Task, Date) VALUES('Tonitaga', 'DO3', '2023-08-29');-- 26
    INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'C5', '2023-09-05'); -- 27
    INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'C5', '2023-09-05');
    INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'C5', '2023-09-06');
    INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'C5', '2023-09-06'); -- 30
    INSERT INTO Checks(Peer, Task, Date) VALUES('Marcelit', 'C5', '2023-09-07'); -- 31
    INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'C6', '2023-09-16'); -- 32
    INSERT INTO Checks(Peer, Task, Date) VALUES('Marcelit', 'C6', '2023-09-18'); -- 33
    INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'C7', '2023-09-23');
    INSERT INTO Checks(Peer, Task, Date) VALUES('Marcelit', 'C7', '2023-09-29'); -- 35
    INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'C8', '2023-09-30');
    INSERT INTO Checks(Peer, Task, Date) VALUES('Marcelit', 'C8', '2023-10-08');
    INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'CPP1', '2023-10-15');
    INSERT INTO Checks(Peer, Task, Date) VALUES('Marcelit', 'SQL1', '2023-10-16');
    INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'SQL1', '2023-10-26'); -- 40
    INSERT INTO Checks(Peer, Task, Date) VALUES('Marcelit', 'CPP1', '2023-10-25');
    INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'SQL2', '2023-11-01');
    INSERT INTO Checks(Peer, Task, Date) VALUES('Marcelit', 'SQL2', '2023-11-06');
    INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'SQL3', '2023-11-10');
    INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'CPP2', '2023-11-14'); -- 45
    INSERT INTO Checks(Peer, Task, Date) VALUES('Marcelit', 'CPP2', '2023-11-24');
    INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'CPP3', '2023-11-29');
    INSERT INTO Checks(Peer, Task, Date) VALUES('Marcelit', 'CPP3', '2023-12-03');
    INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'CPP4', '2023-12-12');
    INSERT INTO Checks(Peer, Task, Date) VALUES('Marcelit', 'CPP4', '2023-12-15'); -- 50
    INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'A1', '2023-12-20');
    INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'A1', '2023-12-24');
    INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'A1', '2023-12-26');
    INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'A1', '2023-12-26');
    INSERT INTO Checks(Peer, Task, Date) VALUES('Zoomdeni', 'A1', '2023-12-31'); -- 55

    -- XP
    INSERT INTO XP(CheckID, XPAmount) VALUES(2, 1023);
    INSERT INTO XP(CheckID, XPAmount) VALUES(3, 1400);
    INSERT INTO XP(CheckID, XPAmount) VALUES(4, 800);
    INSERT INTO XP(CheckID, XPAmount) VALUES(5, 2123);
    INSERT INTO XP(CheckID, XPAmount) VALUES(6, 789);
    INSERT INTO XP(CheckID, XPAmount) VALUES(7, 214);
    INSERT INTO XP(CheckID, XPAmount) VALUES(9, 214);
    INSERT INTO XP(CheckID, XPAmount) VALUES(11, 189);
    INSERT INTO XP(CheckID, XPAmount) VALUES(12, 210);
    INSERT INTO XP(CheckID, XPAmount) VALUES(14, 600);
    INSERT INTO XP(CheckID, XPAmount) VALUES(17, 250);
    INSERT INTO XP(CheckID, XPAmount) VALUES(18, 250);
    INSERT INTO XP(CheckID, XPAmount) VALUES(19, 232);
    INSERT INTO XP(CheckID, XPAmount) VALUES(20, 634);
    INSERT INTO XP(CheckID, XPAmount) VALUES(22, 243);
    INSERT INTO XP(CheckID, XPAmount) VALUES(23, 293);
    INSERT INTO XP(CheckID, XPAmount) VALUES(24, 300);
    INSERT INTO XP(CheckID, XPAmount) VALUES(25, 170);
    INSERT INTO XP(CheckID, XPAmount) VALUES(26, 350);
    INSERT INTO XP(CheckID, XPAmount) VALUES(30, 333);
    INSERT INTO XP(CheckID, XPAmount) VALUES(31, 231);
    INSERT INTO XP(CheckID, XPAmount) VALUES(32, 175);
    INSERT INTO XP(CheckID, XPAmount) VALUES(33, 200);
    INSERT INTO XP(CheckID, XPAmount) VALUES(34, 500);
    INSERT INTO XP(CheckID, XPAmount) VALUES(35, 650);
    INSERT INTO XP(CheckID, XPAmount) VALUES(36, 820);
    INSERT INTO XP(CheckID, XPAmount) VALUES(37, 1043);
    INSERT INTO XP(CheckID, XPAmount) VALUES(38, 267);
    INSERT INTO XP(CheckID, XPAmount) VALUES(39, 1276);
    INSERT INTO XP(CheckID, XPAmount) VALUES(40, 1443);
    INSERT INTO XP(CheckID, XPAmount) VALUES(41, 300);
    INSERT INTO XP(CheckID, XPAmount) VALUES(42, 425);
    INSERT INTO XP(CheckID, XPAmount) VALUES(43, 500);
    INSERT INTO XP(CheckID, XPAmount) VALUES(44, 1500);
    INSERT INTO XP(CheckID, XPAmount) VALUES(45, 330);
    INSERT INTO XP(CheckID, XPAmount) VALUES(46, 200);
    INSERT INTO XP(CheckID, XPAmount) VALUES(47, 589);
    INSERT INTO XP(CheckID, XPAmount) VALUES(48, 445);
    INSERT INTO XP(CheckID, XPAmount) VALUES(49, 612);
    INSERT INTO XP(CheckID, XPAmount) VALUES(50, 750);

    -- Verter
    INSERT INTO Verter(CheckID, Status, Time) VALUES(1, 'Start', '14:35');
    INSERT INTO Verter(CheckID, Status, Time) VALUES(1, 'Failure', '14:40');

    INSERT INTO Verter(CheckID, Status, Time) VALUES(2, 'Start', '18:00');
    INSERT INTO Verter(CheckID, Status, Time) VALUES(2, 'Success', '18:12');

    INSERT INTO Verter(CheckID, Status, Time) VALUES(3, 'Start', '15:35');
    INSERT INTO Verter(CheckID, Status, Time) VALUES(3, 'Success', '15:40');

    INSERT INTO Verter(CheckID, Status, Time) VALUES(4, 'Start', '19:40');
    INSERT INTO Verter(CheckID, Status, Time) VALUES(4, 'Success', '19:43');

    INSERT INTO Verter(CheckID, Status, Time) VALUES(5, 'Start', '02:35');
    INSERT INTO Verter(CheckID, Status, Time) VALUES(5, 'Success', '02:40');

    INSERT INTO Verter(CheckID, Status, Time) VALUES(6, 'Start', '14:55');
    INSERT INTO Verter(CheckID, Status, Time) VALUES(6, 'Success', '15:00');

    INSERT INTO Verter(CheckID, Status, Time) VALUES(7, 'Start', '01:35');
    INSERT INTO Verter(CheckID, Status, Time) VALUES(7, 'Success', '01:40');

    INSERT INTO Verter(CheckID, Status, Time) VALUES(8, 'Start', '05:25');
    INSERT INTO Verter(CheckID, Status, Time) VALUES(8, 'Failure', '05:34');

    INSERT INTO Verter(CheckID, Status, Time) VALUES(9, 'Start', '05:30');
    INSERT INTO Verter(CheckID, Status, Time) VALUES(9, 'Success', '05:40');

    INSERT INTO Verter(CheckID, Status, Time) VALUES(10, 'Start', '17:26');
    INSERT INTO Verter(CheckID, Status, Time) VALUES(10, 'Failure', '17:37'); -- 10

    INSERT INTO Verter(CheckID, Status, Time) VALUES(11, 'Start', '23:34');
    INSERT INTO Verter(CheckID, Status, Time) VALUES(11, 'Success', '23:37');

    INSERT INTO Verter(CheckID, Status, Time) VALUES(12, 'Start', '18:28');
    INSERT INTO Verter(CheckID, Status, Time) VALUES(12, 'Success', '18:35');

    INSERT INTO Verter(CheckID, Status, Time) VALUES(13, 'Start', '18:28');
    INSERT INTO Verter(CheckID, Status, Time) VALUES(13, 'Failure', '18:35');

    INSERT INTO Verter(CheckID, Status, Time) VALUES(14, 'Start', '07:00');
    INSERT INTO Verter(CheckID, Status, Time) VALUES(14, 'Success', '07:14');  -- 14

    INSERT INTO Verter(CheckID, Status, Time) VALUES(20, 'Start', '17:03');
    INSERT INTO Verter(CheckID, Status, Time) VALUES(20, 'Success', '17:08');

    INSERT INTO Verter(CheckID, Status, Time) VALUES(24, 'Start', '02:04');
    INSERT INTO Verter(CheckID, Status, Time) VALUES(24, 'Success', '02:08');

    INSERT INTO Verter(CheckID, Status, Time) VALUES(25, 'Start', '17:44');
    INSERT INTO Verter(CheckID, Status, Time) VALUES(25, 'Success', '17:48');

    INSERT INTO Verter(CheckID, Status, Time) VALUES(29, 'Start', '23:53');
    INSERT INTO Verter(CheckID, Status, Time) VALUES(29, 'Failure', '23:59');
    
    INSERT INTO Verter(CheckID, Status, Time) VALUES(30, 'Start', '02:04');
    INSERT INTO Verter(CheckID, Status, Time) VALUES(30, 'Success', '02:07');

    INSERT INTO Verter(CheckID, Status, Time) VALUES(31, 'Start', '12:41');
    INSERT INTO Verter(CheckID, Status, Time) VALUES(31, 'Success', '12:47');

    INSERT INTO Verter(CheckID, Status, Time) VALUES(32, 'Start', '10:41');
    INSERT INTO Verter(CheckID, Status, Time) VALUES(32, 'Success', '10:47');

    INSERT INTO Verter(CheckID, Status, Time) VALUES(33, 'Start', '14:25');
    INSERT INTO Verter(CheckID, Status, Time) VALUES(33, 'Success', '14:28');

    -- TimeTracking
    INSERT INTO TimeTracking(Peer, Date, Time, Status) VALUES('Jerlenem', '08.08.22', '02:30', 1);
    INSERT INTO TimeTracking(Peer, Date, Time, Status) VALUES('Jerlenem', '08.08.22', '06:12', 2);
    INSERT INTO TimeTracking(Peer, Date, Time, Status) VALUES('Marcelit', '08.08.22', '11:23', 1);
    INSERT INTO TimeTracking(Peer, Date, Time, Status) VALUES('Zoomdeni', '08.08.22', '13:01', 1);
    INSERT INTO TimeTracking(Peer, Date, Time, Status) VALUES('Grandpat', '08.08.22', '14:03', 1);
    INSERT INTO TimeTracking(Peer, Date, Time, Status) VALUES('Grandpat', '08.08.22', '14:33', 2);
    INSERT INTO TimeTracking(Peer, Date, Time, Status) VALUES('Tonitaga', '08.08.22', '15:26', 1);
    INSERT INTO TimeTracking(Peer, Date, Time, Status) VALUES('Zoomdeni', '08.08.22', '16:45', 2);
    INSERT INTO TimeTracking(Peer, Date, Time, Status) VALUES('Tonitaga', '08.08.22', '19:36', 2);
    INSERT INTO TimeTracking(Peer, Date, Time, Status) VALUES('Marcelit', '08.08.22', '23:51', 2);

    -- Recommendations
    INSERT INTO Recommendations(Peer, RecommendedPeer) VALUES('Marcelit', 'Tonitaga');
    INSERT INTO Recommendations(Peer, RecommendedPeer) VALUES('Marcelit', 'Zoomdeni');
    INSERT INTO Recommendations(Peer, RecommendedPeer) VALUES('Zoomdeni', 'Jerlenem');
    INSERT INTO Recommendations(Peer, RecommendedPeer) VALUES('Zoomdeni', 'Grandpat');
    INSERT INTO Recommendations(Peer, RecommendedPeer) VALUES('Grandpat', 'Marcelit');
    INSERT INTO Recommendations(Peer, RecommendedPeer) VALUES('Jerlenem', 'Tonitaga');
    INSERT INTO Recommendations(Peer, RecommendedPeer) VALUES('Tonitaga', 'Zoomdeni');
    INSERT INTO Recommendations(Peer, RecommendedPeer) VALUES('Tonitaga', 'Grandpat');
    INSERT INTO Recommendations(Peer, RecommendedPeer) VALUES('Tonitaga', 'Jerlenem');

    -- Friends
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

    -- TransferredPoints
    INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Zoomdeni', 26);
    INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Tonitaga', 0);
    INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Jerlenem', 2);
    INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Marcelit', 'Grandpat', 2);
    INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Zoomdeni', 'Marcelit', 6);
    INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Zoomdeni', 'Tonitaga', 48);
    INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Zoomdeni', 'Grandpat', 0);
    INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Zoomdeni', 'Jerlenem', 0);
    INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Jerlenem', 'Marcelit', 0);
    INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Jerlenem', 'Zoomdeni', 0);
    INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Jerlenem', 'Tonitaga', 0);
    INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Jerlenem', 'Grandpat', 4);
    INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Tonitaga', 'Marcelit', 2);
    INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Tonitaga', 'Zoomdeni', 2);
    INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Tonitaga', 'Jerlenem', 0);
    INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Tonitaga', 'Grandpat', 8);
    INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Grandpat', 'Zoomdeni', 2);
    INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Grandpat', 'Tonitaga', 8);
    INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Grandpat', 'Jerlenem', 4);
    INSERT INTO TransferredPoints(CheckingPeer, CheckedPeer, PointsAmount) VALUES ('Grandpat', 'Marcelit', 0);
    
    -- P2P

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(1, 'Zoomdeni', 'Start', '14:02');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(1, 'Zoomdeni', 'Success', '14:30');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(2, 'Jerlenem', 'Start', '17:27');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(2, 'Jerlenem', 'Success', '17:57');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(3, 'Marcelit', 'Start', '15:03');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(3, 'Marcelit', 'Success', '15:33');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(4, 'Zoomdeni', 'Start', '19:09');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(4, 'Zoomdeni', 'Success', '19:39');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(5, 'Grandpat', 'Start', '02:03');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(5, 'Grandpat', 'Success', '02:33');
    
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(6, 'Tonitaga', 'Start', '14:23');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(6, 'Tonitaga', 'Success', '14:53');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(7, 'Zoomdeni', 'Start', '00:44');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(7, 'Zoomdeni', 'Success', '01:23');
    
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(8, 'Marcelit', 'Start', '04:53');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(8, 'Marcelit', 'Success', '05:23');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(9, 'Marcelit', 'Start', '16:34');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(9, 'Marcelit', 'Success', '17:02');        
    
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(10, 'Grandpat', 'Start', '16:43');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(10, 'Grandpat', 'Success', '17:13');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(11, 'Marcelit', 'Start', '23:03');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(11, 'Marcelit', 'Success', '23:33');
    
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(12, 'Jerlenem', 'Start', '17:51');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(12, 'Jerlenem', 'Success', '18:21');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(13, 'Tonitaga', 'Start', '00:21'); 
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(13, 'Tonitaga', 'Failure', '00:51');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(14, 'Marcelit', 'Start', '06:21'); 
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(14, 'Marcelit', 'Success', '06:51');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(15, 'Tonitaga', 'Start', '12:21'); 
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(15, 'Tonitaga', 'Failure', '12:51');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(16, 'Jerlenem', 'Start', '17:13');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(16, 'Jerlenem', 'Failure', '17:43');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(17, 'Zoomdeni', 'Start', '23:09');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(17, 'Zoomdeni', 'Success', '23:39');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(18, 'Grandpat', 'Start', '03:55');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(18, 'Grandpat', 'Success', '04:25');
    
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(19, 'Tonitaga', 'Start', '06:43');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(19, 'Tonitaga', 'Success', '07:13');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(20, 'Grandpat', 'Start', '16:32');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(20, 'Grandpat', 'Success', '17:02');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(21, 'Grandpat', 'Start', '22:24');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(21, 'Grandpat', 'Failure', '22:44');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(22, 'Grandpat', 'Start', '23:20');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(22, 'Grandpat', 'Success', '23:57');
    
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(23, 'Tonitaga', 'Start', '13:03');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(23, 'Tonitaga', 'Success', '13:33');
    
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(24, 'Marcelit', 'Start', '02:03');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(24, 'Marcelit', 'Success', '02:33');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(25, 'Zoomdeni', 'Start', '17:13');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(25, 'Zoomdeni', 'Success', '17:43');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(26, 'Grandpat', 'Start', '12:02');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(26, 'Grandpat', 'Success', '12:30');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(27, 'Marcelit', 'Start', '19:22');  -- 27
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(27, 'Marcelit', 'Failure', '19:45');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(28, 'Marcelit', 'Start', '22:10');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(28, 'Marcelit', 'Failure', '22:30');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(29, 'Marcelit', 'Start', '23:00');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(29, 'Marcelit', 'Success', '23:45');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(30, 'Marcelit', 'Start', '01:33');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(30, 'Marcelit', 'Success', '02:03');
-- 
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(31, 'Zoomdeni', 'Start', '12:09');  -- 31
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(31, 'Zoomdeni', 'Success', '12:39');
-- 
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(32, 'Marcelit', 'Start', '10:05');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(32, 'Marcelit', 'Success', '10:35');
    
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(33, 'Zoomdeni', 'Start', '13:44');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(33, 'Zoomdeni', 'Success', '14:24'); -- 33

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(34, 'Marcelit', 'Start', '01:34');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(34, 'Marcelit', 'Success', '02:04');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(35, 'Zoomdeni', 'Start', '04:02');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(35, 'Zoomdeni', 'Success', '04:32');
    
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(36, 'Marcelit', 'Start', '05:10');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(36, 'Marcelit', 'Success', '05:40');
    
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(37, 'Zoomdeni', 'Start', '09:12');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(37, 'Zoomdeni', 'Success', '09:42');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(38, 'Marcelit', 'Start', '02:03');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(38, 'Marcelit', 'Success', '02:33');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(39, 'Zoomdeni', 'Start', '14:02');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(39, 'Zoomdeni', 'Success', '14:30');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(40, 'Marcelit', 'Start', '01:33');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(40, 'Marcelit', 'Success', '02:03');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(41, 'Zoomdeni', 'Start', '12:09');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(41, 'Zoomdeni', 'Success', '12:39');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(42, 'Marcelit', 'Start', '02:06');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(42, 'Marcelit', 'Success', '02:36');
    
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(43, 'Zoomdeni', 'Start', '13:25');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(43, 'Zoomdeni', 'Success', '13:55');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(44, 'Marcelit', 'Start', '14:52');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(44, 'Marcelit', 'Success', '15:12');
    
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(45, 'Marcelit', 'Start', '02:03');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(45, 'Marcelit', 'Success', '02:33');
    
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(46, 'Zoomdeni', 'Start', '06:02');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(46, 'Zoomdeni', 'Success', '06:32');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(47, 'Marcelit', 'Start', '02:41');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(47, 'Marcelit', 'Success', '03:11');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(48, 'Zoomdeni', 'Start', '12:09');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(48, 'Zoomdeni', 'Success', '12:39');
    
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(49, 'Marcelit', 'Start', '14:07');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(49, 'Marcelit', 'Success', '14:37');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(50, 'Zoomdeni', 'Start', '07:41');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(50, 'Zoomdeni', 'Success', '08:11');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(51, 'Marcelit', 'Start', '12:14');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(51, 'Marcelit', 'Failure', '12:54');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(52, 'Marcelit', 'Start', '14:32');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(52, 'Marcelit', 'Failure', '14:40');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(53, 'Marcelit', 'Start', '04:41');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(53, 'Marcelit', 'Failure', '04:45');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(54, 'Marcelit', 'Start', '09:15');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(54, 'Marcelit', 'Failure', '09:24');

    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(55, 'Marcelit', 'Start', '22:30');
    INSERT INTO P2P(CheckID, CheckingPeer, Status, Time) VALUES(55, 'Marcelit', 'Failure', '23:58');

end;
$$ language plpgsql;
