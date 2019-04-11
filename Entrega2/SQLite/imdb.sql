
CREATE TABLE Content(

    id                  INT PRIMARY KEY,
    name                TEXT NOT NULL,
    description         TEXT,
    ageRating           TEXT,
    score               INT,
    duration            INT CHECK(duration > 0),
    budget              REAL CHECK(budget > 0) 

);

CREATE TABLE Movie(

    movieID             INT PRIMARY KEY REFERENCES Content(id),
    year                INT CHECK(year > 1850) NOT NULL,
    boxoffice           REAL CHECK(boxoffice >= 0)          

);


CREATE TABLE TVShow(

    id                  INT PRIMARY KEY,
    name                TEXT UNIQUE NOT NULL,
    description         TEXT,
    ageRating           TEXT,
    score               INT,
    onGoing             INT

);

CREATE TABLE Episode(

    episodeID           INT PRIMARY KEY REFERENCES Content(id),
    number              INT CHECK(number >= 0) NOT NULL,
    seasonNumber        INT CHECK(seasonNumber > 0) NOT NULL,
    tvshowID            INT REFERENCES TVShow(id)

);


CREATE TABLE Award(

    id                  INT PRIMARY KEY,
    category            TEXT NOT NULL,
    awardNameID         INT REFERENCES AwardName(id)
        
);

CREATE TABLE AwardName(

    id                  INT PRIMARY KEY,
    name                TEXT UNIQUE NOT NULL

);


CREATE TABLE MovieAward(

    year                INT NOT NULL,
    awardID             INT REFERENCES Award(id),
    movieID             INT REFERENCES Movie(id),
    personID            INT REFERENCES Person(id),
    PRIMARY KEY(awardID,movieID,personID)

);

CREATE TABLE TvShowReview(

	tvshowID			INT REFERENCES TVShow(id),
	userID				INT REFERENCES User(id),
	score				INT CHECK(score >= 0 AND score <= 10),
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
	name				TEXT UNIQUE NOT NULL

);

CREATE TABLE Country(

	id					INT PRIMARY KEY,
	name				TEXT UNIQUE NOT NULL

);

CREATE TABLE Released(

	contentID			INT PRIMARY KEY REFERENCES Content(id),
	date				DATE NOT NULL,
	countryID			INT REFERENCES Country(id)

);

CREATE TABLE Genre(

	id					INT PRIMARY KEY,
	name				TEXT UNIQUE NOT NULL,
	description			TEXT

);

CREATE TABLE ContentGenre(

	contentID			INT REFERENCES Content(id),
	genreID				INT REFERENCES Genre(id)

);

CREATE TABLE TVAward(

    year                INT NOT NULL,
    awardID             INT REFERENCES Award(id),
    tvshowID            INT REFERENCES TVShow(id),
    personID            INT REFERENCES Person(id),
    PRIMARY KEY(awardID,tvshowID,personID)

);

CREATE TABLE Person(

    id                  INT PRIMARY KEY,
    firstName           TEXT NOT NULL,
    lastName            TEXT NOT NULL,
    biography           TEXT,
    photo               BLOB,
    dateOfBirth         DATE NOT NULL,
    dateOfDeath         DATE,
    country             INT REFERENCES Country(id),
    gender              INT REFERENCES Gender(id)
    CHECK((dateOfBirth < dateOfDeath) or (dateOfDeath is NULL ))

);

CREATE TABLE Role(

    id                  INT PRIMARY KEY,
    description         TEXT NOT NULL

);

CREATE TABLE RolePersonContent(

    roleID              INT REFERENCES Role(id),
    personID            INT REFERENCES Person(id),
    contentID           INT REFERENCES Content(id),

    PRIMARY KEY(roleID,personID, contentID)

);

CREATE TABLE User(

    id                  INT PRIMARY KEY,
    email               TEXT UNIQUE NOT NULL ,
    name                TEXT NOT NULL

);

CREATE TABLE ContentReview(

    contentID           INT REFERENCES Content(id),
    userID              INT REFERENCES User(id),
    score               INT CHECK(score >= 0 AND score <= 10),
    review              TEXT,

    PRIMARY KEY(contentID,userID)

);
