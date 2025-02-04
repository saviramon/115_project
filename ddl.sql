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
    developerID INT(11) AUTO_INCREMENT NOT NULL PRIMARY KEY,
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
    CONSTRAINT `customerfk_1` FOREIGN KEY (`customerID`) REFERENCES `Customers`(`customerID`),
    CONSTRAINT `gamefk_1` FOREIGN KEY (`gameID`) REFERENCES `Games`(`gameID`)
);

INSERT INTO Games (title, developerID, genre, releaseDate, price, platform, condition, quantityInStock) 
VALUES 
('Pokemon Sapphire', SELECT developerID from Developers WHERE name = 'Game Freak', 'RPG', '2003-10-15', 80, 'Game Boy Advance', False, 3),
('Super Mario World', SELECT developerID from Developers WHERE name = 'Nintendo', 'platformer', '1990-11-21', 500, 'Super Nintendo', True, 1),
('The Legend of Zelda: Ocarina of Time', SELECT developerID from Developers WHERE name = 'Nintendo', 'Adventure', '1998-11-23', 150, 'Nintendo 64', False, 2),
('Final Fantasy VII', SELECT developerID from Developers WHERE name = 'Square Enix', 'RPG', '1997-01-31', 125, 'Playstation 1', False, 6),
('Halo: Combat Evolved', SELECT developerID from Developers WHERE name = 'Bungie', 'FPS', '2001-11-15' , 135, 'Xbox', True, 5);

INSERT INTO Developers (name)
VALUES
('Game Freak'),
('Nintendo'),
('Square Enix'),
('Bungie');

INSERT INTO Customers (firstName, lastName, email, phoneNumber)
VALUES
('Liam', 'Smith', 'liam.smith@oregonstate.edu', '9151234567'),
('Olivia', 'Johnson', 'olivia.johnson@yahoo.com', '3219876543'),
('Noah', 'Williams', 'noah.williams@gmail.com', '8085554655'),
('Emma', 'Brown', 'emma.brown@gmail.com', '2051137222'),
('William', 'Jones', 'william.jones@aol.com', '3613456444'),
('Ava', 'Garcia', 'ava.garcia@bot.com', '8006667777');

INSERT INTO Orders (orderDate, customerID, gameID, quantity)
VALUES
('2025-06-15', SELECT customerID FROM Customers WHERE firstName = 'Liam' AND lastName = 'Smith', SELECT gameID FROM Games WHERE title ='Pokemon Sapphire', 1),
('2025-06-22', SELECT customerID FROM Customers WHERE firstName = 'Olivia' AND lastName = 'Johnson', SELECT gameID FROM Games WHERE title ='Final Fantasy VII', ),
('2025-07-01', SELECT customerID FROM Customers WHERE firstName = 'Noah' AND lastName = 'Williams', SELECT gameID FROM Games WHERE title ='Pokemon Sapphire', 1),
('2025-07-08', SELECT customerID FROM Customers WHERE firstName = 'Emma' AND lastName = 'Brown', SELECT gameID FROM Games WHERE title ='Final Fantasy VII', 3),
('2025-07-15', SELECT customerID FROM Customers WHERE firstName = 'William' AND lastName = 'Jones', SELECT gameID FROM Games WHERE title ='Pokemon Sapphire', 1),
('2025-07-22', SELECT customerID FROM Customers WHERE firstName = 'Liam' AND lastName = 'Smith', SELECT gameID FROM Games WHERE title ='Halo: Combat Evolved', 1),
('2025-08-01', SELECT customerID FROM Customers WHERE firstName = 'Ava' AND lastName = 'Garcia', SELECT gameID FROM Games WHERE title ='The Legend of Zelda: Ocarina of Time', 1),
('2025-08-08', SELECT customerID FROM Customers WHERE firstName = 'Olivia' AND lastName = 'Johnson', SELECT gameID FROM Games WHERE title ='Pokemon Sapphire', 1);

SET FOREIGN_KEY_CHECKS=1;
COMMIT;