# DELETES THE DATABASE
DROP DATABASE TinyVideo;

# DELETE THE TABLES
DROP TABLE IF EXISTS DETAILRENTAL;
DROP TABLE IF EXISTS RENTAL;
DROP TABLE IF EXISTS MEMBERSHIP;
DROP TABLE IF EXISTS VIDEO;
DROP TABLE IF EXISTS MOVIE;
DROP TABLE IF EXISTS PRICE;

# DELETE ALL DATA FROM THE TABLES
DELETE FROM DETAILRENTAL;
DELETE FROM RENTAL;
DELETE FROM MEMBERSHIP;
DELETE FROM VIDEO;
DELETE FROM MOVIE;
DELETE FROM PRICE; 