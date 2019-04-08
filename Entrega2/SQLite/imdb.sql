
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

    movieID             




);

CREATE TABLE Episode(

    episodeID           INT PRIMARY KEY REFERENCES Content(id),
    number              INT,
    seasonNumber        INT,
    tvshowID            INT REFERENCES TVShow(id),



);