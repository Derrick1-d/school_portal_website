-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2024 at 10:20 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school_portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `convener`
--

CREATE TABLE `convener` (
  `convener_id` char(4) NOT NULL,
  `rank` char(4) DEFAULT NULL,
  `convener_name` varchar(30) DEFAULT NULL,
  `convener_dob` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `convener`
--

INSERT INTO `convener` (`convener_id`, `rank`, `convener_name`, `convener_dob`) VALUES
('C001', 'R003', 'Dr. Brown', '1980-09-10'),
('C002', 'R004', 'Professor White', '1975-04-22');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `credit_hours` int(11) NOT NULL,
  `course_code` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_name`, `credit_hours`, `course_code`) VALUES
(1, 'Introduction to Computer Science', 3, 'CSC212'),
(2, 'Calculus I', 4, 'MAT201'),
(3, 'Physics for Beginners', 3, 'PHY202'),
(4, 'English Composition', 3, 'ENG200'),
(5, 'World History II', 3, 'WHH200');

-- --------------------------------------------------------

--
-- Table structure for table `course_enrolled`
--

CREATE TABLE `course_enrolled` (
  `enrollment_id` int(11) NOT NULL,
  `student_id` char(4) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `enroll_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_enrolled`
--

INSERT INTO `course_enrolled` (`enrollment_id`, `student_id`, `course_id`, `enroll_date`) VALUES
(1, 'S001', 1, '2024-03-12 08:48:47'),
(2, 'S001', 4, '2024-03-12 08:48:47');

-- --------------------------------------------------------

--
-- Table structure for table `course_enrollment`
--

CREATE TABLE `course_enrollment` (
  `enrollment_id` int(11) NOT NULL,
  `student_id` varchar(50) DEFAULT NULL,
  `credit_hours` int(255) DEFAULT NULL,
  `enrollment_date` datetime DEFAULT current_timestamp(),
  `course_code` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_timetable`
--

CREATE TABLE `exam_timetable` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `exam_date` date NOT NULL,
  `exam_time` time NOT NULL,
  `exam_venue` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exam_timetable`
--

INSERT INTO `exam_timetable` (`id`, `course_id`, `course_name`, `exam_date`, `exam_time`, `exam_venue`) VALUES
(1, 101, 'Mathematics', '2024-03-15', '09:00:00', 'Exam Hall 1'),
(2, 102, 'Physics', '2024-03-17', '14:00:00', 'Exam Hall 2'),
(3, 103, 'Chemistry', '2024-03-20', '11:00:00', 'Exam Hall 3');

-- --------------------------------------------------------

--
-- Table structure for table `faculty_convener`
--

CREATE TABLE `faculty_convener` (
  `convener_id` char(4) NOT NULL,
  `faculty_id` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `student_id` varchar(10) NOT NULL,
  `total_fees` decimal(10,2) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `carry_forward` decimal(10,2) NOT NULL,
  `semester_year` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`student_id`, `total_fees`, `balance`, `carry_forward`, `semester_year`) VALUES
('S001', 5000.00, 2000.00, 0.00, '2023/1'),
('S001', 5000.00, 2500.00, 2000.00, '2023/2'),
('S002', 4500.00, 1200.00, 0.00, '2023/1');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `headline` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date_published` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `headline`, `description`, `date_published`) VALUES
(1, 'Exciting Announcement', 'We are thrilled to announce our latest product launch!', '2024-02-08 00:24:04'),
(2, 'Upcoming Event', 'Join us for an exciting event next week. Save the date!', '2024-02-08 00:24:04'),
(3, 'Company Milestone', 'Celebrating a major milestone in our journey. Thank you for your support!', '2024-02-08 00:24:04');

-- --------------------------------------------------------

--
-- Table structure for table `recycle_bin`
--

