
CREATE TABLE Content(

    id                  INT PRIMARY KEY,
    name                TEXT,
    description         TEXT,
    ageRating           TEXT,
    score               INT,
    duration            INT,
    budget              REAL

);

CREATE TABLE MOVIE(

    movieID             INT PRIMARY KEY REFERENCES Content(id),
    year                INT,
    boxoffice           REAL          

);


CREATE TABLE TVShow(

    id                  INT PRIMARY KEY,
    name                TEXT,
    description         TEXT,
    ageRating           TEXT,
    score               INT

);

CREATE TABLE Episode(

    episodeID           INT PRIMARY KEY REFERENCES Content(id),
    number              INT,
    seasonNumber        INT,
    tvshowID            INT REFERENCES TVShow(id)

);


CREATE TABLE Award(

    id                  INT PRIMARY KEY,
    category            TEXT,
    awardNameID         INT REFERENCES AwardName(id)
        
);

CREATE TABLE AwardName(

    id                  INT PRIMARY KEY,
    name                TEXT

);


CREATE TABLE MovieAward(

    year                INT,



);
