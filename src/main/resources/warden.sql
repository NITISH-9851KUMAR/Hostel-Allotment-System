# DROP TABLE wardendetailstable;

CREATE TABLE warden_details(
    id int PRIMARY KEY AUTO_INCREMENT,
    password VARCHAR(20),
    name VARCHAR(50)
)