SELECT *
FROM (
      
    SELECT MovieAward.year, Person.firstName || ' ' || Person.lastName as name, count(*) as count
    FROM MovieAward JOIN Person ON (Person.id = MovieAward.personID)
    WHERE personID NOT NULL
    GROUP BY MovieAward.year, personID 
    
    UNION
    
    SELECT MovieAward.year, Content.name as name, count(*) as count
    FROM MovieAward,Movie,Content
    WHERE personID IS NULL and MovieAward.movieID = Movie.id and Content.id = Movie.id
    GROUP BY MovieAward.year, movieID 
    
    UNION
    
    SELECT TVAward.year, Person.firstName || ' ' || Person.lastName as name, count(*) as count
    FROM TVAward JOIN Person ON (Person.id = TVAward.personID)
    WHERE personID NOT NULL
    GROUP BY TVAward.year, personID
    
    UNION
    
    SELECT TVAward.year, TVShow.name as name, count(*) as count
    FROM TVAward JOIN TVShow ON (TVAward.tvshowID = TVShow.id)
    WHERE personID IS NULL
    GROUP BY TVAward.year, tvshowID
)
WHERE count >= 2