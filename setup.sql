
--Creates a user database table:

CREATE TABLE user (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    hobbies TEXT,
    active BOOLEAN NOT NULL DEFAULT 1
);

CREATE TABLE vehicle_type (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    description VARCHAR(64)
);

CREATE TABLE vehicle (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    color VARCHAR(45) NOT NULL,
    license_plate VARCHAR(45) NOT NULL,
    v_type INTEGER NOT NULL,
    owner_id INTEGER NOT NULL,
    active BOOLEAN DEFAULT 1,
    FOREIGN KEY (v_type) REFERENCES vehicle_type(id),
    FOREIGN KEY (owner_id) REFERENCES user(id)
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

    INSERT INTO  vehicle_type (description) VALUES ("Car");
    INSERT INTO  vehicle_type (description) VALUES ("Truck");
    INSERT INTO  vehicle_type (description) VALUES ("SUV");
    INSERT INTO  vehicle_type (description) VALUES ("Motorcycle");
    INSERT INTO  vehicle_type (description) VALUES ("Bicycle");

    INSERT INTO vehicle (
        color,
        license_plate,
        v_type,
        owner_id
    ) VALUES (
        "red",
        "HELLO1",
        1,
        1
    );

    INSERT INTO vehicle (
        color,
        license_plate,
        v_type,
        owner_id
    ) VALUES (
        "purple",
        "HELLOWORLD",
        2,
        2
    );

    INSERT INTO vehicle (
        color,
        license_plate,
        v_type,
        owner_id
    ) VALUES (
        "black",
        "HELLO2",
        3,
        2
    );

SELECT  user.last_name,
        user.first_name,
        user.hobbies,
        user.active,
        vehicle.license_plate,
        vehicle.color,
        vehicle.v_type AS vehicle_type

FROM user INNER JOIN vehicle 
ON user.id = vehicle.owner_id;


SELECT  user.last_name,
        user.first_name,
        user.hobbies,
        user.active,
        vehicle.license_plate,
        vehicle.color,
        vehicle_type.description
FROM user
INNER JOIN vehicle ON user.id = vehicle.owner_id
INNER JOIN vehicle_type ON vehicle.v_type = vehicle_type.id;


