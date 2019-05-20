.mode columns
.headers on
.nullvalue NULL

SELECT Movie.id, name
FROM Content, Movie ON Content.id = Movie.id
WHERE score > 8 AND Movie.id NOT IN (SELECT DISTINCT movieID FROM MovieAward);
