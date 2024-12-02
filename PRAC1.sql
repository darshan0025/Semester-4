--Part – A
--1. Retrieve a unique genre of songs.
SELECT DISTINCT Genre FROM Songs;

--2. Find top 2 albums released before 2010.
SELECT TOP 2* 
FROM Albums 
WHERE Release_year < 2010 

--3. Insert Data into the Songs Table. (1245, ‘Zaroor’, 2.55, ‘Feel good’, 1005)
INSERT INTO Songs (Song_id, Song_title, Duration, Genre, Album_id) 
VALUES (1245, 'Zaroor', 2.55, 'Feel good', 1005);

--4. Change the Genre of the song ‘Zaroor’ to ‘Happy’
UPDATE Songs 
SET Genre = 'Happy' 
WHERE Song_title = 'Zaroor';

--5. Delete an Artist ‘Ed Sheeran’
DELETE FROM Artists 
WHERE Artist_name = 'Ed Sheeran';

--6. Add a New Column for Rating in Songs Table. [Ratings decimal(3,2)]
ALTER TABLE Songs 
ADD Rating DECIMAL(3, 2);

--7. Retrieve songs whose title starts with 'S'.
SELECT * 
FROM Songs 
WHERE Song_title LIKE 'S%';

--8. Retrieve all songs whose title contains 'Everybody'.
SELECT * 
FROM Songs 
WHERE Song_title LIKE '%Everybody%';

--9. Display Artist Name in Uppercase.
SELECT UPPER(Artist_name) AS Artist_Name 
FROM Artists;

--10. Find the Square Root of the Duration of a Song ‘Good Luck’
SELECT SQRT(Duration) AS SquareRoot_Duration 
FROM Songs 
WHERE Song_title = 'Good Luck';

--11. Find Current Date.
SELECT CURRENT_DATE AS CurrentDate;

--12. Find the number of albums for each artist.
SELECT a.Artist_name, COUNT(al.Album_id) AS Album_Count 
FROM Artists a
JOIN Albums al ON a.Artist_id = al.Artist_id
GROUP BY a.Artist_name;

--13. Retrieve the Album_id which has more than 5 songs in it.
SELECT Album_id 
FROM Songs 
GROUP BY Album_id 
HAVING COUNT(Song_id) > 5;

--14. Retrieve all songs from the album 'Album1'. (using Subquery)
SELECT * 
FROM Songs 
WHERE Album_id = (SELECT Album_id 
                  FROM Albums 
                  WHERE Album_title = 'Album1');

--15. Retrieve all albums name from the artist ‘Aparshakti Khurana’ (using Subquery)
SELECT Album_title 
FROM Albums 
WHERE Artist_id = (SELECT Artist_id 
                   FROM Artists 
                   WHERE Artist_name = 'Aparshakti Khurana');

--16. Retrieve all the song titles with its album title.
SELECT s.Song_title, a.Album_title 
FROM Songs s
JOIN Albums a ON s.Album_id = a.Album_id;

--17. Find all the songs which are released in 2020.
SELECT s.Song_title 
FROM Songs s
JOIN Albums a ON s.Album_id = a.Album_id
WHERE a.Release_year = 2020;

--18. Create a view called ‘Fav_Songs’ from the songs table having songs with song_id 101-105.
CREATE VIEW Fav_Songs AS
SELECT * 
FROM Songs 
WHERE Song_id BETWEEN 101 AND 105;

--19. Update a song name to ‘Jannat’ of song having song_id 101 in Fav_Songs view.
UPDATE Fav_Songs 
SET Song_title = 'Jannat' 
WHERE Song_id = 101;

--20. Find all artists who have released an album in 2020.
SELECT DISTINCT ar.Artist_name 
FROM Artists ar
JOIN Albums al ON ar.Artist_id = al.Artist_id
WHERE al.Release_year = 2020;

--21. Retrieve all songs by Shreya Ghoshal and order them by duration
SELECT s.Song_title, s.Duration 
FROM Songs s
JOIN Albums a ON s.Album_id = a.Album_id
JOIN Artists ar ON a.Artist_id = ar.Artist_id
WHERE ar.Artist_name = 'Shreya Ghoshal'
ORDER BY s.Duration;

--Part – B
--22. Retrieve all song titles by artists who have more than one album.
SELECT s.Song_title
FROM Songs s
JOIN Albums a ON s.Album_id = a.Album_id
WHERE a.Artist_id IN (
    SELECT Artist_id
    FROM Albums
    GROUP BY Artist_id
    HAVING COUNT(Album_id) > 1
);

--23. Retrieve all albums along with the total number of SELECT s.Song_title
SELECT a.Album_title, COUNT(s.Song_id) AS Total_Songs
FROM Albums a
LEFT JOIN Songs s ON a.Album_id = s.Album_id
GROUP BY a.Album_title;

--24. Retrieve all songs and release year and sort them by release year.
SELECT s.Song_title, a.Release_year
FROM Songs s
JOIN Albums a ON s.Album_id = a.Album_id
ORDER BY a.Release_year;

--25. Retrieve the total number of songs for each genre, showing genres that have more than 2 songs.
SELECT Genre, COUNT(Song_id) AS Total_Songs
FROM Songs
GROUP BY Genre
HAVING COUNT(Song_id) > 2;

--26. List all artists who have albums that contain more than 3 songs.
SELECT DISTINCT ar.Artist_name
FROM Artists ar
JOIN Albums a ON ar.Artist_id = a.Artist_id
WHERE a.Album_id IN (
    SELECT Album_id
    FROM Songs
    GROUP BY Album_id
    HAVING COUNT(Song_id) > 3
);

--Part – C
--27. Retrieve albums that have been released in the same year as 'Album4'
SELECT Album_title
FROM Albums
WHERE Release_year = (SELECT Release_year
                      FROM Albums
                      WHERE Album_title = 'Album4');

--28. Find the longest song in each genre
SELECT Genre, MAX(Duration) AS Longest_Duration
FROM Songs
GROUP BY Genre;

--29. Retrieve the titles of songs released in albums that contain the word 'Album' in the title.
SELECT s.Song_title
FROM Songs s
JOIN Albums a ON s.Album_isd = a.Album_id
WHERE a.Album_title LIKE '%Album%';

--30. Retrieve the total duration of songs by each artist where total duration exceeds 15 minutes
SELECT ar.Artist_name, SUM(s.Duration) AS Total_Duration
FROM Songs s
JOIN Albums a ON s.Album_id = a.Album_id
JOIN Artists ar ON a.Artist_id = ar.Artist_id
GROUP BY ar.Artist_name
HAVING SUM(s.Duration) > 15;
