SELECT 
  at.*
FROM
  desenvolvimento.gold.tracks_artists AS at
CROSS JOIN (
  SELECT
    *
  FROM
    desenvolvimento.gold.music_characteristics_by_popularity
  WHERE
    popularity_bin = 'Bin 5: 80-100'
) AS t
WHERE
  at.danceability >= t.avg_danceability
  AND at.energy <= t.avg_energy
  AND at.liveness <= t.avg_liveness
  AND at.instrumentalness <= t.avg_instrumentalness
   AND at.speechiness >= t.avg_speechiness
  AND at.release_date >= DATE('2020-01-01')
  ORDER BY at.followers DESC