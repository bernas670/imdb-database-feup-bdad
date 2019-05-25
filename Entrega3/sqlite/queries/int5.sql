SELECT TVShow.name as ShowName,User.name as Username
FROM (SELECT userID,tvshowID,contentID, count(*) as numberOfEpisodesOfShowInWatchlist
      FROM Watchlist JOIN Episode ON (Watchlist.contentID = Episode.id)
      GROUP BY userID,tvshowID) as UserAndPerShowEpisodeCntInWatchlist,
      (SELECT tvshowID, count(*) as episodeCnt
      FROM Episode
      GROUP BY TVShowID) as EpisodeCountPerTVShow,
      TVShow,
      User
WHERE EpisodeCountPerTVShow.episodeCnt = UserAndPerShowEpisodeCntInWatchlist.numberOfEpisodesOfShowInWatchlist 
        and UserAndPerShowEpisodeCntInWatchlist.tvshowID = EpisodeCountPerTVShow.tvshowID
        and User.id = UserAndPerShowEpisodeCntInWatchlist.userID
        and TVShow.name = 'Rick and Morty'
        