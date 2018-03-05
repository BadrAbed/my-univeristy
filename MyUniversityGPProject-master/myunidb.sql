-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 02, 2016 at 09:52 AM
-- Server version: 5.7.10
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myunidb`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE IF NOT EXISTS `chat` (
  `ID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Message` text NOT NULL,
  `RecieverID` int(11) NOT NULL,
  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `MessageDate` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`ID`, `UserID`, `Message`, `RecieverID`, `TimeStamp`, `MessageDate`) VALUES
(4, 201568, '&#1575;&#1604;&#1587;&#1604;&#1575;&#1605; &#1593;&#1604;&#1610;&#1603;&#1605;', 4000, '2016-07-02 18:39:59', '2016-07-02 08:39:59 PM'),
(5, 4000, '&#1608;&#1593;&#1604;&#1610;&#1603;&#1605; &#1575;&#1604;&#1587;&#1604;&#1575;&#1605;', 201568, '2016-07-02 18:40:20', '2016-07-02 08:40:20 PM'),
(6, 523867, 'fgdfgdfg', 4000, '2016-07-12 15:40:24', '2016-07-12 03:40:24 PM'),
(7, 523867, '                                    &#1587;&#1604;&#1575;&#1605; &#1593;&#1604;&#1610;&#1603;&#1605;', 123, '2016-07-12 16:07:34', '2016-07-12 04:07:34 PM'),
(8, 523867, '\r\nhi', 201568, '2016-07-12 17:43:03', '2016-07-12 05:43:03 PM'),
(9, 523867, 'vbhhhhhhhhhhhhh', 523867, '2016-07-12 19:15:19', '2016-07-12 07:15:19 PM'),
(10, 523867, '123', 6856, '2016-07-12 20:25:39', '2016-07-12 08:25:39 PM'),
(11, 523867, 'hi', 4000, '2016-07-12 20:25:39', '2016-07-12 08:25:39 PM'),
(12, 523867, '                                    1234567', 6856, '2016-07-12 20:26:04', '2016-07-12 08:26:04 PM'),
(13, 523867, '                                    &#1576;&#1576;&#1575;&#1604;&#1575;&#1575;&#1604;&#1575;&#1604;&#1575;&#1604;&#1575;&#1604;', 12222, '2016-07-12 22:31:46', '2016-07-12 10:31:46 PM'),
(14, 523867, '                                    &#1575;&#1607;\r\n', 400, '2016-07-13 00:40:36', '2016-07-13 12:40:36 AM'),
(15, 523867, '\r\nlk.m..', 59896, '2016-07-13 00:41:26', '2016-07-13 12:41:26 AM'),
(16, 123, '&#1608;&#1593;&#1604;&#1610;&#1603;&#1605; &#1575;&#1604;&#1587;&#1604;&#1575;&#1605; =D', 523867, '2016-07-13 03:03:15', '2016-07-13 03:03:15 AM'),
(17, 523867, '\r\n&#1606;&#1606;&#1606;&#1606;', 12222, '2016-07-13 14:26:14', '2016-07-13 02:26:14 PM'),
(18, 523867, 'khlhlk', 523867, '2016-07-13 21:28:02', '2016-07-13 09:28:02 PM'),
(19, 523867, 'h;o;ihk;', 523867, '2016-07-13 21:28:16', '2016-07-13 09:28:16 PM');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `commentID` int(11) NOT NULL,
  `PostID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `commentContent` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RegistrationCommentDate` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=3061 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`commentID`, `PostID`, `UserID`, `commentContent`, `date`, `RegistrationCommentDate`) VALUES
(175, 4177, 523867, '<p>Hello EveryOne this is my first comment ^_^</p>', '2016-07-14 14:43:10', '2016-07-14 02:43:10 PM'),
(1075, 8747, 4000, '<p>Hello Doctor <strong>Mohamed</strong></p>', '2016-07-02 18:00:38', '2016-07-02 08:00:38 PM'),
(3060, 8747, 4586, '<p>Hello Ahmed</p>', '2016-07-02 18:01:04', '2016-07-02 08:01:04 PM');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE IF NOT EXISTS `faculty` (
  `ID` int(11) NOT NULL,
  `FacultyName` varchar(100) NOT NULL,
  `UniversityID` int(11) NOT NULL,
  `SystemTypeID` int(11) NOT NULL,
  `AddedBy` varchar(100) NOT NULL DEFAULT '',
  `RegisterCourseInDateFaculty` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=8534 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`ID`, `FacultyName`, `UniversityID`, `SystemTypeID`, `AddedBy`, `RegisterCourseInDateFaculty`) VALUES
(1, 'General', 2, 3, 'mohamedgalal9454@gmail.com', ''),
(458, 'helwan ', 1, 1, 'testUniversityAdmin@gmail.com', '2016-07-12 07:14:05 PM'),
(526, '123', 1, 1, 'testUniversityAdmin@gmail.com', '2016-07-13 01:24:02 AM'),
(2124, 'SCF', 1, 2, 'testUniversityAdmin@gmail.com', '2016-07-13 12:44:12 AM'),
(2612, 'Rights', 1, 1, 'testUniversityAdmin@gmail.com', '2016-07-02 06:00:39 PM'),
(2800, 'MIS', 1, 1, 'testUniversityAdmin@gmail.com', '2016-07-13 08:42:38 PM'),
(8533, 'Computers and Information', 1, 1, 'testUniversityAdmin@gmail.com', '2016-07-02 06:00:28 PM');

-- --------------------------------------------------------

--
-- Table structure for table `facultysystemtype`
--

CREATE TABLE IF NOT EXISTS `facultysystemtype` (
  `ID` int(11) NOT NULL,
  `Type` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `facultysystemtype`
--

INSERT INTO `facultysystemtype` (`ID`, `Type`) VALUES
(1, 'CreditHours'),
(2, 'Normal'),
(3, 'General');

-- --------------------------------------------------------

--
-- Table structure for table `favouritefilms`
--

CREATE TABLE IF NOT EXISTS `favouritefilms` (
  `Column_FilmID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `material`
