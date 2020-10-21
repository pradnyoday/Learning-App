-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2020 at 05:58 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `learning_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add post', 7, 'add_post'),
(26, 'Can change post', 7, 'change_post'),
(27, 'Can delete post', 7, 'delete_post'),
(28, 'Can view post', 7, 'view_post'),
(29, 'Can add replies', 8, 'add_replies'),
(30, 'Can change replies', 8, 'change_replies'),
(31, 'Can delete replies', 8, 'delete_replies'),
(32, 'Can view replies', 8, 'view_replies'),
(33, 'Can add profile', 9, 'add_profile'),
(34, 'Can change profile', 9, 'change_profile'),
(35, 'Can delete profile', 9, 'delete_profile'),
(36, 'Can view profile', 9, 'view_profile'),
(37, 'Can add teacher', 10, 'add_teacher'),
(38, 'Can change teacher', 10, 'change_teacher'),
(39, 'Can delete teacher', 10, 'delete_teacher'),
(40, 'Can view teacher', 10, 'view_teacher'),
(41, 'Can add student', 11, 'add_student'),
(42, 'Can change student', 11, 'change_student'),
(43, 'Can delete student', 11, 'delete_student'),
(44, 'Can view student', 11, 'view_student'),
(45, 'Can add parent', 12, 'add_parent'),
(46, 'Can change parent', 12, 'change_parent'),
(47, 'Can delete parent', 12, 'delete_parent'),
(48, 'Can view parent', 12, 'view_parent'),
(49, 'Can add resource', 13, 'add_resource'),
(50, 'Can change resource', 13, 'change_resource'),
(51, 'Can delete resource', 13, 'delete_resource'),
(52, 'Can view resource', 13, 'view_resource'),
(53, 'Can add attendance', 14, 'add_attendance'),
(54, 'Can change attendance', 14, 'change_attendance'),
(55, 'Can delete attendance', 14, 'delete_attendance'),
(56, 'Can view attendance', 14, 'view_attendance'),
(57, 'Can add marks', 15, 'add_marks'),
(58, 'Can change marks', 15, 'change_marks'),
(59, 'Can delete marks', 15, 'delete_marks'),
(60, 'Can view marks', 15, 'view_marks'),
(61, 'Can add assessment', 16, 'add_assessment'),
(62, 'Can change assessment', 16, 'change_assessment'),
(63, 'Can delete assessment', 16, 'delete_assessment'),
(64, 'Can view assessment', 16, 'view_assessment'),
(65, 'Can add questions', 17, 'add_questions'),
(66, 'Can change questions', 17, 'change_questions'),
(67, 'Can delete questions', 17, 'delete_questions'),
(68, 'Can view questions', 17, 'view_questions');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$216000$X52YCGrQAg4K$5KZZz3ObtmEyOOw+6ut5dVmN5u1eZo7y9XyPx7bkppo=', '2020-10-17 11:52:42.907886', 1, 'pradnyoday', '', '', 'pradnyoday@gmail.com', 1, 1, '2020-10-15 20:36:23.848803'),
(2, 'pbkdf2_sha256$216000$pNLasJSuPqwm$K/uwfEwE5nmP0kd535duJ00lqMWY7sCPfHhcKI2S/Fw=', NULL, 0, 'mayank', 'Mayank', 'Agarwal', 'mayank@email.com', 0, 1, '2020-10-17 07:49:59.000000'),
(3, 'pbkdf2_sha256$216000$cqocZDSXUxqV$OEboqkgZAVct7ZflHUr7S93ka0Tw1LNPiBrJ/JbZseU=', NULL, 0, 'cummins', 'Pat', 'Cummins', 'cummins@email.com', 0, 1, '2020-10-17 07:51:04.000000'),
(4, 'pbkdf2_sha256$216000$2BQpG5lc2i1U$DUAUrPyhoLvNRdJRPFaPo4cM1TpqVNnILsz3sPJaJEM=', NULL, 0, 'jasprit', 'Jasprit', 'Bumrah', 'jasprit@email.com', 0, 1, '2020-10-17 07:51:49.000000'),
(5, 'pbkdf2_sha256$216000$TRwu5CBLcAQF$n0zx6VUy41yoFeBOtYMaoFxggu/q7pXURFUWsuOmmtU=', NULL, 0, 'dinesh', 'Dinesh', 'Chugtai', 'dinesh@email.com', 0, 1, '2020-10-17 07:52:22.000000'),
(6, 'pbkdf2_sha256$216000$IpjYInZHvMWR$DEbg9Y/Avjr2qa45/O45L/FKAN/P6hlvs28lf2Bh3ao=', NULL, 0, 'gilfoyle', '', '', 'gilfoyle@email.com', 0, 1, '2020-10-17 07:53:00.000000'),
(7, 'pbkdf2_sha256$216000$qSsNonBaw1Ez$P/z9cgsiKU3SRBjnIZcJt2oOnT7rVct15v2nVaZiYuM=', NULL, 0, 'malinga', '', '', 'malinga@email.com', 0, 1, '2020-10-17 08:38:25.396775'),
(13, 'pbkdf2_sha256$216000$aNYlO6G2AMWD$r+XpC8e3+2Pv2ajk5VngZMPJT4+0/1NcJo84FdmF8bE=', NULL, 0, 'sachin', 'Sachin', 'Tendulkar', 'sachin@email.com', 0, 1, '2020-10-17 09:28:17.694695'),
(14, 'pbkdf2_sha256$216000$Ka1rEfQTiCIE$pNLsUmS2AJ/4i0B8eudJCXZ91d/M7DEKcd/Dh7Ka3tA=', NULL, 0, 'virat', 'Virat', 'Kohli', 'virat@email.com', 0, 1, '2020-10-17 09:31:54.251307'),
(15, 'pbkdf2_sha256$216000$Lvxfeel9WSAv$HY/CqPLZlHPMZxKmwmZSHh4TfnDVd2dqVX2IbapLh2U=', NULL, 0, 'stokes', 'Ben', 'Stokes', 'stokes@email.com', 0, 1, '2020-10-17 09:35:35.483662'),
(16, 'pbkdf2_sha256$216000$KeVAOXXCcvoB$UxU/Fdn354JXKTGvnLEt8brGzjidpg6nVdluf+6vZsE=', NULL, 0, 'rohit', 'Rohit', 'Sharma', 'rohit@email.com', 0, 1, '2020-10-17 09:48:30.099349'),
(17, 'pbkdf2_sha256$216000$lLzEyGItmxuz$Ehz8DDgX2ivg32PdtdmuraI/463KkcxoflM2jXHHIj4=', NULL, 0, 'maxwell', 'Glenn', 'Maxwell', 'maxwell@email.com', 0, 1, '2020-10-17 10:19:24.592492'),
(18, 'pbkdf2_sha256$216000$ecKc5zfJk8MX$SVSEAlvTNQpwXYBlQlLvISMvl4/AjFa6IXjoXRBDo+E=', NULL, 0, 'rabada', 'Kagiso', 'Rabada', 'rabada@email.com', 0, 1, '2020-10-17 10:29:24.946586'),
(19, 'pbkdf2_sha256$216000$5y8UAevUIHbb$qR4YiBhkw5AiRCrSNM4AgBjsc6n574+3bKIMOdkCYNc=', NULL, 0, 'harry', 'Harry', 'Potter', 'harrypotter@hogwarts.com', 0, 1, '2020-10-17 10:30:57.777533'),
(20, 'pbkdf2_sha256$216000$QUGHNPqsQm0T$Z36dcvmfW1b4XbKj/wNSM/ax325XmhU1OuN1vEpol9k=', NULL, 0, 'dravid', 'Rahul', 'Dravid', 'dravid@email.com', 0, 1, '2020-10-17 10:58:59.534236'),
(21, 'pbkdf2_sha256$216000$qKSV7FbwR661$AgT/i2IZC9iXRPuIDjxaV7oC4bVFnnwf0Gd3zYxdP98=', NULL, 0, 'Snape', 'Severus', 'Snape', 'snape@slytherin.com', 0, 1, '2020-10-17 11:08:34.164915'),
(22, 'pbkdf2_sha256$120000$GdIl689qtwaW$yeYv0RAXd/sDtN5sOrZz7brbPEJoOS4CkOXDvixBMzE=', '2020-10-18 08:04:30.512512', 1, 'admin', '', '', 'admin@admin.com', 1, 1, '2020-10-18 08:04:11.300443');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2020-10-18 08:21:32.804490', '3', 'admin Profile', 1, '[{\"added\": {}}]', 9, 22),
(2, '2020-10-18 08:38:36.931272', '7', 'mayank', 1, '[{\"added\": {}}]', 11, 22),
(3, '2020-10-18 08:38:48.055801', '8', 'jasprit', 1, '[{\"added\": {}}]', 11, 22),
(4, '2020-10-18 08:39:05.028234', '9', 'cummins', 1, '[{\"added\": {}}]', 11, 22),
(5, '2020-10-18 08:39:12.792136', '10', 'dinesh', 1, '[{\"added\": {}}]', 11, 22);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(16, 'forum', 'assessment'),
(14, 'forum', 'attendance'),
(15, 'forum', 'marks'),
(7, 'forum', 'post'),
(17, 'forum', 'questions'),
(8, 'forum', 'replies'),
(13, 'resources', 'resource'),
(6, 'sessions', 'session'),
(12, 'users', 'parent'),
(9, 'users', 'profile'),
(11, 'users', 'student'),
(10, 'users', 'teacher');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-10-17 17:22:43.705429'),
(2, 'auth', '0001_initial', '2020-10-17 17:22:49.790992'),
(3, 'admin', '0001_initial', '2020-10-17 17:22:51.288977'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-10-17 17:22:51.320893'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-10-17 17:22:51.353805'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-10-17 17:22:52.355945'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-10-17 17:22:53.056003'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-10-17 17:22:53.680333'),
(9, 'auth', '0004_alter_user_username_opts', '2020-10-17 17:22:53.708257'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-10-17 17:22:54.337575'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-10-17 17:22:54.354529'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-10-17 17:22:54.389435'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-10-17 17:22:55.236173'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-10-17 17:22:56.066341'),
(15, 'forum', '0001_initial', '2020-10-17 17:22:56.469264'),
(16, 'forum', '0002_auto_20201016_0208', '2020-10-17 17:22:57.334909'),
(17, 'forum', '0003_auto_20201016_0338', '2020-10-17 17:22:58.667394'),
(18, 'forum', '0004_post_upvotes', '2020-10-17 17:22:59.804937'),
(19, 'forum', '0005_auto_20201017_0115', '2020-10-17 17:23:00.830031'),
(20, 'forum', '0006_auto_20201017_2140', '2020-10-17 17:23:01.093327'),
(21, 'resources', '0001_initial', '2020-10-17 17:23:04.345977'),
(22, 'resources', '0002_resource_classes', '2020-10-17 17:23:07.152882'),
(23, 'resources', '0003_auto_20201017_0313', '2020-10-17 17:23:07.742904'),
(24, 'sessions', '0001_initial', '2020-10-17 17:23:08.453109'),
(25, 'users', '0001_initial', '2020-10-17 17:23:08.812147'),
(26, 'users', '0002_auto_20201016_1428', '2020-10-17 17:23:08.847054'),
(27, 'users', '0003_parent_student_teacher', '2020-10-17 17:23:10.184731'),
(28, 'users', '0004_auto_20201017_1637', '2020-10-17 17:23:10.914783'),
(29, 'forum', '0007_auto_20201018_0410', '2020-10-18 07:54:28.651831'),
(30, 'forum', '0008_auto_20201018_0449', '2020-10-18 07:54:28.717655'),
(31, 'forum', '0009_attendance', '2020-10-18 07:54:28.982307'),
(32, 'resources', '0004_resource_video_link', '2020-10-18 07:54:29.446219'),
(33, 'forum', '0010_assessment_marks', '2020-10-18 10:49:02.676303'),
(34, 'forum', '0011_questions', '2020-10-18 10:54:55.196653'),
(35, 'forum', '0010_assessment_marks_questions', '2020-10-18 11:21:43.609576');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('c9q1bccvgt8tzfokznuk6w7j2fr845j8', 'N2ZhNGIzNDA0MGE1OTQzY2U5ZDgwMmE3NGNkNzFkNTExNWRjODJiNzp7Il9hdXRoX3VzZXJfaWQiOiIyMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMGJjMjNkZmQyZjk2N2NiMGZkMzI2NDU3YjE0MzZjZGViOTVmODk4ZiJ9', '2020-11-01 08:04:30.555397');

-- --------------------------------------------------------

--
-- Table structure for table `forum_assessment`
--

CREATE TABLE `forum_assessment` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `standard` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `topic` varchar(100) NOT NULL,
  `teacher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forum_assessment`
--

INSERT INTO `forum_assessment` (`id`, `name`, `standard`, `subject`, `topic`, `teacher_id`) VALUES
(1, 'Simple Harmonic Motion', 11, 'Physics', 'Motion', 1);

-- --------------------------------------------------------

--
-- Table structure for table `forum_attendance`
--

CREATE TABLE `forum_attendance` (
  `id` int(11) NOT NULL,
  `present` int(11) NOT NULL,
  `date` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forum_attendance`
