INSERT INTO `admin` (`Phone_Number`, `Email`, `City`, `S_A_Number`, `Street`, `Apt_No`, `Province`, `Zip`, `FName`, `LName`)
VALUES
('403-471-6386', 'nedstark@gmail.com', 'Calgary', 23, 'North Street', NULL, Alberta, 'T3G0S5', 'Ned', 'Stark'),
('587-733-1319', 'mtyrell@hotmail.com', 'Calgary', 911, 'Highgarden Street', 16 , Alberta, 'T3G3Z5', 'Margaery', 'Tyrell'),
('403-879-2391', 'theong@gmail.com', 'Calgary', 241, 'Iron Street', NULL, Alberta, 'T3G1D5', 'Theon', 'Greyjoy');

INSERT INTO `location` (`Phone_Number`, `City`, `S_A_Number`, `Street`, `Apt_No`, `Province`, `Zip`)
VALUES
('403-199-8744', 'Calgary', 21 , 'Jump Street', NULL, 'Alberta', 'T3G2S9'),
('403-347-9188', 'Calgary', 508 , 'Saint Cloud Road', NULL, 'Alberta', 'T3G8G4');

INSERT INTO `amenities` (`Location_No`)
VALUES(/* dont know how to do this one lol because location num is auto incrementing?*/);

INSERT INTO `swimmingpools` (`Amenities_ID`, `Num_Lanes`, `poolsize`)
VALUES(/* dont know how to do this one lol because ammenities id is auto incrementing?*/);

INSERT INTO 'barbeque' (`Amenities_ID`, `Num_Grills`)
VALUES(/* also have no idea*/);

INSERT INTO `boatsailor` (`License_NO`, `FName`, `LName`, `S_A_Number`, `Street`, `Apt_No`, `Province`, `Zip`)
VALUES
(100, 'Peter', 'Parker', 20, 'Ingram Street', 45, Calgary, 'T3G6Q3'),
(200, 'Steve', 'Rogers', 569 , 'Leaman Place', 15, Calgary, 'T3G9P2'),
(300, 'James', 'Barnes', 781, 'Hydra Crescent', NULL, Calgary, 'T3G8M4');


INSERT INTO `boat` (`BName`, `BType`, `SailorLicenseNo`)
VALUES
('SS Tipton', 'Sailboat', 100),
('Argo', 'Sailboat', 200),
('Orca', 'Sailboat', 300),
('Canoe 1', 'Canoe', NULL),
('Canoe 2', 'Canoe', NULL),
('Canoe 3', 'Canoe', NULL),
('Canoe 4', 'Canoe', NULL);

INSERT INTO `clients` (`Phone_Number`, `Email`, `City`, `S_A_Number`, `Street`, `Apt_No`, `Province`, `Zip`, `FName`, `LName`)
VALUES
('403-616-8939', 'robbaratheon@gmail.com', 'Calgary', 81, 'Kings Landing', NULL, Alberta, 'T3G9Y5', 'Robert', 'Baratheon'),
('587-823-9180', 'danyt@outlook.com', 'Calgary', 811, 'Dragon Street', NULL, Alberta, 'T3G6H4', 'Daenerys', 'Targaryen'),
('587-541-4372', 'snowjon@yahoo.com', 'Calgary', 1023, 'Tower Street', 91, Alberta, 'T3G9D2', 'Jon', 'Snow'),
('403-281-6210', 'jlannister@hotmail.com', 'Calgary', 832, 'Lion Street', NULL, Alberta, 'T3G4X3', 'Jaime', 'Lannister');
/*assuming ordering for client id starts at 1, doing membership card accordingly*/

INSERT INTO `member_has_membership_card` (`Client_ID`, `CARD_ID`, `Member_Since`)
VALUES
(1, 1, '2019-11-11'),
(2, 2, '2020-03-29'),
(3, 3, '2021-10-12'),
(4, 4, '2022-06-04');
