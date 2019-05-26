
WITH StarWarsMovies as (SELECT Content.id as contentID
                        FROM Content NATURAL JOIN Movie
                        WHERE Content.name like '%Star Wars%')

SELECT Person.firstName || ' ' || Person.lastName as name
FROM Person
     NATURAL JOIN (SELECT DISTINCT(personID) as id
                   FROM MovieAward
                        JOIN ContentGenre 
                        ON (ContentGenre.contentID = MovieAward.movieID)
                        NATURAL JOIN (SELECT DISTINCT ID AS genreID
                                      FROM (SELECT ContentGenre.genreID as ID
                                            FROM Movie
                                                 JOIN ContentGenre
                                                 ON (Movie.id = ContentGenre.contentID)
                                            EXCEPT
                                            SELECT DISTINCT(ContentGenre.genreID) as ID
                                            FROM ContentGenre
                                                 NATURAL JOIN StarWarsMovies)
                   )) as NotStarWarsGenreAwards
WHERE Person.id in (SELECT personID
                    FROM StarWarsMovies NATURAL JOIN RolePersonContent)        ;            


