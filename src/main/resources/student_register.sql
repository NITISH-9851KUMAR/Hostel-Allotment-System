# This table store student details which register details to show his hostel Details

CREATE TABLE student_register(
    id INT PRIMARY KEY AUTO_INCREMENT,
    prn VARCHAR(12) UNIQUE ,
    password VARCHAR(20),
    FOREIGN KEY (prn) REFERENCES students (prn)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
