.mode columns
.headers on
.nullvalue NULL

SELECT max(numAwards) as numAwards, id, firstName, lastName
FROM Person, ( SELECT personID, count(*) as numAwards
               FROM TVAward
               GROUP BY personID )
WHERE Person.id = personID;