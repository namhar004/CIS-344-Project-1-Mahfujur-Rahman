DROP TABLE IF EXISTS Goals;
DROP TABLE IF EXISTS Accounts;
DROP TABLE IF EXISTS Clients;
DROP TABLE IF EXISTS Coaches;

CREATE TABLE Coaches (
    coach_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    specialty VARCHAR(100)
);

CREATE TABLE Clients (
    client_id INT PRIMARY KEY AUTO_INCREMENT,
    coach_id INT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    FOREIGN KEY (coach_id) REFERENCES Coaches(coach_id)
);

CREATE TABLE Accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    client_id INT NOT NULL,
    account_type VARCHAR(50),
    balance DECIMAL(12,2) DEFAULT 0,
    FOREIGN KEY (client_id) REFERENCES Clients(client_id)
);

CREATE TABLE Goals (
    goal_id INT PRIMARY KEY AUTO_INCREMENT,
    client_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    target_amount DECIMAL(12,2),
    FOREIGN KEY (client_id) REFERENCES Clients(client_id)
);

ALTER TABLE Accounts
ADD CONSTRAINT unique_client_account_type
UNIQUE (client_id, account_type);

ALTER TABLE Goals
ADD CONSTRAINT unique_client_goal_name
UNIQUE (client_id, name);

INSERT IGNORE INTO Coaches (name, email, phone, specialty) VALUES
("Olivia Parker", "olivia.parker@fitworld.com", "555-1111", "Budgeting and Saving"),
("Liam Thompson", "liam.thompson@fitworld.com", "555-2222", "Tax Law"),
("Mia Robinson", "mia.robinson@fitworld.com", "555-3333", "Investing and ETFS");

INSERT IGNORE INTO Clients (coach_id, name, email, phone) VALUES
(1, "Ethan Carter", "ethan.carter@gmail.com", "555-4444"),
(1, "Ava Martinez", "ava.martinez@gmail.com", "555-5555"),
(2, "Noah Hernandez", "noah.hernandez@gmail.com", "555-6666"),
(3, "Sophia Lewis", "sophia.lewis@gmail.com", "555-7777");

INSERT IGNORE INTO Accounts (client_id, account_type, balance) VALUES
(1, "Checking", 2000.00),
(1, "Savings", 3500.00),
(2, "Checking", 1800.00),
(3, "Investment", 6000.00),
(4, "Savings", 1200.00);

INSERT IGNORE INTO Goals (client_id, name, target_amount) VALUES
(1, "Saving for retirement", 2500.00),
(2, "Vacation with family", 7000.00),
(3, "Starting a business", 3000.00),
(4, "Paying off student loans", 4000.00);
