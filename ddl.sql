-- Christian Duval --
-- X'avier Tejada --

SET FOREIGN_KEY_CHECKS=0;
SET AUTOCOMMIT = 0;

CREATE OR REPLACE Games (
    gameID INT(11) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    developerID VARCHAR(100) NOT NULL,
    genre VARCHAR(100) NOT NULL,
    releaseDate DATE NOT NULL,
    price: FLOAT NOT NULL,
    platform VARCHAR(100) NOT NULL,
    condition BOOLEAN NOT NULL,
    quantityInStock INT NOT NULL,
    CONSTRAINT `developerfk_1` FOREIGN KEY (`developerID`) REFERENCES `Developers`(`developerID`)
);

CREATE OR REPLACE Developers (
    developersID INT(11) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
);

CREATE OR REPLACE Customers (
    customerID INT(11) NOT NULL PRIMARY KEY,
    firstName VARCHAR(100) NOT NULL,
    lastName VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phoneNumber VARCHAR(10)
);

CREATE OR REPLACE Orders (
    orderID INT(11) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    orderDate DATE NOT NULL,
    customerID INT(11) NOT NULL,
    gameID INT NOT NULL,
    quantity INT NOT NULL,
    CONSTRAINT `customerfk_1` FOREIGN KEY (`customerID`) REFERENCES `Customers`(`customerID`)
    CONSTRAINT `gamefk_1` FOREIGN KEY (`gameID`) REFERENCES `Games`(`game     ID`)
);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;