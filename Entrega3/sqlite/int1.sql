.mode columns
.headers on
.nullvalue NULL

SELECT max(numAwards) as numAwards, id, firstName, lastName
FROM ( SELECT id, firstName, lastName, count(*) as numAwards
       FROM Person, TVAward
       WHERE Person.id = TVAward.personID
       GROUP BY Person.id );