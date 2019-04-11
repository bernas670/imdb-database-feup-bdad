
CREATE TABLE Content(

    id                  INTEGER PRIMARY KEY,
    name                TEXT NOT NULL,
    description         TEXT,
    ageRating           TEXT,
    score               INTEGER,
    duration            INTEGER CHECK(duration > 0),
    budget              REAL CHECK(budget > 0) 

);

CREATE TABLE Movie(

    id                  INTEGER PRIMARY KEY REFERENCES Content(id),
    year                INTEGER CHECK(year > 1850) NOT NULL,
    boxoffice           REAL CHECK(boxoffice >= 0)          

);


CREATE TABLE TVShow(

    id                  INTEGER PRIMARY KEY,
    name                TEXT UNIQUE NOT NULL,
    description         TEXT,
    ageRating           TEXT,
    score               INTEGER,
    onGoing             INTEGER

);

CREATE TABLE Episode(

    id                  INTEGER PRIMARY KEY REFERENCES Content(id),
    number              INTEGER CHECK(number >= 0) NOT NULL,
    seasonNumber        INTEGER CHECK(seasonNumber > 0) NOT NULL,
    tvshowID            INTEGER REFERENCES TVShow(id)

);


CREATE TABLE Award(

    id                  INTEGER PRIMARY KEY,
    category            TEXT NOT NULL,
    awardNameID         INTEGER REFERENCES AwardName(id)
        
);

CREATE TABLE AwardName(

    id                  INTEGER PRIMARY KEY,
    name                TEXT UNIQUE NOT NULL

);


CREATE TABLE MovieAward(

    year                INTEGER NOT NULL,
    awardID             INTEGER REFERENCES Award(id),
    movieID             INTEGER REFERENCES Movie(id),
    personID            INTEGER REFERENCES Person(id),
    PRIMARY KEY(awardID,movieID,personID)

);

CREATE TABLE TvShowReview(

	tvshowID			INTEGER REFERENCES TVShow(id),
	userID				INTEGER REFERENCES User(id),
	score				INTEGER CHECK(score >= 0 AND score <= 10),
	review				TEXT,

	PRIMARY KEY(tvshowID, userID)

);

CREATE TABLE Watchlist(

	contentID			INTEGER REFERENCES Content(id),
	userID				INTEGER REFERENCES User(id),

	PRIMARY KEY(contentID, userID)

);

CREATE TABLE Gender(

	id 					INTEGER PRIMARY KEY,
	name				TEXT UNIQUE NOT NULL

);

CREATE TABLE Country(

	id					INTEGER PRIMARY KEY,
	name				TEXT UNIQUE NOT NULL

);

CREATE TABLE Released(

	contentID			INTEGER REFERENCES Content(id),
	date				DATE NOT NULL,
	countryID			INTEGER REFERENCES Country(id),
    PRIMARY KEY(contentID, countryID)

);

CREATE TABLE Genre(

	id					INTEGER PRIMARY KEY,
	name				TEXT UNIQUE NOT NULL,
	description			TEXT

);

CREATE TABLE ContentGenre(

	contentID			INTEGER REFERENCES Content(id),
	genreID				INTEGER REFERENCES Genre(id),
    PRIMARY KEY(contentID, genreID)

);

CREATE TABLE TVAward(

    year                INTEGER NOT NULL,
    awardID             INTEGER REFERENCES Award(id),
    tvshowID            INTEGER REFERENCES TVShow(id),
    personID            INTEGER REFERENCES Person(id),
    PRIMARY KEY(awardID,tvshowID,personID)

);

CREATE TABLE Person(

    id                  INTEGER PRIMARY KEY,
    firstName           TEXT NOT NULL,
    lastName            TEXT NOT NULL,
    biography           TEXT,
    photo               BLOB,
    dateOfBirth         DATE NOT NULL,
    dateOfDeath         DATE,
    country             INTEGER REFERENCES Country(id),
    gender              INTEGER REFERENCES Gender(id)
    CHECK((dateOfBirth < dateOfDeath) or (dateOfDeath is NULL ))

);

CREATE TABLE Role(

    id                  INTEGER PRIMARY KEY,
    description         TEXT NOT NULL

);

CREATE TABLE RolePersonContent(

    roleID              INTEGER REFERENCES Role(id),
    personID            INTEGER REFERENCES Person(id),
    contentID           INTEGER REFERENCES Content(id),

    PRIMARY KEY(roleID,personID, contentID)

);

CREATE TABLE User(

    id                  INTEGER PRIMARY KEY,
    email               TEXT UNIQUE NOT NULL ,
    name                TEXT NOT NULL

);

CREATE TABLE ContentReview(

    contentID           INTEGER REFERENCES Content(id),
    userID              INTEGER REFERENCES User(id),
    score               INTEGER CHECK(score >= 0 AND score <= 10),
    review              TEXT,

    PRIMARY KEY(contentID,userID)

);