--

CREATE TABLE IF NOT EXISTS `material` (
  `ID` int(4) NOT NULL DEFAULT '0',
  `Filename` varchar(50) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `SubjectID` int(11) DEFAULT NULL,
  `UserCode` int(11) NOT NULL DEFAULT '123',
  `UploadedDate` varchar(100) NOT NULL DEFAULT '',
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `material`
--

INSERT INTO `material` (`ID`, `Filename`, `Type`, `SubjectID`, `UserCode`, `UploadedDate`, `Description`) VALUES
(6974, 'KMeansExample', 'docx', 348, 523867, '2016-07-14 02:47:13 PM', 'KmeansEx\r\n                                    '),
(7882, 'solutionofdatamining', 'pdf', 348, 523867, '2016-07-14 02:46:11 PM', 'DM1\r\n                                    '),
(8208, 'create_file_in_jsp', 'txt', 3349, 523867, '2016-07-14 02:47:48 PM', 'Description\r\n                                    ');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `ID` int(11) NOT NULL,
  `Post` text NOT NULL,
  `PostDate` varchar(100) NOT NULL,
  `UserID` int(11) NOT NULL,
  `UniversityID` int(11) NOT NULL,
  `FacultyID` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8256 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`ID`, `Post`, `PostDate`, `UserID`, `UniversityID`, `FacultyID`) VALUES
(2592, '<p>Hello I''m Dr <strong><em>Mohamed Mahmoud</em></strong></p>\r\n<p>This Post about your GP</p>\r\n<p>&nbsp;</p>', '2016-07-02 08:25:34 PM', 4586, 1, 8533),
(4073, '<p>Hello Every One</p>\r\n<p>I''m <strong>Ahmed</strong> Your Faculty Admin</p>', '2016-07-02 06:28:48 PM', 201568, 1, 8533);

-- --------------------------------------------------------

