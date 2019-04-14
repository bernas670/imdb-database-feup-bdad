DROP TABLE IF EXISTS Content;
DROP TABLE IF EXISTS Movie;
DROP TABLE IF EXISTS TVShow;
DROP TABLE IF EXISTS Episode;
DROP TABLE IF EXISTS Award;
DROP TABLE IF EXISTS AwardName;
DROP TABLE IF EXISTS MovieAward;
DROP TABLE IF EXISTS TVAward;
DROP TABLE IF EXISTS TVShowReview;
DROP TABLE IF EXISTS ContentReview;
DROP TABLE IF EXISTS Watchlist;
DROP TABLE IF EXISTS Person;
DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS Role;
DROP TABLE IF EXISTS RolePersonContent;
DROP TABLE IF EXISTS Genre;
DROP TABLE IF EXISTS ContentGenre;
DROP TABLE IF EXISTS Gender;
DROP TABLE IF EXISTS Released;
DROP TABLE IF EXISTS Country;
DROP TABLE IF EXISTS Creator;


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

    id                  INTEGER PRIMARY KEY REFERENCES Content(id) ON UPDATE CASCADE ON DELETE RESTRICT, 
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

    id                  INTEGER PRIMARY KEY REFERENCES Content(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    number              INTEGER CHECK(number >= 0) NOT NULL,
    seasonNumber        INTEGER CHECK(seasonNumber > 0) NOT NULL,
    tvshowID            INTEGER REFERENCES TVShow(id) ON UPDATE CASCADE ON DELETE RESTRICT

);


CREATE TABLE Award(

    id                  INTEGER PRIMARY KEY,
    category            TEXT NOT NULL,
    awardNameID         INTEGER REFERENCES AwardName(id) ON UPDATE CASCADE ON DELETE RESTRICT
        
);

CREATE TABLE AwardName(

    id                  INTEGER PRIMARY KEY,
    name                TEXT UNIQUE NOT NULL

);


CREATE TABLE MovieAward(

    year                INTEGER NOT NULL,
    awardID             INTEGER REFERENCES Award(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    movieID             INTEGER REFERENCES Movie(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    personID            INTEGER REFERENCES Person(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    PRIMARY KEY(awardID,movieID,personID)

);

CREATE TABLE TVShowReview(

	tvshowID			INTEGER REFERENCES TVShow(id) ON UPDATE CASCADE ON DELETE RESTRICT,
	userID				INTEGER REFERENCES User(id) ON UPDATE CASCADE ON DELETE RESTRICT,
	score				INTEGER CHECK(score >= 0 AND score <= 10),
	review				TEXT,

	PRIMARY KEY(tvshowID, userID)

);

CREATE TABLE Watchlist(

	contentID			INTEGER REFERENCES Content(id) ON UPDATE CASCADE ON DELETE RESTRICT,
	userID				INTEGER REFERENCES User(id) ON UPDATE CASCADE ON DELETE RESTRICT,

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

	contentID			INTEGER REFERENCES Content(id) ON UPDATE CASCADE ON DELETE RESTRICT,
	date				DATE NOT NULL,
	countryID			INTEGER REFERENCES Country(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    PRIMARY KEY(contentID, countryID)

);

CREATE TABLE Genre(

	id					INTEGER PRIMARY KEY,
	name				TEXT UNIQUE NOT NULL,
	description			TEXT

);

CREATE TABLE ContentGenre(

	contentID			INTEGER REFERENCES Content(id) ON UPDATE CASCADE ON DELETE RESTRICT,
	genreID				INTEGER REFERENCES Genre(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    PRIMARY KEY(contentID, genreID)

);

CREATE TABLE TVAward(

    year                INTEGER NOT NULL,
    awardID             INTEGER REFERENCES Award(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    tvshowID            INTEGER REFERENCES TVShow(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    personID            INTEGER REFERENCES Person(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    PRIMARY KEY(awardID,tvshowID,personID)

);

CREATE TABLE Person(

    id                  INTEGER PRIMARY KEY,
    firstName           TEXT NOT NULL,
    lastName            TEXT NOT NULL,
    biography           TEXT,
    photo               TEXT,
    dateOfBirth         DATE NOT NULL,
    dateOfDeath         DATE,
    country             INTEGER REFERENCES Country(id) ON UPDATE CASCADE ON DELETE SET NULL,
    gender              INTEGER REFERENCES Gender(id) ON UPDATE CASCADE ON DELETE SET NULL,
    CHECK((dateOfBirth < dateOfDeath) or (dateOfDeath is NULL ))

);

CREATE TABLE Creator(

    personID            INTEGER REFERENCES Person(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    tvshowID            INTEGER REFERENCES TVShow(id) ON UPDATE CASCADE ON DELETE RESTRICT,

    PRIMARY KEY(personID,tvshowID)
);

CREATE TABLE Role(

    id                  INTEGER PRIMARY KEY,
    description         TEXT NOT NULL

);

CREATE TABLE RolePersonContent(

    roleID              INTEGER REFERENCES Role(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    personID            INTEGER REFERENCES Person(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    contentID           INTEGER REFERENCES Content(id) ON UPDATE CASCADE ON DELETE RESTRICT,

    PRIMARY KEY(roleID,personID, contentID)

);

CREATE TABLE User(

    id                  INTEGER PRIMARY KEY,
    email               TEXT UNIQUE NOT NULL ,
    name                TEXT NOT NULL

);

CREATE TABLE ContentReview(

    contentID           INTEGER REFERENCES Content(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    userID              INTEGER REFERENCES User(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    score               INTEGER CHECK(score >= 0 AND score <= 10),
    review              TEXT,

    PRIMARY KEY(contentID,userID)

);
