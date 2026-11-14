CREATE DATABASE HotelHousekeepingManagementSystem

ON PRIMARY
(
    NAME = N'HousekeepingSystem_MDF',
    FILENAME = N'D:\DataBasePhase1\project\HousekeepingSystem.mdf',
    SIZE = 10MB,
    MAXSIZE = 300MB,
    FILEGROWTH = 10MB
),
(
    NAME = N'HousekeepingSystem_NDF',
    FILENAME = N'D:\DataBasePhase1\project\HousekeepingSystem.ndf',
    SIZE = 10MB,
    MAXSIZE = 300MB,
    FILEGROWTH = 10MB
)

LOG ON
(
    NAME = N'HousekeepingSystem_LOG1',
    FILENAME = N'D:\DataBasePhase1\project\HousekeepingSystem_LOG1.ldf',
    SIZE = 10MB,
    MAXSIZE = 300MB,
    FILEGROWTH = 10MB
),
(
    NAME = N'HousekeepingSystem_LOG2',
    FILENAME = N'D:\DataBasePhase1\project\HousekeepingSystem_LOG2.ldf',
    SIZE = 10MB,
    MAXSIZE = 300MB,
    FILEGROWTH = 10MB
);

USE HotelHousekeepingManagementSystem;
GO

CREATE TABLE dbo.Rooms
(
    RoomID INT IDENTITY(1,1),

    RoomNumber VARCHAR(30) NOT NULL,

    RoomType VARCHAR(30) NOT NULL,

    Room_Floor INT NOT NULL,

    Room_Status VARCHAR(20) NOT NULL CONSTRAINT DF_Rooms_RoomStatus DEFAULT ('Dirty'),

    CONSTRAINT PK_Rooms PRIMARY KEY (RoomID),

    CONSTRAINT UQ_Rooms_RoomNumber UNIQUE (RoomNumber),

    CONSTRAINT CK_Rooms_RoomFloor CHECK (Room_Floor > 0)
);
GO

CREATE TABLE dbo.Housekeepers
(
    HouseKeeperID INT IDENTITY(1,1),

    FullName VARCHAR(100) NOT NULL,

    Phone VARCHAR(20) NOT NULL,

    Salary DECIMAL(10,2) NOT NULL,

    HireDate DATE NOT NULL CONSTRAINT DF_Housekeepers_HireDate DEFAULT (GETDATE()),

    CONSTRAINT PK_Housekeepers PRIMARY KEY (HouseKeeperID),

    CONSTRAINT UQ_Housekeepers_Phone UNIQUE (Phone),

    CONSTRAINT CK_Housekeepers_Salary CHECK (Salary > 0)
);
GO

CREATE TABLE dbo.Tasks
(
    TaskID INT IDENTITY(1,1),

    TaskName VARCHAR(50) NOT NULL,

    Description VARCHAR(200) NULL,

    EstimatedMinutes INT NOT NULL,

    Priority VARCHAR(20) NOT NULL CONSTRAINT DF_Tasks_Priority DEFAULT ('Normal'),

    CONSTRAINT PK_Tasks PRIMARY KEY (TaskID),

    CONSTRAINT UQ_Tasks_TaskName UNIQUE (TaskName),

    CONSTRAINT CK_Tasks_EstimatedMinutes CHECK (EstimatedMinutes > 0)
);
GO

CREATE TABLE dbo.Supplies
(
    SupplyID INT IDENTITY(1,1),

    SupplyName VARCHAR(100) NOT NULL,

    Quantity INT NOT NULL,

    UnitPrice DECIMAL(10,2) NOT NULL,

    ExpiryDate DATE NULL,

    CONSTRAINT PK_Supplies PRIMARY KEY (SupplyID),

    CONSTRAINT UQ_Supplies_SupplyName UNIQUE (SupplyName),

    CONSTRAINT CK_Supplies_Quantity CHECK (Quantity >= 0),

    CONSTRAINT CK_Supplies_UnitPrice CHECK (UnitPrice >= 0)
);
GO

CREATE TABLE dbo.Schedules
(
    ScheduleID INT IDENTITY(1,1),

    RoomID INT NOT NULL,

    HouseKeeperID INT NOT NULL,

    TaskID INT NOT NULL,

    ScheduledDate DATE NOT NULL,

    Status VARCHAR(20) NOT NULL CONSTRAINT DF_Schedules_Status DEFAULT ('Pending'),

    CONSTRAINT PK_Schedules PRIMARY KEY (ScheduleID),

    CONSTRAINT FK_Schedules_Rooms FOREIGN KEY (RoomID) REFERENCES dbo.Rooms(RoomID),

    CONSTRAINT FK_Schedules_Housekeepers FOREIGN KEY (HouseKeeperID) REFERENCES dbo.Housekeepers(HouseKeeperID),

    CONSTRAINT FK_Schedules_Tasks FOREIGN KEY (TaskID) REFERENCES dbo.Tasks(TaskID)
);
GO

CREATE TABLE dbo.Inspections
(
    InspectionID INT IDENTITY(1,1),

    ScheduleID INT NOT NULL,

    InspectionDate DATE NOT NULL CONSTRAINT DF_Inspections_InspectionDate DEFAULT (GETDATE()),

    Result VARCHAR(20) NOT NULL,

    Notes VARCHAR(200) NULL,

    CONSTRAINT PK_Inspections PRIMARY KEY (InspectionID),

    CONSTRAINT FK_Inspections_Schedules FOREIGN KEY (ScheduleID) REFERENCES dbo.Schedules(ScheduleID),

    CONSTRAINT CK_Inspections_Result CHECK (Result IN ('Passed', 'Failed'))
);
GO

CREATE TABLE dbo.TaskSupplies
(
    TaskID INT NOT NULL,

    SupplyID INT NOT NULL,

    QuantityRequired INT NOT NULL,

    CONSTRAINT PK_TaskSupplies PRIMARY KEY (TaskID, SupplyID),

    CONSTRAINT FK_TaskSupplies_Tasks FOREIGN KEY (TaskID) REFERENCES dbo.Tasks(TaskID),

    CONSTRAINT FK_TaskSupplies_Supplie FOREIGN KEY (SupplyID) REFERENCES dbo.Supplies(SupplyID),

    CONSTRAINT CK_TaskSupplies_QuantityRequired CHECK (QuantityRequired > 0)
);
GO

