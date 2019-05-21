.mode columns
.headers on
.nullvalue NULL

SELECT id, firstName, lastName, count(*) as numAwards 
FROM Person, ( 
               SELECT year, personID, awardID
               FROM TVAward 
               UNION ALL 
               SELECT year, personID, awardID
               FROM MovieAward
             )
ON personID = Person.id
GROUP BY personID;

             

