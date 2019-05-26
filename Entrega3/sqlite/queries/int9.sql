.mode columns
.headers on
.nullvalue NULL

SELECT (firstName || " " || lastName) AS name, description AS role, tvshowName AS tvshow, episodeName AS episode
FROM (
        (
         SELECT  firstName, lastName, Role.description, TVShow.id as tvshowid, Content.name AS episodeName, count(Episode.id) AS numPart
         FROM Person, RolePersonContent, Role, Content, Episode, TVShow
         ON Person.id = RolePersonContent.personID AND
            Role.id = RolePersonContent.roleID AND 
            Content.id = RolePersonContent.contentID AND
            Content.id = Episode.id AND 
            Episode.tvshowID = TVShow.id 
         WHERE (Role.description = 'Actor' OR Role.description = 'Voice actor') 
         GROUP BY Person.id, TVShow.id 
        ) AS ParticipationsInTVShow
        JOIN 
        (
         SELECT TVShow.id AS tvshowid, TVShow.name AS tvshowName, count(Episode.id) AS numEpisodes
         FROM Episode, TVShow
         ON Episode.tvshowID = TVShow.id
         GROUP BY TVShow.id
        ) AS EpisodesInTVShow
        ON ParticipationsInTVShow.tvshowid = EpisodesInTVShow.tvshowid
     )
WHERE numPart = 1 AND numEpisodes > 1;
