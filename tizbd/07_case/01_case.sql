CREATE TABLE books(
    author varchar(255),
    title varchar(255),
    publication_year int,
    ISBN varchar(15) primary key,
    rating dec(3,2),
    ratings_no int,
    reviews_no int,
    1_star int,
    2_star int,
    3_star int,
    4_star int,
    5_star int
);

LOAD DATA INFILE 'C:\\xampp\\htdocs\\5e_2\\tizbd\\07_case\\ksiazki.csv'
INTO TABLE books
CHARACTER SET 'utf8'
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(author,title,publication_year,ISBN,@rating,ratings_no,reviews_no,1_star,2_star,3_star,4_star,5_star)
SET rating = replace(@rating, ',', '.');

SELECT 
    rating, 
    title,
    CASE 
        WHEN rating > 4 THEN 'dobra'
        ELSE 'przecietna'
    END as rating,
    author
FROM books;