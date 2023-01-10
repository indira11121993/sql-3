SELECT genre_id , count(*) FROM genre_singer gs 
GROUP BY genre_id 
ORDER BY genre_id ASC;

SELECT count(track_id) FROM track t
JOIN album a ON t.album_id = a.album_id 
WHERE release_album BETWEEN '2019-01-01' AND '2020-12-31';

SELECT album_id, avg(duration) FROM track t
GROUP BY album_id
ORDER BY avg(duration) DESC;

SELECT DISTINCT singer_name FROM singer s 
WHERE singer_name NOT IN (
		SELECT DISTINCT singer_name
		FROM singer s
		LEFT JOIN album_singer als ON s.singer_id = als.singer_id
		LEFT JOIN album a ON a.album_id = als.album_id
		WHERE a.release_album BETWEEN '2020-01-01' AND '2020-12-31'
)
ORDER BY s.singer_name;

SELECT DISTINCT c.collection_name FROM collection c
JOIN track_collection tc ON c.collection_id = tc.collection_id 
JOIN track t ON tc.track_id = t.track_id 
JOIN album a ON t.album_id = a.album_id
JOIN album_singer as2 ON a.album_id = as2.album_id 
JOIN singer s ON as2.singer_id = s.singer_id 
WHERE singer_name = 'Rihanna'
ORDER BY c.collection_name;

SELECT album_name FROM album a 
JOIN album_singer as2 ON a.album_id = as2.album_id 
JOIN singer s ON as2.singer_id = s.singer_id 
JOIN genre_singer gs ON s.singer_id = gs.singer_id
JOIN genre g ON gs.genre_id = g.genre_id 
GROUP BY album_name 
HAVING count(DISTINCT g.genre_name) >1
ORDER BY album_name;

SELECT track_name FROM track t 
LEFT JOIN track_collection tc ON t.track_id = tc.track_id 
WHERE tc.track_id IS NULL;

SELECT singer_name, duration FROM track t
LEFT JOIN album a ON t.album_id = a.album_id
LEFT JOIN album_singer as2 ON a.album_id = as2.album_id 
LEFT JOIN singer s ON as2.singer_id = s.singer_id 
GROUP BY s.singer_name, t.duration
HAVING t.duration = (SELECT min(duration) FROM track)
ORDER BY s.singer_name;

SELECT DISTINCT album_name FROM album a
LEFT JOIN track t ON a.album_id = t.album_id 
WHERE t.album_id IN (
		SELECT album_id FROM track
		GROUP BY album_id
    	HAVING count(album_id) = (
    			SELECT count(album_id) FROM track
    			GROUP BY album_id
    			ORDER BY count LIMIT 1
		)
)
ORDER BY a.album_name;