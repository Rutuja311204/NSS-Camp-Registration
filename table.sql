CREATE DATABASE nss_db;
USE nss_db;

CREATE TABLE nss_camp (
    id INT AUTO_INCREMENT PRIMARY KEY,
    volunteer VARCHAR(40),
    branch VARCHAR(10),
    tshirt VARCHAR(5),
    mobile VARCHAR(10)
);

SELECT * FROM nss_camp;

INSERT INTO nss_camp (volunteer, branch, tshirt, mobile)
VALUES
('bhumika', 'BCA', 'XL', '8796361515'),
('Rutuja', 'MBA', 'M', '8600345187');

SELECT * FROM nss_camp;