--
-- Table structure for table `opencourses`
--

CREATE TABLE IF NOT EXISTS `opencourses` (
  `ID` int(11) NOT NULL,
  `Course_ID` int(11) NOT NULL,
  `LevelID` int(11) NOT NULL,
  `FaculityID` int(11) NOT NULL,
  `Year` varchar(20) NOT NULL,
  `Term` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `PostID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Post` longtext NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SubjectPostID` int(11) NOT NULL,
  `RegistrationPostDate` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=8748 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`PostID`, `UserID`, `Post`, `date`, `SubjectPostID`, `RegistrationPostDate`) VALUES
(4177, 523867, '<p>Hello, World!</p>', '2016-07-14 14:42:58', 348, '2016-07-14 02:42:58 PM'),
(5522, 523867, '<p>C is PL1</p>', '2016-07-14 14:48:58', 5122, '2016-07-14 02:48:58 PM'),
(8747, 4586, '<p>Hello Every One ^_^</p>', '2016-07-02 17:00:37', 348, '2016-07-02 07:00:37 PM');

-- --------------------------------------------------------

--
-- Table structure for table `problems`
--

CREATE TABLE IF NOT EXISTS `problems` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL DEFAULT '',
  `UserEmail` varchar(100) NOT NULL DEFAULT '',
  `Message` text NOT NULL,
  `ProblemDate` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `problems`
--

INSERT INTO `problems` (`ID`, `Name`, `UserEmail`, `Message`, `ProblemDate`) VALUES
(1, 'hgfv', 'testfaculityadmin@gmail.com', 'ujyhtgrf', '2016-06-29 01:00:55 AM'),
(2, 'hgfv', 'testfaculityadmin@gmail.com', 'ujyhtgrf', '2016-06-29 01:04:25 AM'),
(3, 'a', 'testUniversityAdmin@gmail.com', 'S', '2016-07-13 03:17:27 AM'),
(4, '&#1575;&#1607;', 'mohamedgalal9454@gmail.com', '&#1575;&#1607;', '2016-07-26 03:59:10 AM');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE IF NOT EXISTS `rating` (
  `ID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `InstructorID` int(11) NOT NULL,
  `Positives` text NOT NULL,
  `Negatives` text NOT NULL,
  `RatingGrade` int(11) NOT NULL,
  `RatingDate` varchar(100) NOT NULL DEFAULT '',
  `FacultyID` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9692 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`ID`, `StudentID`, `InstructorID`, `Positives`, `Negatives`, `RatingGrade`, `RatingDate`, `FacultyID`) VALUES
(3483, 4000, 59896, '1.Good instructors                     ', '       2. Doesn''t have communication skills            ', 6, '2016-07-02 08:24:09 PM', 8533),
(3723, 4000, 4586, '1.Good instructors                     ', '       2. Doesn''t have communication skills            ', 6, '2016-07-02 08:23:58 PM', 8533),
(9223, 4000, 59896, '1.Good instructors                     ', '       2. Doesn''t have communication skills            ', 5, '2016-07-02 08:24:37 PM', 8533),
(9691, 4000, 6856, '1.Good instructors                     ', '       2. Doesn''t have communication skills            ', 4, '2016-07-02 08:24:22 PM', 8533);

-- --------------------------------------------------------

--
-- Table structure for table `ratingteachingstuff`
--

