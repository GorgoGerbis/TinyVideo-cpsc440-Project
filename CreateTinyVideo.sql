CREATE SCHEMA TinyVideo;
USE TinyVideo;
# Based on the referential integrity constraints, you should be able to identify a correct sequence in which to create the tables.  
# The key point is that due to referential integrity constraints, 
# the table contributing its PK as a FK must be created before the related table containing the FK.  

CREATE TABLE PRICE (
PRICE_CODE DECIMAL(2,0) NOT NULL,
PRICE_DESCRIPTION VARCHAR(20)  NOT NULL,
PRICE_RENTFEE DECIMAL(5,2) CHECK (PRICE_RENTFEE >= 0),
PRICE_DAILYLATEFEE DECIMAL(5,2) CHECK (PRICE_DAILYLATEFEE >= 0),
PRIMARY KEY (PRICE_CODE)
);

CREATE TABLE MOVIE (
MOVIE_NUM DECIMAL(8,0)  NOT NULL,
MOVIE_TITLE VARCHAR(75) NOT NULL,
MOVIE_YEAR DECIMAL(4,0)  CHECK (MOVIE_YEAR > 1900),
MOVIE_COST DECIMAL(5,2),
MOVIE_GENRE VARCHAR(50),
PRICE_CODE DECIMAL(2,0) NOT NULL,
PRIMARY KEY (MOVIE_NUM),
FOREIGN KEY (PRICE_CODE) REFERENCES PRICE(PRICE_CODE)
);

CREATE TABLE VIDEO (
VID_NUM DECIMAL(8,0) NOT NULL,
VID_INDATE DATE,
MOVIE_NUM DECIMAL(8,0),
PRIMARY KEY (VID_NUM),
FOREIGN KEY (MOVIE_NUM) REFERENCES MOVIE(MOVIE_NUM)
);

CREATE TABLE MEMBERSHIP (
MEM_NUM DECIMAL(8,0) NOT NULL,
MEM_FNAME VARCHAR(30) NOT NULL,
MEM_LNAME VARCHAR(30) NOT NULL,
MEM_STREET VARCHAR(120),
MEM_CITY VARCHAR(50),
MEM_STATE CHAR(2),
MEM_ZIP CHAR(5),
MEM_BALANCE DECIMAL(10,2),
PRIMARY KEY (MEM_NUM)
);

CREATE TABLE RENTAL (
RENT_NUM DECIMAL(8,0) NOT NULL,
RENT_DATE DATE,
MEM_NUM DECIMAL(8,0),
PRIMARY KEY (RENT_NUM),
FOREIGN KEY (MEM_NUM) REFERENCES MEMBERSHIP(MEM_NUM)
);

CREATE TABLE DETAILRENTAL (
RENT_NUM DECIMAL(8,0) NOT NULL,
VID_NUM DECIMAL(8,0) NOT NULL,
DETAIL_FEE DECIMAL(5,2),
DETAIL_DUEDATE DATE,
DETAIL_RETURNDATE DATE,
DETAIL_DAILYLATEFEE DECIMAL(5,2),
PRIMARY KEY (RENT_NUM, VID_NUM ),
FOREIGN KEY (RENT_NUM) REFERENCES RENTAL(RENT_NUM),
FOREIGN KEY (VID_NUM) REFERENCES VIDEO(VID_NUM)
);