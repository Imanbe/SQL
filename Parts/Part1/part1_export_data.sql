create or replace procedure ExportThisData(tableName varchar, filePath varchar, delimiter varchar)
as $$
  begin
    execute format('copy %s TO ''%s'' DELIMITER ''%s'' CSV HEADER;',
    tableName, filePath, delimiter);
  end;
$$ language plpgsql;

create or replace procedure ExportData()
as $$
  begin
  call  ExportThisData('peers', 'D:\School_21\Info\src\Part1\data\peers.csv', ',');
  call  ExportThisData('tasks', 'D:\School_21\Info\src\Part1\data\tasks.csv', ',');
  call  ExportThisData('checks',  'D:\School_21\Info\src\Part1\data\checks.csv', ',');
  call  ExportThisData('p2p','D:\School_21\Info\src\Part1\data\p2p.csv', ',');
  call  ExportThisData('verter','D:\School_21\Info\src\Part1\data\verter.csv', ',');
  call  ExportThisData('TransferredPoints',  'D:\School_21\Info\src\Part1\data\transferred_points.csv', ',');
  call  ExportThisData('Friends',  'D:\School_21\Info\src\Part1\data\friends.csv', ',');
  call  ExportThisData('Recommendations',  'D:\School_21\Info\src\Part1\data\recommendations.csv', ',');
  call  ExportThisData('XP',  'D:\School_21\Info\src\Part1\data\xp.csv', ',');
  call  ExportThisData('TimeTracking',  'D:\School_21\Info\src\Part1\data\time_tracking.csv', ',');
end;
$$ language plpgsql;