CREATE OR REPLACE TABLE desenvolvimento.gold.tracks_artists AS
SELECT 
    t.*,
    a.popularity as artist_popularity, a.followers, a.genres
FROM 
    desenvolvimento.silver.tracks t
JOIN 
    desenvolvimento.silver.artists a
ON 
    t.id_artists = a.id;
