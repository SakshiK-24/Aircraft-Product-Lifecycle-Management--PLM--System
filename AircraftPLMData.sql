CREATE DATABASE AircraftPLM;
USE AircraftPLM;

CREATE TABLE Product(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    LifecycleStage VARCHAR(50)
);

INSERT INTO Product VALUES
(1,'Turbofan Engine','Design'),
(2,'Aircraft Wing','Development'),
(3,'Landing Gear','Manufacturing'),
(4,'Avionics System','Testing'),
(5,'Fuel System','Maintenance');

CREATE TABLE Component(
    ComponentID INT PRIMARY KEY,
    ComponentName VARCHAR(100),
    ProductID INT,
    FOREIGN KEY(ProductID) REFERENCES Product(ProductID)
);

INSERT INTO Component VALUES
(101,'Fan Blade',1),
(102,'Compressor Rotor',1),
(103,'Compressor Stator',1),
(104,'Combustion Chamber',1),
(105,'Turbine Rotor',1),
(106,'Turbine Stator',1),

(201,'Wing Rib A',2),
(202,'Wing Rib B',2),
(203,'Wing Spar Front',2),
(204,'Wing Spar Rear',2),
(205,'Wing Skin Upper',2),
(206,'Wing Skin Lower',2),

(301,'Shock Strut',3),
(302,'Wheel Assembly',3),
(303,'Brake Unit',3),
(304,'Axle',3),
(305,'Hydraulic Cylinder',3),
(306,'Retraction Arm',3),

(401,'Flight Computer',4),
(402,'Navigation Module',4),
(403,'Communication Unit',4),
(404,'Display Panel',4),
(405,'Radar Processor',4),
(406,'Power Supply Unit',4),

(501,'Fuel Pump',5),
(502,'Fuel Filter',5),
(503,'Fuel Tank Sensor',5),
(504,'Fuel Valve',5),
(505,'Fuel Line A',5),
(506,'Fuel Line B',5);

CREATE TABLE BOM(
    BOMID INT PRIMARY KEY,
    ProductID INT,
    ComponentID INT,
    Quantity INT,
    FOREIGN KEY(ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY(ComponentID) REFERENCES Component(ComponentID)
);

INSERT INTO BOM VALUES
(1,1,101,24),
(2,1,102,1),
(3,1,103,2),
(4,1,104,1),
(5,1,105,1),
(6,1,106,2),

(7,2,201,10),
(8,2,202,10),
(9,2,203,2),
(10,2,204,2),
(11,2,205,4),
(12,2,206,4),

(13,3,301,2),
(14,3,302,6),
(15,3,303,6),
(16,3,304,2),
(17,3,305,4),
(18,3,306,2),

(19,4,401,2),
(20,4,402,2),
(21,4,403,2),
(22,4,404,4),
(23,4,405,1),
(24,4,406,2),

(25,5,501,2),
(26,5,502,2),
(27,5,503,4),
(28,5,504,4),
(29,5,505,6),
(30,5,506,6),

(31,1,101,12),
(32,1,103,1),
(33,2,201,5),
(34,2,205,2),
(35,3,302,3),
(36,3,303,3),
(37,4,404,2),
(38,4,406,1),
(39,5,503,2),
(40,5,504,2),

(41,1,102,1),
(42,1,104,1),
(43,2,203,1),
(44,2,204,1),
(45,3,305,2),
(46,3,306,1),
(47,4,401,1),
(48,4,403,1),
(49,5,501,1),
(50,5,502,1);

CREATE TABLE Revision(
    RevisionID INT PRIMARY KEY,
    ComponentID INT,
    RevisionCode VARCHAR(10),
    RevisionDate DATE,
    FOREIGN KEY(ComponentID) REFERENCES Component(ComponentID)
);

INSERT INTO Revision VALUES
(1,101,'A','2026-01-05'),
(2,101,'B','2026-03-10'),
(3,102,'A','2026-01-05'),
(4,103,'A','2026-01-05'),
(5,103,'B','2026-04-15'),
(6,104,'A','2026-01-05'),
(7,105,'A','2026-01-05'),
(8,105,'B','2026-05-01'),
(9,106,'A','2026-01-05'),

(10,201,'A','2026-02-01'),
(11,202,'A','2026-02-01'),
(12,203,'A','2026-02-01'),
(13,204,'B','2026-05-15'),
(14,205,'A','2026-02-01'),

(15,301,'A','2026-02-15'),
(16,302,'A','2026-02-15'),
(17,303,'B','2026-05-20'),
(18,304,'A','2026-02-15'),
(19,305,'A','2026-02-15'),

(20,401,'A','2026-03-01'),
(21,402,'A','2026-03-01'),
(22,403,'B','2026-06-01'),
(23,404,'A','2026-03-01'),
(24,501,'A','2026-01-25'),
(25,504,'B','2026-06-10');

CREATE TABLE ChangeRequest(
    ChangeID INT PRIMARY KEY,
    ComponentID INT,
    Description VARCHAR(200),
    Status VARCHAR(50),
    FOREIGN KEY(ComponentID) REFERENCES Component(ComponentID)
);

INSERT INTO ChangeRequest VALUES
(1,101,'Fan blade material update','Approved'),
(2,103,'Compressor redesign','Approved'),
(3,105,'Turbine efficiency improvement','Pending'),
(4,201,'Wing rib weight reduction','Approved'),
(5,203,'Wing spar reinforcement','Pending'),
(6,302,'Wheel assembly upgrade','Approved'),
(7,303,'Brake unit redesign','Pending'),
(8,305,'Hydraulic optimization','Approved'),
(9,401,'Flight computer firmware update','Approved'),
(10,403,'Communication module enhancement','Pending'),
(11,404,'Display panel replacement','Approved'),
(12,501,'Fuel pump capacity increase','Approved'),
(13,503,'Sensor calibration update','Pending'),
(14,504,'Valve reliability improvement','Approved'),
(15,506,'Fuel line routing modification','Pending');

CREATE TABLE Engineers(
    EngineerID INT PRIMARY KEY,
    EngineerName VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Engineers VALUES
(1,'Jim Halpert','Design'),
(2,'Michael Scott','Manufacturing'),
(3,'Dwight Shrute','Quality'),
(4,'Pam Beesly','PLM'),
(5,'Angela Kinsey','Testing');

CREATE TABLE ChangeApproval(
    ApprovalID INT PRIMARY KEY,
    ChangeID INT,
    EngineerID INT,
    ApprovalDate DATE,
    FOREIGN KEY(ChangeID) REFERENCES ChangeRequest(ChangeID),
    FOREIGN KEY(EngineerID) REFERENCES Engineers(EngineerID)
);

INSERT INTO ChangeApproval VALUES
(1,1,1,'2026-03-15'),
(2,2,4,'2026-04-20'),
(3,4,2,'2026-05-01'),
(4,6,3,'2026-05-15'),
(5,8,1,'2026-05-22'),
(6,9,5,'2026-06-01'),
(7,11,4,'2026-06-10'),
(8,12,2,'2026-06-12'),
(9,14,3,'2026-06-18');