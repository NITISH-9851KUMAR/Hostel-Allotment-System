CREATE TABLE room_allotment
(
    id int PRIMARY KEY AUTO_INCREMENT,
    prn VARCHAR(10) UNIQUE,
    room_number VARCHAR(10),
    allotment_date VARCHAR(50),
    FOREIGN KEY (prn) REFERENCES students (prn)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)