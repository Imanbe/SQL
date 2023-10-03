create or replace procedure ImportThisData(tableName varchar, filePath varchar, delimiter varchar)
as $$
  begin
    execute format('COPY %s FROM ''%s'' DELIMITER ''%s'' CSV HEADER;',
    tableName, filePath, delimiter);
  end;
$$ language plpgsql;

create or replace procedure ImportData()
as $$
  begin
    call  ImportThisData('peers', 'D:\School_21\Info\src\Part1\data\peers.csv', ',');
    call  ImportThisData('tasks',  'D:\School_21\Info\src\Part1\data\tasks.csv', ',');
    call  ImportThisData('checks',  'D:\School_21\Info\src\Part1\data\checks.csv', ',');
    call  ImportThisData('p2p',  'D:\School_21\Info\src\Part1\data\p2p.csv', ',');
    call  ImportThisData('verter',  'D:\School_21\Info\src\Part1\data\verter.csv', ',');
    call  ImportThisData('TransferredPoints',  'D:\School_21\Info\src\Part1\data\transferred_points.csv', ',');
    call  ImportThisData('Friends',  'D:\School_21\Info\src\Part1\data\friends.csv', ',');
    call  ImportThisData('Recommendations',  'D:\School_21\Info\src\Part1\data\recommendations.csv', ',');
    call  ImportThisData('XP',  'D:\School_21\Info\src\Part1\data\xp.csv', ',');
    call  ImportThisData('TimeTracking',  'D:\School_21\Info\src\Part1\data\time_tracking.csv', ',');
  end;
$$ language plpgsql;