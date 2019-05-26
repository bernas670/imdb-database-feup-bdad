SELECT Person.firstName || ' ' || Person.lastName as name
FROM Person 
     JOIN (SELECT DISTINCT(personID) 
           FROM MovieAward 
                JOIN ContentGenre as MovieGenre 
                ON (MovieGenre.contentID = MovieAward.movieID)  
                JOIN (SELECT DISTINCT ID
                      FROM (SELECT ContentGenre.genreID as ID 
                            FROM Movie 
                                 JOIN ContentGenre 
                                 ON (Movie.id = ContentGenre.contentID) 
                            EXCEPT 
                            SELECT DISTINCT(ContentGenre.genreID) as ID
                            FROM ContentGenre 
                                 JOIN (SELECT * 
                                       FROM Content NATURAL JOIN Movie
                                       WHERE Content.name like '%Star Wars%') as StarWarsMovies 
                                 ON (ContentGenre.contentID = StarWarsMovies.id))) as NotStarWarsGenreID
                 ON NotStarWarsGenreID.ID = MovieGenre.genreID) as NotStarwarsGenreAwards 
      ON Person.id = NotStarwarsGenreAwards.personID
WHERE Person.id in (SELECT personID
                    FROM (Content NATURAL JOIN Movie) as MovieContent 
                          JOIN RolePersonContent 
                          ON (RolePersonContent.contentID = MovieContent.id)
                    WHERE Content.name like '%Star Wars%')

SELECT Person.firstName || ' ' || Person.lastName as name
FROM Person
     NATURAL JOIN (SELECT DISTINCT(personID) as id
                   FROM MovieAward
                        JOIN ContentGenre as MovieGenre
                        ON (MovieGenre.contentID = MovieAward.movieID)
                        NATURAL JOIN (SELECT DISTINCT ID AS genreID
                                      FROM (SELECT ContentGenre.genreID as ID
                                            FROM Movie
                                                 JOIN ContentGenre
                                                 ON (Movie.id = ContentGenre.contentID)
                                            EXCEPT
                                            SELECT DISTINCT(ContentGenre.genreID) as ID
                                            FROM ContentGenre
                                                 NATURAL JOIN (SELECT Content.id as contentID
                                                               FROM Content NATURAL JOIN Movie
                                                               WHERE Content.name like '%Star Wars%') as StarWarsMovies)
                   )) as NotStarwarsGenreAwards
WHERE Person.id in (SELECT personID
                    FROM (Content NATURAL JOIN Movie) as MovieContent
                          JOIN RolePersonContent
                          ON (RolePersonContent.contentID = MovieContent.id)
                    WHERE Content.name like '%Star Wars%')                      


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
                    FROM StarWarsMovies NATURAL JOIN RolePersonContent)                    