CREATE TABLE IF NOT EXISTS `ratingteachingstuff` (
  `ID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `InstructorID` int(11) NOT NULL,
  `Advantage` text NOT NULL,
  `Disadvantage` text NOT NULL,
  `Score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE IF NOT EXISTS `subject` (
  `ID` int(11) NOT NULL,
  `Code` varchar(20) NOT NULL,
  `SubjectName` varchar(50) NOT NULL,
  `WritenGrade` int(11) NOT NULL,
  `MidtermGrade` int(11) NOT NULL,
  `FinalExamGrade` int(11) NOT NULL,
  `FaculityID` int(11) NOT NULL,
  `UniversityID` int(11) NOT NULL,
  `CourseDescription` text NOT NULL,
  `AddedBy` varchar(100) NOT NULL,
  `RegisterCourseInDate` varchar(100) NOT NULL DEFAULT '""',
  `DateFrom` varchar(20) NOT NULL DEFAULT '1900-09-19',
  `DateTo` varchar(20) NOT NULL DEFAULT '1900-09-19',
  `Term` varchar(20) NOT NULL DEFAULT '""',
  `LevelID` int(11) NOT NULL DEFAULT '1',
  `DepartmentID` int(11) NOT NULL DEFAULT '1',
  `OpenBy` varchar(100) NOT NULL DEFAULT '""',
  `OpenCourseInDate` varchar(100) NOT NULL DEFAULT '""',
  `OpenFromDate` varchar(20) NOT NULL DEFAULT '1994-09-19',
  `OpenToDate` varchar(20) NOT NULL DEFAULT '1994-09-19'
) ENGINE=InnoDB AUTO_INCREMENT=5123 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`ID`, `Code`, `SubjectName`, `WritenGrade`, `MidtermGrade`, `FinalExamGrade`, `FaculityID`, `UniversityID`, `CourseDescription`, `AddedBy`, `RegisterCourseInDate`, `DateFrom`, `DateTo`, `Term`, `LevelID`, `DepartmentID`, `OpenBy`, `OpenCourseInDate`, `OpenFromDate`, `OpenToDate`) VALUES
(348, 'IS87', 'DataMining', 10, 30, 50, 8533, 1, 'You should know about DB', 'Ahmedfaculityadmin@gmail.com', '2016-07-02 06:30:48 PM', '2016-07-01', '2016-07-13', 'FirstTerm', 1, 2, 'Ahmedfaculityadmin@gmail.com', '2016-07-14 03:16:04 PM', '2016-07-14', '2016-09-25'),
(3349, 'CS87', 'Java', 10, 30, 50, 8533, 1, 'Java is good PL', 'Ahmedfaculityadmin@gmail.com', '2016-07-02 06:30:12 PM', '2016-07-01', '2016-07-04', 'FirstTerm', 1, 2, 'Ahmedfaculityadmin@gmail.com', '2016-07-14 02:56:30 PM', '2016-07-14', '2016-09-25'),
(5122, 'CS87', 'C', 10, 30, 50, 8533, 1, 'C is First PL in Our Faculty', 'Ahmedfaculityadmin@gmail.com', '2016-07-02 06:29:44 PM', '2016-07-01', '2016-07-04', 'FirstTerm', 1, 2, 'Ahmedfaculityadmin@gmail.com', '2016-07-14 03:00:53 PM', '2016-07-14', '2016-09-25');

-- --------------------------------------------------------

--
-- Table structure for table `subjectstudent`
--

