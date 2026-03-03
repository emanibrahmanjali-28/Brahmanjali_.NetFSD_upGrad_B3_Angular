
CREATE DATABASE Event_Db;

CREATE TABLE User_Info (
    EmailId VARCHAR(100) PRIMARY KEY,

    UserName VARCHAR(50) NOT NULL 
        CHECK (LEN(UserName) BETWEEN 1 AND 50),

    Role VARCHAR(20) NOT NULL 
        CHECK (Role IN ('Admin', 'Participant')),

    Password VARCHAR(20) NOT NULL 
        CHECK (LEN(Password) BETWEEN 6 AND 20)
);

INSERT INTO User_Info VALUES
('anjali@gmail.com', 'Anjali', 'Admin', 'pass123');

SELECT EmailId, UserName, Role, Password FROM User_Info



----------Second Query--------

CREATE TABLE EventDetails (
    
    EventId INT PRIMARY KEY,
    
    EventName VARCHAR(50) NOT NULL,
        
    EventCategory VARCHAR(50) NOT NULL,
        
    EventDate DATETIME NOT NULL,
    
    Description VARCHAR(255) NULL,
    
    Status VARCHAR(20) 
        CHECK (Status IN ('Active', 'In-Active'))
);

INSERT INTO EventDetails VALUES
(1, 'Tech Fest', 'Technology', '2026-03-10 10:00:00', 
 'Annual Technical Event', 'Active');

 SELECT * FROM EventDetails


 ----------Third Query--------

 CREATE TABLE SpeakerDetails (
    
    SpeakerId INT PRIMARY KEY, 
    Speaker_Name VARCHAR(50) NOT NULL,
   
);

INSERT INTO SpeakerDetails VALUES
('1001', 'Ravi');
INSERT INTO SpeakerDetails VALUES
('1002', 'Rama');
INSERT INTO SpeakerDetails VALUES
('1003', 'Ram');


 SELECT * FROM SpeakerDetails



 ----------Fourth Query--------


 CREATE TABLE SessionInfo (

    SessionId INT PRIMARY KEY,

    EventId INT NOT NULL,

    SessionTitle VARCHAR(50) NOT NULL,

    SpeakerId INT NOT NULL,

    Description VARCHAR(255) NULL,

    SessionStart DATETIME NOT NULL,

    SessionEnd DATETIME NOT NULL,

    SessionUrl VARCHAR(255),

    CONSTRAINT FK_Event
        FOREIGN KEY (EventId) 
        REFERENCES EventDetails(EventId),

    CONSTRAINT FK_Speaker
        FOREIGN KEY (SpeakerId) 
        REFERENCES SpeakerDetails(SpeakerId)
);

INSERT INTO SessionInfo 
VALUES 
(1, 1, 'AI Introduction', 1001, 
 'Basics of Artificial Intelligence', 
 '2026-03-10 10:00:00', 
 '2026-03-10 11:00:00', 
 'https://meetlink.com/ai'),

(2, 1, 'Cloud Computing', 1002, 
 'Overview of Cloud Services', 
 '2026-03-10 11:30:00', 
 '2026-03-10 12:30:00', 
 'https://meetlink.com/cloud');

 SELECT SessionId,EventId,SessionTitle,SpeakerId,Description,SessionStart,SessionEnd,SessionUrl FROM SessionInfo


 ---------Fifth Query-------------------------

 

CREATE TABLE ParticipantEventDetails (

    Id INT PRIMARY KEY,

    ParticipantEmailId VARCHAR(100) NOT NULL,

    EventId INT NOT NULL,

    SessionId INT NOT NULL,

    IsAttended BIT 
        CHECK (IsAttended IN (0,1)),

    CONSTRAINT FK_Participant
        FOREIGN KEY (ParticipantEmailId)
        REFERENCES User_Info(EmailId),

    CONSTRAINT FK_Event_Participant
        FOREIGN KEY (EventId)
        REFERENCES EventDetails(EventId),

    CONSTRAINT FK_Session_Participant
        FOREIGN KEY (SessionId)
        REFERENCES SessionInfo(SessionId)
);

INSERT INTO ParticipantEventDetails 
VALUES (1, 'anjali@gmail.com', 1, 1, 1);


SELECT Id,ParticipantEmailId,EventId,SessionId,IsAttended FROM ParticipantEventDetails

