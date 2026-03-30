# DROP TABLE wardendetailstable;

CREATE TABLE warden_details(
    id int PRIMARY KEY AUTO_INCREMENT,
    password VARCHAR(20),
    name VARCHAR(50)
);

INSERT INTO warden_details (id, password, name)
VALUES
    ('12345', 'rohit', 'Rohit Khan'),
    ('983577', 'nitish', 'Nitish Kumar');