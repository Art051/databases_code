SELECT a."animalName", "animalAge"
FROM animal a
         FULL JOIN species s ON s."speciesName" = a."animalSpecies"
         FULL JOIN zoo z ON z."zooName" = a."zooName"
         FULL JOIN "zooLocations" zL ON z."zooName" = zL."zooName"
         FULL JOIN employee e ON e."employeeName" = z."zooOwner";

SELECT *
FROM animal a
         FULL JOIN species s ON s."speciesName" = a."animalSpecies"
         FULL JOIN zoo z ON z."zooName" = a."zooName"
         FULL JOIN "zooLocations" zL ON z."zooName" = zL."zooName"
         FULL JOIN employee e ON e."employeeName" = z."zooOwner"
WHERE "animalName" = 'Tony';
