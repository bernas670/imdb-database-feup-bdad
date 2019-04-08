
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
    tvshowID            INT REFERENCES TVShow(id)



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
