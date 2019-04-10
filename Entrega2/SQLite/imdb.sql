
CREATE TABLE Content(

    id                  INT PRIMARY KEY,
    name                TEXT,
    description         TEXT,
    ageRating           TEXT,
    score               INT,
    duration            INT,
    budget              REAL

);

CREATE TABLE Movie(

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
    awardID             INT REFERENCES Award(id),
    movieID             INT REFERENCES Movie(id),
    personID            INT REFERENCES Person(id),
    PRIMARY KEY(awardID,movieID,personID)

);

CREATE TABLE TvShowReview(

	tvshowID			INT REFERENCES TVShow(id),
	userID				INT REFERENCES User(id),
	score				INT,
	review				TEXT,

	PRIMARY KEY(tvshowID, userID)

);

CREATE TABLE Watchlist(

	contentID			INT REFERENCES Content(id),
	userID				INT REFERENCES User(id),

	PRIMARY KEY(contentID, userID)

);

CREATE TABLE Gender(

	id 					INT PRIMARY KEY,
	name				TEXT

);

CREATE TABLE Country(

	id					INT PRIMARY KEY,
	name				TEXT

);

CREATE TABLE Released(

	contentID			INT PRIMARY KEY REFERENCES Content(id),
	date				TEXT,
	countryID			INT REFERENCES Country(id)

);

CREATE TABLE Genre(

	id					INT PRIMARY KEY,
	name				TEXT,
	description			TEXT

);

CREATE TABLE ContentGenre(

	contentID			INT REFERENCES Content(id),
	genreID				INT REFERENCES Genre(id)

);

CREATE TABLE TVAward(

    year                INT,
    awardID             INT REFERENCES Award(id),
    tvshowID            INT REFERENCES TVShow(id),
    personID            INT REFERENCES Person(id),
    PRIMARY KEY(awardID,tvshowID,personID)

);

CREATE TABLE Person(

    id                  INT PRIMARY KEY,
    firstName           TEXT,
    lastName            TEXT,
    biography           TEXT,
    photo               BLOB,
    dateOfBirth         TEXT,
    dateOfDeath         TEXT,
    country             INT REFERENCES Country(id),
    gender              INT REFERENCES Gender(id)

);

CREATE TABLE Role(

    id                  INT PRIMARY KEY,
    description         TEXT

);

CREATE TABLE RolePersonContent(

    roleID              INT REFERENCES Role(id),
    personID            INT REFERENCES Person(id),
    contentID           INT REFERENCES Content(id),

    PRIMARY KEY(roleID,personID, contenID)

);

CREATE TABLE User(

    id                  INT PRIMARY KEY,
    email               TEXT,
    name                TEXT

);

CREATE TABLE ContentReview(

    contentID           INT REFERENCES Content(id),
    userID              INT REFERENCES User(id),
    score               INT,
    review              TEXT,

    PRIMARY KEY(contentID,userID)

);
