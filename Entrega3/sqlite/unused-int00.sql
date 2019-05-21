.mode columns
.headers on
.nullvalue NULL

SELECT year, Content.name, max(Movie.boxoffice - Movie.budget) AS profit
FROM Content, Movie USING(id)
GROUP BY year;