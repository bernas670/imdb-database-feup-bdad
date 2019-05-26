.mode columns
.headers on
.nullvalue NULL

SELECT firstName || ' ' || lastName as Name, CAST ((julianday() - julianday(dateOfBirth))/365 as INTEGER) as age, Country.name as country
FROM  Person as P JOIN Country On (P.country = Country.id)
WHERE age < 55 and Country.name != 'United States of America' and Exists (SELECT personID FROM MovieAward JOIN Person ON (P.id = MovieAward.personID)
                                                                            INTERSECT
                                                                          SELECT personID FROM TVAward JOIN Person ON (P.id = TVAward.personID))
ORDER BY age ASC;