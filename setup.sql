
--Creates a user database table:

CREATE TABLE user (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    hobbies TEXT,
    active BOOLEAN NOT NULL DEFAULT 1
);

INSERT INTO user (
    first_name,
    last_name,
    hobbies
    ) VALUES (
        "Mike",
        "Sanders",
        "Catching Up"
    );

INSERT INTO user (
    first_name,
    last_name,
    hobbies
    ) VALUES (
        "Miles",
        "Zanders",
        "Watching Mike Catching Up"
    );

INSERT INTO user (
    first_name,
    last_name,
    hobbies
    ) VALUES (
        "Bike",
        "Manders",
        "Catching COVID"
    );