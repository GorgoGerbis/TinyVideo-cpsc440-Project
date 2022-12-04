# PART-1-ClassActivity-TinyVideo 
# CODE JACKSON WALKER
USE TinyVideo;
# Based on the referential integrity constraints, you should be able to identify a correct sequence in which to create the tables.  
# The key point is that due to referential integrity constraints, 
# the table contributing its PK as a FK must be created before the related table containing the FK.  

# Q3: Write the SQL command to change the movie year for movie number 1245 to 2008.
UPDATE MOVIE
SET MOVIE_YEAR = 2008
WHERE MOVIE_NUM = 1245;
 
# Q4: Write the SQL command to change the price code for all Action movies to price code 3.
UPDATE MOVIE
SET PRICE_CODE = 3
WHERE MOVIE_GENRE = 'ACTION';
 
# Q5: Write a single SQL command to increase all price rental fee values by $0.50.
UPDATE PRICE
SET PRICE_RENTFEE = PRICE_RENTFEE + 0.50;

# Q6: Write the SQL command to save the changes made to the PRICE and MOVIE tables in Problems 3 – 5.
COMMIT;
 
# Q7: Write a query to display the movie title, movie year, and movie genre for all movies (result shown in Figure 2).
SELECT m.MOVIE_TITLE, m.MOVIE_YEAR, m.MOVIE_GENRE
FROM MOVIE m;