--

INSERT INTO `forum_attendance` (`id`, `present`, `date`, `user_id`) VALUES
(1, 1, '2020-10-01 08:00:00.000000', 2),
(2, 0, '2020-10-01 08:00:00.000000', 3),
(3, 1, '2020-10-01 08:00:00.000000', 4),
(4, 1, '2020-10-01 08:00:00.000000', 5),
(5, 0, '2020-10-02 08:00:00.000000', 2),
(6, 0, '2020-10-02 08:00:00.000000', 3),
(7, 1, '2020-10-02 08:00:00.000000', 4),
(8, 1, '2020-10-02 08:00:00.000000', 5),
(9, 1, '2020-10-03 08:00:00.000000', 2),
(10, 0, '2020-10-03 08:00:00.000000', 3),
(11, 1, '2020-10-03 08:00:00.000000', 4),
(12, 1, '2020-10-03 08:00:00.000000', 5),
(13, 0, '2020-10-04 08:00:00.000000', 2),
(14, 0, '2020-10-04 08:00:00.000000', 3),
(15, 1, '2020-10-04 08:00:00.000000', 4),
(16, 1, '2020-10-04 08:00:00.000000', 5),
(17, 0, '2020-10-05 08:00:00.000000', 2),
(18, 1, '2020-10-05 08:00:00.000000', 3),
(19, 1, '2020-10-05 08:00:00.000000', 4),
(20, 0, '2020-10-05 08:00:00.000000', 5),
(21, 0, '2020-10-06 08:00:00.000000', 2),
(22, 1, '2020-10-06 08:00:00.000000', 3),
(23, 1, '2020-10-06 08:00:00.000000', 4),
(24, 1, '2020-10-06 08:00:00.000000', 5),
(25, 0, '2020-10-07 08:00:00.000000', 2),
(26, 1, '2020-10-07 08:00:00.000000', 3),
(27, 1, '2020-10-07 08:00:00.000000', 4),
(28, 0, '2020-10-07 08:00:00.000000', 5),
(29, 0, '2020-10-08 08:00:00.000000', 2),
(30, 1, '2020-10-08 08:00:00.000000', 3),
(31, 1, '2020-10-08 08:00:00.000000', 4),
(32, 1, '2020-10-08 08:00:00.000000', 5);

