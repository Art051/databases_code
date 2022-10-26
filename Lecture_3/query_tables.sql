-- select ALL from Cinema
SELECT * FROM Cinema;

-- select ALL cinemas managed by Smith
SELECT CinemaNo, CinemaName, TownName, ManagerName
FROM Cinema INNER JOIN Manager
ON Cinema.ManagerNo = Manager.ManagerNo
WHERE ManagerName = 'Smith';

-- Select ALL Cinemas managed by Smith or Jones
SELECT CinemaNo, CinemaName, TownName, ManagerName
FROM Cinema INNER JOIN Manager
ON Cinema.ManagerNo = Manager.ManagerNo
WHERE ManagerName IN ('Smith', 'Jones');


-- Select ALL cinemas managed by Smith or Jons ordered by TownName
SELECT CinemaNo, CinemaName, TownName, ManagerName
FROM Cinema INNER JOIN Manager
ON Cinema.ManagerNo = Manager.ManagerNo
WHERE ManagerName IN ('Smith', 'Jones');

-- Select ALL Cinemas Managed by Smith or Jones Ordered by TownName
SELECT CinemaNo, CinemaName, TownName, ManagerName
FROM Cinema INNER JOIN Manager
ON Cinema.ManagerNo = Manager.ManagerNo
WHERE ManagerName IN ('Smith', 'Jones')
ORDER BY TownName;
