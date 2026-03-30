create table students(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    prn VARCHAR(12) UNIQUE,
    email VARCHAR(50),
    phone VARCHAR(15),
    course VARCHAR(20),
    branch VARCHAR(20),
    year VARCHAR(10),
    room_number VARCHAR(10),
    allotment_date VARCHAR(50)
);

