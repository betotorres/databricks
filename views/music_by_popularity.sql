CREATE OR REPLACE VIEW desenvolvimento.gold.music_characteristics_by_popularity AS
SELECT
  CASE
    WHEN popularity < 20 THEN 'Bin 1: 0-19'
    WHEN popularity >= 20 AND popularity < 40 THEN 'Bin 2: 20-39'
    WHEN popularity >= 40 AND popularity < 60 THEN 'Bin 3: 40-59'
    WHEN popularity >= 60 AND popularity < 80 THEN 'Bin 4: 60-79'
    ELSE 'Bin 5: 80-100'
  END AS popularity_bin,
  COUNT(*) AS num_songs,
  AVG(danceability) AS avg_danceability,
  AVG(energy) AS avg_energy,
  AVG(loudness) AS avg_loudness,
  AVG(speechiness) AS avg_speechiness,
  AVG(acousticness) AS avg_acousticness,
  AVG(instrumentalness) AS avg_instrumentalness,
  AVG(liveness) AS avg_liveness,
  AVG(valence) AS avg_valence,
  AVG(tempo) AS avg_tempo,
  AVG(duration_ms) AS avg_duration_ms
FROM
  desenvolvimento.gold.tracks_artists
WHERE
  release_date > '2000-01-01'
GROUP BY
  popularity_bin
ORDER BY
  popularity_bin;