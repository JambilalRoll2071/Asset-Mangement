-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2023 at 10:23 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `manegement`
--

-- --------------------------------------------------------

--
-- Table structure for table `ac_emp_accounts`
--

CREATE TABLE `ac_emp_accounts` (
  `emp_no` varchar(15) NOT NULL,
  `ac_no` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `ac_overtime`
--

CREATE TABLE `ac_overtime` (
  `emp_no` varchar(255) NOT NULL DEFAULT '',
  `total_days` varchar(255) DEFAULT NULL,
  `unpaid_leaves` varchar(255) DEFAULT NULL,
  `paid_leaves` varchar(255) DEFAULT NULL,
  `work_days` varchar(255) DEFAULT NULL,
  `overtime` varchar(255) DEFAULT NULL,
  `overtime_rate` varchar(255) DEFAULT NULL,
  `bps` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `asset_set`
--

CREATE TABLE `asset_set` (
  `id` int(30) NOT NULL,
  `Room_Number` float NOT NULL,
  `Floor_no` int(10) NOT NULL,
  `Deprt_Name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `asset_set`
--

INSERT INTO `asset_set` (`id`, `Room_Number`, `Floor_no`, `Deprt_Name`) VALUES
(1, 2.26, 3, 'Software'),
(2, 2.21, 3, 'Software'),
(3, 2.2, 3, 'Software'),
(4, 2.56, 3, 'Software'),
(5, 2.3, 3, 'Software'),
(6, 2.56, 3, 'Software'),
(7, 1.2, 1, 'Software'),
(8, 1.45, 1, 'Software');

-- --------------------------------------------------------

--
-- Table structure for table `erp_products`
--

CREATE TABLE `erp_products` (
  `product_id` bigint(255) NOT NULL,
  `sku` varchar(512) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `category_id` int(255) NOT NULL,
  `price` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `erp_req_actions`
--

CREATE TABLE `erp_req_actions` (
  `row_id` int(11) NOT NULL,
  `action_date` datetime DEFAULT NULL,
  `trans_id` int(11) DEFAULT NULL,
  `action_taken_by` varchar(255) DEFAULT NULL,
  `action_taken_by_empid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `erp_req_detail`
--

CREATE TABLE `erp_req_detail` (
  `row_id` bigint(20) NOT NULL,
  `trans_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT 0,
  `qty` decimal(18,2) DEFAULT 0.00,
  `qty_by_hod` decimal(18,2) DEFAULT 0.00,
  `reason` varchar(800) DEFAULT '',
  `hod_remarks` varchar(800) DEFAULT '',
  `qty_in_store` decimal(18,2) DEFAULT 0.00,
  `qty_for_req` decimal(18,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `erp_req_master`
--

CREATE TABLE `erp_req_master` (
  `trans_id` int(11) NOT NULL,
  `entry_date` datetime DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `gsms_sessions`
--

CREATE TABLE `gsms_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kpr_accounts`
--

CREATE TABLE `kpr_accounts` (
  `account_id` int(11) NOT NULL,
  `account_name` varchar(100) DEFAULT NULL,
  `short_name` varchar(100) DEFAULT NULL,
  `erp_code` varchar(50) DEFAULT NULL,
  `sub_group` varchar(255) DEFAULT '',
  `sub_group_id` int(11) DEFAULT 0,
  `erp_id` int(11) DEFAULT NULL,
  `acc_type` varchar(255) DEFAULT NULL,
  `is_conditional` bit(1) DEFAULT b'0',
  `is_staged` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `kpr_ad_role`
--

CREATE TABLE `kpr_ad_role` (
  `role_id` int(11) NOT NULL DEFAULT 0,
  `isactive` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  `supervisor_id` int(11) DEFAULT NULL,
  `is_master_role` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `kpr_ad_role_task`
--

CREATE TABLE `kpr_ad_role_task` (
  `role_id` int(11) NOT NULL DEFAULT 0,
  `task_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `kpr_ad_task`
--

CREATE TABLE `kpr_ad_task` (
  `task_id` int(11) NOT NULL DEFAULT 0,
  `isactive` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `task_name` varchar(255) DEFAULT NULL,
  `view_name` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `app_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `kpr_cjob`
--

CREATE TABLE `kpr_cjob` (
  `seed` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `kpr_conveyance_allowance`
--

CREATE TABLE `kpr_conveyance_allowance` (
  `record_id` int(11) NOT NULL DEFAULT 0,
  `from_scale` int(11) DEFAULT NULL,
  `to_scale` int(11) DEFAULT NULL,
  `rate` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `kpr_empsalarydefault`
--

CREATE TABLE `kpr_empsalarydefault` (
  `RowID` int(11) NOT NULL,
  `empid` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `stage` int(11) DEFAULT NULL,
  `Narration` varchar(255) DEFAULT NULL,
  `Debit` double DEFAULT 0,
  `Credit` double DEFAULT 0,
  `is_stage_enabled` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `kpr_empsalarydefault_copy1`
--

CREATE TABLE `kpr_empsalarydefault_copy1` (
  `RowID` int(11) NOT NULL,
  `empid` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `stage` int(11) DEFAULT NULL,
  `Narration` varchar(255) DEFAULT NULL,
  `Debit` double DEFAULT 0,
  `Credit` double DEFAULT 0,
  `is_stage_enabled` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `kpr_govttax`
--

CREATE TABLE `kpr_govttax` (
  `Sr` int(11) NOT NULL DEFAULT 0,
  `FromAmt` double DEFAULT NULL,
  `ToAmt` double DEFAULT NULL,
  `Difference` double DEFAULT NULL,
  `Percent` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `kpr_paybreakagegovt`
--

CREATE TABLE `kpr_paybreakagegovt` (
  `Scale` int(11) NOT NULL DEFAULT 0,
  `Year` int(11) NOT NULL DEFAULT 0,
  `Basic` int(11) DEFAULT NULL,
  `Inc` int(11) DEFAULT NULL,
  `PossibleStages` int(11) DEFAULT NULL,
  `Endbasic` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `kpr_periods`
--

CREATE TABLE `kpr_periods` (
  `period_id` int(11) NOT NULL DEFAULT 0,
  `period_name` varchar(255) DEFAULT NULL,
  `from_date` datetime DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `kpr_salarydetail`
--

CREATE TABLE `kpr_salarydetail` (
  `RowID` int(11) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `Narration` varchar(255) DEFAULT NULL,
  `RefNo` varchar(200) DEFAULT NULL,
  `Debit` double DEFAULT NULL,
  `Credit` double DEFAULT NULL,
  `TransID` int(11) DEFAULT NULL,
  `Type` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `kpr_salarymaster`
--

CREATE TABLE `kpr_salarymaster` (
  `TransID` int(11) NOT NULL DEFAULT 0,
  `EntryDate` datetime DEFAULT NULL,
  `ForMonth` datetime DEFAULT NULL,
  `ProcessfromDate` datetime DEFAULT NULL,
  `ProcessToDate` datetime DEFAULT NULL,
  `PaidOn` datetime DEFAULT NULL,
  `EntryTime` varchar(40) DEFAULT NULL,
  `EmpID` int(11) DEFAULT NULL,
  `Narration` varchar(255) DEFAULT NULL,
  `UserName` varchar(200) DEFAULT NULL,
  `Paid` int(11) DEFAULT NULL,
  `WorkDays` int(11) DEFAULT NULL,
  `AbsentDays` int(11) DEFAULT NULL,
  `LateDays` double DEFAULT NULL,
  `LeaveDays` int(11) DEFAULT NULL,
  `NetDays` int(11) DEFAULT NULL,
  `gross_salary` double DEFAULT NULL,
  `total_allowance` double DEFAULT NULL,
  `total_deductions` double DEFAULT NULL,
  `NetSalary` double DEFAULT NULL,
  `PaidAmount` double DEFAULT NULL,
  `PaidAccountID` int(11) DEFAULT NULL,
  `Advance` double DEFAULT NULL,
  `Balance` double DEFAULT NULL,
  `isReserve` int(11) DEFAULT NULL,
  `SysDate` datetime DEFAULT NULL,
  `monthdays` int(11) DEFAULT NULL,
  `paidleaves` int(11) DEFAULT NULL,
  `unpaidleaves` int(11) DEFAULT NULL,
  `overtime` double DEFAULT NULL,
  `overtimerate` double DEFAULT NULL,
  `total_days` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `kpr_tally`
--

CREATE TABLE `kpr_tally` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `manegement_asset`
--

CREATE TABLE `manegement_asset` (
  `Asset_id` int(10) NOT NULL,
  `Product_name` varchar(30) NOT NULL,
  `Price` float(10,2) NOT NULL,
  `Purchase_Date` date NOT NULL,
  `Type` varchar(30) NOT NULL,
  `Life_Time` float(6,5) NOT NULL,
  `Ten_ Depreciation` float(10,2) NOT NULL,
  `Ten_Appreciation` float(10,2) NOT NULL,
  `Total_cost` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `manegement_asset`
--

INSERT INTO `manegement_asset` (`Asset_id`, `Product_name`, `Price`, `Purchase_Date`, `Type`, `Life_Time`, `Ten_ Depreciation`, `Ten_Appreciation`, `Total_cost`) VALUES
(1, 'Table', 10000.00, '2023-02-01', 'Furniture', 7.90000, 1000.50, 0.00, 900.30),
(2, 'Chair', 5000.00, '2022-01-01', 'Furniture', 7.90000, 1000.50, 0.00, 4500.70),
(3, 'Computer', 60000.70, '2022-09-01', 'Machine', 7.00000, 2500.76, 0.00, 54000.99),
(4, 'Printer', 25000.00, '2021-01-09', 'Machine', 7.90000, 2500.00, 0.00, 22500.00),
(5, 'Car', 40000000.00, '2022-09-01', 'Machine', 9.99999, 400000.00, 0.00, 3600000.00),
(6, 'Bike', 300000.00, '2022-02-01', 'Machine', 9.99999, 30000.00, 0.00, 270000.00),
(7, 'Building', 25000.00, '2023-02-01', 'Land', 9.99999, 0.00, 2500000.00, 275000.00),
(8, 'Land', 10000000.00, '2022-09-01', 'Land', 9.99999, 0.00, 1000000.00, 1000000.00);

-- --------------------------------------------------------

--
-- Table structure for table `mis_accounts_info`
--

CREATE TABLE `mis_accounts_info` (
  `id` int(11) NOT NULL,
  `cnic` varchar(255) DEFAULT NULL,
  `bank_account_no` varchar(255) DEFAULT NULL,
  `accounts_emp_no` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `mis_additional_charge`
--

CREATE TABLE `mis_additional_charge` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `department` int(11) NOT NULL,
  `designation` int(11) NOT NULL,
  `joining_date` date NOT NULL,
  `status` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `datecreated` date DEFAULT NULL,
  `dateupdated` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_additional_charge_remane`
--

CREATE TABLE `mis_additional_charge_remane` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `department` int(11) NOT NULL,
  `designation` int(11) NOT NULL,
  `joining_date` date NOT NULL,
  `status` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `datecreated` date DEFAULT NULL,
  `dateupdated` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_add_paper`
--

CREATE TABLE `mis_add_paper` (
  `ID` int(11) NOT NULL,
  `doi` varchar(255) DEFAULT NULL,
  `req_date` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `active_date` datetime DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `req_log` varchar(255) DEFAULT NULL,
  `empid` int(11) DEFAULT NULL,
  `usertype` varchar(255) DEFAULT NULL,
  `article` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `month` varchar(255) DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `volume` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `pages` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `journal` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `booktitle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_alumni_student`
--

CREATE TABLE `mis_alumni_student` (
  `id` int(11) NOT NULL,
  `company` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `std_id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `datecreated` datetime DEFAULT NULL,
  `dateupdated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_apr_annual_report`
--

CREATE TABLE `mis_apr_annual_report` (
  `id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `report_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_apr_attachments`
--

CREATE TABLE `mis_apr_attachments` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `report_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_apr_category`
--

CREATE TABLE `mis_apr_category` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_apr_comments`
--

CREATE TABLE `mis_apr_comments` (
  `id` int(11) NOT NULL,
  `report_id` int(11) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `step` int(11) DEFAULT NULL,
  `comments_by` varchar(255) DEFAULT NULL,
  `comments` text DEFAULT NULL,
  `recommendation` varchar(255) DEFAULT NULL,
  `proposed_renewal` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_apr_contract_info`
--

CREATE TABLE `mis_apr_contract_info` (
  `id` int(11) NOT NULL,
  `report_id` int(11) DEFAULT NULL,
  `contract_question_id` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_apr_contract_questions`
--

CREATE TABLE `mis_apr_contract_questions` (
  `id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_apr_questions`
--

CREATE TABLE `mis_apr_questions` (
  `id` int(11) NOT NULL,
  `desc` text DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `section` int(11) DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  `total_score` int(11) DEFAULT NULL,
  `req_field_id` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `seq_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_apr_report_info`
--

CREATE TABLE `mis_apr_report_info` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `user_id` varchar(60) DEFAULT NULL,
  `period_type` varchar(255) DEFAULT NULL,
  `report_from` date DEFAULT NULL,
  `report_to` date DEFAULT NULL,
  `report_type` int(11) DEFAULT 1,
  `template_id` int(11) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `report_points` float DEFAULT NULL,
  `formula_score` float DEFAULT NULL,
  `institutional_services` text DEFAULT NULL,
  `services_count` int(4) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_apr_required_fields`
--

CREATE TABLE `mis_apr_required_fields` (
  `id` int(11) NOT NULL,
  `input_field` varchar(255) DEFAULT NULL,
  `option_label` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_apr_templates`
--

CREATE TABLE `mis_apr_templates` (
  `id` int(11) NOT NULL,
  `title` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_apr_template_questions`
--

CREATE TABLE `mis_apr_template_questions` (
  `id` int(11) NOT NULL,
  `template_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `seq_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_apr_transaction`
--

CREATE TABLE `mis_apr_transaction` (
  `id` int(11) NOT NULL,
  `report_id` int(11) DEFAULT NULL,
  `step` int(11) DEFAULT NULL,
  `action_by` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `next` varchar(255) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `completed` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_apr_wf_states`
--

CREATE TABLE `mis_apr_wf_states` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_apr_workflows`
--

CREATE TABLE `mis_apr_workflows` (
  `id` int(11) NOT NULL,
  `template_id` int(11) DEFAULT NULL,
  `authority` varchar(255) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `step_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_attendance`
--

CREATE TABLE `mis_attendance` (
  `id` int(11) NOT NULL,
  `timetable_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `isactive` int(1) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `mis_audit_log`
--

CREATE TABLE `mis_audit_log` (
  `id` int(11) NOT NULL,
  `section` varchar(100) DEFAULT NULL,
  `action` varchar(100) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `url_string` text DEFAULT NULL,
  `time_string` int(255) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `ip` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_basar_hierarchy`
--

CREATE TABLE `mis_basar_hierarchy` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `next_employee` int(11) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `mis_basar_phd_students`
--

CREATE TABLE `mis_basar_phd_students` (
  `id` int(11) NOT NULL,
  `cba_enrollment` varchar(255) DEFAULT NULL,
  `supervisor_id` int(11) DEFAULT NULL,
  `program_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `student_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `mis_basar_student_request`
--

CREATE TABLE `mis_basar_student_request` (
  `id` int(11) NOT NULL,
  `sup_id` int(11) DEFAULT NULL,
  `app_no` varchar(255) DEFAULT NULL,
  `request_content` text DEFAULT NULL,
  `sup_remarks` text DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `dean_id` int(11) DEFAULT NULL,
  `chairmain_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `mis_bas_supervisor`
--

CREATE TABLE `mis_bas_supervisor` (
  `id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `sup_limit` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `mis_biomatric_userinfo`
--

CREATE TABLE `mis_biomatric_userinfo` (
  `USERID` int(11) NOT NULL,
  `BADGENUMBER` varchar(24) NOT NULL,
  `SSN` varchar(20) DEFAULT NULL,
  `NAME` varchar(40) DEFAULT NULL,
  `GENDER` varchar(8) DEFAULT NULL,
  `TITLE` varchar(20) DEFAULT NULL,
  `PAGER` varchar(20) DEFAULT NULL,
  `BIRTHDAY` datetime DEFAULT NULL,
  `HIREDDAY` datetime DEFAULT NULL,
  `STREET` varchar(80) DEFAULT NULL,
  `CITY` varchar(2) DEFAULT NULL,
  `STATE` varchar(2) DEFAULT NULL,
  `ZIP` varchar(12) DEFAULT NULL,
  `OPHONE` varchar(20) DEFAULT NULL,
  `FPHONE` varchar(20) DEFAULT NULL,
  `VERIFICATIONMETHOD` smallint(6) DEFAULT NULL,
  `DEFAULTDEPTID` smallint(6) DEFAULT NULL,
  `SECURITYFLAGS` smallint(6) DEFAULT NULL,
  `ATT` smallint(6) DEFAULT NULL,
  `INLATE` smallint(6) DEFAULT NULL,
  `OUTEARLY` smallint(6) DEFAULT NULL,
  `OVERTIME` smallint(6) DEFAULT NULL,
  `SEP` smallint(6) DEFAULT NULL,
  `HOLIDAY` smallint(6) DEFAULT NULL,
  `MINZU` varchar(8) DEFAULT NULL,
  `PASSWORD` varchar(50) DEFAULT NULL,
  `LUNCHDURATION` smallint(6) DEFAULT NULL,
  `MVerifyPass` varchar(10) DEFAULT NULL,
  `PHOTO` longblob DEFAULT NULL,
  `Notes` longblob DEFAULT NULL,
  `privilege` int(11) DEFAULT NULL,
  `InheritDeptSch` smallint(6) DEFAULT NULL,
  `InheritDeptSchClass` smallint(6) DEFAULT NULL,
  `AutoSchPlan` smallint(6) DEFAULT NULL,
  `MinAutoSchInterval` int(11) DEFAULT NULL,
  `RegisterOT` smallint(6) DEFAULT NULL,
  `InheritDeptRule` smallint(6) DEFAULT NULL,
  `EMPRIVILEGE` smallint(6) DEFAULT NULL,
  `CardNo` varchar(20) DEFAULT NULL,
  `FaceGroup` int(11) DEFAULT NULL,
  `AccGroup` int(11) DEFAULT NULL,
  `UseAccGroupTZ` int(11) DEFAULT NULL,
  `VerifyCode` int(11) DEFAULT NULL,
  `Expires` int(11) DEFAULT NULL,
  `ValidCount` int(11) DEFAULT NULL,
  `ValidTimeBegin` datetime DEFAULT NULL,
  `ValidTimeEnd` datetime DEFAULT NULL,
  `TimeZone1` int(11) DEFAULT NULL,
  `TimeZone2` int(11) DEFAULT NULL,
  `TimeZone3` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_biometric_devices`
--

CREATE TABLE `mis_biometric_devices` (
  `id` int(11) NOT NULL,
  `ip` text NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `machine_number` int(11) NOT NULL,
  `type` enum('Production','DataEntry','Testing','De-Activated') NOT NULL DEFAULT 'Testing',
  `port_number` int(11) NOT NULL DEFAULT 4370,
  `last_sync` datetime DEFAULT NULL,
  `fail_attempts` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_biometric_device_logs`
--

CREATE TABLE `mis_biometric_device_logs` (
  `id` int(11) NOT NULL,
  `log` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_biometric_logs`
--

CREATE TABLE `mis_biometric_logs` (
  `sensorid` int(11) NOT NULL,
  `badgenumber` int(11) NOT NULL,
  `checktype` varchar(1) NOT NULL,
  `checktime` datetime NOT NULL,
  `verifycode` int(11) DEFAULT NULL,
  `unix_time_stamp` double NOT NULL,
  `id` int(11) NOT NULL,
  `sn` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_boards`
--

CREATE TABLE `mis_boards` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_calander`
--

CREATE TABLE `mis_calander` (
  `cid` int(11) NOT NULL,
  `cyear` int(11) NOT NULL,
  `cdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_campus`
--

CREATE TABLE `mis_campus` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `mis_checkinout`
--

CREATE TABLE `mis_checkinout` (
  `USERID` int(11) NOT NULL,
  `CHECKTIME` datetime NOT NULL,
  `CHECKTYPE` varchar(1) DEFAULT NULL,
  `VERIFYCODE` int(11) DEFAULT NULL,
  `SENSORID` varchar(5) DEFAULT NULL,
  `Memoinfo` varchar(30) DEFAULT NULL,
  `WorkCode` varchar(24) DEFAULT NULL,
  `sn` varchar(20) DEFAULT NULL,
  `UserExtFmt` smallint(6) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `unix_time_stamp` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_checkinout_audit`
--

CREATE TABLE `mis_checkinout_audit` (
  `USERID` int(11) NOT NULL,
  `CHECKTIME` datetime NOT NULL,
  `CHECKTYPE` varchar(1) DEFAULT NULL,
  `VERIFYCODE` int(11) DEFAULT NULL,
  `SENSORID` varchar(5) DEFAULT NULL,
  `Memoinfo` varchar(30) DEFAULT NULL,
  `WorkCode` varchar(24) DEFAULT NULL,
  `sn` varchar(20) DEFAULT NULL,
  `UserExtFmt` smallint(6) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `unix_time_stamp` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_checkinout_manual`
--

CREATE TABLE `mis_checkinout_manual` (
  `USERID` int(11) NOT NULL,
  `CHECKTIME` datetime NOT NULL,
  `CHECKTYPE` varchar(1) DEFAULT NULL,
  `VERIFYCODE` int(11) DEFAULT NULL,
  `SENSORID` varchar(5) DEFAULT NULL,
  `Memoinfo` varchar(30) DEFAULT NULL,
  `WorkCode` varchar(24) DEFAULT NULL,
  `sn` varchar(20) DEFAULT NULL,
  `UserExtFmt` smallint(6) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_cities`
--

CREATE TABLE `mis_cities` (
  `id` int(11) NOT NULL,
  `country` char(6) DEFAULT NULL,
  `region` char(9) DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `is_division` tinyint(1) NOT NULL DEFAULT 0,
  `is_district` tinyint(1) NOT NULL DEFAULT 0,
  `is_tehsil` tinyint(1) NOT NULL DEFAULT 1,
  `district_id` int(11) DEFAULT NULL,
  `division_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_companies`
--

CREATE TABLE `mis_companies` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `dateupdated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_countries`
--

CREATE TABLE `mis_countries` (
  `id` int(11) NOT NULL,
  `iso` char(6) DEFAULT NULL,
  `title` varchar(240) DEFAULT NULL,
  `iso3` char(9) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  `phonecode` int(5) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_cs_attachment`
--

CREATE TABLE `mis_cs_attachment` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `upload` varchar(255) NOT NULL,
  `case_id` int(11) NOT NULL,
  `track_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_cs_barcode_device`
--

CREATE TABLE `mis_cs_barcode_device` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_cs_casetypes`
--

CREATE TABLE `mis_cs_casetypes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `mis_cs_info`
--

CREATE TABLE `mis_cs_info` (
  `id` int(11) NOT NULL,
  `letter_no` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `reference_date` date DEFAULT NULL,
  `received_date` date DEFAULT NULL,
  `case_type_id` int(11) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_cs_priority_type`
--

CREATE TABLE `mis_cs_priority_type` (
  `id` int(10) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_cs_role`
--

CREATE TABLE `mis_cs_role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_cs_status_type`
--

CREATE TABLE `mis_cs_status_type` (
  `id` int(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `viewable` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_cs_track`
--

CREATE TABLE `mis_cs_track` (
  `id` int(11) NOT NULL,
  `case_id` int(11) DEFAULT NULL,
  `sender_dept_id` int(11) DEFAULT NULL,
  `from_dept_id` int(11) DEFAULT NULL,
  `receiver_dept_id` int(11) DEFAULT NULL,
  `init_emp_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `assigned_by` int(6) DEFAULT NULL,
  `initiated` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `feedback` int(5) DEFAULT NULL,
  `status_type_id` int(11) DEFAULT NULL,
  `priority_type_id` int(11) DEFAULT NULL,
  `comments` text DEFAULT NULL,
  `is_hard_copy` varchar(5) DEFAULT NULL,
  `tracking_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_cs_user`
--

CREATE TABLE `mis_cs_user` (
  `id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `active` int(2) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_dailywages_contract`
--

CREATE TABLE `mis_dailywages_contract` (
  `id` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `exp_date` date NOT NULL,
  `emp_id` int(11) NOT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `contract_type` varchar(255) NOT NULL DEFAULT 'Adhoc',
  `contract_date` date DEFAULT NULL,
  `new_salry` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_dailywages_edu`
--

CREATE TABLE `mis_dailywages_edu` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `board` int(11) NOT NULL,
  `degree` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `total_marks` decimal(10,2) NOT NULL,
  `obtained_marks` decimal(10,2) NOT NULL,
  `roll_no` varchar(255) NOT NULL,
  `certificate_no` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_dbconfiguration`
--

CREATE TABLE `mis_dbconfiguration` (
  `id` int(11) NOT NULL,
  `groupname` varchar(255) DEFAULT NULL,
  `dsn` varchar(255) DEFAULT NULL,
  `hostname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `database` varchar(255) NOT NULL,
  `dbdriver` varchar(255) DEFAULT 'mysqli',
  `dbprefix` varchar(255) DEFAULT NULL,
  `pconnect` tinyint(1) NOT NULL DEFAULT 0,
  `db_debug` varchar(255) DEFAULT '(ENVIRONMENT !== ''production'')',
  `cache_on` tinyint(1) NOT NULL DEFAULT 0,
  `cachedir` varchar(255) DEFAULT '',
  `char_set` varchar(255) NOT NULL DEFAULT 'utf8',
  `dbcollat` varchar(255) DEFAULT 'utf8_general_ci',
  `swap_pre` varchar(255) DEFAULT '',
  `encrypt` tinyint(1) NOT NULL DEFAULT 0,
  `compress` tinyint(1) NOT NULL DEFAULT 0,
  `stricton` tinyint(1) NOT NULL DEFAULT 0,
  `failover` varchar(255) DEFAULT 'array()',
  `save_queries` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_degrees`
--

CREATE TABLE `mis_degrees` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `is_phd` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_departments`
--

CREATE TABLE `mis_departments` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 99,
  `description` text DEFAULT NULL,
  `in_menu` tinyint(1) DEFAULT 0,
  `in_faculty` tinyint(1) DEFAULT 1,
  `priority` int(11) DEFAULT NULL,
  `faculty_id` int(11) DEFAULT NULL,
  `status_dept` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_designations_tbl`
--

CREATE TABLE `mis_designations_tbl` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `bps` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `genders` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 for both genders, 1: for male, 2: for female'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_dock_received`
--

CREATE TABLE `mis_dock_received` (
  `ID` int(12) NOT NULL,
  `Dairy_no` varchar(255) DEFAULT NULL,
  `date_rec_letter` date DEFAULT NULL,
  `letter_no` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `Dept_Id` int(11) DEFAULT NULL,
  `received_by` varchar(255) DEFAULT NULL,
  `sender_name` varchar(255) DEFAULT NULL,
  `contact_no` int(15) DEFAULT NULL,
  `consignment_no` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `dateupdated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_dock_sent`
--

CREATE TABLE `mis_dock_sent` (
  `ID` int(11) NOT NULL,
  `Dairy_no` varchar(255) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `sending_mode` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `dispatch_no` varchar(100) NOT NULL,
  `sending_dept` int(11) DEFAULT NULL,
  `consignment_no` varchar(255) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `contact_no` int(25) DEFAULT NULL,
  `dept_dispatch_no` varchar(25) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `dateupdated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_emp_accounts`
--

CREATE TABLE `mis_emp_accounts` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `mis_emp_contract`
--

CREATE TABLE `mis_emp_contract` (
  `id` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `exp_date` date NOT NULL,
  `emp_id` int(11) NOT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `contract_type` varchar(255) NOT NULL DEFAULT 'Adhoc',
  `contract_date` date DEFAULT NULL,
  `new_salry` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ac_emp_accounts`
--
ALTER TABLE `ac_emp_accounts`
  ADD PRIMARY KEY (`emp_no`) USING BTREE;

--
-- Indexes for table `ac_overtime`
--
ALTER TABLE `ac_overtime`
  ADD PRIMARY KEY (`emp_no`) USING BTREE;

--
-- Indexes for table `asset_set`
--
ALTER TABLE `asset_set`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `erp_req_actions`
--
ALTER TABLE `erp_req_actions`
  ADD PRIMARY KEY (`row_id`) USING BTREE;

--
-- Indexes for table `erp_req_detail`
--
ALTER TABLE `erp_req_detail`
  ADD PRIMARY KEY (`row_id`) USING BTREE;

--
-- Indexes for table `erp_req_master`
--
ALTER TABLE `erp_req_master`
  ADD PRIMARY KEY (`trans_id`) USING BTREE;

--
-- Indexes for table `kpr_accounts`
--
ALTER TABLE `kpr_accounts`
  ADD PRIMARY KEY (`account_id`) USING BTREE;

--
-- Indexes for table `kpr_ad_role`
--
ALTER TABLE `kpr_ad_role`
  ADD PRIMARY KEY (`role_id`) USING BTREE;

--
-- Indexes for table `kpr_ad_role_task`
--
ALTER TABLE `kpr_ad_role_task`
  ADD PRIMARY KEY (`role_id`,`task_id`) USING BTREE;

--
-- Indexes for table `kpr_ad_task`
--
ALTER TABLE `kpr_ad_task`
  ADD PRIMARY KEY (`task_id`) USING BTREE;

--
-- Indexes for table `kpr_cjob`
--
ALTER TABLE `kpr_cjob`
  ADD PRIMARY KEY (`seed`) USING BTREE;

--
-- Indexes for table `kpr_conveyance_allowance`
--
ALTER TABLE `kpr_conveyance_allowance`
  ADD PRIMARY KEY (`record_id`) USING BTREE;

--
-- Indexes for table `kpr_empsalarydefault`
--
ALTER TABLE `kpr_empsalarydefault`
  ADD PRIMARY KEY (`RowID`) USING BTREE;

--
-- Indexes for table `kpr_empsalarydefault_copy1`
--
ALTER TABLE `kpr_empsalarydefault_copy1`
  ADD PRIMARY KEY (`RowID`) USING BTREE;

--
-- Indexes for table `kpr_govttax`
--
ALTER TABLE `kpr_govttax`
  ADD PRIMARY KEY (`Sr`) USING BTREE;

--
-- Indexes for table `kpr_paybreakagegovt`
--
ALTER TABLE `kpr_paybreakagegovt`
  ADD PRIMARY KEY (`Scale`,`Year`) USING BTREE;

--
-- Indexes for table `kpr_periods`
--
ALTER TABLE `kpr_periods`
  ADD PRIMARY KEY (`period_id`) USING BTREE;

--
-- Indexes for table `kpr_salarydetail`
--
ALTER TABLE `kpr_salarydetail`
  ADD PRIMARY KEY (`RowID`) USING BTREE,
  ADD KEY `account_id` (`account_id`) USING BTREE,
  ADD KEY `TransID` (`TransID`) USING BTREE;

--
-- Indexes for table `kpr_salarymaster`
--
ALTER TABLE `kpr_salarymaster`
  ADD PRIMARY KEY (`TransID`) USING BTREE,
  ADD KEY `IX_ForMonth` (`ForMonth`) USING BTREE,
  ADD KEY `IX_TransID` (`TransID`) USING BTREE,
  ADD KEY `IX_EntryDate` (`EntryDate`) USING BTREE,
  ADD KEY `IX_EmpID` (`EmpID`) USING BTREE;

--
-- Indexes for table `manegement_asset`
--
ALTER TABLE `manegement_asset`
  ADD PRIMARY KEY (`Asset_id`);

--
-- Indexes for table `mis_accounts_info`
--
ALTER TABLE `mis_accounts_info`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_additional_charge`
--
ALTER TABLE `mis_additional_charge`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_additional_charge_remane`
--
ALTER TABLE `mis_additional_charge_remane`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_add_paper`
--
ALTER TABLE `mis_add_paper`
  ADD PRIMARY KEY (`ID`) USING BTREE;

--
-- Indexes for table `mis_alumni_student`
--
ALTER TABLE `mis_alumni_student`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_apr_annual_report`
--
ALTER TABLE `mis_apr_annual_report`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_apr_attachments`
--
ALTER TABLE `mis_apr_attachments`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_apr_category`
--
ALTER TABLE `mis_apr_category`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_apr_comments`
--
ALTER TABLE `mis_apr_comments`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_apr_contract_info`
--
ALTER TABLE `mis_apr_contract_info`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_apr_contract_questions`
--
ALTER TABLE `mis_apr_contract_questions`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_apr_questions`
--
ALTER TABLE `mis_apr_questions`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_apr_report_info`
--
ALTER TABLE `mis_apr_report_info`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_apr_required_fields`
--
ALTER TABLE `mis_apr_required_fields`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_apr_templates`
--
ALTER TABLE `mis_apr_templates`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_apr_template_questions`
--
ALTER TABLE `mis_apr_template_questions`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_apr_transaction`
--
ALTER TABLE `mis_apr_transaction`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_apr_wf_states`
--
ALTER TABLE `mis_apr_wf_states`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_apr_workflows`
--
ALTER TABLE `mis_apr_workflows`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_attendance`
--
ALTER TABLE `mis_attendance`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_audit_log`
--
ALTER TABLE `mis_audit_log`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_basar_hierarchy`
--
ALTER TABLE `mis_basar_hierarchy`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_basar_phd_students`
--
ALTER TABLE `mis_basar_phd_students`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_basar_student_request`
--
ALTER TABLE `mis_basar_student_request`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_bas_supervisor`
--
ALTER TABLE `mis_bas_supervisor`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_biomatric_userinfo`
--
ALTER TABLE `mis_biomatric_userinfo`
  ADD PRIMARY KEY (`USERID`) USING BTREE;

--
-- Indexes for table `mis_biometric_devices`
--
ALTER TABLE `mis_biometric_devices`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_biometric_device_logs`
--
ALTER TABLE `mis_biometric_device_logs`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_biometric_logs`
--
ALTER TABLE `mis_biometric_logs`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_boards`
--
ALTER TABLE `mis_boards`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_calander`
--
ALTER TABLE `mis_calander`
  ADD PRIMARY KEY (`cid`) USING BTREE,
  ADD UNIQUE KEY `cdate` (`cdate`) USING BTREE;

--
-- Indexes for table `mis_campus`
--
ALTER TABLE `mis_campus`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_checkinout`
--
ALTER TABLE `mis_checkinout`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `id` (`id`) USING BTREE,
  ADD KEY `USERID` (`USERID`) USING BTREE;

--
-- Indexes for table `mis_checkinout_audit`
--
ALTER TABLE `mis_checkinout_audit`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `USERID` (`USERID`) USING BTREE;

--
-- Indexes for table `mis_checkinout_manual`
--
ALTER TABLE `mis_checkinout_manual`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `USERID` (`USERID`) USING BTREE;

--
-- Indexes for table `mis_cities`
--
ALTER TABLE `mis_cities`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `division_id` (`division_id`) USING BTREE,
  ADD KEY `district_id` (`district_id`) USING BTREE;

--
-- Indexes for table `mis_companies`
--
ALTER TABLE `mis_companies`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_countries`
--
ALTER TABLE `mis_countries`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_cs_attachment`
--
ALTER TABLE `mis_cs_attachment`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_cs_barcode_device`
--
ALTER TABLE `mis_cs_barcode_device`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_cs_casetypes`
--
ALTER TABLE `mis_cs_casetypes`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_cs_info`
--
ALTER TABLE `mis_cs_info`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_cs_priority_type`
--
ALTER TABLE `mis_cs_priority_type`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_cs_role`
--
ALTER TABLE `mis_cs_role`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_cs_status_type`
--
ALTER TABLE `mis_cs_status_type`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_cs_track`
--
ALTER TABLE `mis_cs_track`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `priority` (`priority_type_id`) USING BTREE,
  ADD KEY `status` (`status_type_id`) USING BTREE,
  ADD KEY `self` (`tracking_id`) USING BTREE,
  ADD KEY `case` (`case_id`) USING BTREE;

--
-- Indexes for table `mis_cs_user`
--
ALTER TABLE `mis_cs_user`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_role` (`role_id`) USING BTREE;

--
-- Indexes for table `mis_dailywages_contract`
--
ALTER TABLE `mis_dailywages_contract`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_dailywages_edu`
--
ALTER TABLE `mis_dailywages_edu`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_dbconfiguration`
--
ALTER TABLE `mis_dbconfiguration`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_degrees`
--
ALTER TABLE `mis_degrees`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_departments`
--
ALTER TABLE `mis_departments`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `title` (`title`,`parent_id`,`faculty_id`) USING BTREE,
  ADD UNIQUE KEY `title_2` (`title`,`slug`) USING BTREE,
  ADD KEY `id` (`id`) USING BTREE;

--
-- Indexes for table `mis_designations_tbl`
--
ALTER TABLE `mis_designations_tbl`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id` (`id`) USING BTREE;

--
-- Indexes for table `mis_dock_received`
--
ALTER TABLE `mis_dock_received`
  ADD PRIMARY KEY (`ID`) USING BTREE;

--
-- Indexes for table `mis_dock_sent`
--
ALTER TABLE `mis_dock_sent`
  ADD PRIMARY KEY (`ID`) USING BTREE,
  ADD UNIQUE KEY `dispatchno` (`dispatch_no`) USING BTREE;

--
-- Indexes for table `mis_emp_accounts`
--
ALTER TABLE `mis_emp_accounts`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mis_emp_contract`
--
ALTER TABLE `mis_emp_contract`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `asset_set`
--
ALTER TABLE `asset_set`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `erp_req_actions`
--
ALTER TABLE `erp_req_actions`
  MODIFY `row_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_req_detail`
--
ALTER TABLE `erp_req_detail`
  MODIFY `row_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kpr_cjob`
--
ALTER TABLE `kpr_cjob`
  MODIFY `seed` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kpr_empsalarydefault`
--
ALTER TABLE `kpr_empsalarydefault`
  MODIFY `RowID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kpr_empsalarydefault_copy1`
--
ALTER TABLE `kpr_empsalarydefault_copy1`
  MODIFY `RowID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kpr_salarydetail`
--
ALTER TABLE `kpr_salarydetail`
  MODIFY `RowID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manegement_asset`
--
ALTER TABLE `manegement_asset`
  MODIFY `Asset_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `mis_accounts_info`
--
ALTER TABLE `mis_accounts_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4504;

--
-- AUTO_INCREMENT for table `mis_additional_charge`
--
ALTER TABLE `mis_additional_charge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `mis_additional_charge_remane`
--
ALTER TABLE `mis_additional_charge_remane`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mis_add_paper`
--
ALTER TABLE `mis_add_paper`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mis_alumni_student`
--
ALTER TABLE `mis_alumni_student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mis_apr_annual_report`
--
ALTER TABLE `mis_apr_annual_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mis_apr_attachments`
--
ALTER TABLE `mis_apr_attachments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mis_apr_category`
--
ALTER TABLE `mis_apr_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mis_apr_comments`
--
ALTER TABLE `mis_apr_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mis_apr_contract_info`
--
ALTER TABLE `mis_apr_contract_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mis_apr_contract_questions`
--
ALTER TABLE `mis_apr_contract_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mis_apr_questions`
--
ALTER TABLE `mis_apr_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mis_apr_report_info`
--
ALTER TABLE `mis_apr_report_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mis_apr_required_fields`
--
ALTER TABLE `mis_apr_required_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mis_apr_templates`
--
ALTER TABLE `mis_apr_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mis_apr_template_questions`
--
ALTER TABLE `mis_apr_template_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mis_apr_transaction`
--
ALTER TABLE `mis_apr_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mis_apr_wf_states`
--
ALTER TABLE `mis_apr_wf_states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mis_apr_workflows`
--
ALTER TABLE `mis_apr_workflows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mis_attendance`
--
ALTER TABLE `mis_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mis_audit_log`
--
ALTER TABLE `mis_audit_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5325004;

--
-- AUTO_INCREMENT for table `mis_basar_hierarchy`
--
ALTER TABLE `mis_basar_hierarchy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `mis_basar_phd_students`
--
ALTER TABLE `mis_basar_phd_students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1145;

--
-- AUTO_INCREMENT for table `mis_basar_student_request`
--
ALTER TABLE `mis_basar_student_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `mis_bas_supervisor`
--
ALTER TABLE `mis_bas_supervisor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `mis_biomatric_userinfo`
--
ALTER TABLE `mis_biomatric_userinfo`
  MODIFY `USERID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mis_biometric_devices`
--
ALTER TABLE `mis_biometric_devices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mis_biometric_device_logs`
--
ALTER TABLE `mis_biometric_device_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mis_biometric_logs`
--
ALTER TABLE `mis_biometric_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mis_boards`
--
ALTER TABLE `mis_boards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=651;

--
-- AUTO_INCREMENT for table `mis_calander`
--
ALTER TABLE `mis_calander`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mis_campus`
--
ALTER TABLE `mis_campus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mis_checkinout`
--
ALTER TABLE `mis_checkinout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mis_checkinout_audit`
--
ALTER TABLE `mis_checkinout_audit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mis_checkinout_manual`
--
ALTER TABLE `mis_checkinout_manual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mis_cities`
--
ALTER TABLE `mis_cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=648;

--
-- AUTO_INCREMENT for table `mis_companies`
--
ALTER TABLE `mis_companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mis_countries`
--
ALTER TABLE `mis_countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mis_cs_attachment`
--
ALTER TABLE `mis_cs_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `mis_cs_barcode_device`
--
ALTER TABLE `mis_cs_barcode_device`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mis_cs_casetypes`
--
ALTER TABLE `mis_cs_casetypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `mis_cs_info`
--
ALTER TABLE `mis_cs_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `mis_cs_priority_type`
--
ALTER TABLE `mis_cs_priority_type`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mis_cs_role`
--
ALTER TABLE `mis_cs_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mis_cs_status_type`
--
ALTER TABLE `mis_cs_status_type`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `mis_cs_track`
--
ALTER TABLE `mis_cs_track`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `mis_cs_user`
--
ALTER TABLE `mis_cs_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mis_dailywages_contract`
--
ALTER TABLE `mis_dailywages_contract`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mis_dailywages_edu`
--
ALTER TABLE `mis_dailywages_edu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mis_dbconfiguration`
--
ALTER TABLE `mis_dbconfiguration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `mis_degrees`
--
ALTER TABLE `mis_degrees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=889;

--
-- AUTO_INCREMENT for table `mis_departments`
--
ALTER TABLE `mis_departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT for table `mis_designations_tbl`
--
ALTER TABLE `mis_designations_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=363;

--
-- AUTO_INCREMENT for table `mis_dock_received`
--
ALTER TABLE `mis_dock_received`
  MODIFY `ID` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mis_dock_sent`
--
ALTER TABLE `mis_dock_sent`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mis_emp_accounts`
--
ALTER TABLE `mis_emp_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mis_emp_contract`
--
ALTER TABLE `mis_emp_contract`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kpr_salarydetail`
--
ALTER TABLE `kpr_salarydetail`
  ADD CONSTRAINT `kpr_salarydetail_ibfk_1` FOREIGN KEY (`TransID`) REFERENCES `kpr_salarymaster` (`TransID`) ON DELETE CASCADE;

--
-- Constraints for table `mis_cs_track`
--
ALTER TABLE `mis_cs_track`
  ADD CONSTRAINT `mis_cs_track_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `mis_cs_info` (`id`),
  ADD CONSTRAINT `mis_cs_track_ibfk_2` FOREIGN KEY (`priority_type_id`) REFERENCES `mis_cs_priority_type` (`id`),
  ADD CONSTRAINT `mis_cs_track_ibfk_3` FOREIGN KEY (`tracking_id`) REFERENCES `mis_cs_track` (`id`),
  ADD CONSTRAINT `mis_cs_track_ibfk_4` FOREIGN KEY (`status_type_id`) REFERENCES `mis_cs_status_type` (`id`);

--
-- Constraints for table `mis_cs_user`
--
ALTER TABLE `mis_cs_user`
  ADD CONSTRAINT `mis_cs_user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `mis_cs_role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