CREATE TABLE IF NOT EXISTS `subjectstudent` (
  `SubjectID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `WritenGrade` int(11) NOT NULL DEFAULT '-1',
  `MidtermGrade` int(11) NOT NULL DEFAULT '-1',
  `FinalExamGrade` int(11) NOT NULL DEFAULT '-1',
  `FinalGrade` int(11) NOT NULL DEFAULT '-1',
  `StudentRegisterSubjectDate` varchar(100) NOT NULL DEFAULT '""',
  `Term` varchar(20) NOT NULL DEFAULT '""',
  `CourseOpeningFrom` varchar(20) NOT NULL DEFAULT '1994-09-19',
  `CourseOpeningTo` varchar(20) NOT NULL DEFAULT '1994-09-19'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subjectstudent`
--

INSERT INTO `subjectstudent` (`SubjectID`, `StudentID`, `WritenGrade`, `MidtermGrade`, `FinalExamGrade`, `FinalGrade`, `StudentRegisterSubjectDate`, `Term`, `CourseOpeningFrom`, `CourseOpeningTo`) VALUES
(348, 4000, 10, 20, 30, -3, '2016-07-02 06:50:50 PM', 'FirstTerm', '2016-07-01', '2016-08-11'),
(348, 6856, 4, 5, 30, 39, '2016-07-14 03:12:32 PM', 'FirstTerm', '2016-07-14', '2016-09-25'),
(3349, 4000, -1, -1, -1, -1, '2016-07-02 06:50:50 PM', 'FirstTerm', '2016-07-01', '2016-08-11');

-- --------------------------------------------------------

--
-- Table structure for table `subjectteachingstuff`
--

CREATE TABLE IF NOT EXISTS `subjectteachingstuff` (
  `SubjectID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `semester` varchar(100) NOT NULL,
  `CourseOpeningFrom` varchar(20) NOT NULL DEFAULT '1994-09-19',
  `CourseOpeningTo` varchar(20) NOT NULL DEFAULT '1994-09-19',
  `AddedBy` varchar(100) NOT NULL DEFAULT '""',
  `SubjectInstructorRegisterDate` varchar(100) NOT NULL DEFAULT '""'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subjectteachingstuff`
--

INSERT INTO `subjectteachingstuff` (`SubjectID`, `UserID`, `semester`, `CourseOpeningFrom`, `CourseOpeningTo`, `AddedBy`, `SubjectInstructorRegisterDate`) VALUES
(348, 4586, 'FirstTerm', '2016-07-14', '2016-09-25', 'Ahmedfaculityadmin@gmail.com', '2016-07-14 03:16:17 PM'),
(348, 59896, 'FirstTerm', '2016-07-01', '2016-08-11', 'Ahmedfaculityadmin@gmail.com', '2016-07-02 06:34:40 PM'),
(5122, 4586, 'FirstTerm', '2016-07-14', '2016-09-25', 'Ahmedfaculityadmin@gmail.com', '2016-07-14 03:01:29 PM');

-- --------------------------------------------------------

--
-- Table structure for table `university`
--

CREATE TABLE IF NOT EXISTS `university` (
  `ID` int(11) NOT NULL,
  `UniversityName` varchar(150) NOT NULL,
  `Address` varchar(300) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `university`
--

INSERT INTO `university` (`ID`, `UniversityName`, `Address`) VALUES
(1, 'Helwan', 'Helwan'),
(2, 'Cairo', 'Giza'),
(3, 'Ainshams', 'ElAbasia'),
(4, 'General', 'Cairo,Egypt');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `Code` int(11) NOT NULL,
  `MyUniversityCodeString` varchar(50) NOT NULL,
  `Mail` varchar(100) NOT NULL,
  `FName` varchar(50) NOT NULL,
  `LName` varchar(50) NOT NULL,
  `MName` varchar(50) NOT NULL DEFAULT '',
  `Password` varchar(200) NOT NULL,
  `FacultyID` int(11) NOT NULL,
  `UniversityID` int(11) NOT NULL,
  `Address` varchar(150) NOT NULL DEFAULT '""',
  `UserTypeID` int(11) NOT NULL,
  `LevelID` int(11) NOT NULL,
  `DepartmentID` int(11) NOT NULL DEFAULT '2',
  `ProfilePic` varchar(150) NOT NULL DEFAULT '""',
  `SSn` int(11) DEFAULT NULL,
  `BirthDate` varchar(50) NOT NULL DEFAULT '1994-09-19',
  `Gender` varchar(20) NOT NULL,
  `Approve` varchar(10) NOT NULL DEFAULT 'Yes',
  `RegistrationDate` varchar(100) NOT NULL DEFAULT '""'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Code`, `MyUniversityCodeString`, `Mail`, `FName`, `LName`, `MName`, `Password`, `FacultyID`, `UniversityID`, `Address`, `UserTypeID`, `LevelID`, `DepartmentID`, `ProfilePic`, `SSn`, `BirthDate`, `Gender`, `Approve`, `RegistrationDate`) VALUES
(123, '4', 'mohamedgalal9454@gmail.com', 'Mohamed', 'Farid', 'Abdullah', '123', 1, 4, 'AinShams', 1, 6, 1, '', 13545758, '1994-09-19', 'male', 'Yes', '""'),
(400, '20160702062519853340001', 'nadine.40009@yahoo.com', 'Nadine', 'Salim', 'N', '123', 8533, 1, 'Deutch', 6, 2, 3, '""', NULL, '2000-09-19', 'female', 'Yes', '2016-07-02 06:25:19 PM'),
(4000, '2016070206251885334000', 'ahmed4000@yahoo.com', 'Ahmed', 'Farid', '', '4000', 8533, 1, '""', 6, 1, 2, '""', NULL, '1994-09-19', 'male', 'Yes', '2016-07-02 06:25:18 PM'),
(4586, '2016070206262585334586', 'mahmadMahmoud@yahoo.com', 'Mohamed', 'Mahmoud', 'Ahmed', '123', 8533, 1, '1984-09-19', 4, 6, 1, '""', NULL, 'Ain Shams', 'Male', 'Yes', '2016-07-02 06:26:25 PM'),
(6856, '2016070206280485336856', 'AhmedMahmoudStudent@gmail.com', 'Ahmed', 'Mahmoud', '', '123', 8533, 1, '""', 6, 1, 2, '""', NULL, '1994-09-19', 'Male', 'Yes', '2016-07-02 06:28:04 PM'),
(12222, '20160712040649112222', 'ahmed.pro94@yahoo.com', 'aaa', 'qqqq', '', '1111111', 2612, 1, '""', 3, 6, 1, '""', NULL, '1994-09-19', 'Male', 'Yes', '2016-07-12 04:06:49 PM'),
(40003, '20160713071450853340003', 'ahmedAli403@yahoo.com', 'Ahmed ', 'Ali', '', '40003', 8533, 1, '""', 6, 1, 1, '""', NULL, '1994-09-19', 'male', 'No', '2016-07-13 07:14:50 AM'),
(40004, '20160713071450853340004', 'Ahmed.sobhy29793@gmail.com', 'Ahmed ', 'Sobhy', '', '123', 8533, 1, '""', 6, 1, 1, '""', NULL, '1994-09-19', 'male', 'No', '2016-07-13 07:14:50 AM'),
(59896, '20160702062719853359896', 'sayedmarzoq@yahoo.com', 'Sayed', 'Marzoq', '', '123', 8533, 1, '""', 5, 6, 1, '""', NULL, '1994-09-19', 'Male', 'Yes', '2016-07-02 06:27:19 PM'),
(201568, '201607020601241201568', 'Ahmedfaculityadmin@gmail.com', 'Ahmed', 'FacultyAdmin', '', '123', 8533, 1, '""', 3, 6, 1, '""', NULL, '1994-09-19', 'Male', 'Yes', '2016-07-02 06:01:24 PM'),
(523867, '3', 'testUniversityAdmin@gmail.com', 'Amr', 'Admin', 'UniversityAdmin', '123', 1, 1, '1994-09-19', 2, 6, 1, '', 1354582758, 'AinShams', 'male', 'Yes', '""');

-- --------------------------------------------------------

--
-- Table structure for table `userlevel`
--

CREATE TABLE IF NOT EXISTS `userlevel` (
  `ID` int(11) NOT NULL,
  `Level` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userlevel`
--

INSERT INTO `userlevel` (`ID`, `Level`) VALUES
(1, '1'),
(2, '2'),
(3, '3'),
(4, '4'),
(5, '5'),
(6, 'Graduated');

-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

CREATE TABLE IF NOT EXISTS `usertype` (
  `ID` int(11) NOT NULL,
  `UserType` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usertype`
--

INSERT INTO `usertype` (`ID`, `UserType`) VALUES
(1, 'MyUniversity Admin'),
(2, 'University Admin'),
(3, 'Faculty Admin'),
(4, 'Professor'),
(5, 'Professor Assistant'),
(6, 'Student');

-- --------------------------------------------------------

--
-- Table structure for table `user_department`
--

CREATE TABLE IF NOT EXISTS `user_department` (
  `ID` int(11) NOT NULL,
  `DepartmentName` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_department`
--

INSERT INTO `user_department` (`ID`, `DepartmentName`) VALUES
(1, 'Graduated'),
(2, 'General'),
(3, 'CS'),
(4, 'IS'),
(5, 'IT'),
(6, 'SW');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `RecieverID` (`RecieverID`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`commentID`),
  ADD KEY `PostID` (`PostID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `faculty_unique` (`UniversityID`,`FacultyName`),
  ADD KEY `UniversityID` (`UniversityID`),
  ADD KEY `SystemTypeID` (`SystemTypeID`),
  ADD KEY `ID` (`ID`);

--
-- Indexes for table `facultysystemtype`
--
ALTER TABLE `facultysystemtype`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `favouritefilms`
--
ALTER TABLE `favouritefilms`
  ADD PRIMARY KEY (`Column_FilmID`);

--
-- Indexes for table `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Filename` (`Filename`),
  ADD KEY `UserCode` (`UserCode`),
  ADD KEY `SubjectID` (`SubjectID`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `UniversityID` (`UniversityID`),
  ADD KEY `FacultyID` (`FacultyID`);

--
-- Indexes for table `opencourses`
--
ALTER TABLE `opencourses`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Course_ID` (`Course_ID`,`LevelID`,`FaculityID`),
  ADD KEY `FaculityID` (`FaculityID`),
  ADD KEY `LevelID` (`LevelID`),
  ADD KEY `FaculityID_2` (`FaculityID`),
  ADD KEY `LevelID_2` (`LevelID`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`PostID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `SubjectPostID` (`SubjectPostID`);

--
-- Indexes for table `problems`
--
ALTER TABLE `problems`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UserID` (`StudentID`),
  ADD KEY `PostID` (`InstructorID`),
  ADD KEY `FacultyID` (`FacultyID`);

--
-- Indexes for table `ratingteachingstuff`
--
ALTER TABLE `ratingteachingstuff`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `InstructorID` (`InstructorID`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FaculityID` (`FaculityID`),
  ADD KEY `UniversityID` (`UniversityID`),
  ADD KEY `AddedBy` (`AddedBy`),
  ADD KEY `Code` (`Code`),
  ADD KEY `LevelD` (`LevelID`,`DepartmentID`),
  ADD KEY `OpenBy` (`OpenBy`);

--
-- Indexes for table `subjectstudent`
--
ALTER TABLE `subjectstudent`
  ADD PRIMARY KEY (`SubjectID`,`StudentID`),
  ADD KEY `SubjectID` (`SubjectID`),
  ADD KEY `StudentID` (`StudentID`);

--
-- Indexes for table `subjectteachingstuff`
--
ALTER TABLE `subjectteachingstuff`
  ADD PRIMARY KEY (`SubjectID`,`UserID`),
  ADD KEY `SubjectID` (`SubjectID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `university`
--
ALTER TABLE `university`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Code`),
  ADD UNIQUE KEY `Mail` (`Mail`),
  ADD UNIQUE KEY `MyUniversityCodeString` (`MyUniversityCodeString`),
  ADD UNIQUE KEY `SSn` (`SSn`),
  ADD KEY `FacultyID` (`FacultyID`),
  ADD KEY `UniversityID` (`UniversityID`),
  ADD KEY `UserTypeID` (`UserTypeID`),
  ADD KEY `LevelID` (`LevelID`),
  ADD KEY `FacultyID_2` (`FacultyID`),
  ADD KEY `UniversityID_2` (`UniversityID`),
  ADD KEY `DepartmentID` (`DepartmentID`),
  ADD KEY `DepartmentID_2` (`DepartmentID`);

--
-- Indexes for table `userlevel`
--
ALTER TABLE `userlevel`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `usertype`
--
ALTER TABLE `usertype`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user_department`
--
ALTER TABLE `user_department`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `commentID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3061;
--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8534;
--
-- AUTO_INCREMENT for table `facultysystemtype`
--
ALTER TABLE `facultysystemtype`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `favouritefilms`
--
ALTER TABLE `favouritefilms`
  MODIFY `Column_FilmID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8256;
--
-- AUTO_INCREMENT for table `opencourses`
--
ALTER TABLE `opencourses`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `PostID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8748;
--
-- AUTO_INCREMENT for table `problems`
--
ALTER TABLE `problems`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9692;
--
-- AUTO_INCREMENT for table `ratingteachingstuff`
--
ALTER TABLE `ratingteachingstuff`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5123;
--
-- AUTO_INCREMENT for table `university`
--
ALTER TABLE `university`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `userlevel`
--
ALTER TABLE `userlevel`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `user_department`
--
ALTER TABLE `user_department`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`Code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`RecieverID`) REFERENCES `user` (`Code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`PostID`) REFERENCES `post` (`PostID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`Code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `faculty`
--
ALTER TABLE `faculty`
  ADD CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`UniversityID`) REFERENCES `university` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `faculty_ibfk_2` FOREIGN KEY (`SystemTypeID`) REFERENCES `facultysystemtype` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `material`
--
ALTER TABLE `material`
  ADD CONSTRAINT `material_ibfk_1` FOREIGN KEY (`UserCode`) REFERENCES `user` (`Code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `material_ibfk_2` FOREIGN KEY (`SubjectID`) REFERENCES `subject` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`Code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `news_ibfk_2` FOREIGN KEY (`UniversityID`) REFERENCES `university` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `news_ibfk_3` FOREIGN KEY (`FacultyID`) REFERENCES `faculty` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `opencourses`
--
ALTER TABLE `opencourses`
  ADD CONSTRAINT `opencourses_ibfk_1` FOREIGN KEY (`Course_ID`) REFERENCES `subject` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `opencourses_ibfk_2` FOREIGN KEY (`LevelID`) REFERENCES `userlevel` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `opencourses_ibfk_3` FOREIGN KEY (`FaculityID`) REFERENCES `faculty` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`Code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `post_ibfk_2` FOREIGN KEY (`SubjectPostID`) REFERENCES `subject` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `user` (`Code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`InstructorID`) REFERENCES `user` (`Code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rating_ibfk_3` FOREIGN KEY (`FacultyID`) REFERENCES `faculty` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ratingteachingstuff`
--
ALTER TABLE `ratingteachingstuff`
  ADD CONSTRAINT `ratingteachingstuff_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`Code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratingteachingstuff_ibfk_2` FOREIGN KEY (`InstructorID`) REFERENCES `user` (`Code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `subject_ibfk_2` FOREIGN KEY (`FaculityID`) REFERENCES `faculty` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subject_ibfk_3` FOREIGN KEY (`UniversityID`) REFERENCES `university` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subject_ibfk_4` FOREIGN KEY (`LevelID`) REFERENCES `userlevel` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subjectstudent`
--
ALTER TABLE `subjectstudent`
  ADD CONSTRAINT `subjectstudent_ibfk_1` FOREIGN KEY (`SubjectID`) REFERENCES `subject` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subjectstudent_ibfk_2` FOREIGN KEY (`StudentID`) REFERENCES `user` (`Code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subjectteachingstuff`
--
ALTER TABLE `subjectteachingstuff`
  ADD CONSTRAINT `subjectteachingstuff_ibfk_1` FOREIGN KEY (`SubjectID`) REFERENCES `subject` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subjectteachingstuff_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`Code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`FacultyID`) REFERENCES `faculty` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`UniversityID`) REFERENCES `university` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_ibfk_3` FOREIGN KEY (`UserTypeID`) REFERENCES `usertype` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_ibfk_4` FOREIGN KEY (`LevelID`) REFERENCES `userlevel` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_ibfk_5` FOREIGN KEY (`DepartmentID`) REFERENCES `user_department` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