CREATE TABLE `recycle_bin` (
  `student_id` char(4) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recycle_bin`
--

INSERT INTO `recycle_bin` (`student_id`, `firstname`, `lastname`, `email`, `deleted_at`) VALUES
('0', 'Jane', 'Smith', 'jane.smith@example.com', '2024-03-30 01:39:47');

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `student_id` char(4) NOT NULL,
  `subject_id` char(4) NOT NULL,
  `Subject Name` text NOT NULL,
  `attempt` int(11) NOT NULL DEFAULT 1,
  `score` int(11) DEFAULT NULL,
  `credit` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`student_id`, `subject_id`, `Subject Name`, `attempt`, `score`, `credit`) VALUES
('S001', 'C001', 'Professional Computing ', 1, 85, 3),
('S001', 'M001', 'Social Neworking ', 1, 92, 3),
('S002', 'C001', 'Computer Security ', 1, 78, 0),
('S002', 'P001', '', 1, 90, 0),
('S003', 'M001', '', 1, 88, 0),
('S003', 'P001', '', 1, 75, 0);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room_id` char(4) NOT NULL,
  `number_of_seat` int(11) NOT NULL,
  `reserve` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room_id`, `number_of_seat`, `reserve`) VALUES
('R001', 30, 1),
('R002', 25, 0);

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `rank` char(4) NOT NULL,
  `pay_rate` decimal(6,3) DEFAULT NULL,
  `further_detail` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`rank`, `pay_rate`, `further_detail`) VALUES
('R001', 90.000, 'Department Head'),
('R002', 75.000, 'Instructor');

-- --------------------------------------------------------

--
-- Table structure for table `scholarship`
--

CREATE TABLE `scholarship` (
  `scholarship_id` char(4) NOT NULL,
  `scholarship_value` int(6) NOT NULL,
  `scholarship_condition` varchar(30) DEFAULT NULL,
  `scholarship_desc` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scholarship`
--

INSERT INTO `scholarship` (`scholarship_id`, `scholarship_value`, `scholarship_condition`, `scholarship_desc`) VALUES
('SC01', 5000, 'GPA > 3.5', 'Merit Scholarship'),
('SC02', 3000, 'Financial need', 'Need-Based Scholarship'),
('SC03', 2000, 'Extracurricular achievements', 'Achievement Scholarship');

-- --------------------------------------------------------

--
-- Table structure for table `scholarship_provider`
--

CREATE TABLE `scholarship_provider` (
  `scholarship_id` char(4) NOT NULL,
  `provider_id` char(4) NOT NULL,
  `note` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scholarship_provider`
--

INSERT INTO `scholarship_provider` (`scholarship_id`, `provider_id`, `note`) VALUES
('SC01', 'P001', 'Main provider for Merit Scholarship'),
('SC02', 'P002', 'Primary sponsor for Need-Based Scholarship');

-- --------------------------------------------------------

--
-- Table structure for table `school_info`
--

CREATE TABLE `school_info` (
  `id` int(11) NOT NULL,
  `school_name` varchar(255) NOT NULL,
  `about_us` text DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(20) DEFAULT NULL,
  `contact_address` text DEFAULT NULL,
  `news` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `school_info`
--

INSERT INTO `school_info` (`id`, `school_name`, `about_us`, `contact_email`, `contact_phone`, `contact_address`, `news`) VALUES
(1, 'Your School Name', 'About your school...', 'info@example.com', '+123456789', '123 School Street, City', 'Latest news about the school...');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` char(4) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `gender` enum('male','female','other') DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `country_of_birth` varchar(20) DEFAULT NULL,
  `faculty_id` char(4) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `level` varchar(50) DEFAULT NULL,
  `programme` varchar(100) DEFAULT NULL,
  `cell_phone` varchar(20) DEFAULT NULL,
  `postal_address` varchar(255) DEFAULT NULL,
  `place_of_birth` varchar(100) DEFAULT NULL,
  `hometown` varchar(100) DEFAULT NULL,
  `hall_of_residence` varchar(100) DEFAULT NULL,
  `institutional_email` varchar(100) DEFAULT NULL,
  `scholarship_id` char(4) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT 'image',
  `updated_email` varchar(25) NOT NULL,
  `updated_phone_number` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `firstname`, `lastname`, `gender`, `date_of_birth`, `country_of_birth`, `faculty_id`, `password`, `email`, `level`, `programme`, `cell_phone`, `postal_address`, `place_of_birth`, `hometown`, `hall_of_residence`, `institutional_email`, `scholarship_id`, `profile_image`, `updated_email`, `updated_phone_number`) VALUES
('CS08', 'Jane', 'Smith', 'female', '1997-08-21', 'UK', NULL, NULL, 'jane.smith@example.com', '300', 'Business Administration', '+987654321', '456 Oak St, Townsville', 'Townsville', 'Hometown City', 'Hall B', 'jane.smith@university.edu', 'SCH6', 'image.jpeg', '', ''),
('CS09', 'Derrick', 'Tabiri', 'male', '1995-05-15', 'USA', NULL, NULL, 'john.doe@example.com', '400', 'Computer Science', '+123456789', '123 Main St, Cityville', 'Cityville', 'Hometownville', 'Hall A', 'john.doe@university.edu', 'SCH1', 'image.jpg', '', ''),
('S001', 'John', 'Doe', 'male', '1995-05-15', 'USA', 'F1', 'password12', 'johndoe@gmail.com', '400', 'Computer Science', '0558686295', NULL, 'BErekum', 'Berekum', 'KNH', 'John.doe@ucc.edu.gh', 'SC01', 'images/image.jpg', '', ''),
('S002', 'Jane', 'Smith', 'female', '1998-08-20', 'Canada', 'F2', 'pass456', 'janesmith@gmail.com', '100', 'Home Economics', '0202699616', NULL, 'Takoradi', 'Berekum', 'Oguaa', 'Jane.smith@ucc.edu.gh', 'SC02', 'image.jpg', '', ''),
('S003', 'Alex', 'Johnson', 'other', '1997-03-10', 'UK', 'F3', 'secret789', 'alexjohnson@gmail.com', '200', 'Mathematics', '0541049176', NULL, 'Tamale', 'Berekum', 'Atl', 'alex.johnson@ucc.edu.gh', 'SC01', 'image.jpg', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tutor`
--

CREATE TABLE `tutor` (
  `tutor_id` char(4) NOT NULL,
  `rank` char(4) DEFAULT NULL,
  `tutor_name` varchar(50) NOT NULL,
  `tutor_dob` date NOT NULL,
  `tutor_desc` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tutor`
--

INSERT INTO `tutor` (`tutor_id`, `rank`, `tutor_name`, `tutor_dob`, `tutor_desc`) VALUES
('T001', 'R001', 'Professor Smith', '1970-02-28', 'Head of Computer Science Department'),
('T002', 'R002', 'Dr. Johnson', '1985-06-15', 'Mathematics Instructor');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `convener`
--
ALTER TABLE `convener`
  ADD PRIMARY KEY (`convener_id`),
  ADD KEY `fk_Convener_Salary` (`rank`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `course_enrolled`
--
ALTER TABLE `course_enrolled`
  ADD PRIMARY KEY (`enrollment_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `course_enrollment`
--
ALTER TABLE `course_enrollment`
  ADD PRIMARY KEY (`enrollment_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `exam_timetable`
--
ALTER TABLE `exam_timetable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faculty_convener`
--
ALTER TABLE `faculty_convener`
  ADD KEY `fk_Faculty_Convener` (`faculty_id`),
  ADD KEY `fk_Convener_Faculty` (`convener_id`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`student_id`,`semester_year`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recycle_bin`
--
ALTER TABLE `recycle_bin`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`student_id`,`subject_id`,`attempt`),
  ADD KEY `fk_Result_Subject` (`subject_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_id`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`rank`);

--
-- Indexes for table `scholarship`
--
ALTER TABLE `scholarship`
  ADD PRIMARY KEY (`scholarship_id`);

--
-- Indexes for table `scholarship_provider`
--
ALTER TABLE `scholarship_provider`
  ADD KEY `fk_Scholarship_Provider` (`scholarship_id`),
  ADD KEY `fk_Provider_Scholarship` (`provider_id`);

--
-- Indexes for table `school_info`
--
ALTER TABLE `school_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `fk_Student_Faculty` (`faculty_id`),
  ADD KEY `fk_Student_Scholarship` (`scholarship_id`);

--
-- Indexes for table `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`tutor_id`),
  ADD KEY `fk_Tutor_Salary` (`rank`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `course_enrolled`
--
ALTER TABLE `course_enrolled`
  MODIFY `enrollment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `course_enrollment`
--
ALTER TABLE `course_enrollment`
  MODIFY `enrollment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `exam_timetable`
--
ALTER TABLE `exam_timetable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `school_info`
--
ALTER TABLE `school_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `convener`
--
ALTER TABLE `convener`
  ADD CONSTRAINT `fk_Convener_Salary` FOREIGN KEY (`rank`) REFERENCES `salary` (`rank`);

--
-- Constraints for table `course_enrolled`
--
ALTER TABLE `course_enrolled`
  ADD CONSTRAINT `course_enrolled_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  ADD CONSTRAINT `course_enrolled_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`);

--
-- Constraints for table `course_enrollment`
--
ALTER TABLE `course_enrollment`
  ADD CONSTRAINT `course_enrollment_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Constraints for table `faculty_convener`
--
ALTER TABLE `faculty_convener`
  ADD CONSTRAINT `fk_Convener_Faculty` FOREIGN KEY (`convener_id`) REFERENCES `convener` (`convener_id`),
  ADD CONSTRAINT `fk_Faculty_Convener` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`);

--
-- Constraints for table `fees`
--
ALTER TABLE `fees`
  ADD CONSTRAINT `fees_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`);

--
-- Constraints for table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `fk_Result_Student` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  ADD CONSTRAINT `fk_Result_Subject` FOREIGN KEY (`subject_id`) REFERENCES `courses` (`course_id`);

--
-- Constraints for table `scholarship_provider`
--
ALTER TABLE `scholarship_provider`
  ADD CONSTRAINT `fk_Provider_Scholarship` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`),
  ADD CONSTRAINT `fk_Scholarship_Provider` FOREIGN KEY (`scholarship_id`) REFERENCES `scholarship` (`scholarship_id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `fk_Student_Faculty` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`),
  ADD CONSTRAINT `fk_Student_Scholarship` FOREIGN KEY (`scholarship_id`) REFERENCES `scholarship` (`scholarship_id`);

--
-- Constraints for table `tutor`
--
ALTER TABLE `tutor`
  ADD CONSTRAINT `fk_Tutor_Salary` FOREIGN KEY (`rank`) REFERENCES `salary` (`rank`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