-- --------------------------------------------------------

--
-- Table structure for table `forum_marks`
--

CREATE TABLE `forum_marks` (
  `id` int(11) NOT NULL,
  `marks` int(11) NOT NULL,
  `assessment_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forum_marks`
--

INSERT INTO `forum_marks` (`id`, `marks`, `assessment_id`, `student_id`, `teacher_id`) VALUES
(1, 20, 1, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `forum_posts`
--

CREATE TABLE `forum_posts` (
  `id` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `content` longtext NOT NULL,
  `files` varchar(100) DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  `classes` varchar(50) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `video_link` varchar(5000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forum_posts`
--

INSERT INTO `forum_posts` (`id`, `title`, `content`, `files`, `date`, `author_id`, `classes`, `subject`, `video_link`) VALUES
(20, 'Solar System', 'Solar System image.', 'files/Posts/pradnyoday/20_37637.jpg', '2020-10-17 16:08:00.000000', 1, 'Other', 'Other', 'None'),
(33, 'Simple Harmonic Motion', 'SHM', 'files/Posts/pradnyoday/33_Figure_17_03_02a.jpg', '2020-10-17 17:27:39.000000', 1, 'Other', 'Other', 'None'),
(34, 'Water Cycle', 'water cycle', 'files/Posts/pradnyoday/34_hydrocycle_max.jpg', '2020-10-17 17:31:01.000000', 1, 'Other', 'Other', 'None'),
(37, 'test3', 'aa', '', '2020-10-17 22:52:06.878498', 1, 'Other', 'Other', 'https://www.youtube.com/embed/cnn42LLdNJw'),
(38, 'Rational Numbers Fun Learning', 'Hello students, this fun video will help you understand the concept of Rational Numbers in an interactive manner.', '', '2020-10-18 13:07:52.760964', 22, '7', 'Mathematics', 'https://www.youtube.com/embed/9yvtLN_24G0');

-- --------------------------------------------------------

--
-- Table structure for table `forum_posts_upvotes`
--

CREATE TABLE `forum_posts_upvotes` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forum_posts_upvotes`
--

INSERT INTO `forum_posts_upvotes` (`id`, `post_id`, `user_id`) VALUES
(30, 20, 1),
(31, 34, 1);

-- --------------------------------------------------------

--
-- Table structure for table `forum_questions`
--

CREATE TABLE `forum_questions` (
  `id` int(11) NOT NULL,
  `question` varchar(200) NOT NULL,
  `option1` varchar(100) NOT NULL,
  `option2` varchar(100) NOT NULL,
  `option3` varchar(100) NOT NULL,
  `option4` varchar(100) NOT NULL,
  `answer` int(11) NOT NULL,
  `marks` int(11) NOT NULL,
  `assessment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forum_questions`
--

INSERT INTO `forum_questions` (`id`, `question`, `option1`, `option2`, `option3`, `option4`, `answer`, `marks`, `assessment_id`) VALUES
(1, 'What is this?', 'Abba', 'Dabba', 'Jabba', 'None of the above', 3, 1, 1),
(2, 'What is that?', 'Abba', 'Dabba', 'Jabba', 'None of the above', 3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `forum_replies`
--

CREATE TABLE `forum_replies` (
  `id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `date` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forum_replies`
--

INSERT INTO `forum_replies` (`id`, `content`, `date`, `author_id`, `post_id`) VALUES
(7, 'Best', '2020-10-17 18:41:56.726428', 1, 33),
(8, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-10-17 18:59:38.669788', 1, 33);

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE `resources` (
  `id` int(11) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `content` longtext NOT NULL,
  `files` varchar(100) DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  `classes` varchar(50) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `video_link` varchar(5000)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resources`
--

INSERT INTO `resources` (`id`, `title`, `content`, `files`, `date`, `author_id`, `classes`, `subject`, `video_link`) VALUES
(10, 'Solar System', 'ssa', 'files/resources/pradnyoday/10_PMBJP_Product.pdf', '2020-10-16 21:38:41.000000', 1, '6', 'Other', 'None'),
(11, 'Res1', 'Res', 'files/resources/pradnyoday/11_hydrocycle_max.jpg', '2020-10-17 20:42:53.578999', 1, '2', 'Geography', 'None'),
(12, 'Res1', 'Res', 'files/resources/pradnyoday/12_hydrocycle_max.jpg', '2020-10-17 20:43:24.666825', 1, '3', 'Geography', 'None'),
(13, 'test1', 'aa', '', '2020-10-17 23:27:18.206857', 1, 'Other', 'Other', 'https://www.youtube.com/embed/fnHEDbFsZEE');

-- --------------------------------------------------------

--
-- Table structure for table `users_parent`
--

CREATE TABLE `users_parent` (
  `id` int(11) NOT NULL,
  `contact_info` varchar(20) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `child_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_profile`
--

CREATE TABLE `users_profile` (
  `id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_profile`
--

INSERT INTO `users_profile` (`id`, `image`, `user_id`) VALUES
(2, 'profile_pics/pradnyoday/game-of-thrones-609b.jpg', 1),
(3, 'profile_pics/admin/tmp624682146170142721.jpg', 22);

-- --------------------------------------------------------

--
-- Table structure for table `users_student`
--

CREATE TABLE `users_student` (
  `id` int(11) NOT NULL,
  `rollno` int(11) NOT NULL,
  `standard` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_student`
--

INSERT INTO `users_student` (`id`, `rollno`, `standard`, `user_id`) VALUES
(7, 1, '6', 2),
(8, 3, '6', 4),
(9, 4, '6', 3),
(10, 5, '6', 5);

-- --------------------------------------------------------

--
-- Table structure for table `users_teacher`
--

CREATE TABLE `users_teacher` (
  `id` int(11) NOT NULL,
  `is_class1` int(11) NOT NULL,
  `is_class2` int(11) NOT NULL,
  `is_class3` int(11) NOT NULL,
  `is_class4` int(11) NOT NULL,
  `is_class5` int(11) NOT NULL,
  `is_class6` int(11) NOT NULL,
  `is_class7` int(11) NOT NULL,
  `is_class8` int(11) NOT NULL,
  `is_class9` int(11) NOT NULL,
  `is_class10` int(11) NOT NULL,
  `is_class11` int(11) NOT NULL,
  `is_class12` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `education` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_teacher`
--

INSERT INTO `users_teacher` (`id`, `is_class1`, `is_class2`, `is_class3`, `is_class4`, `is_class5`, `is_class6`, `is_class7`, `is_class8`, `is_class9`, `is_class10`, `is_class11`, `is_class12`, `user_id`, `education`) VALUES
(1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 21, 'Master Of Potions');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `forum_assessment`
--
ALTER TABLE `forum_assessment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `forum_assessment_teacher_id_fd6a8164_fk_users_teacher_id` (`teacher_id`);

--
-- Indexes for table `forum_attendance`
--
ALTER TABLE `forum_attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `forum_attendance_user_id_80a96511_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `forum_marks`
--
ALTER TABLE `forum_marks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `forum_marks_assessment_id_2905e889_fk_forum_assessment_id` (`assessment_id`),
  ADD KEY `forum_marks_student_id_a2cc26ff_fk_users_student_id` (`student_id`),
  ADD KEY `forum_marks_teacher_id_51302cb8_fk_users_teacher_id` (`teacher_id`);

--
-- Indexes for table `forum_posts`
--
ALTER TABLE `forum_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `forum_post_author_id_609b7963_fk_auth_user_id` (`author_id`);

--
-- Indexes for table `forum_posts_upvotes`
--
ALTER TABLE `forum_posts_upvotes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `forum_posts_upvotes_post_id_user_id_0a9d2e34_uniq` (`post_id`,`user_id`),
  ADD KEY `forum_posts_upvotes_user_id_40d6d316_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `forum_questions`
--
ALTER TABLE `forum_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `forum_questions_assessment_id_26f48b3e_fk_forum_assessment_id` (`assessment_id`);

--
-- Indexes for table `forum_replies`
--
ALTER TABLE `forum_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `forum_replies_author_id_0f8e4147_fk_auth_user_id` (`author_id`),
  ADD KEY `forum_replies_post_id_3bf3e32c_fk_forum_posts_id` (`post_id`);

--
-- Indexes for table `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resources_author_id_e0fea664_fk_auth_user_id` (`author_id`);

--
-- Indexes for table `users_parent`
--
ALTER TABLE `users_parent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_parent_child_id_857b93db_fk_users_student_id` (`child_id`),
  ADD KEY `users_parent_user_id_50358a89_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `users_profile`
--
ALTER TABLE `users_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `users_student`
--
ALTER TABLE `users_student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_student_user_id_dc59cd64_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `users_teacher`
--
ALTER TABLE `users_teacher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_teacher_user_id_bc9e1389_fk_auth_user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `forum_assessment`
--
ALTER TABLE `forum_assessment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `forum_attendance`
--
ALTER TABLE `forum_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `forum_marks`
--
ALTER TABLE `forum_marks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `forum_posts`
--
ALTER TABLE `forum_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `forum_posts_upvotes`
--
ALTER TABLE `forum_posts_upvotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `forum_questions`
--
ALTER TABLE `forum_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `forum_replies`
--
ALTER TABLE `forum_replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `resources`
--
ALTER TABLE `resources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users_parent`
--
ALTER TABLE `users_parent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_profile`
--
ALTER TABLE `users_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users_student`
--
ALTER TABLE `users_student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users_teacher`
--
ALTER TABLE `users_teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `forum_assessment`
--
ALTER TABLE `forum_assessment`
  ADD CONSTRAINT `forum_assessment_teacher_id_fd6a8164_fk_users_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `users_teacher` (`id`);

--
-- Constraints for table `forum_attendance`
--
ALTER TABLE `forum_attendance`
  ADD CONSTRAINT `forum_attendance_user_id_80a96511_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `forum_marks`
--
ALTER TABLE `forum_marks`
  ADD CONSTRAINT `forum_marks_assessment_id_2905e889_fk_forum_assessment_id` FOREIGN KEY (`assessment_id`) REFERENCES `forum_assessment` (`id`),
  ADD CONSTRAINT `forum_marks_student_id_a2cc26ff_fk_users_student_id` FOREIGN KEY (`student_id`) REFERENCES `users_student` (`id`),
  ADD CONSTRAINT `forum_marks_teacher_id_51302cb8_fk_users_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `users_teacher` (`id`);

--
-- Constraints for table `forum_posts`
--
ALTER TABLE `forum_posts`
  ADD CONSTRAINT `forum_post_author_id_609b7963_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `forum_posts_upvotes`
--
ALTER TABLE `forum_posts_upvotes`
  ADD CONSTRAINT `forum_posts_upvotes_post_id_bb94b86f_fk_forum_posts_id` FOREIGN KEY (`post_id`) REFERENCES `forum_posts` (`id`),
  ADD CONSTRAINT `forum_posts_upvotes_user_id_40d6d316_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `forum_questions`
--
ALTER TABLE `forum_questions`
  ADD CONSTRAINT `forum_questions_assessment_id_26f48b3e_fk_forum_assessment_id` FOREIGN KEY (`assessment_id`) REFERENCES `forum_assessment` (`id`);

--
-- Constraints for table `forum_replies`
--
ALTER TABLE `forum_replies`
  ADD CONSTRAINT `forum_replies_author_id_0f8e4147_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `forum_replies_post_id_3bf3e32c_fk_forum_posts_id` FOREIGN KEY (`post_id`) REFERENCES `forum_posts` (`id`);

--
-- Constraints for table `resources`
--
ALTER TABLE `resources`
  ADD CONSTRAINT `resources_author_id_e0fea664_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `users_parent`
--
ALTER TABLE `users_parent`
  ADD CONSTRAINT `users_parent_child_id_857b93db_fk_users_student_id` FOREIGN KEY (`child_id`) REFERENCES `users_student` (`id`),
  ADD CONSTRAINT `users_parent_user_id_50358a89_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `users_profile`
--
ALTER TABLE `users_profile`
  ADD CONSTRAINT `users_profile_user_id_2112e78d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `users_student`
--
ALTER TABLE `users_student`
  ADD CONSTRAINT `users_student_user_id_dc59cd64_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `users_teacher`
--
ALTER TABLE `users_teacher`
  ADD CONSTRAINT `users_teacher_user_id_bc9e1389_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
