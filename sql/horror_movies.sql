-- Add your SQL here
SELECT Movie_ID, Movie_Title, Rating
FROM (
    SELECT id AS Movie_ID, name AS Movie_Title, imdb_rating AS Rating,
           ROW_NUMBER() OVER (ORDER BY imdb_rating DESC) AS rn
    FROM movies
    WHERE genre = 'horror' AND release_year <= 1985
) AS ranked_movies
WHERE rn <= 3;