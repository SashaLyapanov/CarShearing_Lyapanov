-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 06 2026 г., 15:01
-- Версия сервера: 8.0.30
-- Версия PHP: 8.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `carShearing_DB`
--

-- --------------------------------------------------------

--
-- Структура таблицы `b_admin_notify`
--

CREATE TABLE `b_admin_notify` (
  `ID` int NOT NULL,
  `MODULE_ID` varchar(50) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `MESSAGE` text,
  `ENABLE_CLOSE` char(1) DEFAULT 'Y',
  `PUBLIC_SECTION` char(1) NOT NULL DEFAULT 'N',
  `NOTIFY_TYPE` char(1) NOT NULL DEFAULT 'M'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_admin_notify`
--

INSERT INTO `b_admin_notify` (`ID`, `MODULE_ID`, `TAG`, `MESSAGE`, `ENABLE_CLOSE`, `PUBLIC_SECTION`, `NOTIFY_TYPE`) VALUES
(1, 'MAIN', 'SITE_CHECKER', 'Обнаружены ошибки в работе сайта. <a href=\"/bitrix/admin/site_checker.php?lang=ru&start_test=Y\">Проверить и исправить.</a>', 'Y', 'N', 'M');

-- --------------------------------------------------------

--
-- Структура таблицы `b_admin_notify_lang`
--

CREATE TABLE `b_admin_notify_lang` (
  `ID` int NOT NULL,
  `NOTIFY_ID` int NOT NULL,
  `LID` char(2) NOT NULL,
  `MESSAGE` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_agent`
--

CREATE TABLE `b_agent` (
  `ID` bigint NOT NULL,
  `MODULE_ID` varchar(50) DEFAULT NULL,
  `SORT` int NOT NULL DEFAULT '100',
  `NAME` text,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `LAST_EXEC` datetime DEFAULT NULL,
  `NEXT_EXEC` datetime NOT NULL,
  `DATE_CHECK` datetime DEFAULT NULL,
  `AGENT_INTERVAL` int DEFAULT '86400',
  `IS_PERIOD` char(1) DEFAULT 'Y',
  `USER_ID` int DEFAULT NULL,
  `RUNNING` char(1) NOT NULL DEFAULT 'N',
  `RETRY_COUNT` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_agent`
--

INSERT INTO `b_agent` (`ID`, `MODULE_ID`, `SORT`, `NAME`, `ACTIVE`, `LAST_EXEC`, `NEXT_EXEC`, `DATE_CHECK`, `AGENT_INTERVAL`, `IS_PERIOD`, `USER_ID`, `RUNNING`, `RETRY_COUNT`) VALUES
(1, 'main', 100, 'CCaptchaAgent::DeleteOldCaptcha(3600);', 'Y', '2026-10-06 14:42:17', '2026-10-06 15:42:17', NULL, 3600, 'N', NULL, 'N', 0),
(2, 'main', 100, 'CSiteCheckerTest::CommonTest();', 'Y', '2026-10-05 14:56:18', '2026-10-06 14:56:18', NULL, 86400, 'N', NULL, 'N', 0),
(3, 'main', 100, 'CEvent::CleanUpAgent();', 'Y', '2026-10-05 14:56:18', '2026-10-06 14:56:18', NULL, 86400, 'N', NULL, 'N', 0),
(4, 'main', 100, 'CUser::CleanUpHitAuthAgent();', 'Y', '2026-10-05 14:56:18', '2026-10-06 14:56:18', NULL, 86400, 'N', NULL, 'N', 0),
(5, 'main', 100, 'CUndo::CleanUpOld();', 'Y', '2026-10-05 14:56:18', '2026-10-06 14:56:18', NULL, 86400, 'N', NULL, 'N', 0),
(6, 'main', 100, 'CUserCounter::DeleteOld();', 'Y', '2026-10-05 14:56:18', '2026-10-06 14:56:18', NULL, 86400, 'N', NULL, 'N', 0),
(7, 'main', 100, '\\Bitrix\\Main\\UI\\Viewer\\FilePreviewTable::deleteOldAgent(22, 20);', 'Y', '2026-10-05 14:56:18', '2026-10-06 14:56:18', NULL, 86400, 'N', NULL, 'N', 0),
(8, 'main', 100, 'CUser::AuthActionsCleanUpAgent();', 'Y', '2026-10-05 14:56:18', '2026-10-06 14:56:18', NULL, 86400, 'N', NULL, 'N', 0),
(9, 'main', 100, 'CUser::CleanUpAgent();', 'Y', '2026-10-05 14:56:18', '2026-10-06 14:56:18', NULL, 86400, 'N', NULL, 'N', 0),
(10, 'main', 100, 'CUser::DeactivateAgent();', 'Y', '2026-10-05 14:56:18', '2026-10-06 14:56:18', NULL, 86400, 'N', NULL, 'N', 0),
(11, 'main', 100, 'CEventLog::CleanUpAgent();', 'Y', '2026-10-05 14:56:18', '2026-10-06 14:56:18', NULL, 86400, 'N', NULL, 'N', 0),
(35, 'security', 100, 'CSecuritySession::CleanUpAgent();', 'Y', '2026-10-06 14:42:17', '2026-10-06 15:12:17', NULL, 1800, 'N', NULL, 'N', 0),
(36, 'security', 100, 'CSecurityIPRule::CleanUpAgent();', 'Y', '2026-10-06 14:42:17', '2026-10-06 15:42:17', NULL, 3600, 'N', NULL, 'N', 0),
(42, 'ui', 100, '\\Bitrix\\UI\\FileUploader\\TempFileAgent::clearOldRecords();', 'Y', '2026-10-06 14:42:17', '2026-10-06 15:12:17', NULL, 1800, 'N', NULL, 'N', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `b_app_password`
--

CREATE TABLE `b_app_password` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `APPLICATION_ID` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `DIGEST_PASSWORD` varchar(255) NOT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `DATE_LOGIN` datetime DEFAULT NULL,
  `LAST_IP` varchar(255) DEFAULT NULL,
  `COMMENT` varchar(255) DEFAULT NULL,
  `SYSCOMMENT` varchar(255) DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_cache_clean_path`
--

CREATE TABLE `b_cache_clean_path` (
  `ID` bigint NOT NULL,
  `PREFIX` text,
  `CLEAN_FROM` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CLUSTER_GROUP` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_cache_tag`
--

CREATE TABLE `b_cache_tag` (
  `ID` bigint NOT NULL,
  `SITE_ID` char(2) DEFAULT NULL,
  `CACHE_SALT` char(4) DEFAULT NULL,
  `RELATIVE_PATH` varchar(255) DEFAULT NULL,
  `TAG` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_captcha`
--

CREATE TABLE `b_captcha` (
  `ID` varchar(32) NOT NULL,
  `CODE` varchar(20) NOT NULL,
  `IP` varchar(15) NOT NULL,
  `DATE_CREATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_cars`
--

CREATE TABLE `b_cars` (
  `ID` bigint NOT NULL,
  `UF_MODEL` text COLLATE utf8mb4_unicode_ci,
  `UF_YEAR` int DEFAULT NULL,
  `UF_VIN` text COLLATE utf8mb4_unicode_ci,
  `UF_STATUS` int DEFAULT NULL,
  `UF_PRICE_PER_DAY` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `b_cars`
--

INSERT INTO `b_cars` (`ID`, `UF_MODEL`, `UF_YEAR`, `UF_VIN`, `UF_STATUS`, `UF_PRICE_PER_DAY`) VALUES
(2, 'Honda CR-V RD1', 1999, '654889465489685', 1, 100000),
(3, 'Ford Musatng', 1999, 'sd589987wefr54e57', 1, 1000),
(4, 'Porsh', 2022, 'sd589987wefr54e52', 1, 2000),
(5, 'Lada', 2023, 'dd589987wefr54e52', 1, 10),
(6, 'Toyota', 2002, 'sd589987wefr54e66', 1, 3000),
(7, 'Lada1', 2023, 'dd589987wefr57e53', 1, 10),
(8, 'Toyota1', 2032, 'sd589987wefr54e78', 1, 3000),
(12, 'Lada1', 2023, 'dd589747wefr57e13', 1, 10),
(13, 'Toyota1', 2022, 'sd545987wefr54238', 1, 3000),
(14, 'Lada1', 2023, 'd3589747wefr57e13', 1, 10),
(15, 'Toyota1', 2022, 'sd345987wefr54238', 1, 3000),
(16, 'Porsh', 2022, 'sd2344587wefr54e52', 1, 2000),
(17, 'Porsh', 2022, 'sd2341587wefr54e52', 1, 2000),
(18, 'Porsh', 2022, 'sd23415873efr54e52', 1, 2000),
(19, 'Lada1', 2023, 'd3589347wefr57e13', 1, 10),
(20, 'Toyota1', 2022, 'sd345937wefr54238', 1, 3000),
(21, 'Lada1', 2023, 'd35893s7wefr57e13', 1, 10),
(23, 'Porsh12', 2022, 'sd589987wefr54e23', 2, 3000);

-- --------------------------------------------------------

--
-- Структура таблицы `b_checklist`
--

CREATE TABLE `b_checklist` (
  `ID` int NOT NULL,
  `DATE_CREATE` varchar(255) DEFAULT NULL,
  `TESTER` varchar(255) DEFAULT NULL,
  `COMPANY_NAME` varchar(255) DEFAULT NULL,
  `PICTURE` int DEFAULT NULL,
  `TOTAL` int DEFAULT NULL,
  `SUCCESS` int DEFAULT NULL,
  `FAILED` int DEFAULT NULL,
  `PENDING` int DEFAULT NULL,
  `SKIP` int DEFAULT NULL,
  `STATE` longtext,
  `REPORT_COMMENT` text,
  `REPORT` char(1) DEFAULT 'Y',
  `EMAIL` varchar(50) DEFAULT NULL,
  `PHONE` varchar(50) DEFAULT NULL,
  `SENDED_TO_BITRIX` char(1) DEFAULT 'N',
  `HIDDEN` char(1) DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_component_params`
--

CREATE TABLE `b_component_params` (
  `ID` int NOT NULL,
  `SITE_ID` char(2) NOT NULL,
  `COMPONENT_NAME` varchar(255) NOT NULL,
  `TEMPLATE_NAME` varchar(255) DEFAULT NULL,
  `REAL_PATH` varchar(255) NOT NULL,
  `SEF_MODE` char(1) NOT NULL DEFAULT 'Y',
  `SEF_FOLDER` varchar(255) DEFAULT NULL,
  `START_CHAR` int NOT NULL,
  `END_CHAR` int NOT NULL,
  `PARAMETERS` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_composite_log`
--

CREATE TABLE `b_composite_log` (
  `ID` int NOT NULL,
  `HOST` varchar(100) NOT NULL,
  `URI` varchar(2000) NOT NULL,
  `TITLE` varchar(250) DEFAULT NULL,
  `CREATED` datetime NOT NULL,
  `TYPE` varchar(50) NOT NULL,
  `MESSAGE` longtext,
  `AJAX` char(1) NOT NULL DEFAULT 'N',
  `USER_ID` int NOT NULL DEFAULT '0',
  `PAGE_ID` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_composite_page`
--

CREATE TABLE `b_composite_page` (
  `ID` int NOT NULL,
  `CACHE_KEY` varchar(2000) NOT NULL,
  `HOST` varchar(100) NOT NULL,
  `URI` varchar(2000) NOT NULL,
  `TITLE` varchar(250) DEFAULT NULL,
  `CREATED` datetime NOT NULL,
  `CHANGED` datetime NOT NULL,
  `LAST_VIEWED` datetime NOT NULL,
  `VIEWS` int NOT NULL DEFAULT '0',
  `REWRITES` int NOT NULL DEFAULT '0',
  `SIZE` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_consent_agreement`
--

CREATE TABLE `b_consent_agreement` (
  `ID` int NOT NULL,
  `CODE` varchar(45) DEFAULT NULL,
  `DATE_INSERT` datetime NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) NOT NULL,
  `TYPE` char(1) DEFAULT NULL,
  `LANGUAGE_ID` char(2) DEFAULT NULL,
  `DATA_PROVIDER` varchar(45) DEFAULT NULL,
  `AGREEMENT_TEXT` longtext,
  `LABEL_TEXT` varchar(4000) DEFAULT NULL,
  `SECURITY_CODE` varchar(32) DEFAULT NULL,
  `USE_URL` char(1) NOT NULL DEFAULT 'N',
  `URL` varchar(255) DEFAULT NULL,
  `IS_AGREEMENT_TEXT_HTML` char(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_consent_field`
--

CREATE TABLE `b_consent_field` (
  `ID` int NOT NULL,
  `AGREEMENT_ID` int NOT NULL,
  `CODE` varchar(100) DEFAULT NULL,
  `VALUE` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_consent_user_consent`
--

CREATE TABLE `b_consent_user_consent` (
  `ID` int NOT NULL,
  `DATE_INSERT` datetime NOT NULL,
  `AGREEMENT_ID` int NOT NULL,
  `USER_ID` int DEFAULT NULL,
  `IP` varchar(15) NOT NULL,
  `URL` varchar(4000) DEFAULT NULL,
  `ORIGIN_ID` varchar(30) DEFAULT NULL,
  `ORIGINATOR_ID` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_consent_user_consent_item`
--

CREATE TABLE `b_consent_user_consent_item` (
  `ID` int NOT NULL,
  `USER_CONSENT_ID` int NOT NULL,
  `VALUE` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_counter_data`
--

CREATE TABLE `b_counter_data` (
  `ID` varchar(16) NOT NULL,
  `TYPE` varchar(30) NOT NULL,
  `DATA` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_culture`
--

CREATE TABLE `b_culture` (
  `ID` int NOT NULL,
  `CODE` varchar(50) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `FORMAT_DATE` varchar(50) DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) DEFAULT NULL,
  `FORMAT_NAME` varchar(50) DEFAULT NULL,
  `WEEK_START` int DEFAULT '1',
  `CHARSET` varchar(50) DEFAULT NULL,
  `DIRECTION` char(1) DEFAULT 'Y',
  `SHORT_DATE_FORMAT` varchar(50) DEFAULT 'n/j/Y',
  `MEDIUM_DATE_FORMAT` varchar(50) DEFAULT 'M j, Y',
  `LONG_DATE_FORMAT` varchar(50) DEFAULT 'F j, Y',
  `FULL_DATE_FORMAT` varchar(50) DEFAULT 'l, F j, Y',
  `DAY_MONTH_FORMAT` varchar(50) DEFAULT 'F j',
  `DAY_SHORT_MONTH_FORMAT` varchar(50) DEFAULT 'M j',
  `DAY_OF_WEEK_MONTH_FORMAT` varchar(50) DEFAULT 'l, F j',
  `SHORT_DAY_OF_WEEK_MONTH_FORMAT` varchar(50) DEFAULT 'D, F j',
  `SHORT_DAY_OF_WEEK_SHORT_MONTH_FORMAT` varchar(50) DEFAULT 'D, M j',
  `SHORT_TIME_FORMAT` varchar(50) DEFAULT 'g:i a',
  `LONG_TIME_FORMAT` varchar(50) DEFAULT 'g:i:s a',
  `AM_VALUE` varchar(20) DEFAULT 'am',
  `PM_VALUE` varchar(20) DEFAULT 'pm',
  `NUMBER_THOUSANDS_SEPARATOR` varchar(10) DEFAULT ',',
  `NUMBER_DECIMAL_SEPARATOR` varchar(10) DEFAULT '.',
  `NUMBER_DECIMALS` tinyint DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_culture`
--

INSERT INTO `b_culture` (`ID`, `CODE`, `NAME`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `DIRECTION`, `SHORT_DATE_FORMAT`, `MEDIUM_DATE_FORMAT`, `LONG_DATE_FORMAT`, `FULL_DATE_FORMAT`, `DAY_MONTH_FORMAT`, `DAY_SHORT_MONTH_FORMAT`, `DAY_OF_WEEK_MONTH_FORMAT`, `SHORT_DAY_OF_WEEK_MONTH_FORMAT`, `SHORT_DAY_OF_WEEK_SHORT_MONTH_FORMAT`, `SHORT_TIME_FORMAT`, `LONG_TIME_FORMAT`, `AM_VALUE`, `PM_VALUE`, `NUMBER_THOUSANDS_SEPARATOR`, `NUMBER_DECIMAL_SEPARATOR`, `NUMBER_DECIMALS`) VALUES
(1, 'ru', 'ru', 'DD.MM.YYYY', 'DD.MM.YYYY HH:MI:SS', '#NAME# #LAST_NAME#', 1, 'UTF-8', 'Y', 'd.m.Y', 'j M Y', 'j F Y', 'l, j F Y', 'j F', 'j M', 'l, j F', 'D, j F', 'D, j M', 'H:i', 'H:i:s', 'am', 'pm', ' ', ',', 2),
(2, 'en', 'en', 'MM/DD/YYYY', 'MM/DD/YYYY H:MI:SS T', '#NAME# #LAST_NAME#', 0, 'UTF-8', 'Y', 'n/j/Y', 'M j, Y', 'F j, Y', 'l, F j, Y', 'F j', 'M j', 'l, F j', 'D, F j', 'D, M j', 'g:i a', 'g:i:s a', 'am', 'pm', ',', '.', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `b_entity_usage`
--

CREATE TABLE `b_entity_usage` (
  `USER_ID` int NOT NULL,
  `CONTEXT` varchar(50) NOT NULL,
  `ENTITY_ID` varchar(30) NOT NULL,
  `ITEM_ID` varchar(50) NOT NULL,
  `ITEM_ID_INT` int NOT NULL DEFAULT '0',
  `PREFIX` varchar(10) NOT NULL DEFAULT '',
  `LAST_USE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_event`
--

CREATE TABLE `b_event` (
  `ID` int NOT NULL,
  `EVENT_NAME` varchar(255) NOT NULL,
  `MESSAGE_ID` int DEFAULT NULL,
  `LID` varchar(255) NOT NULL,
  `C_FIELDS` longtext,
  `DATE_INSERT` datetime DEFAULT NULL,
  `DATE_EXEC` datetime DEFAULT NULL,
  `SUCCESS_EXEC` char(1) NOT NULL DEFAULT 'N',
  `DUPLICATE` char(1) NOT NULL DEFAULT 'Y',
  `LANGUAGE_ID` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_attachment`
--

CREATE TABLE `b_event_attachment` (
  `EVENT_ID` int NOT NULL,
  `FILE_ID` int NOT NULL,
  `IS_FILE_COPIED` char(1) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_log`
--

CREATE TABLE `b_event_log` (
  `ID` bigint NOT NULL,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `SEVERITY` varchar(50) NOT NULL,
  `AUDIT_TYPE_ID` varchar(50) NOT NULL,
  `MODULE_ID` varchar(50) NOT NULL,
  `ITEM_ID` varchar(255) NOT NULL,
  `REMOTE_ADDR` varchar(40) DEFAULT NULL,
  `USER_AGENT` text,
  `REQUEST_URI` text,
  `SITE_ID` char(2) DEFAULT NULL,
  `USER_ID` int DEFAULT NULL,
  `GUEST_ID` int DEFAULT NULL,
  `DESCRIPTION` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_event_log`
--

INSERT INTO `b_event_log` (`ID`, `TIMESTAMP_X`, `SEVERITY`, `AUDIT_TYPE_ID`, `MODULE_ID`, `ITEM_ID`, `REMOTE_ADDR`, `USER_AGENT`, `REQUEST_URI`, `SITE_ID`, `USER_ID`, `GUEST_ID`, `DESCRIPTION`) VALUES
(1, '2026-10-05 14:56:18', 'WARNING', 'SITE_CHECKER_ERROR', 'main', 'CSiteCheckerTest::CommonTest();', '-', '-', '/bitrix/tools/public_session.php?k=434b098e81efb4d499fd00816f52e279.9c9721f30fea4a31c85a8d1c37c92b454884db4f5290d7748ff8e4023f768c92', 's1', NULL, NULL, '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_message`
--

CREATE TABLE `b_event_message` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `EVENT_NAME` varchar(255) NOT NULL,
  `LID` char(2) DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `EMAIL_FROM` varchar(255) NOT NULL DEFAULT '#EMAIL_FROM#',
  `EMAIL_TO` varchar(255) NOT NULL DEFAULT '#EMAIL_TO#',
  `SUBJECT` varchar(255) DEFAULT NULL,
  `MESSAGE` longtext,
  `MESSAGE_PHP` longtext,
  `BODY_TYPE` varchar(4) NOT NULL DEFAULT 'text',
  `BCC` text,
  `REPLY_TO` varchar(255) DEFAULT NULL,
  `CC` varchar(255) DEFAULT NULL,
  `IN_REPLY_TO` varchar(255) DEFAULT NULL,
  `PRIORITY` varchar(50) DEFAULT NULL,
  `FIELD1_NAME` varchar(50) DEFAULT NULL,
  `FIELD1_VALUE` varchar(255) DEFAULT NULL,
  `FIELD2_NAME` varchar(50) DEFAULT NULL,
  `FIELD2_VALUE` varchar(255) DEFAULT NULL,
  `SITE_TEMPLATE_ID` varchar(255) DEFAULT NULL,
  `ADDITIONAL_FIELD` text,
  `LANGUAGE_ID` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_event_message`
--

INSERT INTO `b_event_message` (`ID`, `TIMESTAMP_X`, `EVENT_NAME`, `LID`, `ACTIVE`, `EMAIL_FROM`, `EMAIL_TO`, `SUBJECT`, `MESSAGE`, `MESSAGE_PHP`, `BODY_TYPE`, `BCC`, `REPLY_TO`, `CC`, `IN_REPLY_TO`, `PRIORITY`, `FIELD1_NAME`, `FIELD1_VALUE`, `FIELD2_NAME`, `FIELD2_VALUE`, `SITE_TEMPLATE_ID`, `ADDITIONAL_FIELD`, `LANGUAGE_ID`) VALUES
(1, '2026-09-11 13:14:36', 'NEW_USER', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#DEFAULT_EMAIL_FROM#', '#SITE_NAME#: Зарегистрировался новый пользователь', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНа сайте #SERVER_NAME# успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: #USER_ID#\n\nИмя: #NAME#\nФамилия: #LAST_NAME#\nE-Mail: #EMAIL#\n\nLogin: #LOGIN#\n\nПисьмо сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНа сайте <?=$arParams[\"SERVER_NAME\"];?> успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\n\nИмя: <?=$arParams[\"NAME\"];?>\n\nФамилия: <?=$arParams[\"LAST_NAME\"];?>\n\nE-Mail: <?=$arParams[\"EMAIL\"];?>\n\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nПисьмо сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(2, '2026-09-11 13:14:36', 'USER_INFO', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Регистрационная информация', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(3, '2026-09-11 13:14:36', 'USER_PASS_REQUEST', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Запрос на смену пароля', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(4, '2026-09-11 13:14:36', 'USER_PASS_CHANGED', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение смены пароля', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(5, '2026-09-11 13:14:36', 'NEW_USER_CONFIRM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение регистрации нового пользователя', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере #SERVER_NAME#.\n\nВаш код для подтверждения регистрации: #CONFIRM_CODE#\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#&confirm_code=#CONFIRM_CODE#\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере <?=$arParams[\"SERVER_NAME\"];?>.\n\nВаш код для подтверждения регистрации: <?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams[\"USER_ID\"];?>&confirm_code=<?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams[\"USER_ID\"];?>\n\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(6, '2026-09-11 13:14:36', 'USER_INVITE', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Приглашение на сайт', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\nЗдравствуйте, #NAME# #LAST_NAME#!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: #ID#\nLogin: #LOGIN#\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth.php?change_password=yes&USER_LOGIN=#URL_LOGIN#&USER_CHECKWORD=#CHECKWORD#\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\nЗдравствуйте, <?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"ID\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth.php?change_password=yes&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>\n\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(7, '2026-09-11 13:14:36', 'FEEDBACK_FORM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: Сообщение из формы обратной связи', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: #AUTHOR#\nE-mail автора: #AUTHOR_EMAIL#\n\nТекст сообщения:\n#TEXT#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nE-mail автора: <?=$arParams[\"AUTHOR_EMAIL\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"TEXT\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(8, '2026-09-11 13:14:36', 'MAIN_MAIL_CONFIRM_CODE', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#MESSAGE_SUBJECT#', '<? EventMessageThemeCompiler::includeComponent(\'bitrix:main.mail.confirm\', \'\', $arParams); ?>', '<? EventMessageThemeCompiler::includeComponent(\'bitrix:main.mail.confirm\', \'\', $arParams); ?>', 'html', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'mail_join', NULL, NULL),
(9, '2026-09-11 13:14:36', 'EVENT_LOG_NOTIFICATION', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', 'Оповещение журнала событий: #NAME#', 'Зафиксированы события в журнале, соответствующие параметрам оповещения:\n\nТип события: #AUDIT_TYPE_ID#\nОбъект: #ITEM_ID#\nПользователь: #USER_ID# \nIP-адрес: #REMOTE_ADDR#\nБраузер: #USER_AGENT#\nСтраница: #REQUEST_URI# \n\nКоличество записей: #EVENT_COUNT# \n\n#ADDITIONAL_TEXT#\n\nПерейти в журнал событий:\nhttp://#SERVER_NAME#/bitrix/admin/event_log.php?set_filter=Y&find_audit_type_id=#AUDIT_TYPE_ID#', 'Зафиксированы события в журнале, соответствующие параметрам оповещения:\n\nТип события: <?=$arParams[\"AUDIT_TYPE_ID\"];?>\n\nОбъект: <?=$arParams[\"ITEM_ID\"];?>\n\nПользователь: <?=$arParams[\"USER_ID\"];?> \nIP-адрес: <?=$arParams[\"REMOTE_ADDR\"];?>\n\nБраузер: <?=$arParams[\"USER_AGENT\"];?>\n\nСтраница: <?=$arParams[\"REQUEST_URI\"];?> \n\nКоличество записей: <?=$arParams[\"EVENT_COUNT\"];?> \n\n<?=$arParams[\"ADDITIONAL_TEXT\"];?>\n\n\nПерейти в журнал событий:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/bitrix/admin/event_log.php?set_filter=Y&find_audit_type_id=<?=$arParams[\"AUDIT_TYPE_ID\"];?>', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(10, '2026-09-11 13:14:36', 'USER_CODE_REQUEST', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Запрос кода авторизации', 'Используйте для авторизации код:\n\n#CHECKWORD#\n\nПосле авторизации вы сможете изменить свой пароль в редактировании профиля.\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nЛогин: #LOGIN#\n\nСообщение создано автоматически.', 'Используйте для авторизации код:\n\n<?=$arParams[\"CHECKWORD\"];?>\n\n\nПосле авторизации вы сможете изменить свой пароль в редактировании профиля.\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nЛогин: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение создано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(11, '2026-09-11 13:14:36', 'NEW_DEVICE_LOGIN', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', 'Вход с нового устройства', 'Здравствуйте, #NAME#,\n\nНовое устройство авторизовалось под вашим логином #LOGIN#.\n \nУстройство: #DEVICE# \nБраузер: #BROWSER#\nПлатформа: #PLATFORM#\nМестоположение: #LOCATION# (может быть неточным)\nДата: #DATE#\n\nЕсли вы не знаете, кто это был, рекомендуем немедленно сменить пароль.\n', 'Здравствуйте, <?=$arParams[\"NAME\"];?>,\n\nНовое устройство авторизовалось под вашим логином <?=$arParams[\"LOGIN\"];?>.\n \nУстройство: <?=$arParams[\"DEVICE\"];?> \nБраузер: <?=$arParams[\"BROWSER\"];?>\n\nПлатформа: <?=$arParams[\"PLATFORM\"];?>\n\nМестоположение: <?=$arParams[\"LOCATION\"];?> (может быть неточным)\nДата: <?=$arParams[\"DATE\"];?>\n\n\nЕсли вы не знаете, кто это был, рекомендуем немедленно сменить пароль.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(12, '2026-09-11 13:14:36', 'NEW_USER', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#DEFAULT_EMAIL_FROM#', '#SITE_NAME#: New user has been registered on the site', 'Informational message from #SITE_NAME#\n---------------------------------------\n\nNew user has been successfully registered on the site #SERVER_NAME#.\n\nUser details:\nUser ID: #USER_ID#\n\nName: #NAME#\nLast Name: #LAST_NAME#\nUser\'s E-Mail: #EMAIL#\n\nLogin: #LOGIN#\n\nAutomatically generated message.', 'Informational message from <?=$arParams[\"SITE_NAME\"];?>\n\n---------------------------------------\n\nNew user has been successfully registered on the site <?=$arParams[\"SERVER_NAME\"];?>.\n\nUser details:\nUser ID: <?=$arParams[\"USER_ID\"];?>\n\n\nName: <?=$arParams[\"NAME\"];?>\n\nLast Name: <?=$arParams[\"LAST_NAME\"];?>\n\nUser\'s E-Mail: <?=$arParams[\"EMAIL\"];?>\n\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nAutomatically generated message.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en'),
(13, '2026-09-11 13:14:36', 'USER_INFO', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Registration info', 'Informational message from #SITE_NAME#\n---------------------------------------\n\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nYour registration info:\n\nUser ID: #USER_ID#\nAccount status: #STATUS#\nLogin: #LOGIN#\n\nTo change your password please visit the link below:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=en&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nAutomatically generated message.', 'Informational message from <?=$arParams[\"SITE_NAME\"];?>\n\n---------------------------------------\n\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nYour registration info:\n\nUser ID: <?=$arParams[\"USER_ID\"];?>\n\nAccount status: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nTo change your password please visit the link below:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?change_password=yes&lang=en&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>\n\n\nAutomatically generated message.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en'),
(14, '2026-09-11 13:14:36', 'USER_PASS_REQUEST', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Password Change Request', 'Informational message from #SITE_NAME#\n---------------------------------------\n\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nTo change your password please visit the link below:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=en&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nYour registration info:\n\nUser ID: #USER_ID#\nAccount status: #STATUS#\nLogin: #LOGIN#\n\nAutomatically generated message.', 'Informational message from <?=$arParams[\"SITE_NAME\"];?>\n\n---------------------------------------\n\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nTo change your password please visit the link below:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?change_password=yes&lang=en&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>\n\n\nYour registration info:\n\nUser ID: <?=$arParams[\"USER_ID\"];?>\n\nAccount status: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nAutomatically generated message.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en'),
(15, '2026-09-11 13:14:36', 'USER_PASS_CHANGED', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Password Change Confirmation', 'Informational message from #SITE_NAME#\n---------------------------------------\n\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nYour registration info:\n\nUser ID: #USER_ID#\nAccount status: #STATUS#\nLogin: #LOGIN#\n\nAutomatically generated message.', 'Informational message from <?=$arParams[\"SITE_NAME\"];?>\n\n---------------------------------------\n\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nYour registration info:\n\nUser ID: <?=$arParams[\"USER_ID\"];?>\n\nAccount status: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nAutomatically generated message.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en'),
(16, '2026-09-11 13:14:36', 'NEW_USER_CONFIRM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: New user registration confirmation', 'Greetings from #SITE_NAME#!\n------------------------------------------\n\nHello,\n\nyou have received this message because you (or someone else) used your e-mail to register at #SERVER_NAME#.\n\nYour registration confirmation code: #CONFIRM_CODE#\n\nPlease use the link below to verify and activate your registration:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#&confirm_code=#CONFIRM_CODE#\n\nAlternatively, open this link in your browser and enter the code manually:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#\n\nAttention! Your account will not be activated until you confirm registration.\n\n---------------------------------------------------------------------\n\nAutomatically generated message.', 'Greetings from <?=$arParams[\"SITE_NAME\"];?>!\n------------------------------------------\n\nHello,\n\nyou have received this message because you (or someone else) used your e-mail to register at <?=$arParams[\"SERVER_NAME\"];?>.\n\nYour registration confirmation code: <?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nPlease use the link below to verify and activate your registration:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams[\"USER_ID\"];?>&confirm_code=<?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nAlternatively, open this link in your browser and enter the code manually:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams[\"USER_ID\"];?>\n\n\nAttention! Your account will not be activated until you confirm registration.\n\n---------------------------------------------------------------------\n\nAutomatically generated message.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en'),
(17, '2026-09-11 13:14:36', 'USER_INVITE', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Invitation to site', 'Informational message from site #SITE_NAME#\n------------------------------------------\nHello #NAME# #LAST_NAME#!\n\nAdministrator has added you to registered site users.\n\nWe invite you to visit our site.\n\nYour registration info:\n\nUser ID: #ID#\nLogin: #LOGIN#\n\nWe recommend you to change automatically generated password.\n\nTo change password please follow the link:\nhttp://#SERVER_NAME#/auth.php?change_password=yes&USER_LOGIN=#URL_LOGIN#&USER_CHECKWORD=#CHECKWORD#', 'Informational message from site <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\nHello <?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>!\n\nAdministrator has added you to registered site users.\n\nWe invite you to visit our site.\n\nYour registration info:\n\nUser ID: <?=$arParams[\"ID\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nWe recommend you to change automatically generated password.\n\nTo change password please follow the link:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth.php?change_password=yes&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en'),
(18, '2026-09-11 13:14:36', 'FEEDBACK_FORM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: A feedback form message', 'Notification from #SITE_NAME#\n------------------------------------------\n\nA message has been sent to you from the feedback form.\n\nSent by: #AUTHOR#\nSender\'s e-mail: #AUTHOR_EMAIL#\n\nMessage text:\n#TEXT#\n\nThis notification has been generated automatically.', 'Notification from <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nA message has been sent to you from the feedback form.\n\nSent by: <?=$arParams[\"AUTHOR\"];?>\n\nSender\'s e-mail: <?=$arParams[\"AUTHOR_EMAIL\"];?>\n\n\nMessage text:\n<?=$arParams[\"TEXT\"];?>\n\n\nThis notification has been generated automatically.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en'),
(19, '2026-09-11 13:14:36', 'MAIN_MAIL_CONFIRM_CODE', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#MESSAGE_SUBJECT#', '<? EventMessageThemeCompiler::includeComponent(\'bitrix:main.mail.confirm\', \'\', $arParams); ?>', '<? EventMessageThemeCompiler::includeComponent(\'bitrix:main.mail.confirm\', \'\', $arParams); ?>', 'html', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'mail_join', NULL, NULL),
(20, '2026-09-11 13:14:36', 'EVENT_LOG_NOTIFICATION', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', 'Event log notification: #NAME#', 'Log events matching the notification parameters are found:\n\nEvent type: #AUDIT_TYPE_ID#\nObject: #ITEM_ID#\nUser: #USER_ID# \nIP address: #REMOTE_ADDR#\nBrowser: #USER_AGENT#\nPage URL: #REQUEST_URI# \n\nNumber of events: #EVENT_COUNT# \n\n#ADDITIONAL_TEXT#\n\nGo to event log:\nhttp://#SERVER_NAME#/bitrix/admin/event_log.php?set_filter=Y&find_audit_type_id=#AUDIT_TYPE_ID#', 'Log events matching the notification parameters are found:\n\nEvent type: <?=$arParams[\"AUDIT_TYPE_ID\"];?>\n\nObject: <?=$arParams[\"ITEM_ID\"];?>\n\nUser: <?=$arParams[\"USER_ID\"];?> \nIP address: <?=$arParams[\"REMOTE_ADDR\"];?>\n\nBrowser: <?=$arParams[\"USER_AGENT\"];?>\n\nPage URL: <?=$arParams[\"REQUEST_URI\"];?> \n\nNumber of events: <?=$arParams[\"EVENT_COUNT\"];?> \n\n<?=$arParams[\"ADDITIONAL_TEXT\"];?>\n\n\nGo to event log:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/bitrix/admin/event_log.php?set_filter=Y&find_audit_type_id=<?=$arParams[\"AUDIT_TYPE_ID\"];?>', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en'),
(21, '2026-09-11 13:14:36', 'USER_CODE_REQUEST', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Request for verification code', 'Use the following code to log in:\n\n#CHECKWORD#\n\nOnce logged in, you can change your password in your user profile.\n\nYour registration information:\n\nUser ID: #USER_ID#\nAccount status: #STATUS#\nLogin: #LOGIN#\n\nThis message was created automatically.', 'Use the following code to log in:\n\n<?=$arParams[\"CHECKWORD\"];?>\n\n\nOnce logged in, you can change your password in your user profile.\n\nYour registration information:\n\nUser ID: <?=$arParams[\"USER_ID\"];?>\n\nAccount status: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nThis message was created automatically.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en'),
(22, '2026-09-11 13:14:36', 'NEW_DEVICE_LOGIN', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', 'New device signed in', 'Hello #NAME#,\n\na new device has just signed in using your login #LOGIN#.\n \nDevice: #DEVICE# \nBrowser: #BROWSER#\nPlatform: #PLATFORM#\nLocation: #LOCATION# (approximate)\nDate: #DATE#\n\nWe recommend that you change your password immediately if it was not you or the sign-in was not on your behalf.\n', 'Hello <?=$arParams[\"NAME\"];?>,\n\na new device has just signed in using your login <?=$arParams[\"LOGIN\"];?>.\n \nDevice: <?=$arParams[\"DEVICE\"];?> \nBrowser: <?=$arParams[\"BROWSER\"];?>\n\nPlatform: <?=$arParams[\"PLATFORM\"];?>\n\nLocation: <?=$arParams[\"LOCATION\"];?> (approximate)\nDate: <?=$arParams[\"DATE\"];?>\n\n\nWe recommend that you change your password immediately if it was not you or the sign-in was not on your behalf.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en'),
(40, '2026-09-11 13:14:47', 'FORUM_NEW_MESSAGE_MAIL', 's1', 'Y', '#FROM_EMAIL#', '#RECIPIENT#', '#TOPIC_TITLE#', '#MESSAGE_TEXT#\n\n------------------------------------------  \nВы получили это сообщение, так как выподписаны на форум #FORUM_NAME#.\n\nОтветить на сообщение можно по электронной почте или через форму на сайте:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nНаписать новое сообщение: #FORUM_EMAIL#\n\nАвтор сообщения: #AUTHOR#\n\nСообщение сгенерировано автоматически на сайте #SITE_NAME#.\n', '<?=$arParams[\"MESSAGE_TEXT\"];?>\n\n\n------------------------------------------  \nВы получили это сообщение, так как выподписаны на форум <?=$arParams[\"FORUM_NAME\"];?>.\n\nОтветить на сообщение можно по электронной почте или через форму на сайте:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"PATH2FORUM\"];?>\n\n\nНаписать новое сообщение: <?=$arParams[\"FORUM_EMAIL\"];?>\n\n\nАвтор сообщения: <?=$arParams[\"AUTHOR\"];?>\n\n\nСообщение сгенерировано автоматически на сайте <?=$arParams[\"SITE_NAME\"];?>.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, '2026-09-11 13:15:01', 'VIRUS_DETECTED', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Обнаружен вирус', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте!\n\nВы получили это сообщение, так как модуль проактивной защиты сервера #SERVER_NAME# обнаружил код, похожий на вирус.\n\n1. Подозрительный код был вырезан из html.\n2. Проверьте журнал вторжений и убедитесь, что код действительно вредоносный, а не является кодом какого-либо счетчика или фреймворка.\n (ссылка: http://#SERVER_NAME#/bitrix/admin/event_log.php?lang=ru&set_filter=Y&find_type=audit_type_id&find_audit_type[]=SECURITY_VIRUS )\n3. В случае, если код не является опасным, добавьте его в исключения на странице настройки антивируса.\n (ссылка: http://#SERVER_NAME#/bitrix/admin/security_antivirus.php?lang=ru&tabControl_active_tab=exceptions )\n4. Если код является вирусным, то необходимо выполнить следующие действия:\n\n а) Смените пароли доступа к сайту у администраторов и ответственных сотрудников.\n б) Смените пароли доступа по ssh и ftp.\n в) Проверьте и вылечите компьютеры администраторов, имевших доступ к сайту по ssh или ftp.\n г) В программах доступа к сайту по ssh и ftp отключите сохранение паролей.\n д) Удалите вредоносный код из зараженных файлов. Например, восстановите поврежденные файлы из самой свежей резервной копии.\n\n---------------------------------------------------------------------\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nЗдравствуйте!\n\nВы получили это сообщение, так как модуль проактивной защиты сервера <?=$arParams[\"SERVER_NAME\"];?> обнаружил код, похожий на вирус.\n\n1. Подозрительный код был вырезан из html.\n2. Проверьте журнал вторжений и убедитесь, что код действительно вредоносный, а не является кодом какого-либо счетчика или фреймворка.\n (ссылка: http://<?=$arParams[\"SERVER_NAME\"];?>/bitrix/admin/event_log.php?lang=ru&set_filter=Y&find_type=audit_type_id&find_audit_type[]=SECURITY_VIRUS )\n3. В случае, если код не является опасным, добавьте его в исключения на странице настройки антивируса.\n (ссылка: http://<?=$arParams[\"SERVER_NAME\"];?>/bitrix/admin/security_antivirus.php?lang=ru&tabControl_active_tab=exceptions )\n4. Если код является вирусным, то необходимо выполнить следующие действия:\n\n а) Смените пароли доступа к сайту у администраторов и ответственных сотрудников.\n б) Смените пароли доступа по ssh и ftp.\n в) Проверьте и вылечите компьютеры администраторов, имевших доступ к сайту по ssh или ftp.\n г) В программах доступа к сайту по ssh и ftp отключите сохранение паролей.\n д) Удалите вредоносный код из зараженных файлов. Например, восстановите поврежденные файлы из самой свежей резервной копии.\n\n---------------------------------------------------------------------\nСообщение сгенерировано автоматически.\n', 'text', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, '2026-09-11 13:15:27', 'USER_OTP_AUTH_CODE', 's1', 'N', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Одноразовый пароль', 'В ваш аккаунт на #SERVER_NAME# выполнен вход и запрошен одноразовый пароль:\n				\n#CODE#\n				\nПроверьте данные и убедитесь, что это были вы.\n\nДата: #DATE#\nЛогин: #LOGIN#\nУстройство: #DEVICE_INFO#\nБраузер: #USER_AGENT#\nIP-адрес: #IP#\nМестоположение: #LOCATION#\n\nЕсли это не вы, рекомендуем как можно скорее сменить пароль. \n\nПодробнее о защите аккаунта: #HELP_URL#\n', 'В ваш аккаунт на <?=$arParams[\"SERVER_NAME\"];?> выполнен вход и запрошен одноразовый пароль:\n				\n<?=$arParams[\"CODE\"];?>\n\n				\nПроверьте данные и убедитесь, что это были вы.\n\nДата: <?=$arParams[\"DATE\"];?>\n\nЛогин: <?=$arParams[\"LOGIN\"];?>\n\nУстройство: <?=$arParams[\"DEVICE_INFO\"];?>\n\nБраузер: <?=$arParams[\"USER_AGENT\"];?>\n\nIP-адрес: <?=$arParams[\"IP\"];?>\n\nМестоположение: <?=$arParams[\"LOCATION\"];?>\n\n\nЕсли это не вы, рекомендуем как можно скорее сменить пароль. \n\nПодробнее о защите аккаунта: <?=$arParams[\"HELP_URL\"];?>\n\n', 'text', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(45, '2026-09-11 13:15:27', 'USER_OTP_EMAIL_CONFIRM', 's1', 'N', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Код для подтверждения почты', 'Скопируйте код для подтверждения почты и вставьте его в Битрикс24:\n				\n#CODE#\n				\nЕсли вы получили это письмо по ошибке, проигнорируйте его.\n\nВаш Битрикс24: #SERVER_NAME#\nЛогин для входа: #LOGIN#\nДата: #DATE#\n', 'Скопируйте код для подтверждения почты и вставьте его в Битрикс24:\n				\n<?=$arParams[\"CODE\"];?>\n\n				\nЕсли вы получили это письмо по ошибке, проигнорируйте его.\n\nВаш Битрикс24: <?=$arParams[\"SERVER_NAME\"];?>\n\nЛогин для входа: <?=$arParams[\"LOGIN\"];?>\n\nДата: <?=$arParams[\"DATE\"];?>\n\n', 'text', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru');

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_message_attachment`
--

CREATE TABLE `b_event_message_attachment` (
  `EVENT_MESSAGE_ID` int NOT NULL,
  `FILE_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_message_site`
--

CREATE TABLE `b_event_message_site` (
  `EVENT_MESSAGE_ID` int NOT NULL,
  `SITE_ID` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_event_message_site`
--

INSERT INTO `b_event_message_site` (`EVENT_MESSAGE_ID`, `SITE_ID`) VALUES
(1, 's1'),
(2, 's1'),
(3, 's1'),
(4, 's1'),
(5, 's1'),
(6, 's1'),
(7, 's1'),
(8, 's1'),
(9, 's1'),
(10, 's1'),
(11, 's1'),
(12, 's1'),
(13, 's1'),
(14, 's1'),
(15, 's1'),
(16, 's1'),
(17, 's1'),
(18, 's1'),
(19, 's1'),
(20, 's1'),
(21, 's1'),
(22, 's1'),
(23, 's1'),
(24, 's1'),
(25, 's1'),
(26, 's1'),
(27, 's1'),
(28, 's1'),
(29, 's1'),
(30, 's1'),
(31, 's1'),
(32, 's1'),
(33, 's1'),
(34, 's1'),
(35, 's1'),
(36, 's1'),
(37, 's1'),
(38, 's1'),
(39, 's1'),
(40, 's1'),
(41, 's1'),
(42, 's1'),
(43, 's1'),
(44, 's1'),
(45, 's1');

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_type`
--

CREATE TABLE `b_event_type` (
  `ID` int NOT NULL,
  `LID` char(2) NOT NULL,
  `EVENT_NAME` varchar(255) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `DESCRIPTION` text,
  `SORT` int NOT NULL DEFAULT '150',
  `EVENT_TYPE` varchar(10) NOT NULL DEFAULT 'email'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_event_type`
--

INSERT INTO `b_event_type` (`ID`, `LID`, `EVENT_NAME`, `NAME`, `DESCRIPTION`, `SORT`, `EVENT_TYPE`) VALUES
(1, 'ru', 'NEW_USER', 'Зарегистрировался новый пользователь', '\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n', 1, 'email'),
(2, 'ru', 'USER_INFO', 'Информация о пользователе', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 2, 'email'),
(3, 'ru', 'NEW_USER_CONFIRM', 'Подтверждение регистрации нового пользователя', '\n\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n#CONFIRM_CODE# - Код подтверждения\n', 3, 'email'),
(4, 'ru', 'USER_PASS_REQUEST', 'Запрос на смену пароля', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 4, 'email'),
(5, 'ru', 'USER_PASS_CHANGED', 'Подтверждение смены пароля', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 5, 'email'),
(6, 'ru', 'USER_INVITE', 'Приглашение на сайт нового пользователя', '#ID# - ID пользователя\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#PASSWORD# - пароль пользователя \n#CHECKWORD# - Контрольная строка для смены пароля\n#XML_ID# - ID пользователя для связи с внешними источниками\n', 6, 'email'),
(7, 'ru', 'FEEDBACK_FORM', 'Отправка сообщения через форму обратной связи', '#AUTHOR# - Автор сообщения\n#AUTHOR_EMAIL# - Email автора сообщения\n#TEXT# - Текст сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 7, 'email'),
(8, 'ru', 'MAIN_MAIL_CONFIRM_CODE', 'Подтверждение email-адреса отправителя', '\n\n#EMAIL_TO# - Email-адрес для подтверждения\n#MESSAGE_SUBJECT# - Тема сообщения\n#CONFIRM_CODE# - Код подтверждения', 8, 'email'),
(9, 'ru', 'EVENT_LOG_NOTIFICATION', 'Оповещение журнала событий', '#EMAIL# - Email получателя\n#ADDITIONAL_TEXT# - Дополнительный текст действия\n#NAME# - Название оповещения\n#AUDIT_TYPE_ID# - Тип события\n#ITEM_ID# - Объект\n#USER_ID# - Пользователь\n#REMOTE_ADDR# - IP-адрес\n#USER_AGENT# - Браузер\n#REQUEST_URI# - Страница\n#EVENT_COUNT# - Количество записей', 9, 'email'),
(10, 'ru', 'USER_CODE_REQUEST', 'Запрос кода авторизации', '#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#LOGIN# - Логин\n#CHECKWORD# - Код для авторизации\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - Email пользователя\n', 10, 'email'),
(11, 'ru', 'NEW_DEVICE_LOGIN', 'Вход с нового устройства', '#USER_ID# - ID пользователя\n#EMAIL# - Email пользователя\n#LOGIN# - Логин пользователя\n#NAME# - Имя пользователя\n#LAST_NAME# - Фамилия пользователя\n#DEVICE# - Устройство\n#BROWSER# - Браузер\n#PLATFORM# - Платформа\n#DEVICE_INFO# - Устройство, браузер, платформа \n#USER_AGENT# - User agent\n#IP# - IP-адрес\n#DATE# - Дата\n#COUNTRY# - Страна\n#REGION# - Регион\n#CITY# - Город\n#LOCATION# - Город, регион, страна\n', 11, 'email'),
(12, 'ru', 'SMS_USER_CONFIRM_NUMBER', 'Подтверждение номера телефона по СМС', '#USER_PHONE# - номер телефона\n#CODE# - код подтверждения\n', 100, 'sms'),
(13, 'ru', 'SMS_USER_RESTORE_PASSWORD', 'Восстановление пароля через СМС', '#USER_PHONE# - номер телефона\n#CODE# - код для восстановления\n', 100, 'sms'),
(14, 'ru', 'SMS_EVENT_LOG_NOTIFICATION', 'Оповещение журнала событий', '#PHONE_NUMBER# - Номер телефона получателя\n#ADDITIONAL_TEXT# - Дополнительный текст действия\n#NAME# - Название оповещения\n#AUDIT_TYPE_ID# - Тип события\n#ITEM_ID# - Объект\n#USER_ID# - Пользователь\n#REMOTE_ADDR# - IP-адрес\n#USER_AGENT# - Браузер\n#REQUEST_URI# - Страница\n#EVENT_COUNT# - Количество записей', 100, 'sms'),
(15, 'en', 'NEW_USER', 'New user was registered', '\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - Email\n#NAME# - Name\n#LAST_NAME# - Last Name\n#USER_IP# - User IP\n#USER_HOST# - User Host\n', 1, 'email'),
(16, 'en', 'USER_INFO', 'Account Information', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Checkword for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 2, 'email'),
(17, 'en', 'NEW_USER_CONFIRM', 'New user registration confirmation', '\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - E-mail\n#NAME# - First name\n#LAST_NAME# - Last name\n#USER_IP# - User IP\n#USER_HOST# - User host\n#CONFIRM_CODE# - Confirmation code\n', 3, 'email'),
(18, 'en', 'USER_PASS_REQUEST', 'Password Change Request', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Checkword for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 4, 'email'),
(19, 'en', 'USER_PASS_CHANGED', 'Password Change Confirmation', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Checkword for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 5, 'email'),
(20, 'en', 'USER_INVITE', 'Invitation of a new site user', '#ID# - User ID\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#EMAIL# - Email\n#NAME# - Name\n#LAST_NAME# - Last Name\n#PASSWORD# - User password \n#CHECKWORD# - Password checkword\n#XML_ID# - User ID to link with external data sources\n\n', 6, 'email'),
(21, 'en', 'FEEDBACK_FORM', 'Sending a message using a feedback form', '#AUTHOR# - Message author\n#AUTHOR_EMAIL# - Author\'s e-mail address\n#TEXT# - Message text\n#EMAIL_FROM# - Sender\'s e-mail address\n#EMAIL_TO# - Recipient\'s e-mail address', 7, 'email'),
(22, 'en', 'MAIN_MAIL_CONFIRM_CODE', 'Confirm sender\'s email address', '\n\n#EMAIL_TO# - confirmation email address\n#MESSAGE_SUBJECT# - Message subject\n#CONFIRM_CODE# - Confirmation code', 8, 'email'),
(23, 'en', 'EVENT_LOG_NOTIFICATION', 'Event log notification', '#EMAIL# - Recipient email\n#ADDITIONAL_TEXT# - Action additional text\n#NAME# - Notification name\n#AUDIT_TYPE_ID# - Event type\n#ITEM_ID# - Object\n#USER_ID# - User\n#REMOTE_ADDR# - IP address\n#USER_AGENT# - Browser\n#REQUEST_URI# - Page URL\n#EVENT_COUNT# - Number of events', 9, 'email'),
(24, 'en', 'USER_CODE_REQUEST', 'Request for verification code', '#USER_ID# - user ID\n#STATUS# - Login status\n#LOGIN# - Login\n#CHECKWORD# - Verification code\n#NAME# - First name\n#LAST_NAME# - Last name\n#EMAIL# - User email\n', 10, 'email'),
(25, 'en', 'NEW_DEVICE_LOGIN', 'New device signed in', '#USER_ID# - User ID\n#EMAIL# - User email:\n#LOGIN# - User login\n#NAME# - User first name\n#LAST_NAME# - User last name\n#DEVICE# - Device\n#BROWSER# - Browser\n#PLATFORM# - Platform\n#DEVICE_INFO# - Device, Browser, Platform \n#USER_AGENT# - User agent\n#IP# - IP address\n#DATE# - Date\n#COUNTRY# - Country\n#REGION# - Region\n#CITY# - City\n#LOCATION# - Full location (city, region, country)\n', 11, 'email'),
(26, 'en', 'SMS_USER_CONFIRM_NUMBER', 'Verify phone number using SMS', '#USER_PHONE# - phone number\n#CODE# - confirmation code', 100, 'sms'),
(27, 'en', 'SMS_USER_RESTORE_PASSWORD', 'Recover password using SMS', '#USER_PHONE# - phone number\n#CODE# - recovery confirmation code', 100, 'sms'),
(28, 'en', 'SMS_EVENT_LOG_NOTIFICATION', 'Event log notification', '#PHONE_NUMBER# - Recipient phone number\n#ADDITIONAL_TEXT# - Action additional text\n#NAME# - Notification name\n#AUDIT_TYPE_ID# - Event type\n#ITEM_ID# - Object\n#USER_ID# - User\n#REMOTE_ADDR# - IP address\n#USER_AGENT# - Browser\n#REQUEST_URI# - Page URL\n#EVENT_COUNT# - Number of events', 100, 'sms'),
(63, 'ru', 'FORUM_NEW_MESSAGE_MAIL', 'Новое сообщение на форуме в режиме общения по E-Mail', '#FORUM_NAME# - Название форума\n#AUTHOR# - Автор сообщения\n#FROM_EMAIL# - E-Mail для поля From письма\n#RECIPIENT# - Получатель сообщения\n#TOPIC_TITLE# - Тема сообщения\n#MESSAGE_TEXT# - Текст сообщения\n#PATH2FORUM# - Адрес сообщения\n#MESSAGE_DATE# - Дата сообщения\n#FORUM_EMAIL# - Е-Mail адрес для добавления сообщений на форум\n#FORUM_ID# - ID форума\n#TOPIC_ID# - ID темы \n#MESSAGE_ID# - ID сообщения\n#TAPPROVED# - Тема опубликована\n#MAPPROVED# - Сообщение опубликовано\n', 100, 'email'),
(64, 'en', 'FORUM_NEW_MESSAGE_MAIL', 'New message at the forum (e-mail messaging mode)', '#FORUM_NAME# - Forum name\n#AUTHOR# - Message author\n#FROM_EMAIL# - E-Mail in the &amp;From&amp; field\n#RECIPIENT# - Message recipient\n#TOPIC_TITLE# - Message subject\n#MESSAGE_TEXT# - Message text\n#PATH2FORUM# - Message URL\n#MESSAGE_DATE# - Message date\n#FORUM_EMAIL# - E-Mail to add messages to the forum \n#FORUM_ID# - Forum ID\n#TOPIC_ID# - Topic ID \n#MESSAGE_ID# - Message ID\n#TAPPROVED# - Topic approved and published\n#MAPPROVED# - Message approved and published\n', 100, 'email'),
(65, 'ru', 'VIRUS_DETECTED', 'Обнаружен вирус', '#EMAIL# - E-Mail администратора сайта (из настроек главного модуля)', 100, 'email'),
(66, 'ru', 'SMS_USER_OTP_AUTH_CODE', 'Подтверждение входа по СМС', '#USER_PHONE# - номер телефона\n#CODE# - код подтверждения\n', 100, 'sms'),
(67, 'en', 'VIRUS_DETECTED', 'Virus detected', '#EMAIL# - Site administrator\'s e-mail address (from the Kernel module settings)', 100, 'email'),
(68, 'en', 'SMS_USER_OTP_AUTH_CODE', 'Login confirmation via SMS code', '#USER_PHONE#: phone number\n#CODE#: confirmation code', 100, 'sms'),
(73, 'ru', 'USER_OTP_AUTH_CODE', 'Одноразовый пароль', '#USER_ID# - ID пользователя\n#EMAIL# - Резервный email для одноразового пароля\n#LOGIN# - Логин\n#CODE# - Одноразовый пароль\n#DATE# - Дата и время\n#DEVICE# - Тип устройства\n#BROWSER# - Название браузера\n#PLATFORM# - Платформа\n#DEVICE_INFO# - Комбинированная информация об устройстве\n#USER_AGENT# - User Agent браузера\n#IP# - IP-адрес\n#COUNTRY# - Страна\n#REGION# - Регион\n#CITY# - Город\n#LOCATION# - Комбинированное местоположение\n#HELP_URL# - Ссылка на документацию\n', 100, 'email'),
(74, 'ru', 'USER_OTP_EMAIL_CONFIRM', 'Подтверждение резервного email', '#USER_ID# - ID пользователя\n#EMAIL# - Резервный email для одноразового пароля\n#LOGIN# - Логин\n#CODE# - Код подтверждения\n#DATE# - Дата и время\n', 100, 'email'),
(75, 'en', 'USER_OTP_AUTH_CODE', NULL, NULL, 100, 'email'),
(76, 'en', 'USER_OTP_EMAIL_CONFIRM', NULL, NULL, 100, 'email');

-- --------------------------------------------------------

--
-- Структура таблицы `b_favorite`
--

CREATE TABLE `b_favorite` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `C_SORT` int NOT NULL DEFAULT '100',
  `MODIFIED_BY` int DEFAULT NULL,
  `CREATED_BY` int DEFAULT NULL,
  `MODULE_ID` varchar(50) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `URL` text,
  `COMMENTS` text,
  `LANGUAGE_ID` char(2) DEFAULT NULL,
  `USER_ID` int DEFAULT NULL,
  `CODE_ID` int DEFAULT NULL,
  `COMMON` char(1) NOT NULL DEFAULT 'Y',
  `MENU_ID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_feature_flag`
--

CREATE TABLE `b_feature_flag` (
  `CODE` varchar(255) NOT NULL,
  `MODULE_ID` varchar(50) NOT NULL,
  `ENABLED` char(1) NOT NULL DEFAULT 'N',
  `MODIFIED_AT` datetime NOT NULL,
  `MODIFIED_BY` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_feature_flag_rule`
--

CREATE TABLE `b_feature_flag_rule` (
  `ID` int NOT NULL,
  `FEATURE_CODE` varchar(255) NOT NULL,
  `POLICY` varchar(10) NOT NULL,
  `RULE_CODE` varchar(255) NOT NULL,
  `RULE_ARGS` varchar(255) DEFAULT NULL,
  `MODIFIED_AT` datetime NOT NULL,
  `MODIFIED_BY` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_file`
--

CREATE TABLE `b_file` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `MODULE_ID` varchar(50) DEFAULT NULL,
  `HEIGHT` int DEFAULT NULL,
  `WIDTH` int DEFAULT NULL,
  `FILE_SIZE` bigint DEFAULT NULL,
  `CONTENT_TYPE` varchar(255) DEFAULT 'IMAGE',
  `SUBDIR` varchar(255) DEFAULT NULL,
  `FILE_NAME` varchar(255) NOT NULL,
  `ORIGINAL_NAME` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `HANDLER_ID` varchar(50) DEFAULT NULL,
  `EXTERNAL_ID` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_file_duplicate`
--

CREATE TABLE `b_file_duplicate` (
  `DUPLICATE_ID` int NOT NULL,
  `ORIGINAL_ID` int NOT NULL,
  `COUNTER` int NOT NULL DEFAULT '1',
  `ORIGINAL_DELETED` char(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_file_hash`
--

CREATE TABLE `b_file_hash` (
  `FILE_ID` int NOT NULL,
  `FILE_SIZE` bigint NOT NULL,
  `FILE_HASH` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_file_preview`
--

CREATE TABLE `b_file_preview` (
  `ID` int NOT NULL,
  `FILE_ID` int NOT NULL,
  `PREVIEW_ID` int DEFAULT NULL,
  `PREVIEW_IMAGE_ID` int DEFAULT NULL,
  `CREATED_AT` datetime NOT NULL,
  `TOUCHED_AT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_file_search`
--

CREATE TABLE `b_file_search` (
  `ID` int NOT NULL,
  `SESS_ID` varchar(255) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `F_PATH` varchar(255) DEFAULT NULL,
  `B_DIR` int NOT NULL DEFAULT '0',
  `F_SIZE` int NOT NULL DEFAULT '0',
  `F_TIME` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_file_version`
--

CREATE TABLE `b_file_version` (
  `ORIGINAL_ID` int NOT NULL,
  `VERSION_ID` int NOT NULL,
  `META` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_filters`
--

CREATE TABLE `b_filters` (
  `ID` int NOT NULL,
  `USER_ID` int DEFAULT NULL,
  `FILTER_ID` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FIELDS` text NOT NULL,
  `COMMON` char(1) DEFAULT NULL,
  `PRESET` char(1) DEFAULT NULL,
  `LANGUAGE_ID` char(2) DEFAULT NULL,
  `PRESET_ID` varchar(255) DEFAULT NULL,
  `SORT` int DEFAULT NULL,
  `SORT_FIELD` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_finder_dest`
--

CREATE TABLE `b_finder_dest` (
  `USER_ID` int NOT NULL,
  `CODE` varchar(30) NOT NULL,
  `CODE_USER_ID` int DEFAULT NULL,
  `CODE_TYPE` varchar(10) DEFAULT NULL,
  `CONTEXT` varchar(50) NOT NULL,
  `LAST_USE_DATE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_geoip_handlers`
--

CREATE TABLE `b_geoip_handlers` (
  `ID` int NOT NULL,
  `SORT` int NOT NULL DEFAULT '100',
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `CLASS_NAME` varchar(255) NOT NULL,
  `CONFIG` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_geoip_handlers`
--

INSERT INTO `b_geoip_handlers` (`ID`, `SORT`, `ACTIVE`, `CLASS_NAME`, `CONFIG`) VALUES
(1, 100, 'Y', '\\Bitrix\\Main\\Service\\GeoIp\\GeoIP2', NULL),
(2, 110, 'N', '\\Bitrix\\Main\\Service\\GeoIp\\MaxMind', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_geoname`
--

CREATE TABLE `b_geoname` (
  `ID` bigint UNSIGNED NOT NULL,
  `LANGUAGE_CODE` varchar(35) NOT NULL,
  `NAME` varchar(600) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_group`
--

CREATE TABLE `b_group` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `C_SORT` int NOT NULL DEFAULT '100',
  `ANONYMOUS` char(1) NOT NULL DEFAULT 'N',
  `IS_SYSTEM` char(1) NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `SECURITY_POLICY` text,
  `STRING_ID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_group`
--

INSERT INTO `b_group` (`ID`, `TIMESTAMP_X`, `ACTIVE`, `C_SORT`, `ANONYMOUS`, `IS_SYSTEM`, `NAME`, `DESCRIPTION`, `SECURITY_POLICY`, `STRING_ID`) VALUES
(1, '2026-09-11 13:14:36', 'Y', 1, 'N', 'Y', 'Администраторы', 'Полный доступ к управлению сайтом.', NULL, NULL),
(2, '2026-09-11 13:14:36', 'Y', 2, 'Y', 'Y', 'Все пользователи (в том числе неавторизованные)', 'Все пользователи, включая неавторизованных.', NULL, NULL),
(3, '2026-09-11 13:14:36', 'Y', 3, 'N', 'Y', 'Пользователи, имеющие право голосовать за рейтинг', 'В эту группу пользователи добавляются автоматически.', NULL, 'RATING_VOTE'),
(4, '2026-09-11 13:14:36', 'Y', 4, 'N', 'Y', 'Пользователи имеющие право голосовать за авторитет', 'В эту группу пользователи добавляются автоматически.', NULL, 'RATING_VOTE_AUTHORITY');

-- --------------------------------------------------------

--
-- Структура таблицы `b_group_collection_task`
--

CREATE TABLE `b_group_collection_task` (
  `GROUP_ID` int NOT NULL,
  `TASK_ID` int NOT NULL,
  `COLLECTION_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_group_subordinate`
--

CREATE TABLE `b_group_subordinate` (
  `ID` int NOT NULL,
  `AR_SUBGROUP_ID` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_group_task`
--

CREATE TABLE `b_group_task` (
  `GROUP_ID` int NOT NULL,
  `TASK_ID` int NOT NULL,
  `EXTERNAL_ID` varchar(50) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_hlblock_entity`
--

CREATE TABLE `b_hlblock_entity` (
  `ID` int UNSIGNED NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `TABLE_NAME` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_hlblock_entity`
--

INSERT INTO `b_hlblock_entity` (`ID`, `NAME`, `TABLE_NAME`) VALUES
(1, 'Statuses', 'b_statuses'),
(2, 'Cars', 'b_cars'),
(3, 'TestDrives', 'b_test_drives');

-- --------------------------------------------------------

--
-- Структура таблицы `b_hlblock_entity_lang`
--

CREATE TABLE `b_hlblock_entity_lang` (
  `ID` int UNSIGNED NOT NULL,
  `LID` char(2) NOT NULL,
  `NAME` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_hlblock_entity_rights`
--

CREATE TABLE `b_hlblock_entity_rights` (
  `ID` int UNSIGNED NOT NULL,
  `HL_ID` int UNSIGNED NOT NULL,
  `TASK_ID` int UNSIGNED NOT NULL,
  `ACCESS_CODE` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_hot_keys`
--

CREATE TABLE `b_hot_keys` (
  `ID` int NOT NULL,
  `KEYS_STRING` varchar(20) NOT NULL,
  `CODE_ID` int NOT NULL,
  `USER_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_hot_keys`
--

INSERT INTO `b_hot_keys` (`ID`, `KEYS_STRING`, `CODE_ID`, `USER_ID`) VALUES
(1, 'Ctrl+Alt+85', 139, 0),
(2, 'Ctrl+Alt+80', 17, 0),
(3, 'Ctrl+Alt+70', 120, 0),
(4, 'Ctrl+Alt+68', 117, 0),
(5, 'Ctrl+Alt+81', 3, 0),
(6, 'Ctrl+Alt+75', 106, 0),
(7, 'Ctrl+Alt+79', 133, 0),
(8, 'Ctrl+Alt+70', 121, 0),
(9, 'Ctrl+Alt+69', 118, 0),
(10, 'Ctrl+Shift+83', 87, 0),
(11, 'Ctrl+Shift+88', 88, 0),
(12, 'Ctrl+Shift+76', 89, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `b_hot_keys_code`
--

CREATE TABLE `b_hot_keys_code` (
  `ID` int NOT NULL,
  `CLASS_NAME` varchar(50) DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TITLE_OBJ` varchar(50) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `IS_CUSTOM` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_hot_keys_code`
--

INSERT INTO `b_hot_keys_code` (`ID`, `CLASS_NAME`, `CODE`, `NAME`, `COMMENTS`, `TITLE_OBJ`, `URL`, `IS_CUSTOM`) VALUES
(3, 'CAdminTabControl', 'NextTab();', 'HK_DB_CADMINTC', 'HK_DB_CADMINTC_C', 'tab-container', '', 0),
(5, 'btn_new', 'var d=BX (\'btn_new\'); if (d) location.href = d.href;', 'HK_DB_BUT_ADD', 'HK_DB_BUT_ADD_C', 'btn_new', '', 0),
(6, 'btn_excel', 'var d=BX(\'btn_excel\'); if (d) location.href = d.href;', 'HK_DB_BUT_EXL', 'HK_DB_BUT_EXL_C', 'btn_excel', '', 0),
(7, 'btn_settings', 'var d=BX(\'btn_settings\'); if (d) location.href = d.href;', 'HK_DB_BUT_OPT', 'HK_DB_BUT_OPT_C', 'btn_settings', '', 0),
(8, 'btn_list', 'var d=BX(\'btn_list\'); if (d) location.href = d.href;', 'HK_DB_BUT_LST', 'HK_DB_BUT_LST_C', 'btn_list', '', 0),
(9, 'Edit_Save_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'save\'}}, true );  if (d) d.click();', 'HK_DB_BUT_SAVE', 'HK_DB_BUT_SAVE_C', 'Edit_Save_Button', '', 0),
(10, 'btn_delete', 'var d=BX(\'btn_delete\'); if (d) location.href = d.href;', 'HK_DB_BUT_DEL', 'HK_DB_BUT_DEL_C', 'btn_delete', '', 0),
(12, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'find\'}}, true ); if (d) d.focus();', 'HK_DB_FLT_FND', 'HK_DB_FLT_FND_C', 'find', '', 0),
(13, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'set_filter\'}}, true );  if (d) d.click();', 'HK_DB_FLT_BUT_F', 'HK_DB_FLT_BUT_F_C', 'set_filter', '', 0),
(14, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'del_filter\'}}, true );  if (d) d.click();', 'HK_DB_FLT_BUT_CNL', 'HK_DB_FLT_BUT_CNL_C', 'del_filter', '', 0),
(15, 'bx-panel-admin-button-help-icon-id', 'var d=BX(\'bx-panel-admin-button-help-icon-id\'); if (d) location.href = d.href;', 'HK_DB_BUT_HLP', 'HK_DB_BUT_HLP_C', 'bx-panel-admin-button-help-icon-id', '', 0),
(17, 'Global', 'BXHotKeys.ShowSettings();', 'HK_DB_SHW_L', 'HK_DB_SHW_L_C', 'bx-panel-hotkeys', '', 0),
(19, 'Edit_Apply_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'apply\'}}, true );  if (d) d.click();', 'HK_DB_BUT_APPL', 'HK_DB_BUT_APPL_C', 'Edit_Apply_Button', '', 0),
(20, 'Edit_Cancel_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'cancel\'}}, true );  if (d) d.click();', 'HK_DB_BUT_CANCEL', 'HK_DB_BUT_CANCEL_C', 'Edit_Cancel_Button', '', 0),
(54, 'top_panel_org_fav', '', '-=AUTONAME=-', NULL, 'top_panel_org_fav', NULL, 0),
(55, 'top_panel_module_settings', '', '-=AUTONAME=-', NULL, 'top_panel_module_settings', '', 0),
(56, 'top_panel_interface_settings', '', '-=AUTONAME=-', NULL, 'top_panel_interface_settings', '', 0),
(57, 'top_panel_help', '', '-=AUTONAME=-', NULL, 'top_panel_help', '', 0),
(58, 'top_panel_bizproc_tasks', '', '-=AUTONAME=-', NULL, 'top_panel_bizproc_tasks', '', 0),
(59, 'top_panel_add_fav', '', '-=AUTONAME=-', NULL, 'top_panel_add_fav', NULL, 0),
(60, 'top_panel_create_page', '', '-=AUTONAME=-', NULL, 'top_panel_create_page', '', 0),
(62, 'top_panel_create_folder', '', '-=AUTONAME=-', NULL, 'top_panel_create_folder', '', 0),
(63, 'top_panel_edit_page', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page', '', 0),
(64, 'top_panel_page_prop', '', '-=AUTONAME=-', NULL, 'top_panel_page_prop', '', 0),
(65, 'top_panel_edit_page_html', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page_html', '', 0),
(67, 'top_panel_edit_page_php', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page_php', '', 0),
(68, 'top_panel_del_page', '', '-=AUTONAME=-', NULL, 'top_panel_del_page', '', 0),
(69, 'top_panel_folder_prop', '', '-=AUTONAME=-', NULL, 'top_panel_folder_prop', '', 0),
(70, 'top_panel_access_folder_new', '', '-=AUTONAME=-', NULL, 'top_panel_access_folder_new', '', 0),
(71, 'main_top_panel_struct_panel', '', '-=AUTONAME=-', NULL, 'main_top_panel_struct_panel', '', 0),
(72, 'top_panel_cache_page', '', '-=AUTONAME=-', NULL, 'top_panel_cache_page', '', 0),
(73, 'top_panel_cache_comp', '', '-=AUTONAME=-', NULL, 'top_panel_cache_comp', '', 0),
(74, 'top_panel_cache_not', '', '-=AUTONAME=-', NULL, 'top_panel_cache_not', '', 0),
(75, 'top_panel_edit_mode', '', '-=AUTONAME=-', NULL, 'top_panel_edit_mode', '', 0),
(76, 'top_panel_templ_site_css', '', '-=AUTONAME=-', NULL, 'top_panel_templ_site_css', '', 0),
(77, 'top_panel_templ_templ_css', '', '-=AUTONAME=-', NULL, 'top_panel_templ_templ_css', '', 0),
(78, 'top_panel_templ_site', '', '-=AUTONAME=-', NULL, 'top_panel_templ_site', '', 0),
(81, 'top_panel_debug_time', '', '-=AUTONAME=-', NULL, 'top_panel_debug_time', '', 0),
(82, 'top_panel_debug_incl', '', '-=AUTONAME=-', NULL, 'top_panel_debug_incl', '', 0),
(83, 'top_panel_debug_sql', '', '-=AUTONAME=-', NULL, 'top_panel_debug_sql', NULL, 0),
(84, 'top_panel_debug_compr', '', '-=AUTONAME=-', NULL, 'top_panel_debug_compr', '', 0),
(85, 'MTP_SHORT_URI1', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI1', '', 0),
(86, 'MTP_SHORT_URI_LIST', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI_LIST', '', 0),
(87, 'FMST_PANEL_STICKER_ADD', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKER_ADD', '', 0),
(88, 'FMST_PANEL_STICKERS_SHOW', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKERS_SHOW', '', 0),
(89, 'FMST_PANEL_CUR_STICKER_LIST', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_CUR_STICKER_LIST', '', 0),
(90, 'FMST_PANEL_ALL_STICKER_LIST', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_ALL_STICKER_LIST', '', 0),
(91, 'top_panel_menu', 'var d=BX(\"bx-panel-menu\"); if (d) d.click();', '-=AUTONAME=-', NULL, 'bx-panel-menu', '', 0),
(92, 'top_panel_admin', 'var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-admin-tab', '', 0),
(93, 'admin_panel_site', 'var d=BX(\'bx-panel-view-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-view-tab', '', 0),
(94, 'admin_panel_admin', 'var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-admin-tab', '', 0),
(96, 'top_panel_folder_prop_new', '', '-=AUTONAME=-', NULL, 'top_panel_folder_prop_new', '', 0),
(97, 'main_top_panel_structure', '', '-=AUTONAME=-', NULL, 'main_top_panel_structure', '', 0),
(98, 'top_panel_clear_cache', '', '-=AUTONAME=-', NULL, 'top_panel_clear_cache', '', 0),
(99, 'top_panel_templ', '', '-=AUTONAME=-', NULL, 'top_panel_templ', '', 0),
(100, 'top_panel_debug', '', '-=AUTONAME=-', NULL, 'top_panel_debug', '', 0),
(101, 'MTP_SHORT_URI', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI', '', 0),
(102, 'FMST_PANEL_STICKERS', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKERS', '', 0),
(103, 'top_panel_settings', '', '-=AUTONAME=-', NULL, 'top_panel_settings', '', 0),
(104, 'top_panel_fav', '', '-=AUTONAME=-', NULL, 'top_panel_fav', '', 0),
(106, 'Global', 'location.href=\'/bitrix/admin/hot_keys_list.php?lang=ru\';', 'HK_DB_SHW_HK', '', '', '', 0),
(107, 'top_panel_edit_new', '', '-=AUTONAME=-', NULL, 'top_panel_edit_new', '', 0),
(108, 'FLOW_PANEL_CREATE_WITH_WF', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_CREATE_WITH_WF', '', 0),
(109, 'FLOW_PANEL_EDIT_WITH_WF', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_EDIT_WITH_WF', '', 0),
(110, 'FLOW_PANEL_HISTORY', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_HISTORY', '', 0),
(111, 'top_panel_create_new', '', '-=AUTONAME=-', NULL, 'top_panel_create_new', '', 0),
(112, 'top_panel_create_folder_new', '', '-=AUTONAME=-', NULL, 'top_panel_create_folder_new', '', 0),
(116, 'bx-panel-toggle', '', '-=AUTONAME=-', NULL, 'bx-panel-toggle', '', 0),
(117, 'bx-panel-small-toggle', '', '-=AUTONAME=-', NULL, 'bx-panel-small-toggle', '', 0),
(118, 'bx-panel-expander', 'var d=BX(\'bx-panel-expander\'); if (d) BX.fireEvent(d, \'click\');', '-=AUTONAME=-', NULL, 'bx-panel-expander', '', 0),
(119, 'bx-panel-hider', 'var d=BX(\'bx-panel-hider\'); if (d) d.click();', '-=AUTONAME=-', NULL, 'bx-panel-hider', '', 0),
(120, 'search-textbox-input', 'var d=BX(\'search-textbox-input\'); if (d) { d.click(); d.focus();}', '-=AUTONAME=-', '', 'search', '', 0),
(121, 'bx-search-input', 'var d=BX(\'bx-search-input\'); if (d) { d.click(); d.focus(); }', '-=AUTONAME=-', '', 'bx-search-input', '', 0),
(133, 'bx-panel-logout', 'var d=BX(\'bx-panel-logout\'); if (d) location.href = d.href;', '-=AUTONAME=-', '', 'bx-panel-logout', '', 0),
(135, 'CDialog', 'var d=BX(\'cancel\'); if (d) d.click();', 'HK_DB_D_CANCEL', '', 'cancel', '', 0),
(136, 'CDialog', 'var d=BX(\'close\'); if (d) d.click();', 'HK_DB_D_CLOSE', '', 'close', '', 0),
(137, 'CDialog', 'var d=BX(\'savebtn\'); if (d) d.click();', 'HK_DB_D_SAVE', '', 'savebtn', '', 0),
(138, 'CDialog', 'var d=BX(\'btn_popup_save\'); if (d) d.click();', 'HK_DB_D_EDIT_SAVE', '', 'btn_popup_save', '', 0),
(139, 'Global', 'location.href=\'/bitrix/admin/user_admin.php?lang=\'+phpVars.LANGUAGE_ID;', 'HK_DB_SHW_U', '', '', '', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `b_lang`
--

CREATE TABLE `b_lang` (
  `LID` char(2) NOT NULL,
  `SORT` int NOT NULL DEFAULT '100',
  `DEF` char(1) NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) NOT NULL,
  `DIR` varchar(50) NOT NULL,
  `FORMAT_DATE` varchar(50) DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) DEFAULT NULL,
  `FORMAT_NAME` varchar(255) DEFAULT NULL,
  `WEEK_START` int DEFAULT NULL,
  `CHARSET` varchar(255) DEFAULT NULL,
  `LANGUAGE_ID` char(2) NOT NULL,
  `DOC_ROOT` varchar(255) DEFAULT NULL,
  `DOMAIN_LIMITED` char(1) NOT NULL DEFAULT 'N',
  `SERVER_NAME` varchar(255) DEFAULT NULL,
  `SITE_NAME` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `CULTURE_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_lang`
--

INSERT INTO `b_lang` (`LID`, `SORT`, `DEF`, `ACTIVE`, `NAME`, `DIR`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `LANGUAGE_ID`, `DOC_ROOT`, `DOMAIN_LIMITED`, `SERVER_NAME`, `SITE_NAME`, `EMAIL`, `CULTURE_ID`) VALUES
('s1', 1, 'Y', 'Y', 'Сайт по умолчанию', '/', NULL, NULL, NULL, NULL, NULL, 'ru', NULL, 'N', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `b_language`
--

CREATE TABLE `b_language` (
  `LID` char(2) NOT NULL,
  `SORT` int NOT NULL DEFAULT '100',
  `DEF` char(1) NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) NOT NULL,
  `FORMAT_DATE` varchar(50) DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) DEFAULT NULL,
  `FORMAT_NAME` varchar(255) DEFAULT NULL,
  `WEEK_START` int DEFAULT NULL,
  `CHARSET` varchar(255) DEFAULT NULL,
  `DIRECTION` char(1) DEFAULT NULL,
  `CULTURE_ID` int DEFAULT NULL,
  `CODE` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_language`
--

INSERT INTO `b_language` (`LID`, `SORT`, `DEF`, `ACTIVE`, `NAME`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `DIRECTION`, `CULTURE_ID`, `CODE`) VALUES
('en', 2, 'N', 'Y', 'English', NULL, NULL, NULL, NULL, NULL, NULL, 2, 'en'),
('ru', 1, 'Y', 'Y', 'Russian', NULL, NULL, NULL, NULL, NULL, NULL, 1, 'ru');

-- --------------------------------------------------------

--
-- Структура таблицы `b_lang_domain`
--

CREATE TABLE `b_lang_domain` (
  `LID` char(2) NOT NULL,
  `DOMAIN` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_location_hierarchy`
--

CREATE TABLE `b_location_hierarchy` (
  `ANCESTOR_ID` int NOT NULL,
  `DESCENDANT_ID` int NOT NULL,
  `LEVEL` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_log_notification`
--

CREATE TABLE `b_log_notification` (
  `ID` int UNSIGNED NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) DEFAULT NULL,
  `AUDIT_TYPE_ID` varchar(50) NOT NULL,
  `ITEM_ID` varchar(255) DEFAULT NULL,
  `USER_ID` int DEFAULT NULL,
  `REMOTE_ADDR` varchar(40) DEFAULT NULL,
  `USER_AGENT` varchar(1000) DEFAULT NULL,
  `REQUEST_URI` varchar(1000) DEFAULT NULL,
  `CHECK_INTERVAL` int DEFAULT NULL,
  `ALERT_COUNT` int DEFAULT NULL,
  `DATE_CHECKED` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_log_notification_action`
--

CREATE TABLE `b_log_notification_action` (
  `ID` int UNSIGNED NOT NULL,
  `NOTIFICATION_ID` int UNSIGNED NOT NULL,
  `NOTIFICATION_TYPE` varchar(15) NOT NULL,
  `RECIPIENT` varchar(50) DEFAULT NULL,
  `ADDITIONAL_TEXT` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_main_mail_blacklist`
--

CREATE TABLE `b_main_mail_blacklist` (
  `ID` int NOT NULL,
  `DATE_INSERT` datetime NOT NULL,
  `CATEGORY_ID` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `CODE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_main_mail_sender`
--

CREATE TABLE `b_main_mail_sender` (
  `ID` int NOT NULL,
  `NAME` varchar(255) NOT NULL DEFAULT '',
  `EMAIL` varchar(255) NOT NULL,
  `USER_ID` int NOT NULL,
  `IS_CONFIRMED` tinyint NOT NULL DEFAULT '0',
  `IS_PUBLIC` tinyint NOT NULL DEFAULT '0',
  `OPTIONS` text,
  `PARENT_MODULE_ID` varchar(50) NOT NULL DEFAULT 'main',
  `PARENT_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_main_mail_sender_send_counter`
--

CREATE TABLE `b_main_mail_sender_send_counter` (
  `DATE_STAT` date NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `CNT` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_main_messenger_message`
--

CREATE TABLE `b_main_messenger_message` (
  `ID` int NOT NULL,
  `QUEUE_ID` varchar(255) NOT NULL,
  `ITEM_ID` varchar(255) DEFAULT NULL,
  `CLASS` varchar(255) NOT NULL,
  `PAYLOAD` text NOT NULL,
  `CREATED_AT` datetime NOT NULL,
  `UPDATED_AT` datetime NOT NULL,
  `TTL` int NOT NULL,
  `AVAILABLE_AT` datetime NOT NULL,
  `STATUS` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_medialib_collection`
--

CREATE TABLE `b_medialib_collection` (
  `ID` int NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` text,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `DATE_UPDATE` datetime NOT NULL,
  `OWNER_ID` int DEFAULT NULL,
  `PARENT_ID` int DEFAULT NULL,
  `SITE_ID` char(2) DEFAULT NULL,
  `KEYWORDS` varchar(255) DEFAULT NULL,
  `ITEMS_COUNT` int DEFAULT NULL,
  `ML_TYPE` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_medialib_collection_item`
--

CREATE TABLE `b_medialib_collection_item` (
  `COLLECTION_ID` int NOT NULL,
  `ITEM_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_medialib_item`
--

CREATE TABLE `b_medialib_item` (
  `ID` int NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ITEM_TYPE` char(30) DEFAULT NULL,
  `DESCRIPTION` text,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `SOURCE_ID` int NOT NULL,
  `KEYWORDS` varchar(255) DEFAULT NULL,
  `SEARCHABLE_CONTENT` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_medialib_type`
--

CREATE TABLE `b_medialib_type` (
  `ID` int NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `CODE` varchar(255) NOT NULL,
  `EXT` varchar(255) NOT NULL,
  `SYSTEM` char(1) NOT NULL DEFAULT 'N',
  `DESCRIPTION` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_medialib_type`
--

INSERT INTO `b_medialib_type` (`ID`, `NAME`, `CODE`, `EXT`, `SYSTEM`, `DESCRIPTION`) VALUES
(1, 'image_name', 'image', 'jpg,jpeg,gif,png', 'Y', 'image_desc'),
(2, 'video_name', 'video', 'flv,mp4,wmv', 'Y', 'video_desc'),
(3, 'sound_name', 'sound', 'mp3,wma,aac', 'Y', 'sound_desc');

-- --------------------------------------------------------

--
-- Структура таблицы `b_module`
--

CREATE TABLE `b_module` (
  `ID` varchar(50) NOT NULL,
  `DATE_ACTIVE` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_module`
--

INSERT INTO `b_module` (`ID`, `DATE_ACTIVE`) VALUES
('bitrix.sitecorporate', NULL),
('fileman', NULL),
('highloadblock', NULL),
('main', NULL),
('security', NULL),
('ui', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_module_group`
--

CREATE TABLE `b_module_group` (
  `ID` int NOT NULL,
  `MODULE_ID` varchar(50) NOT NULL,
  `GROUP_ID` int NOT NULL,
  `G_ACCESS` varchar(255) NOT NULL,
  `SITE_ID` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_module_to_module`
--

CREATE TABLE `b_module_to_module` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `SORT` int NOT NULL DEFAULT '100',
  `FROM_MODULE_ID` varchar(50) NOT NULL,
  `MESSAGE_ID` varchar(255) NOT NULL,
  `TO_MODULE_ID` varchar(50) NOT NULL,
  `TO_PATH` varchar(255) DEFAULT NULL,
  `TO_CLASS` varchar(255) DEFAULT NULL,
  `TO_METHOD` varchar(255) DEFAULT NULL,
  `TO_METHOD_ARG` varchar(255) DEFAULT NULL,
  `VERSION` int DEFAULT NULL,
  `UNIQUE_ID` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_module_to_module`
--

INSERT INTO `b_module_to_module` (`ID`, `TIMESTAMP_X`, `SORT`, `FROM_MODULE_ID`, `MESSAGE_ID`, `TO_MODULE_ID`, `TO_PATH`, `TO_CLASS`, `TO_METHOD`, `TO_METHOD_ARG`, `VERSION`, `UNIQUE_ID`) VALUES
(1, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'main', '/modules/main/tools/prop_userid.php', 'CIBlockPropertyUserID', 'GetUserTypeDescription', '', 1, '2b30c309bf87645959b9bfbed51b49c6'),
(2, NULL, 100, 'main', 'OnChangeFile', 'main', '', 'CMain', 'OnChangeFileComponent', '', 1, '332179402f77c4d41c6c2e524acde4d0'),
(3, NULL, 100, 'main', 'OnUserTypeRightsCheck', 'main', '', 'CUser', 'UserTypeRightsCheck', '', 1, 'e1aae03ea8eb08e7bbb6d8d42cbc2ebe'),
(4, NULL, 100, 'main', 'OnUserLogin', 'main', '', 'UpdateTools', 'CheckUpdates', '', 1, 'a2986b9f6e9a99c0351c2ba858dafc85'),
(5, NULL, 100, 'main', 'OnModuleUpdate', 'main', '', 'UpdateTools', 'SetUpdateResult', '', 1, 'f9b70c6a75b6341063b23bde5d32e582'),
(6, NULL, 100, 'main', 'OnUpdateCheck', 'main', '', 'UpdateTools', 'SetUpdateError', '', 1, 'a0aecef95a192ec3dd134f71f0f4f175'),
(7, NULL, 100, 'main', 'OnPanelCreate', 'main', '', 'CUndo', 'CheckNotifyMessage', '', 1, '6476f96ffba6ab2b4a7dbe644f42edf6'),
(8, NULL, 100, 'main', 'OnAfterAddRating', 'main', '', 'CRatingsComponentsMain', 'OnAfterAddRating', '', 1, '6122bee2ad083f8f72e35655cee48859'),
(9, NULL, 100, 'main', 'OnAfterUpdateRating', 'main', '', 'CRatingsComponentsMain', 'OnAfterUpdateRating', '', 1, 'f8f806e33dc35737bdbe6b9bc42626a4'),
(10, NULL, 100, 'main', 'OnSetRatingsConfigs', 'main', '', 'CRatingsComponentsMain', 'OnSetRatingConfigs', '', 1, '9244ca7fd6964757ca191c9407cb1218'),
(11, NULL, 100, 'main', 'OnGetRatingsConfigs', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingConfigs', '', 1, 'd8ae8e1f8889b1fbb6af276fb14c8411'),
(12, NULL, 100, 'main', 'OnGetRatingsObjects', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingObject', '', 1, '129315715250c195ee115002b445a156'),
(13, NULL, 100, 'main', 'OnGetRatingContentOwner', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingContentOwner', '', 1, 'bf1f5deaa1532fe9a28acd6d19d23a80'),
(14, NULL, 100, 'main', 'OnAfterAddRatingRule', 'main', '', 'CRatingRulesMain', 'OnAfterAddRatingRule', '', 1, '298e763431f7f7d6c3af9798663f410d'),
(15, NULL, 100, 'main', 'OnAfterUpdateRatingRule', 'main', '', 'CRatingRulesMain', 'OnAfterUpdateRatingRule', '', 1, '4ecdc4a15e24c49f0fa8f44064bf1511'),
(16, NULL, 100, 'main', 'OnGetRatingRuleObjects', 'main', '', 'CRatingRulesMain', 'OnGetRatingRuleObjects', '', 1, '6ac10928b76183004ba0e88ace0a1b5b'),
(17, NULL, 100, 'main', 'OnGetRatingRuleConfigs', 'main', '', 'CRatingRulesMain', 'OnGetRatingRuleConfigs', '', 1, '06769c4f6bbba4fad79c1619a874ee97'),
(18, NULL, 100, 'main', 'OnAfterUserAdd', 'main', '', 'CRatings', 'OnAfterUserRegister', '', 1, 'ecb9ae0476db69da6c95b06bcb3aebbb'),
(19, NULL, 100, 'main', 'OnUserDelete', 'main', '', 'CRatings', 'OnUserDelete', '', 1, '9fe6984fd29b7ab9508ac02c23690094'),
(20, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'main', '', 'CEventMain', 'GetAuditTypes', '', 1, 'ac0b8b7a5e703131a3bd41b4399bc032'),
(21, NULL, 100, 'main', 'OnEventLogGetAuditHandlers', 'main', '', 'CEventMain', 'MakeMainObject', '', 1, '1ddb38ccf35a8a9da5d3b2bc80591ad6'),
(22, NULL, 100, 'perfmon', 'OnGetTableSchema', 'main', '', 'CTableSchema', 'OnGetTableSchema', '', 1, 'c1f65f88d449e8b8a3b7af9d54ef3f50'),
(23, NULL, 100, 'sender', 'OnConnectorList', 'main', '', '\\Bitrix\\Main\\SenderEventHandler', 'onConnectorListUser', '', 1, '8af99568465a1ccdb6a84e868cf5aad8'),
(24, NULL, 110, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeString', 'GetUserTypeDescription', '', 1, '09f8200652932044934bd3c522e920c5'),
(25, NULL, 120, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeInteger', 'GetUserTypeDescription', '', 1, '71ef247b3eb3b07e4bd6940791b89497'),
(26, NULL, 130, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDouble', 'GetUserTypeDescription', '', 1, '4fe2008255fe567423cc0c2f080ca741'),
(27, NULL, 140, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDateTime', 'GetUserTypeDescription', '', 1, '686c0679e60bee52dbcc27f5502277b6'),
(28, NULL, 145, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDate', 'GetUserTypeDescription', '', 1, '7e19b5fc5fc48b1cd317a6ac44d84236'),
(29, NULL, 150, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeBoolean', 'GetUserTypeDescription', '', 1, '4d5e1dd2369089f2db9480549241205f'),
(30, NULL, 155, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeUrl', 'GetUserTypeDescription', '', 1, '79fcd650625b296abf13216cd5af2428'),
(31, NULL, 160, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeFile', 'GetUserTypeDescription', '', 1, '67b9a4fbc45240a7887b73e3a246eba0'),
(32, NULL, 170, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeEnum', 'GetUserTypeDescription', '', 1, 'fbebdb289fe38c1fbfeda4d3d8ee43ef'),
(33, NULL, 180, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeIBlockSection', 'GetUserTypeDescription', '', 1, '2065f8305645790970bac0b99f127f47'),
(34, NULL, 190, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeIBlockElement', 'GetUserTypeDescription', '', 1, '65bda5818e3545f1683a3ff5271cc891'),
(35, NULL, 200, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeStringFormatted', 'GetUserTypeDescription', '', 1, '47e3cf1c280e01dbaed43f9989a6747b'),
(36, NULL, 210, 'main', 'OnUserTypeBuildList', 'main', '', '\\Bitrix\\Main\\UrlPreview\\UrlPreviewUserType', 'getUserTypeDescription', '', 1, '719d15ee5f60f6348d2bd6a8911aeed1'),
(37, NULL, 100, 'main', 'OnFileDelete', 'main', '', '\\Bitrix\\Main\\UI\\Viewer\\FilePreviewTable', 'onFileDelete', '', 1, '54c80cd94412db221338aeb59902f059'),
(38, NULL, 100, 'socialnetwork', 'OnSocNetLogDelete', 'main', '', 'CUserCounter', 'OnSocNetLogDelete', '', 1, '33e603755a0bc07abd51a1f8ed52966e'),
(39, NULL, 100, 'socialnetwork', 'OnSocNetLogCommentDelete', 'main', '', 'CUserCounter', 'OnSocNetLogCommentDelete', '', 1, '51ee2214895be904a880046f43e84138'),
(40, NULL, 100, 'main', 'OnAdminInformerInsertItems', 'main', '', 'CMpNotifications', 'OnAdminInformerInsertItemsHandlerMP', '', 1, 'c89c0e94ac1110c334a24c70e1773daa'),
(41, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'main', '', '\\Bitrix\\Main\\Rest\\Handlers', 'onRestServiceBuildDescription', '', 1, 'c0b0c358a21b648d4f9c5d29d17a5ab2'),
(42, NULL, 100, 'main', 'OnBeforeUserTypeAdd', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'OnBeforeUserTypeAdd', '', 1, 'e204684efc0764af9431ca94b950619a'),
(43, NULL, 100, 'main', 'OnAfterUserTypeAdd', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'onAfterUserTypeAdd', '', 1, '50932fb244caf7af686fac906caf3e73'),
(44, NULL, 100, 'main', 'OnBeforeUserTypeDelete', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'OnBeforeUserTypeDelete', '', 1, 'd22a86deba0ff4bd031d022e331033b4'),
(45, NULL, 100, 'main', 'OnAfterUserTypeDelete', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'OnAfterUserTypeDelete', '', 1, '5210d0a76033ece8d636b506a962dce1'),
(46, NULL, 100, 'main', 'OnAuthProvidersBuildList', 'main', '', '\\Bitrix\\Main\\Access\\Auth\\AccessAuthProvider', 'getProviders', '', 1, '3a2839dac113bf47bce01812903e768a'),
(47, NULL, 100, 'iblock', 'OnBeforeIBlockSectionUpdate', 'main', '', '\\Bitrix\\Main\\Access\\Auth\\AccessEventHandler', 'onBeforeIBlockSectionUpdate', '', 1, 'dde505dba68c59bd4661b7680c329485'),
(48, NULL, 100, 'iblock', 'OnBeforeIBlockSectionAdd', 'main', '', '\\Bitrix\\Main\\Access\\Auth\\AccessEventHandler', 'onBeforeIBlockSectionAdd', '', 1, 'd3a665b1890dabbba32ff01e3e46ec57'),
(49, NULL, 100, 'iblock', 'OnBeforeIBlockSectionDelete', 'main', '', '\\Bitrix\\Main\\Access\\Auth\\AccessEventHandler', 'onBeforeIBlockSectionDelete', '', 1, '157add4b02621a60fabf1369c3e7ea9b'),
(50, NULL, 100, 'humanresources', 'OnMemberUpdated', 'main', '', '\\Bitrix\\Main\\Access\\Auth\\HrAccessEventHandler', 'onMemberUpdated', '', 2, '3efa257eae507c4597da49cd7f3643ef'),
(51, NULL, 100, 'humanresources', 'OnMemberDeleted', 'main', '', '\\Bitrix\\Main\\Access\\Auth\\HrAccessEventHandler', 'onMemberDeleted', '', 2, 'cb392ca593721ff9a7287c1fb0400ef2'),
(52, NULL, 100, 'humanresources', 'OnMemberAdded', 'main', '', '\\Bitrix\\Main\\Access\\Auth\\HrAccessEventHandler', 'onMemberAdded', '', 2, '7ad24e12b0833881a0f5947b0a59d8cc'),
(53, NULL, 100, 'sale', 'OnSaleBasketItemSaved', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogBasket', '', 2, 'fa4fc3924ff2585e92f8bdabaf287864'),
(54, NULL, 100, 'sale', 'OnSaleOrderSaved', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogOrder', '', 2, '6b358bb17b30da91b105fb1451ed9aaa'),
(55, NULL, 100, 'sale', 'OnSaleOrderPaid', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogOrderPayment', '', 2, '8f5ca6e1c5136cb4bbf30474f0ff4183'),
(56, NULL, 1000, 'sale', 'onBuildDiscountConditionInterfaceControls', 'main', '', '\\Bitrix\\Main\\Discount\\UserConditionControl', 'onBuildDiscountConditionInterfaceControls', '', 1, '9f0d91c081704e52b52f540b3acaf52e'),
(57, NULL, 100, 'main', 'OnBeforePhpMail', 'main', '', '\\Bitrix\\Main\\Mail\\Sender', 'applyCustomSmtp', '', 2, '10fbf5b8dec05a02d8d7010e594f16ec'),
(58, NULL, 100, 'main', 'OnBuildFilterFactoryMethods', 'main', '', '\\Bitrix\\Main\\Filter\\FactoryMain', 'onBuildFilterFactoryMethods', '', 2, '19f10c2686a955bd8b8116ea1f1ad829'),
(59, NULL, 100, 'main', 'onGetUserFieldValues', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'onGetUserFieldValues', '', 2, '7f9a5e25d638a6bff29f0bf4666da1a9'),
(60, NULL, 100, 'main', 'onUpdateUserFieldValues', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'onUpdateUserFieldValues', '', 2, 'd78761f994d74258421d271810f03ebf'),
(61, NULL, 100, 'main', 'onDeleteUserFieldValues', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'onDeleteUserFieldValues', '', 2, '074b2e25238a00ffc809ad12b609db2c'),
(62, NULL, 100, 'main', 'OnAfterUserTypeAdd', 'main', '', '\\Bitrix\\Main\\ORM\\Entity', 'onUserTypeChange', '', 2, '37b1b1538fa6a6c5f41c9ce4afbf2789'),
(63, NULL, 100, 'main', 'OnAfterUserTypeUpdate', 'main', '', '\\Bitrix\\Main\\ORM\\Entity', 'onUserTypeChange', '', 2, '6a53bbd6e85686f4aa8a69d3d75f7e37'),
(64, NULL, 100, 'main', 'OnAfterUserTypeDelete', 'main', '', '\\Bitrix\\Main\\ORM\\Entity', 'onUserTypeChange', '', 2, '010cc1e3107418a1fd9f9a4cde7d93b9'),
(67, NULL, 100, 'main', 'OnBeforeProlog', 'bitrix.sitecorporate', '', 'CSiteCorporate', 'ShowPanel', '', 1, 'bc7c322534797a9ed3493c40e1b8fdac'),
(121, NULL, 100, 'main', 'OnGroupDelete', 'fileman', '', 'CFileman', 'OnGroupDelete', '', 1, 'd10f791d422ba0e7551ab267db50404c'),
(122, NULL, 100, 'main', 'OnPanelCreate', 'fileman', '', 'CFileman', 'OnPanelCreate', '', 1, 'b00a6174fb1763684c299ccf5e054c65'),
(123, NULL, 100, 'main', 'OnModuleUpdate', 'fileman', '', 'CFileman', 'OnModuleUpdate', '', 1, '58ae853e2b7c230b5cdb51129efd8a05'),
(124, NULL, 100, 'main', 'OnModuleInstalled', 'fileman', '', 'CFileman', 'ClearComponentsListCache', '', 1, '7bdbd354eab11f376fa257a998587277'),
(125, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyMapGoogle', 'GetUserTypeDescription', '', 1, 'd9d06fd05f80b33379359ebd8e36e655'),
(126, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyMapYandex', 'GetUserTypeDescription', '', 1, '20ca1d02998884b5abec68b32fdb561d'),
(127, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyVideo', 'GetUserTypeDescription', '', 1, '991c32062e05844708a5cf7aba37bf9a'),
(128, NULL, 100, 'main', 'OnUserTypeBuildList', 'fileman', '', 'CUserTypeVideo', 'GetUserTypeDescription', '', 1, '41bc5efb49ebf8d165acd4e4d556f60c'),
(129, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'fileman', '', 'CEventFileman', 'GetAuditTypes', '', 1, 'e0a610651ffec1fbddb2f261223fb2e9'),
(130, NULL, 100, 'main', 'OnEventLogGetAuditHandlers', 'fileman', '', 'CEventFileman', 'MakeFilemanObject', '', 1, 'fbfef1ef99530f6eae191da293f9566c'),
(131, NULL, 154, 'main', 'OnUserTypeBuildList', 'fileman', '', '\\Bitrix\\Fileman\\UserField\\Address', 'getUserTypeDescription', '', 1, 'f0583a376e38d3d2675513b1a367ed3c'),
(162, NULL, 100, 'main', 'OnBeforeUserTypeAdd', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'OnBeforeUserTypeAdd', '', 1, 'f9dcff287cf7753e5c56974d37975507'),
(163, NULL, 100, 'main', 'OnAfterUserTypeAdd', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'onAfterUserTypeAdd', '', 1, 'd1fa2865e72eca144b964b6fb1eefc15'),
(164, NULL, 100, 'main', 'OnBeforeUserTypeDelete', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'OnBeforeUserTypeDelete', '', 1, '1bf13707e1a45b8320c2ecd35534cbb4'),
(165, NULL, 100, 'main', 'OnUserTypeBuildList', 'highloadblock', '', 'CUserTypeHlblock', 'GetUserTypeDescription', '', 1, '2ac4a2154f4fd85d67b50f412ed5ed48'),
(166, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'highloadblock', '', 'CIBlockPropertyDirectory', 'GetUserTypeDescription', '', 1, 'a6f7df502db8a04590e43188d7cbfc99'),
(272, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'security', '', 'CSecurityFilter', 'GetAuditTypes', '', 1, '893bc94df887141b4f3579561ea37454'),
(273, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'security', '', 'CSecurityAntiVirus', 'GetAuditTypes', '', 1, '9ba919b0537aa25fe47e438c2428b4d9'),
(274, NULL, 100, 'main', 'OnAdminInformerInsertItems', 'security', '', 'CSecurityFilter', 'OnAdminInformerInsertItems', '', 1, 'c751923f396ccc4e102ed17e97cb8afb'),
(275, NULL, 100, 'main', 'OnAdminInformerInsertItems', 'security', '', 'CSecuritySiteChecker', 'OnAdminInformerInsertItems', '', 1, '0c7cea553d58a72f7c5521d282898bc7'),
(276, NULL, 5, 'main', 'OnBeforeProlog', 'security', '', 'CSecurityFilter', 'OnBeforeProlog', '', 1, 'bb70fedd18267b1c5290068ae80dbc4d'),
(277, NULL, 9999, 'main', 'OnEndBufferContent', 'security', '', 'CSecurityXSSDetect', 'OnEndBufferContent', '', 1, 'd1886589ecd51b020420e6c1415edeaf'),
(278, NULL, 1, 'main', 'OnBeforeLocalRedirect', 'security', '', 'CSecurityRedirect', 'BeforeLocalRedirect', '', 1, '2dbeb7fa7a8bec4d90e8940616976b3d'),
(279, NULL, 1, 'main', 'OnEndBufferContent', 'security', '', 'CSecurityRedirect', 'EndBufferContent', '', 1, '099871646b4df8c1263e26f9bd91f3bd'),
(333, NULL, 100, 'main', 'OnUserDelete', 'ui', '', '\\Bitrix\\UI\\Integration\\Main\\User', 'onDelete', '', 2, '5e748ff204d0dac471be127b136eeb1d'),
(334, NULL, 100, 'main', 'OnFileDelete', 'ui', '', '\\Bitrix\\UI\\Avatar\\Mask\\Item', 'onFileDelete', '', 2, 'bdf678d45b7e9f3ce906099a5e4fc975'),
(335, NULL, 100, 'rest', 'onRestAppDelete', 'ui', '', '\\Bitrix\\UI\\Integration\\Rest\\App', 'onRestAppDelete', '', 2, 'b213605cfa38675d5e4b60f257f6acce'),
(336, NULL, 100, 'rest', 'OnRestAppInstall', 'ui', '', '\\Bitrix\\UI\\Integration\\Rest\\App', 'OnRestAppInstall', '', 2, '206ce4eafe25cc4b5fbaddfa36eaba47'),
(337, NULL, 100, 'rest', 'onRestApplicationConfigurationGetManifest', 'ui', '', '\\Bitrix\\UI\\Integration\\Rest\\MaskManifest', 'onRestApplicationConfigurationGetManifest', '', 2, 'daad84620a1a84daef4884f1162e2099'),
(338, NULL, 100, 'rest', 'onRestApplicationConfigurationGetManifestSetting', 'ui', '', '\\Bitrix\\UI\\Integration\\Rest\\MaskManifest', 'onRestApplicationConfigurationGetManifestSetting', '', 2, 'b3290d964ad532e24a892bae6001146c'),
(339, NULL, 100, 'rest', 'onRestApplicationConfigurationExport', 'ui', '', '\\Bitrix\\UI\\Integration\\Rest\\MaskManifest', 'onRestApplicationConfigurationExport', '', 2, 'ac9b60f1d69d98c3980413800a3524f7'),
(340, NULL, 100, 'rest', 'onRestApplicationConfigurationEntity', 'ui', '', '\\Bitrix\\UI\\Integration\\Rest\\MaskManifest', 'onRestApplicationConfigurationEntity', '', 2, '8d609b415b9bfa097d137ab69ba6903f'),
(341, NULL, 100, 'rest', 'onRestApplicationConfigurationImport', 'ui', '', '\\Bitrix\\UI\\Integration\\Rest\\MaskManifest', 'onRestApplicationConfigurationImport', '', 2, 'b1a5ce1bd868f8c86462c5b60eec1307'),
(342, NULL, 100, 'humanresources', 'OnMemberAdded', 'ui', '', 'Bitrix\\Ui\\EntityForm\\Scope', 'handleMemberAddedToDepartment', '', 2, '65fcc157e7c2cc43ede51c8fa6be728e'),
(343, NULL, 100, 'socialnetwork', 'OnSocNetUserToGroupAdd', 'ui', '', 'Bitrix\\Ui\\EntityForm\\Scope', 'handleMemberAddedToSocialGroup', '', 2, 'f8b84147f8b365c8b5fab59961aede82'),
(344, NULL, 100, 'socialnetwork', 'OnSocNetUserToGroupUpdate', 'ui', '', 'Bitrix\\Ui\\EntityForm\\Scope', 'handleMemberAddedToSocialGroup', '', 2, '09f5438e286fd3549aeac8fc5b67b674'),
(351, NULL, 100, 'main', 'OnAfterUserDelete', 'security', '', 'CSecurityUser', 'onUserDelete', '', 1, 'fcf2fb6b50143dba93d3241fa63a1c17'),
(352, NULL, 100, 'main', 'OnAfterUserUpdate', 'security', '', 'CSecurityUser', 'onAfterUserUpdate', '', 1, '3075c47493d538dba91fbe592fe546ea'),
(353, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'security', '', '\\Bitrix\\Security\\Mfa\\Otp', 'getAuditTypes', '', 1, 'ec1c62f3cebe477c92e2bb405446c7af'),
(354, NULL, 100, 'main', 'OnAfterUserDelete', 'rest', '', 'Bitrix\\Rest\\Internal\\Integration\\Main\\EventHandlers\\UserEventHandler', 'onAfterUserDelete', '', 2, '8b681600599823bececc9b89913946ea'),
(355, NULL, 100, 'intranet', 'onSettingsProvidersCollect', 'landing', '', 'Bitrix\\Landing\\Vibe\\Integration\\Intranet\\EventHandler', 'onSettingsProvidersCollect', '', 2, 'e360e407ca6c96087d950ce8d77a495f'),
(356, NULL, 100, 'main', 'OnBeforeProlog', 'main', '/modules/main/install/wizard_sol/panel_button.php', 'CWizardSolPanel', 'ShowPanel', '', 1, 'bbd7b8c1e518a0b3eae815eb91a95c11');

-- --------------------------------------------------------

--
-- Структура таблицы `b_numerator`
--

CREATE TABLE `b_numerator` (
  `ID` int UNSIGNED NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `TEMPLATE` varchar(255) DEFAULT NULL,
  `TYPE` varchar(50) DEFAULT NULL,
  `SETTINGS` text,
  `CREATED_AT` datetime DEFAULT NULL,
  `CREATED_BY` int DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `UPDATED_BY` int DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_numerator_sequence`
--

CREATE TABLE `b_numerator_sequence` (
  `NUMERATOR_ID` int NOT NULL DEFAULT '0',
  `KEY` varchar(32) NOT NULL DEFAULT '0',
  `TEXT_KEY` varchar(50) DEFAULT NULL,
  `NEXT_NUMBER` int DEFAULT NULL,
  `LAST_INVOCATION_TIME` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_operation`
--

CREATE TABLE `b_operation` (
  `ID` int NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `MODULE_ID` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `BINDING` varchar(50) DEFAULT 'module'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_operation`
--

INSERT INTO `b_operation` (`ID`, `NAME`, `MODULE_ID`, `DESCRIPTION`, `BINDING`) VALUES
(1, 'edit_php', 'main', NULL, 'module'),
(2, 'view_own_profile', 'main', NULL, 'module'),
(3, 'edit_own_profile', 'main', NULL, 'module'),
(4, 'view_all_users', 'main', NULL, 'module'),
(5, 'view_groups', 'main', NULL, 'module'),
(6, 'view_tasks', 'main', NULL, 'module'),
(7, 'view_other_settings', 'main', NULL, 'module'),
(8, 'view_subordinate_users', 'main', NULL, 'module'),
(9, 'edit_subordinate_users', 'main', NULL, 'module'),
(10, 'edit_all_users', 'main', NULL, 'module'),
(11, 'edit_groups', 'main', NULL, 'module'),
(12, 'edit_tasks', 'main', NULL, 'module'),
(13, 'edit_other_settings', 'main', NULL, 'module'),
(14, 'cache_control', 'main', NULL, 'module'),
(15, 'lpa_template_edit', 'main', NULL, 'module'),
(16, 'view_event_log', 'main', NULL, 'module'),
(17, 'edit_ratings', 'main', NULL, 'module'),
(18, 'manage_short_uri', 'main', NULL, 'module'),
(19, 'fm_view_permission', 'main', NULL, 'file'),
(20, 'fm_view_file', 'main', NULL, 'file'),
(21, 'fm_view_listing', 'main', NULL, 'file'),
(22, 'fm_edit_existent_folder', 'main', NULL, 'file'),
(23, 'fm_create_new_file', 'main', NULL, 'file'),
(24, 'fm_edit_existent_file', 'main', NULL, 'file'),
(25, 'fm_create_new_folder', 'main', NULL, 'file'),
(26, 'fm_delete_file', 'main', NULL, 'file'),
(27, 'fm_delete_folder', 'main', NULL, 'file'),
(28, 'fm_edit_in_workflow', 'main', NULL, 'file'),
(29, 'fm_rename_file', 'main', NULL, 'file'),
(30, 'fm_rename_folder', 'main', NULL, 'file'),
(31, 'fm_upload_file', 'main', NULL, 'file'),
(32, 'fm_add_to_menu', 'main', NULL, 'file'),
(33, 'fm_download_file', 'main', NULL, 'file'),
(34, 'fm_lpa', 'main', NULL, 'file'),
(35, 'fm_edit_permission', 'main', NULL, 'file'),
(36, 'bitrixcloud_monitoring', 'bitrixcloud', NULL, 'module'),
(37, 'bitrixcloud_backup', 'bitrixcloud', NULL, 'module'),
(41, 'fileman_view_file_structure', 'fileman', NULL, 'module'),
(42, 'fileman_add_element_to_menu', 'fileman', NULL, 'module'),
(43, 'fileman_edit_menu_elements', 'fileman', NULL, 'module'),
(44, 'fileman_edit_existent_files', 'fileman', NULL, 'module'),
(45, 'fileman_edit_existent_folders', 'fileman', NULL, 'module'),
(46, 'fileman_admin_files', 'fileman', NULL, 'module'),
(47, 'fileman_admin_folders', 'fileman', NULL, 'module'),
(48, 'fileman_view_permissions', 'fileman', NULL, 'module'),
(49, 'fileman_upload_files', 'fileman', NULL, 'module'),
(50, 'fileman_view_all_settings', 'fileman', NULL, 'module'),
(51, 'fileman_edit_menu_types', 'fileman', NULL, 'module'),
(52, 'fileman_edit_all_settings', 'fileman', NULL, 'module'),
(53, 'fileman_install_control', 'fileman', NULL, 'module'),
(54, 'medialib_view_collection', 'fileman', NULL, 'medialib'),
(55, 'medialib_new_collection', 'fileman', NULL, 'medialib'),
(56, 'medialib_new_item', 'fileman', NULL, 'medialib'),
(57, 'medialib_edit_item', 'fileman', NULL, 'medialib'),
(58, 'medialib_del_item', 'fileman', NULL, 'medialib'),
(59, 'medialib_edit_collection', 'fileman', NULL, 'medialib'),
(60, 'medialib_del_collection', 'fileman', NULL, 'medialib'),
(61, 'medialib_access', 'fileman', NULL, 'medialib'),
(62, 'sticker_view', 'fileman', NULL, 'stickers'),
(63, 'sticker_edit', 'fileman', NULL, 'stickers'),
(64, 'sticker_new', 'fileman', NULL, 'stickers'),
(65, 'sticker_del', 'fileman', NULL, 'stickers'),
(66, 'hl_element_read', 'highloadblock', NULL, 'module'),
(67, 'hl_element_write', 'highloadblock', NULL, 'module'),
(68, 'hl_element_delete', 'highloadblock', NULL, 'module'),
(92, 'security_filter_bypass', 'security', NULL, 'module'),
(93, 'security_edit_user_otp', 'security', NULL, 'module'),
(94, 'security_module_settings_read', 'security', NULL, 'module'),
(95, 'security_panel_view', 'security', NULL, 'module'),
(96, 'security_filter_settings_read', 'security', NULL, 'module'),
(97, 'security_otp_settings_read', 'security', NULL, 'module'),
(98, 'security_iprule_admin_settings_read', 'security', NULL, 'module'),
(99, 'security_session_settings_read', 'security', NULL, 'module'),
(100, 'security_redirect_settings_read', 'security', NULL, 'module'),
(101, 'security_stat_activity_settings_read', 'security', NULL, 'module'),
(102, 'security_iprule_settings_read', 'security', NULL, 'module'),
(103, 'security_antivirus_settings_read', 'security', NULL, 'module'),
(104, 'security_frame_settings_read', 'security', NULL, 'module'),
(105, 'security_module_settings_write', 'security', NULL, 'module'),
(106, 'security_filter_settings_write', 'security', NULL, 'module'),
(107, 'security_otp_settings_write', 'security', NULL, 'module'),
(108, 'security_iprule_admin_settings_write', 'security', NULL, 'module'),
(109, 'security_session_settings_write', 'security', NULL, 'module'),
(110, 'security_redirect_settings_write', 'security', NULL, 'module'),
(111, 'security_stat_activity_settings_write', 'security', NULL, 'module'),
(112, 'security_iprule_settings_write', 'security', NULL, 'module'),
(113, 'security_file_verifier_sign', 'security', NULL, 'module'),
(114, 'security_file_verifier_collect', 'security', NULL, 'module'),
(115, 'security_file_verifier_verify', 'security', NULL, 'module'),
(116, 'security_antivirus_settings_write', 'security', NULL, 'module'),
(117, 'security_frame_settings_write', 'security', NULL, 'module');

-- --------------------------------------------------------

--
-- Структура таблицы `b_option`
--

CREATE TABLE `b_option` (
  `MODULE_ID` varchar(50) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `VALUE` mediumtext,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `SITE_ID` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_option`
--

INSERT INTO `b_option` (`MODULE_ID`, `NAME`, `VALUE`, `DESCRIPTION`, `SITE_ID`) VALUES
('blog', 'socnetnewperms', 'Y', NULL, NULL),
('fileman', 'stickers_use_hotkeys', 'N', NULL, NULL),
('fileman', 'use_editor_3', 'Y', NULL, NULL),
('forum', 'filter', 'N', NULL, NULL),
('landing', 'pub_path_s1', '/lp/', NULL, NULL),
('location', 'address_format_code', 'RU', NULL, NULL),
('main', '~crypto_b_socialservices_user', 'a:2:{s:7:\"OATOKEN\";b:1;s:13:\"REFRESH_TOKEN\";b:1;}', NULL, NULL),
('main', '~crypto_b_user_auth_code', 'a:1:{s:10:\"OTP_SECRET\";b:1;}', NULL, NULL),
('main', '~crypto_b_user_phone_auth', 'a:1:{s:10:\"OTP_SECRET\";b:1;}', NULL, NULL),
('main', '~license_name', 'Стандарт', NULL, NULL),
('main', '~mp24_paid', '', NULL, NULL),
('main', '~mp24_paid_date', '', NULL, NULL),
('main', '~new_license18_0_sign', 'Y', NULL, NULL),
('main', '~param_client_lang', 'ru', NULL, NULL),
('main', '~param_composite', 'N', NULL, NULL),
('main', '~param_finish_date', '8a18e617b782b659e87b17725c1e057f7379fae9ca01b2dcfc168089b6a75b40.2026-10-11', NULL, NULL),
('main', '~param_max_servers', '2', NULL, NULL),
('main', '~param_max_users', 'a263ad64037c2f58cdc1f2170f73e1eae3223efdf92fc8fb8d308067175d9628.0', NULL, NULL),
('main', '~param_partner_id', '', NULL, NULL),
('main', '~param_phone_sip', 'N', NULL, NULL),
('main', '~support_finish_date', '2026-10-11', NULL, NULL),
('main', '~update_autocheck_result', 'a:4:{s:10:\"check_date\";i:1789132633;s:6:\"result\";b:0;s:5:\"error\";s:0:\"\";s:7:\"modules\";a:0:{}}', NULL, NULL),
('main', 'admin_lid', 'ru', NULL, NULL),
('main', 'admin_passwordh', 'FVsQemYUBwQtCUVcABcHCgsTAQ==', NULL, NULL),
('main', 'control_file_duplicates', 'Y', NULL, NULL),
('main', 'crc_code', 'eUtOeHlyTWNnNg==', NULL, NULL),
('main', 'email_from', '123@asd.ri', NULL, NULL),
('main', 'group_default_task', '1', NULL, NULL),
('main', 'last_mp_modules_result', 'a:4:{s:10:\"check_date\";i:1791203293;s:13:\"update_module\";a:0:{}s:10:\"end_update\";a:0:{}s:10:\"new_module\";a:0:{}}', NULL, NULL),
('main', 'optimize_css_files', 'Y', NULL, NULL),
('main', 'optimize_js_files', 'Y', NULL, NULL),
('main', 'param_max_sites', '0', NULL, NULL),
('main', 'param_max_users', '0', NULL, NULL),
('main', 'rating_assign_authority_group', '4', NULL, NULL),
('main', 'rating_assign_authority_group_add', '2', NULL, NULL),
('main', 'rating_assign_authority_group_delete', '2', NULL, NULL),
('main', 'rating_assign_rating_group', '3', NULL, NULL),
('main', 'rating_assign_rating_group_add', '1', NULL, NULL),
('main', 'rating_assign_rating_group_delete', '1', NULL, NULL),
('main', 'rating_assign_type', 'auto', NULL, NULL),
('main', 'rating_authority_rating', '2', NULL, NULL),
('main', 'rating_authority_weight_formula', 'Y', NULL, NULL),
('main', 'rating_community_authority', '30', NULL, NULL),
('main', 'rating_community_last_visit', '90', NULL, NULL),
('main', 'rating_community_size', '1', NULL, NULL),
('main', 'rating_count_vote', '10', NULL, NULL),
('main', 'rating_normalization', '10', NULL, NULL),
('main', 'rating_normalization_type', 'auto', NULL, NULL),
('main', 'rating_self_vote', 'Y', NULL, NULL),
('main', 'rating_start_authority', '3', NULL, NULL),
('main', 'rating_text_like_d', 'Это нравится', NULL, NULL),
('main', 'rating_text_like_n', 'Не нравится', NULL, NULL),
('main', 'rating_text_like_y', 'Нравится', NULL, NULL),
('main', 'rating_vote_show', 'Y', NULL, NULL),
('main', 'rating_vote_template', 'like', NULL, NULL),
('main', 'rating_vote_type', 'like', NULL, NULL),
('main', 'rating_vote_weight', '10', NULL, NULL),
('main', 'secure_logout', 'Y', NULL, NULL),
('main', 'server_uniq_id', 'ypviuma3zhcp8j0g4a6khyg7omkcctcd', NULL, NULL),
('main', 'signer_default_key', '2be83b079eddd79cb6cc45412782b68a01c445aa74e9e9d0b475c9ffcbcf23aad5a9c0b3b7bdc52bc8ab643467921287796f8f6e3b03070f2520e483213efe25', NULL, NULL),
('main', 'smile_last_update', '1789132476', NULL, NULL),
('main', 'update_site', 'www.1c-bitrix.ru', NULL, NULL),
('main', 'update_site_ns', 'Y', NULL, NULL),
('main', 'update_use_https', 'Y', NULL, NULL),
('main', 'vendor', '1c_bitrix', NULL, NULL),
('main_sec', 'sec_actualize_vendor_notifications', '1791203293', NULL, NULL),
('main_sec', 'wwall_actualize_rules', '1791282382', NULL, NULL),
('main.stepper.landing', 'bitrix\\landing\\update\\repo\\contentsanitizer', 'a:0:{}', NULL, NULL),
('main.stepper.rest', 'bitrix\\rest\\update\\deleteapplicationsystemusers', 'a:0:{}', NULL, NULL),
('rest', 'entity_iblock_type', 'rest_entity', NULL, NULL),
('rest', 'server_path', '/rest', NULL, NULL),
('search', 'dbnode_id', 'N', NULL, NULL),
('search', 'dbnode_status', 'ok', NULL, NULL),
('security', 'ipcheck_disable_file', '/bitrix/modules/ipcheck_disable_eba5d642d27bb8f865cfc72f32ba0d6c', NULL, NULL),
('security', 'redirect_sid', 'j8rm6sk9wyl7prto4hjbcl2qz73qz48a', NULL, NULL),
('seo', 'yandex_direct_region_last_update', '0', NULL, NULL),
('socialservices', 'allow_encrypted_tokens', '1', NULL, NULL),
('socialservices', 'bitrix24net_domain', 'http://clearbitrix1109', NULL, NULL),
('socialservices', 'bitrix24net_id', 'ext.6aa3fed78ac281.08829659', NULL, NULL),
('socialservices', 'bitrix24net_secret', 'HoL2syP890tJh9CbUv0tnLvKxQ9DZnJJj6VQFiJr22WYIELRAE', NULL, NULL),
('socialservices', 'google_api_key', 'AIzaSyA7puwZwGDJgOjcAWsFsY7hQcrioC13A18', NULL, NULL),
('socialservices', 'google_appid', '798910771106.apps.googleusercontent.com', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_option_site`
--

CREATE TABLE `b_option_site` (
  `MODULE_ID` varchar(50) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `SITE_ID` char(2) NOT NULL,
  `VALUE` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_option_site`
--

INSERT INTO `b_option_site` (`MODULE_ID`, `NAME`, `SITE_ID`, `VALUE`) VALUES
('forum', 'filter_dict_t', 'en', '4'),
('forum', 'filter_dict_t', 'ru', '2'),
('forum', 'filter_dict_w', 'en', '3'),
('forum', 'filter_dict_w', 'ru', '1');

-- --------------------------------------------------------

--
-- Структура таблицы `b_persistent_storage`
--

CREATE TABLE `b_persistent_storage` (
  `KEY` varchar(255) NOT NULL,
  `VALUE` text NOT NULL,
  `CREATED_AT` datetime NOT NULL,
  `EXPIRED_AT` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating`
--

CREATE TABLE `b_rating` (
  `ID` int NOT NULL,
  `ACTIVE` char(1) NOT NULL,
  `NAME` varchar(512) NOT NULL,
  `ENTITY_ID` varchar(50) NOT NULL,
  `CALCULATION_METHOD` varchar(3) NOT NULL DEFAULT 'SUM',
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `POSITION` char(1) DEFAULT 'N',
  `AUTHORITY` char(1) DEFAULT 'N',
  `CALCULATED` char(1) NOT NULL DEFAULT 'N',
  `CONFIGS` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_rating`
--

INSERT INTO `b_rating` (`ID`, `ACTIVE`, `NAME`, `ENTITY_ID`, `CALCULATION_METHOD`, `CREATED`, `LAST_MODIFIED`, `LAST_CALCULATED`, `POSITION`, `AUTHORITY`, `CALCULATED`, `CONFIGS`) VALUES
(1, 'N', 'Рейтинг', 'USER', 'SUM', '2026-09-11 16:14:36', NULL, NULL, 'Y', 'N', 'N', 'a:3:{s:4:\"MAIN\";a:2:{s:4:\"VOTE\";a:1:{s:4:\"USER\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:5:\"BONUS\";a:2:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";}}}s:5:\"FORUM\";a:2:{s:4:\"VOTE\";a:2:{s:5:\"TOPIC\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.5\";s:5:\"LIMIT\";s:2:\"30\";}s:4:\"POST\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:9:{s:6:\"ACTIVE\";s:1:\"Y\";s:16:\"TODAY_TOPIC_COEF\";s:3:\"0.4\";s:15:\"WEEK_TOPIC_COEF\";s:3:\"0.2\";s:16:\"MONTH_TOPIC_COEF\";s:3:\"0.1\";s:14:\"ALL_TOPIC_COEF\";s:1:\"0\";s:15:\"TODAY_POST_COEF\";s:3:\"0.2\";s:14:\"WEEK_POST_COEF\";s:3:\"0.1\";s:15:\"MONTH_POST_COEF\";s:4:\"0.05\";s:13:\"ALL_POST_COEF\";s:1:\"0\";}}}s:4:\"BLOG\";a:2:{s:4:\"VOTE\";a:2:{s:4:\"POST\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.5\";s:5:\"LIMIT\";s:2:\"30\";}s:7:\"COMMENT\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:9:{s:6:\"ACTIVE\";s:1:\"Y\";s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";s:18:\"TODAY_COMMENT_COEF\";s:3:\"0.2\";s:17:\"WEEK_COMMENT_COEF\";s:3:\"0.1\";s:18:\"MONTH_COMMENT_COEF\";s:4:\"0.05\";s:16:\"ALL_COMMENT_COEF\";s:1:\"0\";}}}}'),
(2, 'N', 'Авторитет', 'USER', 'SUM', '2026-09-11 16:14:36', NULL, NULL, 'Y', 'Y', 'N', 'a:3:{s:4:\"MAIN\";a:2:{s:4:\"VOTE\";a:1:{s:4:\"USER\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:1:\"0\";}}s:6:\"RATING\";a:1:{s:5:\"BONUS\";a:2:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";}}}s:5:\"FORUM\";a:2:{s:4:\"VOTE\";a:2:{s:5:\"TOPIC\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}s:4:\"POST\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:8:{s:16:\"TODAY_TOPIC_COEF\";s:2:\"20\";s:15:\"WEEK_TOPIC_COEF\";s:2:\"10\";s:16:\"MONTH_TOPIC_COEF\";s:1:\"5\";s:14:\"ALL_TOPIC_COEF\";s:1:\"0\";s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";}}}s:4:\"BLOG\";a:2:{s:4:\"VOTE\";a:2:{s:4:\"POST\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}s:7:\"COMMENT\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:8:{s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";s:18:\"TODAY_COMMENT_COEF\";s:3:\"0.2\";s:17:\"WEEK_COMMENT_COEF\";s:3:\"0.1\";s:18:\"MONTH_COMMENT_COEF\";s:4:\"0.05\";s:16:\"ALL_COMMENT_COEF\";s:1:\"0\";}}}}');

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_component`
--

CREATE TABLE `b_rating_component` (
  `ID` int NOT NULL,
  `RATING_ID` int NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'N',
  `ENTITY_ID` varchar(50) NOT NULL,
  `MODULE_ID` varchar(50) NOT NULL,
  `RATING_TYPE` varchar(50) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `COMPLEX_NAME` varchar(200) NOT NULL,
  `CLASS` varchar(255) NOT NULL,
  `CALC_METHOD` varchar(255) NOT NULL,
  `EXCEPTION_METHOD` varchar(255) DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `NEXT_CALCULATION` datetime DEFAULT NULL,
  `REFRESH_INTERVAL` int NOT NULL,
  `CONFIG` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_component_results`
--

CREATE TABLE `b_rating_component_results` (
  `ID` int NOT NULL,
  `RATING_ID` int NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `MODULE_ID` varchar(50) NOT NULL,
  `RATING_TYPE` varchar(50) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `COMPLEX_NAME` varchar(200) NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_prepare`
--

CREATE TABLE `b_rating_prepare` (
  `ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_results`
--

CREATE TABLE `b_rating_results` (
  `ID` int NOT NULL,
  `RATING_ID` int NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  `PREVIOUS_VALUE` decimal(18,4) DEFAULT NULL,
  `CURRENT_POSITION` int DEFAULT '0',
  `PREVIOUS_POSITION` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_rule`
--

CREATE TABLE `b_rating_rule` (
  `ID` int NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'N',
  `NAME` varchar(256) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) NOT NULL,
  `CONDITION_NAME` varchar(200) NOT NULL,
  `CONDITION_MODULE` varchar(50) DEFAULT NULL,
  `CONDITION_CLASS` varchar(255) NOT NULL,
  `CONDITION_METHOD` varchar(255) NOT NULL,
  `CONDITION_CONFIG` text,
  `ACTION_NAME` varchar(200) NOT NULL,
  `ACTION_CONFIG` text,
  `ACTIVATE` char(1) NOT NULL DEFAULT 'N',
  `ACTIVATE_CLASS` varchar(255) NOT NULL,
  `ACTIVATE_METHOD` varchar(255) NOT NULL,
  `DEACTIVATE` char(1) NOT NULL DEFAULT 'N',
  `DEACTIVATE_CLASS` varchar(255) NOT NULL,
  `DEACTIVATE_METHOD` varchar(255) NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_APPLIED` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_rating_rule`
--

INSERT INTO `b_rating_rule` (`ID`, `ACTIVE`, `NAME`, `ENTITY_TYPE_ID`, `CONDITION_NAME`, `CONDITION_MODULE`, `CONDITION_CLASS`, `CONDITION_METHOD`, `CONDITION_CONFIG`, `ACTION_NAME`, `ACTION_CONFIG`, `ACTIVATE`, `ACTIVATE_CLASS`, `ACTIVATE_METHOD`, `DEACTIVATE`, `DEACTIVATE_CLASS`, `DEACTIVATE_METHOD`, `CREATED`, `LAST_MODIFIED`, `LAST_APPLIED`) VALUES
(1, 'N', 'Добавление в группу пользователей, имеющих право голосовать за рейтинг', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:1;s:12:\"RATING_VALUE\";i:1;}}', 'ADD_TO_GROUP', 'a:1:{s:12:\"ADD_TO_GROUP\";a:1:{s:8:\"GROUP_ID\";i:3;}}', 'N', 'CRatingRulesMain', 'addToGroup', 'N', 'CRatingRulesMain ', 'addToGroup', '2026-09-11 16:14:36', '2026-09-11 16:14:36', NULL),
(2, 'N', 'Удаление из группы пользователей, не имеющих права голосовать за рейтинг', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:2;s:12:\"RATING_VALUE\";i:1;}}', 'REMOVE_FROM_GROUP', 'a:1:{s:17:\"REMOVE_FROM_GROUP\";a:1:{s:8:\"GROUP_ID\";i:3;}}', 'N', 'CRatingRulesMain', 'removeFromGroup', 'N', 'CRatingRulesMain ', 'removeFromGroup', '2026-09-11 16:14:36', '2026-09-11 16:14:36', NULL),
(3, 'N', 'Добавление в группу пользователей, имеющих право голосовать за авторитет', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:1;s:12:\"RATING_VALUE\";i:2;}}', 'ADD_TO_GROUP', 'a:1:{s:12:\"ADD_TO_GROUP\";a:1:{s:8:\"GROUP_ID\";i:4;}}', 'N', 'CRatingRulesMain', 'addToGroup', 'N', 'CRatingRulesMain ', 'addToGroup', '2026-09-11 16:14:36', '2026-09-11 16:14:36', NULL),
(4, 'N', 'Удаление из группы пользователей, не имеющих права голосовать за авторитет', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:2;s:12:\"RATING_VALUE\";i:2;}}', 'REMOVE_FROM_GROUP', 'a:1:{s:17:\"REMOVE_FROM_GROUP\";a:1:{s:8:\"GROUP_ID\";i:4;}}', 'N', 'CRatingRulesMain', 'removeFromGroup', 'N', 'CRatingRulesMain ', 'removeFromGroup', '2026-09-11 16:14:36', '2026-09-11 16:14:36', NULL),
(5, 'Y', 'Автоматическое голосование за авторитет пользователя', 'USER', 'VOTE', NULL, 'CRatingRulesMain', 'voteCheck', 'a:1:{s:4:\"VOTE\";a:6:{s:10:\"VOTE_LIMIT\";i:90;s:11:\"VOTE_RESULT\";i:10;s:16:\"VOTE_FORUM_TOPIC\";d:0.5;s:15:\"VOTE_FORUM_POST\";d:0.1;s:14:\"VOTE_BLOG_POST\";d:0.5;s:17:\"VOTE_BLOG_COMMENT\";d:0.1;}}', 'empty', 'a:0:{}', 'N', 'empty', 'empty', 'N', 'empty ', 'empty', '2026-09-11 16:14:36', '2026-09-11 16:14:36', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_rule_vetting`
--

CREATE TABLE `b_rating_rule_vetting` (
  `ID` int NOT NULL,
  `RULE_ID` int NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `ACTIVATE` char(1) NOT NULL DEFAULT 'N',
  `APPLIED` char(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_user`
--

CREATE TABLE `b_rating_user` (
  `ID` int NOT NULL,
  `RATING_ID` int NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `BONUS` decimal(18,4) DEFAULT '0.0000',
  `VOTE_WEIGHT` decimal(18,4) DEFAULT '0.0000',
  `VOTE_COUNT` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_rating_user`
--

INSERT INTO `b_rating_user` (`ID`, `RATING_ID`, `ENTITY_ID`, `BONUS`, `VOTE_WEIGHT`, `VOTE_COUNT`) VALUES
(1, 2, 1, '3.0000', '30.0000', 13);

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_vote`
--

CREATE TABLE `b_rating_vote` (
  `ID` int NOT NULL,
  `RATING_VOTING_ID` int NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `OWNER_ID` int NOT NULL,
  `VALUE` decimal(18,4) NOT NULL,
  `ACTIVE` char(1) NOT NULL,
  `CREATED` datetime NOT NULL,
  `USER_ID` int NOT NULL,
  `USER_IP` varchar(64) NOT NULL,
  `REACTION` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_vote_group`
--

CREATE TABLE `b_rating_vote_group` (
  `ID` int NOT NULL,
  `GROUP_ID` int NOT NULL,
  `TYPE` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_rating_vote_group`
--

INSERT INTO `b_rating_vote_group` (`ID`, `GROUP_ID`, `TYPE`) VALUES
(5, 1, 'A'),
(1, 1, 'R'),
(3, 1, 'R'),
(2, 3, 'R'),
(4, 3, 'R'),
(6, 4, 'A');

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_voting`
--

CREATE TABLE `b_rating_voting` (
  `ID` int NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `OWNER_ID` int NOT NULL,
  `ACTIVE` char(1) NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int NOT NULL,
  `TOTAL_POSITIVE_VOTES` int NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_voting_prepare`
--

CREATE TABLE `b_rating_voting_prepare` (
  `ID` int NOT NULL,
  `RATING_VOTING_ID` int NOT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int NOT NULL,
  `TOTAL_POSITIVE_VOTES` int NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_voting_reaction`
--

CREATE TABLE `b_rating_voting_reaction` (
  `ENTITY_TYPE_ID` varchar(50) NOT NULL,
  `ENTITY_ID` int NOT NULL,
  `REACTION` varchar(8) NOT NULL DEFAULT '',
  `TOTAL_VOTES` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_weight`
--

CREATE TABLE `b_rating_weight` (
  `ID` int NOT NULL,
  `RATING_FROM` decimal(18,4) NOT NULL,
  `RATING_TO` decimal(18,4) NOT NULL,
  `WEIGHT` decimal(18,4) DEFAULT '0.0000',
  `COUNT` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_rating_weight`
--

INSERT INTO `b_rating_weight` (`ID`, `RATING_FROM`, `RATING_TO`, `WEIGHT`, `COUNT`) VALUES
(1, '-1000000.0000', '1000000.0000', '1.0000', 10);

-- --------------------------------------------------------

--
-- Структура таблицы `b_security_sitecheck`
--

CREATE TABLE `b_security_sitecheck` (
  `ID` int NOT NULL,
  `TEST_DATE` datetime DEFAULT NULL,
  `RESULTS` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_filter_mask`
--

CREATE TABLE `b_sec_filter_mask` (
  `ID` int NOT NULL,
  `SORT` int NOT NULL DEFAULT '10',
  `SITE_ID` char(2) DEFAULT NULL,
  `FILTER_MASK` varchar(250) DEFAULT NULL,
  `LIKE_MASK` varchar(250) DEFAULT NULL,
  `PREG_MASK` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_frame_mask`
--

CREATE TABLE `b_sec_frame_mask` (
  `ID` int NOT NULL,
  `SORT` int NOT NULL DEFAULT '10',
  `SITE_ID` char(2) DEFAULT NULL,
  `FRAME_MASK` varchar(250) DEFAULT NULL,
  `LIKE_MASK` varchar(250) DEFAULT NULL,
  `PREG_MASK` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_iprule`
--

CREATE TABLE `b_sec_iprule` (
  `ID` int NOT NULL,
  `RULE_TYPE` char(1) NOT NULL DEFAULT 'M',
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `ADMIN_SECTION` char(1) NOT NULL DEFAULT 'Y',
  `SITE_ID` char(2) DEFAULT NULL,
  `SORT` int NOT NULL DEFAULT '500',
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_FROM_TIMESTAMP` int DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `ACTIVE_TO_TIMESTAMP` int DEFAULT NULL,
  `NAME` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_iprule_excl_ip`
--

CREATE TABLE `b_sec_iprule_excl_ip` (
  `IPRULE_ID` int NOT NULL,
  `RULE_IP` varchar(50) NOT NULL,
  `SORT` int NOT NULL DEFAULT '500',
  `IP_START` bigint DEFAULT NULL,
  `IP_END` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_iprule_excl_mask`
--

CREATE TABLE `b_sec_iprule_excl_mask` (
  `IPRULE_ID` int NOT NULL,
  `RULE_MASK` varchar(250) NOT NULL,
  `SORT` int NOT NULL DEFAULT '500',
  `LIKE_MASK` varchar(250) DEFAULT NULL,
  `PREG_MASK` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_iprule_incl_ip`
--

CREATE TABLE `b_sec_iprule_incl_ip` (
  `IPRULE_ID` int NOT NULL,
  `RULE_IP` varchar(50) NOT NULL,
  `SORT` int NOT NULL DEFAULT '500',
  `IP_START` bigint DEFAULT NULL,
  `IP_END` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_iprule_incl_mask`
--

CREATE TABLE `b_sec_iprule_incl_mask` (
  `IPRULE_ID` int NOT NULL,
  `RULE_MASK` varchar(250) NOT NULL,
  `SORT` int NOT NULL DEFAULT '500',
  `LIKE_MASK` varchar(250) DEFAULT NULL,
  `PREG_MASK` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_recovery_codes`
--

CREATE TABLE `b_sec_recovery_codes` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `CODE` varchar(255) NOT NULL,
  `USED` varchar(1) NOT NULL DEFAULT 'N',
  `USING_DATE` datetime DEFAULT NULL,
  `USING_IP` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_redirect_url`
--

CREATE TABLE `b_sec_redirect_url` (
  `IS_SYSTEM` char(1) NOT NULL DEFAULT 'Y',
  `SORT` int NOT NULL DEFAULT '500',
  `URL` varchar(250) NOT NULL,
  `PARAMETER_NAME` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_session`
--

CREATE TABLE `b_sec_session` (
  `SESSION_ID` varchar(250) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `SESSION_DATA` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_user`
--

CREATE TABLE `b_sec_user` (
  `USER_ID` int NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'N',
  `SECRET` varchar(64) DEFAULT NULL,
  `TYPE` varchar(16) NOT NULL,
  `INIT_PARAMS` text,
  `PARAMS` text,
  `ATTEMPTS` int DEFAULT NULL,
  `INITIAL_DATE` datetime DEFAULT NULL,
  `SKIP_MANDATORY` char(1) NOT NULL DEFAULT 'N',
  `DEACTIVATE_UNTIL` datetime DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `DATE_SENT_EMAIL` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_vendor_notification`
--

CREATE TABLE `b_sec_vendor_notification` (
  `VENDOR_ID` varchar(50) NOT NULL,
  `DATA` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_vendor_notification_sign`
--

CREATE TABLE `b_sec_vendor_notification_sign` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `NOTIFICATION_VENDOR_ID` varchar(50) NOT NULL,
  `DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_virus`
--

CREATE TABLE `b_sec_virus` (
  `ID` varchar(32) NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `SITE_ID` char(2) DEFAULT NULL,
  `SENT` char(1) NOT NULL DEFAULT 'N',
  `INFO` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_white_list`
--

CREATE TABLE `b_sec_white_list` (
  `ID` int NOT NULL,
  `WHITE_SUBSTR` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_wwall_rules`
--

CREATE TABLE `b_sec_wwall_rules` (
  `ID` int NOT NULL,
  `DATA` text,
  `MODULE` varchar(50) NOT NULL,
  `MODULE_VERSION` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sec_xscan_results`
--

CREATE TABLE `b_sec_xscan_results` (
  `id` int NOT NULL,
  `type` varchar(5) NOT NULL,
  `src` text NOT NULL,
  `message` text NOT NULL,
  `score` double NOT NULL,
  `mtime` datetime DEFAULT NULL,
  `ctime` datetime DEFAULT NULL,
  `tags` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_short_uri`
--

CREATE TABLE `b_short_uri` (
  `ID` int NOT NULL,
  `URI` varchar(2000) NOT NULL,
  `URI_CRC` int NOT NULL,
  `SHORT_URI` varbinary(250) NOT NULL,
  `SHORT_URI_CRC` int NOT NULL,
  `STATUS` int NOT NULL DEFAULT '301',
  `MODIFIED` datetime NOT NULL,
  `LAST_USED` datetime DEFAULT NULL,
  `NUMBER_USED` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sidepanel_toolbar`
--

CREATE TABLE `b_sidepanel_toolbar` (
  `ID` bigint UNSIGNED NOT NULL,
  `USER_ID` int NOT NULL,
  `CONTEXT` varchar(50) NOT NULL,
  `COLLAPSED` char(1) NOT NULL,
  `CREATED_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sidepanel_toolbar_item`
--

CREATE TABLE `b_sidepanel_toolbar_item` (
  `ID` bigint UNSIGNED NOT NULL,
  `TOOLBAR_ID` bigint UNSIGNED NOT NULL,
  `URL` varchar(2000) NOT NULL,
  `TITLE` varchar(255) NOT NULL,
  `ENTITY_TYPE` varchar(50) NOT NULL,
  `ENTITY_ID` varchar(50) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `LAST_USE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_site_template`
--

CREATE TABLE `b_site_template` (
  `ID` int NOT NULL,
  `SITE_ID` char(2) NOT NULL,
  `CONDITION` varchar(255) DEFAULT NULL,
  `SORT` int NOT NULL DEFAULT '500',
  `TEMPLATE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_smile`
--

CREATE TABLE `b_smile` (
  `ID` int NOT NULL,
  `TYPE` char(1) NOT NULL DEFAULT 'S',
  `SET_ID` int NOT NULL DEFAULT '0',
  `SORT` int NOT NULL DEFAULT '150',
  `TYPING` varchar(100) DEFAULT NULL,
  `CLICKABLE` char(1) NOT NULL DEFAULT 'Y',
  `HIDDEN` char(1) NOT NULL DEFAULT 'N',
  `IMAGE` varchar(255) NOT NULL,
  `IMAGE_DEFINITION` varchar(10) NOT NULL DEFAULT 'SD',
  `IMAGE_WIDTH` int NOT NULL DEFAULT '0',
  `IMAGE_HEIGHT` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_smile`
--

INSERT INTO `b_smile` (`ID`, `TYPE`, `SET_ID`, `SORT`, `TYPING`, `CLICKABLE`, `HIDDEN`, `IMAGE`, `IMAGE_DEFINITION`, `IMAGE_WIDTH`, `IMAGE_HEIGHT`) VALUES
(1, 'S', 2, 100, ':) :-)', 'Y', 'N', 'bx_smile_smile.png', 'UHD', 20, 20),
(2, 'S', 2, 105, ';) ;-)', 'Y', 'N', 'bx_smile_wink.png', 'UHD', 20, 20),
(3, 'S', 2, 110, ':D :-D', 'Y', 'N', 'bx_smile_biggrin.png', 'UHD', 20, 20),
(4, 'S', 2, 115, '8-)', 'Y', 'N', 'bx_smile_cool.png', 'UHD', 20, 20),
(5, 'S', 2, 120, ':facepalm:', 'Y', 'N', 'bx_smile_facepalm.png', 'UHD', 20, 20),
(6, 'S', 2, 125, ':{} :-{}', 'Y', 'N', 'bx_smile_kiss.png', 'UHD', 20, 20),
(7, 'S', 2, 130, ':( :-(', 'Y', 'N', 'bx_smile_sad.png', 'UHD', 20, 20),
(8, 'S', 2, 135, ':| :-|', 'Y', 'N', 'bx_smile_neutral.png', 'UHD', 20, 20),
(9, 'S', 2, 140, ':oops:', 'Y', 'N', 'bx_smile_redface.png', 'UHD', 20, 20),
(10, 'S', 2, 145, ':cry: :~(', 'Y', 'N', 'bx_smile_cry.png', 'UHD', 20, 20),
(11, 'S', 2, 150, ':evil: >:-<', 'Y', 'N', 'bx_smile_evil.png', 'UHD', 20, 20),
(12, 'S', 2, 155, ':o :-o :shock:', 'Y', 'N', 'bx_smile_eek.png', 'UHD', 20, 20),
(13, 'S', 2, 160, ':/ :-/', 'Y', 'N', 'bx_smile_confuse.png', 'UHD', 20, 20),
(14, 'S', 2, 165, ':idea:', 'Y', 'N', 'bx_smile_idea.png', 'UHD', 20, 20),
(15, 'S', 2, 170, ':?:', 'Y', 'N', 'bx_smile_question.png', 'UHD', 20, 20),
(16, 'S', 2, 175, ':!:', 'Y', 'N', 'bx_smile_exclaim.png', 'UHD', 20, 20),
(17, 'S', 2, 180, ':like:', 'Y', 'N', 'bx_smile_like.png', 'UHD', 20, 20),
(18, 'I', 2, 175, 'ICON_NOTE', 'Y', 'N', 'bx_icon_1.gif', 'SD', 15, 15),
(19, 'I', 2, 180, 'ICON_DIRRECTION', 'Y', 'N', 'bx_icon_2.gif', 'SD', 15, 15),
(20, 'I', 2, 185, 'ICON_IDEA', 'Y', 'N', 'bx_icon_3.gif', 'SD', 15, 15),
(21, 'I', 2, 190, 'ICON_ATTANSION', 'Y', 'N', 'bx_icon_4.gif', 'SD', 15, 15),
(22, 'I', 2, 195, 'ICON_QUESTION', 'Y', 'N', 'bx_icon_5.gif', 'SD', 15, 15),
(23, 'I', 2, 200, 'ICON_BAD', 'Y', 'N', 'bx_icon_6.gif', 'SD', 15, 15),
(24, 'I', 2, 205, 'ICON_GOOD', 'Y', 'N', 'bx_icon_7.gif', 'SD', 15, 15);

-- --------------------------------------------------------

--
-- Структура таблицы `b_smile_lang`
--

CREATE TABLE `b_smile_lang` (
  `ID` int NOT NULL,
  `TYPE` char(1) NOT NULL DEFAULT 'S',
  `SID` int NOT NULL,
  `LID` char(2) NOT NULL,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_smile_lang`
--

INSERT INTO `b_smile_lang` (`ID`, `TYPE`, `SID`, `LID`, `NAME`) VALUES
(1, 'P', 1, 'ru', 'Стандартная галерея'),
(2, 'P', 1, 'en', 'Standard gallery'),
(3, 'G', 2, 'ru', 'Основной набор'),
(4, 'G', 2, 'en', 'Default pack'),
(5, 'S', 1, 'ru', 'С улыбкой'),
(6, 'S', 1, 'en', 'Smile'),
(7, 'S', 2, 'ru', 'Шутливо'),
(8, 'S', 2, 'en', 'Wink'),
(9, 'S', 3, 'ru', 'Широкая улыбка'),
(10, 'S', 3, 'en', 'Big grin'),
(11, 'S', 4, 'ru', 'Здорово'),
(12, 'S', 4, 'en', 'Cool'),
(13, 'S', 5, 'ru', 'Разочарование'),
(14, 'S', 5, 'en', 'Facepalm'),
(15, 'S', 6, 'ru', 'Поцелуй'),
(16, 'S', 6, 'en', 'Kiss'),
(17, 'S', 7, 'ru', 'Печально'),
(18, 'S', 7, 'en', 'Sad'),
(19, 'S', 8, 'ru', 'Скептически'),
(20, 'S', 8, 'en', 'Skeptic'),
(21, 'S', 9, 'ru', 'Смущенный'),
(22, 'S', 9, 'en', 'Embarrassed'),
(23, 'S', 10, 'ru', 'Очень грустно'),
(24, 'S', 10, 'en', 'Crying'),
(25, 'S', 11, 'ru', 'Со злостью'),
(26, 'S', 11, 'en', 'Angry'),
(27, 'S', 12, 'ru', 'Удивленно'),
(28, 'S', 12, 'en', 'Surprised'),
(29, 'S', 13, 'ru', 'Смущенно'),
(30, 'S', 13, 'en', 'Confused'),
(31, 'S', 14, 'ru', 'Идея'),
(32, 'S', 14, 'en', 'Idea'),
(33, 'S', 15, 'ru', 'Вопрос'),
(34, 'S', 15, 'en', 'Question'),
(35, 'S', 16, 'ru', 'Восклицание'),
(36, 'S', 16, 'en', 'Exclamation'),
(37, 'S', 17, 'ru', 'Нравится'),
(38, 'S', 17, 'en', 'Like');

-- --------------------------------------------------------

--
-- Структура таблицы `b_smile_set`
--

CREATE TABLE `b_smile_set` (
  `ID` int NOT NULL,
  `TYPE` char(1) NOT NULL DEFAULT 'G',
  `PARENT_ID` int NOT NULL DEFAULT '0',
  `STRING_ID` varchar(255) DEFAULT NULL,
  `SORT` int NOT NULL DEFAULT '150'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_smile_set`
--

INSERT INTO `b_smile_set` (`ID`, `TYPE`, `PARENT_ID`, `STRING_ID`, `SORT`) VALUES
(1, 'P', 0, 'bitrix', 150),
(2, 'G', 1, 'bitrix_main', 150);

-- --------------------------------------------------------

--
-- Структура таблицы `b_sms_template`
--

CREATE TABLE `b_sms_template` (
  `ID` int NOT NULL,
  `EVENT_NAME` varchar(255) NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `SENDER` varchar(50) DEFAULT NULL,
  `RECEIVER` varchar(50) DEFAULT NULL,
  `MESSAGE` text,
  `LANGUAGE_ID` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_sms_template`
--

INSERT INTO `b_sms_template` (`ID`, `EVENT_NAME`, `ACTIVE`, `SENDER`, `RECEIVER`, `MESSAGE`, `LANGUAGE_ID`) VALUES
(1, 'SMS_USER_CONFIRM_NUMBER', 'Y', '#DEFAULT_SENDER#', '#USER_PHONE#', 'Код подтверждения #CODE#', 'ru'),
(2, 'SMS_USER_RESTORE_PASSWORD', 'Y', '#DEFAULT_SENDER#', '#USER_PHONE#', 'Код для восстановления пароля #CODE#', 'ru'),
(3, 'SMS_EVENT_LOG_NOTIFICATION', 'Y', '#DEFAULT_SENDER#', '#PHONE_NUMBER#', '#NAME#: #ADDITIONAL_TEXT# (событий: #EVENT_COUNT#)', 'ru'),
(4, 'SMS_USER_CONFIRM_NUMBER', 'Y', '#DEFAULT_SENDER#', '#USER_PHONE#', 'Confirmation code: #CODE#', 'en'),
(5, 'SMS_USER_RESTORE_PASSWORD', 'Y', '#DEFAULT_SENDER#', '#USER_PHONE#', 'Code to recover password: #CODE#', 'en'),
(6, 'SMS_EVENT_LOG_NOTIFICATION', 'Y', '#DEFAULT_SENDER#', '#PHONE_NUMBER#', '#NAME#: #ADDITIONAL_TEXT# (events: #EVENT_COUNT#)', 'en'),
(7, 'SMS_USER_OTP_AUTH_CODE', 'Y', '#DEFAULT_SENDER#', '#USER_PHONE#', '#CODE# — код подтверждения для входа в Битрикс24', 'ru'),
(8, 'SMS_USER_OTP_AUTH_CODE', 'Y', '#DEFAULT_SENDER#', '#USER_PHONE#', '#CODE# is Bitrix24 login confirmation code.', 'en');

-- --------------------------------------------------------

--
-- Структура таблицы `b_sms_template_site`
--

CREATE TABLE `b_sms_template_site` (
  `TEMPLATE_ID` int NOT NULL,
  `SITE_ID` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_sms_template_site`
--

INSERT INTO `b_sms_template_site` (`TEMPLATE_ID`, `SITE_ID`) VALUES
(1, 's1'),
(2, 's1'),
(3, 's1'),
(4, 's1'),
(5, 's1'),
(6, 's1'),
(7, 's1'),
(8, 's1');

-- --------------------------------------------------------

--
-- Структура таблицы `b_sm_version_history`
--

CREATE TABLE `b_sm_version_history` (
  `ID` int NOT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `VERSIONS` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_statuses`
--

CREATE TABLE `b_statuses` (
  `ID` bigint NOT NULL,
  `UF_NAME` text COLLATE utf8mb4_unicode_ci,
  `UF_CODE` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `b_statuses`
--

INSERT INTO `b_statuses` (`ID`, `UF_NAME`, `UF_CODE`) VALUES
(1, 'Доступен', 'available'),
(2, 'В ремонте', 'repair');

-- --------------------------------------------------------

--
-- Структура таблицы `b_sticker`
--

CREATE TABLE `b_sticker` (
  `ID` int NOT NULL,
  `SITE_ID` char(2) DEFAULT NULL,
  `PAGE_URL` varchar(255) NOT NULL,
  `PAGE_TITLE` varchar(255) NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `MODIFIED_BY` int NOT NULL,
  `CREATED_BY` int NOT NULL,
  `PERSONAL` char(1) NOT NULL DEFAULT 'N',
  `CONTENT` text,
  `POS_TOP` int DEFAULT NULL,
  `POS_LEFT` int DEFAULT NULL,
  `WIDTH` int DEFAULT NULL,
  `HEIGHT` int DEFAULT NULL,
  `COLOR` int DEFAULT NULL,
  `COLLAPSED` char(1) NOT NULL DEFAULT 'N',
  `COMPLETED` char(1) NOT NULL DEFAULT 'N',
  `CLOSED` char(1) NOT NULL DEFAULT 'N',
  `DELETED` char(1) NOT NULL DEFAULT 'N',
  `MARKER_TOP` int DEFAULT NULL,
  `MARKER_LEFT` int DEFAULT NULL,
  `MARKER_WIDTH` int DEFAULT NULL,
  `MARKER_HEIGHT` int DEFAULT NULL,
  `MARKER_ADJUST` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sticker_group_task`
--

CREATE TABLE `b_sticker_group_task` (
  `GROUP_ID` int NOT NULL,
  `TASK_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_task`
--

CREATE TABLE `b_task` (
  `ID` int NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `LETTER` char(1) DEFAULT NULL,
  `MODULE_ID` varchar(50) NOT NULL,
  `SYS` char(1) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `BINDING` varchar(50) DEFAULT 'module'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_task`
--

INSERT INTO `b_task` (`ID`, `NAME`, `LETTER`, `MODULE_ID`, `SYS`, `DESCRIPTION`, `BINDING`) VALUES
(1, 'main_denied', 'D', 'main', 'Y', NULL, 'module'),
(2, 'main_change_profile', 'P', 'main', 'Y', NULL, 'module'),
(3, 'main_view_all_settings', 'R', 'main', 'Y', NULL, 'module'),
(4, 'main_view_all_settings_change_profile', 'T', 'main', 'Y', NULL, 'module'),
(5, 'main_edit_subordinate_users', 'V', 'main', 'Y', NULL, 'module'),
(6, 'main_full_access', 'W', 'main', 'Y', NULL, 'module'),
(7, 'fm_folder_access_denied', 'D', 'main', 'Y', NULL, 'file'),
(8, 'fm_folder_access_read', 'R', 'main', 'Y', NULL, 'file'),
(9, 'fm_folder_access_write', 'W', 'main', 'Y', NULL, 'file'),
(10, 'fm_folder_access_full', 'X', 'main', 'Y', NULL, 'file'),
(11, 'fm_folder_access_workflow', 'U', 'main', 'Y', NULL, 'file'),
(12, 'bitrixcloud_deny', 'D', 'bitrixcloud', 'Y', NULL, 'module'),
(13, 'bitrixcloud_control', 'W', 'bitrixcloud', 'Y', NULL, 'module'),
(18, 'fileman_denied', 'D', 'fileman', 'Y', NULL, 'module'),
(19, 'fileman_allowed_folders', 'F', 'fileman', 'Y', NULL, 'module'),
(20, 'fileman_full_access', 'W', 'fileman', 'Y', NULL, 'module'),
(21, 'medialib_denied', 'D', 'fileman', 'Y', NULL, 'medialib'),
(22, 'medialib_view', 'F', 'fileman', 'Y', NULL, 'medialib'),
(23, 'medialib_only_new', 'R', 'fileman', 'Y', NULL, 'medialib'),
(24, 'medialib_edit_items', 'V', 'fileman', 'Y', NULL, 'medialib'),
(25, 'medialib_editor', 'W', 'fileman', 'Y', NULL, 'medialib'),
(26, 'medialib_full', 'X', 'fileman', 'Y', NULL, 'medialib'),
(27, 'stickers_denied', 'D', 'fileman', 'Y', NULL, 'stickers'),
(28, 'stickers_read', 'R', 'fileman', 'Y', NULL, 'stickers'),
(29, 'stickers_edit', 'W', 'fileman', 'Y', NULL, 'stickers'),
(30, 'hblock_denied', 'D', 'highloadblock', 'Y', NULL, 'module'),
(31, 'hblock_read', 'R', 'highloadblock', 'Y', NULL, 'module'),
(32, 'hblock_write', 'W', 'highloadblock', 'Y', NULL, 'module'),
(47, 'security_denied', 'D', 'security', 'Y', NULL, 'module'),
(48, 'security_filter', 'F', 'security', 'Y', NULL, 'module'),
(49, 'security_otp', 'S', 'security', 'Y', NULL, 'module'),
(50, 'security_view_all_settings', 'T', 'security', 'Y', NULL, 'module'),
(51, 'security_full_access', 'W', 'security', 'Y', NULL, 'module');

-- --------------------------------------------------------

--
-- Структура таблицы `b_task_operation`
--

CREATE TABLE `b_task_operation` (
  `TASK_ID` int NOT NULL,
  `OPERATION_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_task_operation`
--

INSERT INTO `b_task_operation` (`TASK_ID`, `OPERATION_ID`) VALUES
(2, 2),
(2, 3),
(3, 2),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(5, 2),
(5, 3),
(5, 5),
(5, 6),
(5, 7),
(5, 8),
(5, 9),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(6, 7),
(6, 10),
(6, 11),
(6, 12),
(6, 13),
(6, 14),
(6, 15),
(6, 16),
(6, 17),
(6, 18),
(8, 19),
(8, 20),
(8, 21),
(9, 19),
(9, 20),
(9, 21),
(9, 22),
(9, 23),
(9, 24),
(9, 25),
(9, 26),
(9, 27),
(9, 28),
(9, 29),
(9, 30),
(9, 31),
(9, 32),
(9, 33),
(9, 34),
(10, 19),
(10, 20),
(10, 21),
(10, 22),
(10, 23),
(10, 24),
(10, 25),
(10, 26),
(10, 27),
(10, 28),
(10, 29),
(10, 30),
(10, 31),
(10, 32),
(10, 33),
(10, 34),
(10, 35),
(11, 19),
(11, 20),
(11, 21),
(11, 24),
(11, 28),
(13, 36),
(13, 37),
(19, 41),
(19, 42),
(19, 43),
(19, 44),
(19, 45),
(19, 46),
(19, 47),
(19, 48),
(19, 49),
(20, 41),
(20, 42),
(20, 43),
(20, 44),
(20, 45),
(20, 46),
(20, 47),
(20, 48),
(20, 49),
(20, 50),
(20, 51),
(20, 52),
(20, 53),
(22, 54),
(23, 54),
(23, 55),
(23, 56),
(24, 54),
(24, 56),
(24, 57),
(24, 58),
(25, 54),
(25, 55),
(25, 56),
(25, 57),
(25, 58),
(25, 59),
(25, 60),
(26, 54),
(26, 55),
(26, 56),
(26, 57),
(26, 58),
(26, 59),
(26, 60),
(26, 61),
(28, 62),
(29, 62),
(29, 63),
(29, 64),
(29, 65),
(31, 66),
(32, 67),
(32, 68),
(48, 92),
(49, 93),
(50, 94),
(50, 95),
(50, 96),
(50, 97),
(50, 98),
(50, 99),
(50, 100),
(50, 101),
(50, 102),
(50, 103),
(50, 104),
(51, 92),
(51, 93),
(51, 94),
(51, 95),
(51, 96),
(51, 97),
(51, 98),
(51, 99),
(51, 100),
(51, 101),
(51, 102),
(51, 103),
(51, 104),
(51, 105),
(51, 106),
(51, 107),
(51, 108),
(51, 109),
(51, 110),
(51, 111),
(51, 112),
(51, 113),
(51, 114),
(51, 115),
(51, 116),
(51, 117);

-- --------------------------------------------------------

--
-- Структура таблицы `b_test_drives`
--

CREATE TABLE `b_test_drives` (
  `ID` bigint NOT NULL,
  `UF_CAR` int DEFAULT NULL,
  `UF_DATE_START` datetime DEFAULT NULL,
  `UF_DATE_END` datetime DEFAULT NULL,
  `UF_TOTAL_COST` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `b_test_drives`
--

INSERT INTO `b_test_drives` (`ID`, `UF_CAR`, `UF_DATE_START`, `UF_DATE_END`, `UF_TOTAL_COST`) VALUES
(2, 23, '2026-10-06 13:26:39', '2026-10-07 13:26:39', NULL),
(3, 2, '2026-10-10 10:00:00', '2026-10-11 10:00:00', 100000),
(4, 2, '2026-10-11 10:00:00', '2026-10-13 10:00:00', 200000);

-- --------------------------------------------------------

--
-- Структура таблицы `b_ui_avatar_mask_access`
--

CREATE TABLE `b_ui_avatar_mask_access` (
  `ID` bigint UNSIGNED NOT NULL,
  `ITEM_ID` int NOT NULL,
  `ACCESS_CODE` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_ui_avatar_mask_file_deleted`
--

CREATE TABLE `b_ui_avatar_mask_file_deleted` (
  `ID` bigint NOT NULL,
  `ENTITY` varchar(50) NOT NULL,
  `ORIGINAL_FILE_ID` int NOT NULL,
  `FILE_ID` int NOT NULL,
  `ITEM_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_ui_avatar_mask_group`
--

CREATE TABLE `b_ui_avatar_mask_group` (
  `ID` int UNSIGNED NOT NULL,
  `OWNER_TYPE` varchar(100) NOT NULL,
  `OWNER_ID` varchar(20) NOT NULL,
  `TITLE` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `SORT` int NOT NULL DEFAULT '100',
  `TIMESTAMP_X` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_ui_avatar_mask_item`
--

CREATE TABLE `b_ui_avatar_mask_item` (
  `ID` int UNSIGNED NOT NULL,
  `OWNER_TYPE` varchar(100) NOT NULL,
  `OWNER_ID` varchar(20) NOT NULL,
  `FILE_ID` int NOT NULL,
  `GROUP_ID` int DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `SORT` int NOT NULL DEFAULT '100',
  `TIMESTAMP_X` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_ui_avatar_mask_item_applied_to`
--

CREATE TABLE `b_ui_avatar_mask_item_applied_to` (
  `ID` bigint UNSIGNED NOT NULL,
  `ORIGINAL_FILE_ID` int NOT NULL,
  `FILE_ID` int NOT NULL,
  `ITEM_ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_ui_avatar_mask_recently_used`
--

CREATE TABLE `b_ui_avatar_mask_recently_used` (
  `ID` bigint UNSIGNED NOT NULL,
  `ITEM_ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `TIMESTAMP_X` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_ui_entity_editor_config`
--

CREATE TABLE `b_ui_entity_editor_config` (
  `ID` int UNSIGNED NOT NULL,
  `CATEGORY` varchar(20) NOT NULL,
  `ENTITY_TYPE_ID` varchar(60) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `CONFIG` longtext NOT NULL,
  `COMMON` varchar(1) NOT NULL,
  `AUTO_APPLY_SCOPE` varchar(1) NOT NULL DEFAULT 'N',
  `OPTION_CATEGORY` varchar(50) NOT NULL,
  `ON_ADD` varchar(1) NOT NULL DEFAULT 'Y',
  `ON_UPDATE` varchar(1) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_ui_entity_editor_config_ac`
--

CREATE TABLE `b_ui_entity_editor_config_ac` (
  `ID` int UNSIGNED NOT NULL,
  `ACCESS_CODE` varchar(10) NOT NULL,
  `CONFIG_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_ui_file_uploader_temp_file`
--

CREATE TABLE `b_ui_file_uploader_temp_file` (
  `ID` int NOT NULL,
  `GUID` char(36) NOT NULL,
  `FILE_ID` int DEFAULT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `SIZE` bigint NOT NULL,
  `PATH` varchar(255) NOT NULL,
  `MIMETYPE` varchar(255) NOT NULL,
  `RECEIVED_SIZE` bigint NOT NULL DEFAULT '0',
  `WIDTH` int NOT NULL DEFAULT '0',
  `HEIGHT` int NOT NULL DEFAULT '0',
  `BUCKET_ID` int DEFAULT NULL,
  `MODULE_ID` varchar(50) NOT NULL,
  `CONTROLLER` varchar(255) NOT NULL,
  `CONTROLLER_OPTIONS` text,
  `CLOUD` tinyint(1) NOT NULL DEFAULT '0',
  `UPLOADED` tinyint(1) NOT NULL DEFAULT '0',
  `DELETED` tinyint(1) NOT NULL DEFAULT '0',
  `CREATED_BY` int NOT NULL DEFAULT '0',
  `CREATED_AT` datetime NOT NULL,
  `STRATEGY` varchar(20) DEFAULT NULL,
  `PART_SIZE` int DEFAULT NULL,
  `PART_COUNT` int DEFAULT NULL,
  `UPLOAD_ID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_ui_file_uploader_temp_file_part`
--

CREATE TABLE `b_ui_file_uploader_temp_file_part` (
  `ID` int NOT NULL,
  `TEMP_FILE_ID` int NOT NULL,
  `PART_NO` int NOT NULL,
  `ETAG` varchar(64) DEFAULT NULL,
  `RECEIVED_AT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_undo`
--

CREATE TABLE `b_undo` (
  `ID` varchar(255) NOT NULL,
  `MODULE_ID` varchar(50) DEFAULT NULL,
  `UNDO_TYPE` varchar(50) DEFAULT NULL,
  `UNDO_HANDLER` varchar(255) DEFAULT NULL,
  `CONTENT` mediumtext,
  `USER_ID` int DEFAULT NULL,
  `TIMESTAMP_X` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_undo`
--

INSERT INTO `b_undo` (`ID`, `MODULE_ID`, `UNDO_TYPE`, `UNDO_HANDLER`, `CONTENT`, `USER_ID`, `TIMESTAMP_X`) VALUES
('218549847c900947f1d3ec9b87ed83d9a', 'main', 'autosave', 'CAutoSave::_Restore', 'a:9:{s:2:\"ID\";s:1:\"3\";s:4:\"NAME\";s:10:\"TestDrives\";s:10:\"TABLE_NAME\";s:13:\"b_test_drives\";s:23:\"LANGSX000091XruX000093X\";s:0:\"\";s:23:\"LANGSX000091XenX000093X\";s:0:\"\";s:4:\"save\";s:0:\"\";s:5:\"apply\";s:0:\"\";s:6:\"cancel\";s:0:\"\";s:21:\"tabControl_active_tab\";s:5:\"edit1\";}', 1, 1791209312),
('249004a7f370a267674a95a85909b188c', 'main', 'autosave', 'CAutoSave::_Restore', 'a:11:{s:6:\"UF_CAR\";s:0:\"\";s:13:\"UF_DATE_START\";s:19:\"06.10.2026 14:42:24\";s:11:\"UF_DATE_END\";s:0:\"\";s:13:\"UF_TOTAL_COST\";s:0:\"\";s:4:\"save\";s:0:\"\";s:5:\"apply\";s:0:\"\";s:6:\"cancel\";s:0:\"\";s:23:\"hlrow_edit_3_active_tab\";s:5:\"edit1\";s:2:\"ID\";s:0:\"\";s:9:\"ENTITY_ID\";s:1:\"3\";s:6:\"action\";s:3:\"add\";}', 1, 1791286951),
('27332822e8011c5f0234bef050b0e9d6c', 'main', 'autosave', 'CAutoSave::_Restore', 'a:9:{s:2:\"ID\";s:1:\"1\";s:4:\"NAME\";s:8:\"Statuses\";s:10:\"TABLE_NAME\";s:10:\"b_statuses\";s:23:\"LANGSX000091XruX000093X\";s:0:\"\";s:23:\"LANGSX000091XenX000093X\";s:0:\"\";s:4:\"save\";s:0:\"\";s:5:\"apply\";s:0:\"\";s:6:\"cancel\";s:0:\"\";s:21:\"tabControl_active_tab\";s:5:\"edit1\";}', 1, 1791208039),
('2e7f19851544fb305f4c4e15fd3ec5c2f', 'main', 'autosave', 'CAutoSave::_Restore', 'a:9:{s:2:\"ID\";s:1:\"2\";s:4:\"NAME\";s:4:\"Cars\";s:10:\"TABLE_NAME\";s:6:\"b_cars\";s:23:\"LANGSX000091XruX000093X\";s:0:\"\";s:23:\"LANGSX000091XenX000093X\";s:0:\"\";s:4:\"save\";s:0:\"\";s:5:\"apply\";s:0:\"\";s:6:\"cancel\";s:0:\"\";s:21:\"tabControl_active_tab\";s:5:\"edit1\";}', 1, 1791208432);

-- --------------------------------------------------------

--
-- Структура таблицы `b_urlpreview_metadata`
--

CREATE TABLE `b_urlpreview_metadata` (
  `ID` int NOT NULL,
  `URL` varchar(2000) NOT NULL,
  `TYPE` char(1) NOT NULL DEFAULT 'S',
  `DATE_INSERT` datetime NOT NULL,
  `DATE_EXPIRE` datetime DEFAULT NULL,
  `TITLE` varchar(200) DEFAULT NULL,
  `DESCRIPTION` text,
  `IMAGE_ID` int DEFAULT NULL,
  `IMAGE` varchar(2000) DEFAULT NULL,
  `EMBED` mediumtext,
  `EXTRA` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_urlpreview_route`
--

CREATE TABLE `b_urlpreview_route` (
  `ID` int NOT NULL,
  `ROUTE` varchar(2000) NOT NULL,
  `MODULE` varchar(50) NOT NULL,
  `CLASS` varchar(150) NOT NULL,
  `PARAMETERS` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_urlpreview_route`
--

INSERT INTO `b_urlpreview_route` (`ID`, `ROUTE`, `MODULE`, `CLASS`, `PARAMETERS`) VALUES
(1, '/knowledge/#knowledgeCode#/', 'landing', '\\Bitrix\\Landing\\Landing\\UrlPreview', 'a:3:{s:13:\"knowledgeCode\";s:14:\"$knowledgeCode\";s:5:\"scope\";s:9:\"knowledge\";s:12:\"allowSlashes\";s:1:\"N\";}'),
(2, '/knowledge/group/#knowledgeCode#/', 'landing', '\\Bitrix\\Landing\\Landing\\UrlPreview', 'a:3:{s:13:\"knowledgeCode\";s:14:\"$knowledgeCode\";s:5:\"scope\";s:5:\"group\";s:12:\"allowSlashes\";s:1:\"N\";}'),
(3, '/bitrix/components/bitrix/voting.attached.result/slider.php', 'vote', '\\Bitrix\\Vote\\Integration\\Main\\UrlPreview', 'a:1:{s:14:\"signedAttachId\";s:15:\"$signedAttachId\";}');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user`
--

CREATE TABLE `b_user` (
  `ID` int NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `LOGIN` varchar(50) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `CHECKWORD` varchar(255) DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) DEFAULT NULL,
  `LAST_NAME` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `LAST_LOGIN` datetime DEFAULT NULL,
  `DATE_REGISTER` datetime NOT NULL,
  `LID` char(2) DEFAULT NULL,
  `PERSONAL_PROFESSION` varchar(255) DEFAULT NULL,
  `PERSONAL_WWW` varchar(255) DEFAULT NULL,
  `PERSONAL_ICQ` varchar(255) DEFAULT NULL,
  `PERSONAL_GENDER` char(1) DEFAULT NULL,
  `PERSONAL_BIRTHDATE` varchar(50) DEFAULT NULL,
  `PERSONAL_PHOTO` int DEFAULT NULL,
  `PERSONAL_PHONE` varchar(255) DEFAULT NULL,
  `PERSONAL_FAX` varchar(255) DEFAULT NULL,
  `PERSONAL_MOBILE` varchar(255) DEFAULT NULL,
  `PERSONAL_PAGER` varchar(255) DEFAULT NULL,
  `PERSONAL_STREET` text,
  `PERSONAL_MAILBOX` varchar(255) DEFAULT NULL,
  `PERSONAL_CITY` varchar(255) DEFAULT NULL,
  `PERSONAL_STATE` varchar(255) DEFAULT NULL,
  `PERSONAL_ZIP` varchar(255) DEFAULT NULL,
  `PERSONAL_COUNTRY` varchar(255) DEFAULT NULL,
  `PERSONAL_NOTES` text,
  `WORK_COMPANY` varchar(255) DEFAULT NULL,
  `WORK_DEPARTMENT` varchar(255) DEFAULT NULL,
  `WORK_POSITION` varchar(255) DEFAULT NULL,
  `WORK_WWW` varchar(255) DEFAULT NULL,
  `WORK_PHONE` varchar(255) DEFAULT NULL,
  `WORK_FAX` varchar(255) DEFAULT NULL,
  `WORK_PAGER` varchar(255) DEFAULT NULL,
  `WORK_STREET` text,
  `WORK_MAILBOX` varchar(255) DEFAULT NULL,
  `WORK_CITY` varchar(255) DEFAULT NULL,
  `WORK_STATE` varchar(255) DEFAULT NULL,
  `WORK_ZIP` varchar(255) DEFAULT NULL,
  `WORK_COUNTRY` varchar(255) DEFAULT NULL,
  `WORK_PROFILE` text,
  `WORK_LOGO` int DEFAULT NULL,
  `WORK_NOTES` text,
  `ADMIN_NOTES` text,
  `STORED_HASH` varchar(32) DEFAULT NULL,
  `XML_ID` varchar(255) DEFAULT NULL,
  `PERSONAL_BIRTHDAY` date DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(255) DEFAULT NULL,
  `CHECKWORD_TIME` datetime DEFAULT NULL,
  `SECOND_NAME` varchar(50) DEFAULT NULL,
  `CONFIRM_CODE` varchar(8) DEFAULT NULL,
  `LOGIN_ATTEMPTS` int DEFAULT NULL,
  `LAST_ACTIVITY_DATE` datetime DEFAULT NULL,
  `AUTO_TIME_ZONE` char(1) DEFAULT NULL,
  `TIME_ZONE` varchar(50) DEFAULT NULL,
  `TIME_ZONE_OFFSET` int DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `BX_USER_ID` varchar(32) DEFAULT NULL,
  `LANGUAGE_ID` char(2) DEFAULT NULL,
  `BLOCKED` char(1) NOT NULL DEFAULT 'N',
  `PASSWORD_EXPIRED` char(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_user`
--

INSERT INTO `b_user` (`ID`, `TIMESTAMP_X`, `LOGIN`, `PASSWORD`, `CHECKWORD`, `ACTIVE`, `NAME`, `LAST_NAME`, `EMAIL`, `LAST_LOGIN`, `DATE_REGISTER`, `LID`, `PERSONAL_PROFESSION`, `PERSONAL_WWW`, `PERSONAL_ICQ`, `PERSONAL_GENDER`, `PERSONAL_BIRTHDATE`, `PERSONAL_PHOTO`, `PERSONAL_PHONE`, `PERSONAL_FAX`, `PERSONAL_MOBILE`, `PERSONAL_PAGER`, `PERSONAL_STREET`, `PERSONAL_MAILBOX`, `PERSONAL_CITY`, `PERSONAL_STATE`, `PERSONAL_ZIP`, `PERSONAL_COUNTRY`, `PERSONAL_NOTES`, `WORK_COMPANY`, `WORK_DEPARTMENT`, `WORK_POSITION`, `WORK_WWW`, `WORK_PHONE`, `WORK_FAX`, `WORK_PAGER`, `WORK_STREET`, `WORK_MAILBOX`, `WORK_CITY`, `WORK_STATE`, `WORK_ZIP`, `WORK_COUNTRY`, `WORK_PROFILE`, `WORK_LOGO`, `WORK_NOTES`, `ADMIN_NOTES`, `STORED_HASH`, `XML_ID`, `PERSONAL_BIRTHDAY`, `EXTERNAL_AUTH_ID`, `CHECKWORD_TIME`, `SECOND_NAME`, `CONFIRM_CODE`, `LOGIN_ATTEMPTS`, `LAST_ACTIVITY_DATE`, `AUTO_TIME_ZONE`, `TIME_ZONE`, `TIME_ZONE_OFFSET`, `TITLE`, `BX_USER_ID`, `LANGUAGE_ID`, `BLOCKED`, `PASSWORD_EXPIRED`) VALUES
(1, NULL, 'admin', '$6$3I0lf6PFBQwMzk4G$kGOs8T6Y.V9d9sQJWQP98NsqcZtkq8aVlxJcrq9qyD0ks.uZQdsPSY8e2h796cVvYir.oQZ/Tkda20W0KBUug1', '$6$ufzk7zWxiWf1KuMw$X11gT1ohvtqqkqQCl34VcxqBSrwzY/Lk936JoVr3Dt3UaRmnGIeAtRrIp8TejrqIKoBDAGOztSfzSlMHHAi63.', 'Y', '123', '123', '123@asd.ri', '2026-10-06 13:26:33', '2026-09-11 16:19:03', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-11 16:19:03', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'ru', 'N', 'N');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_access`
--

CREATE TABLE `b_user_access` (
  `ID` bigint UNSIGNED NOT NULL,
  `USER_ID` int DEFAULT NULL,
  `PROVIDER_ID` varchar(50) DEFAULT NULL,
  `ACCESS_CODE` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_user_access`
--

INSERT INTO `b_user_access` (`ID`, `USER_ID`, `PROVIDER_ID`, `ACCESS_CODE`) VALUES
(1, 0, 'group', 'G2'),
(2, 1, 'group', 'G1'),
(3, 1, 'group', 'G3'),
(4, 1, 'group', 'G4'),
(5, 1, 'group', 'G2'),
(9, 1, 'user', 'U1');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_access_check`
--

CREATE TABLE `b_user_access_check` (
  `USER_ID` int DEFAULT NULL,
  `PROVIDER_ID` varchar(50) DEFAULT NULL,
  `DATE_CHECK` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_auth_action`
--

CREATE TABLE `b_user_auth_action` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `PRIORITY` int NOT NULL DEFAULT '100',
  `ACTION` varchar(20) DEFAULT NULL,
  `ACTION_DATE` datetime NOT NULL,
  `APPLICATION_ID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_auth_code`
--

CREATE TABLE `b_user_auth_code` (
  `USER_ID` int NOT NULL,
  `CODE_TYPE` varchar(20) NOT NULL DEFAULT 'email',
  `OTP_SECRET` text,
  `ATTEMPTS` int DEFAULT '0',
  `DATE_SENT` datetime DEFAULT NULL,
  `DATE_RESENT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_counter`
--

CREATE TABLE `b_user_counter` (
  `ID` bigint UNSIGNED NOT NULL,
  `USER_ID` int NOT NULL,
  `SITE_ID` char(2) NOT NULL DEFAULT '**',
  `CODE` varchar(50) NOT NULL,
  `CNT` int NOT NULL DEFAULT '0',
  `LAST_DATE` datetime DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '3000-01-01 00:00:00',
  `TAG` varchar(255) DEFAULT NULL,
  `PARAMS` text,
  `SENT` char(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_device`
--

CREATE TABLE `b_user_device` (
  `ID` bigint UNSIGNED NOT NULL,
  `USER_ID` bigint UNSIGNED NOT NULL,
  `DEVICE_UID` varchar(50) NOT NULL,
  `DEVICE_TYPE` int UNSIGNED NOT NULL DEFAULT '0',
  `BROWSER` varchar(100) DEFAULT NULL,
  `PLATFORM` varchar(25) DEFAULT NULL,
  `USER_AGENT` varchar(1000) DEFAULT NULL,
  `COOKABLE` char(1) NOT NULL DEFAULT 'N',
  `APP_PASSWORD_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_device_login`
--

CREATE TABLE `b_user_device_login` (
  `ID` bigint UNSIGNED NOT NULL,
  `DEVICE_ID` bigint UNSIGNED NOT NULL,
  `LOGIN_DATE` datetime DEFAULT NULL,
  `IP` varchar(20) DEFAULT NULL,
  `CITY_GEOID` bigint DEFAULT NULL,
  `REGION_GEOID` bigint DEFAULT NULL,
  `COUNTRY_ISO_CODE` varchar(10) DEFAULT NULL,
  `APP_PASSWORD_ID` bigint UNSIGNED DEFAULT NULL,
  `STORED_AUTH_ID` bigint UNSIGNED DEFAULT NULL,
  `HIT_AUTH_ID` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_digest`
--

CREATE TABLE `b_user_digest` (
  `USER_ID` int NOT NULL,
  `DIGEST_HA1` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_field`
--

CREATE TABLE `b_user_field` (
  `ID` int NOT NULL,
  `ENTITY_ID` varchar(50) DEFAULT NULL,
  `FIELD_NAME` varchar(50) DEFAULT NULL,
  `USER_TYPE_ID` varchar(50) DEFAULT NULL,
  `XML_ID` varchar(255) DEFAULT NULL,
  `SORT` int DEFAULT NULL,
  `MULTIPLE` char(1) NOT NULL DEFAULT 'N',
  `MANDATORY` char(1) NOT NULL DEFAULT 'N',
  `SHOW_FILTER` char(1) NOT NULL DEFAULT 'N',
  `SHOW_IN_LIST` char(1) NOT NULL DEFAULT 'Y',
  `EDIT_IN_LIST` char(1) NOT NULL DEFAULT 'Y',
  `IS_SEARCHABLE` char(1) NOT NULL DEFAULT 'N',
  `SETTINGS` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_user_field`
--

INSERT INTO `b_user_field` (`ID`, `ENTITY_ID`, `FIELD_NAME`, `USER_TYPE_ID`, `XML_ID`, `SORT`, `MULTIPLE`, `MANDATORY`, `SHOW_FILTER`, `SHOW_IN_LIST`, `EDIT_IN_LIST`, `IS_SEARCHABLE`, `SETTINGS`) VALUES
(5, 'BLOG_POST', 'UF_GRATITUDE', 'integer', 'UF_GRATITUDE', 100, 'N', 'N', 'N', 'N', 'Y', 'N', 'a:0:{}'),
(8, 'HLBLOCK_1', 'UF_NAME', 'string', '', 100, 'N', 'Y', 'N', 'Y', 'Y', 'N', 'a:6:{s:4:\"SIZE\";i:20;s:4:\"ROWS\";i:1;s:6:\"REGEXP\";s:0:\"\";s:10:\"MIN_LENGTH\";i:0;s:10:\"MAX_LENGTH\";i:0;s:13:\"DEFAULT_VALUE\";s:0:\"\";}'),
(9, 'HLBLOCK_1', 'UF_CODE', 'string', '', 100, 'N', 'Y', 'N', 'Y', 'Y', 'N', 'a:6:{s:4:\"SIZE\";i:20;s:4:\"ROWS\";i:1;s:6:\"REGEXP\";s:0:\"\";s:10:\"MIN_LENGTH\";i:0;s:10:\"MAX_LENGTH\";i:0;s:13:\"DEFAULT_VALUE\";s:0:\"\";}'),
(10, 'HLBLOCK_2', 'UF_MODEL', 'string', '', 100, 'N', 'Y', 'N', 'Y', 'Y', 'N', 'a:6:{s:4:\"SIZE\";i:20;s:4:\"ROWS\";i:1;s:6:\"REGEXP\";s:0:\"\";s:10:\"MIN_LENGTH\";i:0;s:10:\"MAX_LENGTH\";i:0;s:13:\"DEFAULT_VALUE\";s:0:\"\";}'),
(11, 'HLBLOCK_2', 'UF_YEAR', 'integer', '', 100, 'N', 'N', 'N', 'Y', 'Y', 'N', 'a:4:{s:4:\"SIZE\";i:20;s:9:\"MIN_VALUE\";i:1950;s:9:\"MAX_VALUE\";i:2026;s:13:\"DEFAULT_VALUE\";N;}'),
(12, 'HLBLOCK_2', 'UF_VIN', 'string', '', 100, 'N', 'Y', 'N', 'Y', 'Y', 'N', 'a:6:{s:4:\"SIZE\";i:20;s:4:\"ROWS\";i:1;s:6:\"REGEXP\";s:0:\"\";s:10:\"MIN_LENGTH\";i:0;s:10:\"MAX_LENGTH\";i:0;s:13:\"DEFAULT_VALUE\";s:0:\"\";}'),
(13, 'HLBLOCK_2', 'UF_STATUS', 'hlblock', '', 100, 'N', 'Y', 'N', 'Y', 'Y', 'N', 'a:5:{s:7:\"DISPLAY\";s:4:\"LIST\";s:11:\"LIST_HEIGHT\";i:2;s:10:\"HLBLOCK_ID\";i:1;s:10:\"HLFIELD_ID\";i:8;s:13:\"DEFAULT_VALUE\";s:0:\"\";}'),
(14, 'HLBLOCK_2', 'UF_PRICE_PER_DAY', 'integer', '', 100, 'N', 'Y', 'N', 'Y', 'Y', 'N', 'a:4:{s:4:\"SIZE\";i:20;s:9:\"MIN_VALUE\";i:0;s:9:\"MAX_VALUE\";i:0;s:13:\"DEFAULT_VALUE\";N;}'),
(15, 'HLBLOCK_3', 'UF_CAR', 'hlblock', '', 100, 'N', 'Y', 'N', 'Y', 'Y', 'N', 'a:5:{s:7:\"DISPLAY\";s:4:\"LIST\";s:11:\"LIST_HEIGHT\";i:10;s:10:\"HLBLOCK_ID\";i:2;s:10:\"HLFIELD_ID\";i:10;s:13:\"DEFAULT_VALUE\";s:0:\"\";}'),
(16, 'HLBLOCK_3', 'UF_DATE_START', 'datetime', '', 100, 'N', 'Y', 'N', 'Y', 'Y', 'N', 'a:3:{s:13:\"DEFAULT_VALUE\";a:2:{s:4:\"TYPE\";s:3:\"NOW\";s:5:\"VALUE\";s:0:\"\";}s:10:\"USE_SECOND\";s:1:\"N\";s:12:\"USE_TIMEZONE\";s:1:\"N\";}'),
(17, 'HLBLOCK_3', 'UF_DATE_END', 'datetime', '', 100, 'N', 'N', 'N', 'Y', 'Y', 'N', 'a:3:{s:13:\"DEFAULT_VALUE\";a:2:{s:4:\"TYPE\";s:4:\"NONE\";s:5:\"VALUE\";s:0:\"\";}s:10:\"USE_SECOND\";s:1:\"N\";s:12:\"USE_TIMEZONE\";s:1:\"N\";}'),
(18, 'HLBLOCK_3', 'UF_TOTAL_COST', 'integer', '', 100, 'N', 'N', 'N', 'Y', 'N', 'N', 'a:4:{s:4:\"SIZE\";i:20;s:9:\"MIN_VALUE\";i:0;s:9:\"MAX_VALUE\";i:0;s:13:\"DEFAULT_VALUE\";N;}');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_field_confirm`
--

CREATE TABLE `b_user_field_confirm` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `DATE_CHANGE` timestamp NULL DEFAULT NULL,
  `FIELD` varchar(255) NOT NULL,
  `FIELD_VALUE` varchar(255) NOT NULL,
  `CONFIRM_CODE` varchar(32) NOT NULL,
  `ATTEMPTS` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_field_enum`
--

CREATE TABLE `b_user_field_enum` (
  `ID` int NOT NULL,
  `USER_FIELD_ID` int DEFAULT NULL,
  `VALUE` varchar(255) NOT NULL,
  `DEF` char(1) NOT NULL DEFAULT 'N',
  `SORT` int NOT NULL DEFAULT '500',
  `XML_ID` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_field_lang`
--

CREATE TABLE `b_user_field_lang` (
  `USER_FIELD_ID` int NOT NULL,
  `LANGUAGE_ID` char(2) NOT NULL,
  `EDIT_FORM_LABEL` varchar(255) DEFAULT NULL,
  `LIST_COLUMN_LABEL` varchar(255) DEFAULT NULL,
  `LIST_FILTER_LABEL` varchar(255) DEFAULT NULL,
  `ERROR_MESSAGE` varchar(255) DEFAULT NULL,
  `HELP_MESSAGE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_user_field_lang`
--

INSERT INTO `b_user_field_lang` (`USER_FIELD_ID`, `LANGUAGE_ID`, `EDIT_FORM_LABEL`, `LIST_COLUMN_LABEL`, `LIST_FILTER_LABEL`, `ERROR_MESSAGE`, `HELP_MESSAGE`) VALUES
(8, 'en', '', '', '', '', ''),
(8, 'ru', '', '', '', '', ''),
(9, 'en', '', '', '', '', ''),
(9, 'ru', '', '', '', '', ''),
(10, 'en', '', '', '', '', ''),
(10, 'ru', '', '', '', '', ''),
(11, 'en', '', '', '', '', ''),
(11, 'ru', '', '', '', '', ''),
(12, 'en', '', '', '', '', ''),
(12, 'ru', '', '', '', '', ''),
(13, 'en', '', '', '', '', ''),
(13, 'ru', '', '', '', '', ''),
(14, 'en', '', '', '', '', ''),
(14, 'ru', '', '', '', '', ''),
(15, 'en', '', '', '', '', ''),
(15, 'ru', '', '', '', '', ''),
(16, 'en', '', '', '', '', ''),
(16, 'ru', '', '', '', '', ''),
(17, 'en', '', '', '', '', ''),
(17, 'ru', '', '', '', '', ''),
(18, 'en', '', '', '', '', ''),
(18, 'ru', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_field_permission`
--

CREATE TABLE `b_user_field_permission` (
  `ID` int UNSIGNED NOT NULL,
  `ENTITY_TYPE_ID` int NOT NULL,
  `USER_FIELD_ID` int UNSIGNED NOT NULL,
  `ACCESS_CODE` varchar(100) NOT NULL,
  `PERMISSION_ID` varchar(32) NOT NULL,
  `VALUE` tinyint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_group`
--

CREATE TABLE `b_user_group` (
  `USER_ID` int NOT NULL,
  `GROUP_ID` int NOT NULL,
  `DATE_ACTIVE_FROM` datetime DEFAULT NULL,
  `DATE_ACTIVE_TO` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_user_group`
--

INSERT INTO `b_user_group` (`USER_ID`, `GROUP_ID`, `DATE_ACTIVE_FROM`, `DATE_ACTIVE_TO`) VALUES
(1, 1, NULL, NULL),
(1, 3, NULL, NULL),
(1, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_hit_auth`
--

CREATE TABLE `b_user_hit_auth` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `HASH` varchar(32) NOT NULL,
  `URL` varchar(255) NOT NULL,
  `SITE_ID` char(2) DEFAULT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `VALID_UNTIL` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_index`
--

CREATE TABLE `b_user_index` (
  `USER_ID` int NOT NULL,
  `SEARCH_USER_CONTENT` text,
  `SEARCH_DEPARTMENT_CONTENT` text,
  `SEARCH_ADMIN_CONTENT` text,
  `NAME` varchar(50) DEFAULT NULL,
  `LAST_NAME` varchar(50) DEFAULT NULL,
  `SECOND_NAME` varchar(50) DEFAULT NULL,
  `WORK_POSITION` varchar(255) DEFAULT NULL,
  `UF_DEPARTMENT_NAME` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_user_index`
--

INSERT INTO `b_user_index` (`USER_ID`, `SEARCH_USER_CONTENT`, `SEARCH_DEPARTMENT_CONTENT`, `SEARCH_ADMIN_CONTENT`, `NAME`, `LAST_NAME`, `SECOND_NAME`, `WORK_POSITION`, `UF_DEPARTMENT_NAME`) VALUES
(1, '001 123 123 ', '', '001 123 nfq 123@nfq.ev nqzva', '123', '123', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_option`
--

CREATE TABLE `b_user_option` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `CATEGORY` varchar(50) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` mediumtext,
  `COMMON` char(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_user_option`
--

INSERT INTO `b_user_option` (`ID`, `USER_ID`, `CATEGORY`, `NAME`, `VALUE`, `COMMON`) VALUES
(1, 0, 'intranet', '~gadgets_admin_index', 'a:1:{i:0;a:1:{s:7:\"GADGETS\";a:8:{s:20:\"ADMIN_INFO@333333333\";a:3:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:0;s:4:\"HIDE\";s:1:\"N\";}s:19:\"HTML_AREA@444444444\";a:5:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:1;s:4:\"HIDE\";s:1:\"N\";s:8:\"USERDATA\";a:1:{s:7:\"content\";s:805:\"<table class=\"bx-gadgets-info-site-table\" cellspacing=\"0\"><tr>	<td class=\"bx-gadget-gray\">Создатель сайта:</td>	<td>Группа компаний &laquo;1С-Битрикс&raquo;.</td>	<td class=\"bx-gadgets-info-site-logo\" rowspan=\"5\"><img src=\"/bitrix/components/bitrix/desktop/templates/admin/images/site_logo.png\" alt=\"\"></td></tr><tr>	<td class=\"bx-gadget-gray\">Адрес сайта:</td>	<td><a href=\"https://www.1c-bitrix.ru\">www.1c-bitrix.ru</a></td></tr><tr>	<td class=\"bx-gadget-gray\">Сайт сдан:</td>	<td>12 декабря 2010 г.</td></tr><tr>	<td class=\"bx-gadget-gray\">Ответственное лицо:</td>	<td>Иван Иванов</td></tr><tr>	<td class=\"bx-gadget-gray\">E-mail:</td>	<td><a href=\"mailto:info@1c-bitrix.ru\">info@1c-bitrix.ru</a></td></tr></table>\";}s:8:\"SETTINGS\";a:1:{s:9:\"TITLE_STD\";s:34:\"Информация о сайте\";}}s:25:\"ADMIN_CHECKLIST@777888999\";a:3:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:2;s:4:\"HIDE\";s:1:\"N\";}s:19:\"RSSREADER@777777777\";a:4:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:3;s:4:\"HIDE\";s:1:\"N\";s:8:\"SETTINGS\";a:3:{s:9:\"TITLE_STD\";s:33:\"Новости 1С-Битрикс\";s:3:\"CNT\";i:10;s:7:\"RSS_URL\";s:45:\"https://www.1c-bitrix.ru/about/life/news/rss/\";}}s:24:\"ADMIN_SECURITY@555555555\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:0;s:4:\"HIDE\";s:1:\"N\";}s:25:\"ADMIN_SITESPEED@666666777\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:1;s:4:\"HIDE\";s:1:\"N\";}s:23:\"ADMIN_PERFMON@666666666\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:2;s:4:\"HIDE\";s:1:\"N\";}s:23:\"ADMIN_MARKETPALCE@22549\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:3;s:4:\"HIDE\";s:1:\"N\";}}}}', 'Y'),
(2, 1, 'favorite', 'favorite_menu', 'a:1:{s:5:\"stick\";s:1:\"N\";}', 'N'),
(4, 1, 'admin_menu', 'pos', 'a:1:{s:8:\"sections\";s:11:\"menu_system\";}', 'N'),
(7, 1, 'filter', 'tbl_statuses_filter_id', 'a:1:{s:4:\"rows\";s:1:\"0\";}', 'N'),
(10, 1, 'filter', 'tbl_cars_filter_id', 'a:1:{s:4:\"rows\";s:1:\"0\";}', 'N'),
(11, 1, 'filter', 'tbl_test_drives_filter_id', 'a:1:{s:4:\"rows\";s:1:\"0\";}', 'N'),
(13, 1, 'filter', 'tbl_b_test_drives_filter_id', 'a:1:{s:4:\"rows\";s:1:\"0\";}', 'N'),
(14, 1, 'filter', 'tbl_b_cars_filter_id', 'a:1:{s:4:\"rows\";s:1:\"0\";}', 'N'),
(18, 1, 'filter', 'tbl_b_statuses_filter_id', 'a:1:{s:4:\"rows\";s:1:\"0\";}', 'N');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_password`
--

CREATE TABLE `b_user_password` (
  `ID` bigint NOT NULL,
  `USER_ID` bigint NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `DATE_CHANGE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_user_password`
--

INSERT INTO `b_user_password` (`ID`, `USER_ID`, `PASSWORD`, `DATE_CHANGE`) VALUES
(1, 1, '$6$3I0lf6PFBQwMzk4G$kGOs8T6Y.V9d9sQJWQP98NsqcZtkq8aVlxJcrq9qyD0ks.uZQdsPSY8e2h796cVvYir.oQZ/Tkda20W0KBUug1', '2026-09-11 16:19:03');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_phone_auth`
--

CREATE TABLE `b_user_phone_auth` (
  `USER_ID` int NOT NULL,
  `PHONE_NUMBER` varchar(25) NOT NULL,
  `OTP_SECRET` text,
  `ATTEMPTS` int DEFAULT '0',
  `CONFIRMED` char(1) DEFAULT 'N',
  `DATE_SENT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_profile_history`
--

CREATE TABLE `b_user_profile_history` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `EVENT_TYPE` int DEFAULT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `REMOTE_ADDR` varchar(40) DEFAULT NULL,
  `USER_AGENT` text,
  `REQUEST_URI` text,
  `UPDATED_BY_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_profile_record`
--

CREATE TABLE `b_user_profile_record` (
  `ID` int NOT NULL,
  `HISTORY_ID` int NOT NULL,
  `FIELD` varchar(40) DEFAULT NULL,
  `DATA` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_session`
--

CREATE TABLE `b_user_session` (
  `SESSION_ID` varchar(250) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `SESSION_DATA` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_stored_auth`
--

CREATE TABLE `b_user_stored_auth` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `DATE_REG` datetime NOT NULL,
  `LAST_AUTH` datetime NOT NULL,
  `STORED_HASH` varchar(32) NOT NULL,
  `TEMP_HASH` char(1) NOT NULL DEFAULT 'N',
  `IP_ADDR` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `b_user_stored_auth`
--

INSERT INTO `b_user_stored_auth` (`ID`, `USER_ID`, `DATE_REG`, `LAST_AUTH`, `STORED_HASH`, `TEMP_HASH`, `IP_ADDR`) VALUES
(1, 1, '2026-09-11 16:19:03', '2026-09-11 16:19:03', 'AaD4QQk6zfpJUBj2fufw5smUzb298OQd', 'N', 2130706433);

-- --------------------------------------------------------

--
-- Структура таблицы `b_utm_blog_comment`
--

CREATE TABLE `b_utm_blog_comment` (
  `ID` int NOT NULL,
  `VALUE_ID` int NOT NULL,
  `FIELD_ID` int NOT NULL,
  `VALUE` text,
  `VALUE_INT` int DEFAULT NULL,
  `VALUE_DOUBLE` double DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_utm_blog_post`
--

CREATE TABLE `b_utm_blog_post` (
  `ID` int NOT NULL,
  `VALUE_ID` int NOT NULL,
  `FIELD_ID` int NOT NULL,
  `VALUE` text,
  `VALUE_INT` int DEFAULT NULL,
  `VALUE_DOUBLE` double DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_utm_forum_message`
--

CREATE TABLE `b_utm_forum_message` (
  `ID` int NOT NULL,
  `VALUE_ID` int NOT NULL,
  `FIELD_ID` int NOT NULL,
  `VALUE` text,
  `VALUE_INT` int DEFAULT NULL,
  `VALUE_DOUBLE` double DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_uts_blog_comment`
--

CREATE TABLE `b_uts_blog_comment` (
  `VALUE_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_uts_blog_post`
--

CREATE TABLE `b_uts_blog_post` (
  `VALUE_ID` int NOT NULL,
  `UF_GRATITUDE` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_uts_forum_message`
--

CREATE TABLE `b_uts_forum_message` (
  `VALUE_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `b_admin_notify`
--
ALTER TABLE `b_admin_notify`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_AD_TAG` (`TAG`);

--
-- Индексы таблицы `b_admin_notify_lang`
--
ALTER TABLE `b_admin_notify_lang`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_ADM_NTFY_LANG` (`NOTIFY_ID`,`LID`),
  ADD KEY `IX_ADM_NTFY_LID` (`LID`);

--
-- Индексы таблицы `b_agent`
--
ALTER TABLE `b_agent`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_agent_user_id` (`USER_ID`),
  ADD KEY `ix_agent_name` (`NAME`(100)),
  ADD KEY `ix_agent_act_period_next_exec` (`ACTIVE`,`IS_PERIOD`,`NEXT_EXEC`),
  ADD KEY `ix_agent_next_exec` (`NEXT_EXEC`),
  ADD KEY `ix_agent_module_act` (`MODULE_ID`,`ACTIVE`);

--
-- Индексы таблицы `b_app_password`
--
ALTER TABLE `b_app_password`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_app_password_user` (`USER_ID`);

--
-- Индексы таблицы `b_cache_clean_path`
--
ALTER TABLE `b_cache_clean_path`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_CLEAN` (`CLUSTER_GROUP`,`CLEAN_FROM`);

--
-- Индексы таблицы `b_cache_tag`
--
ALTER TABLE `b_cache_tag`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_init_tag` (`SITE_ID`,`CACHE_SALT`,`RELATIVE_PATH`,`TAG`),
  ADD KEY `ix_relative_path` (`RELATIVE_PATH`),
  ADD KEY `ix_tag_relative_path` (`TAG`,`RELATIVE_PATH`);

--
-- Индексы таблицы `b_captcha`
--
ALTER TABLE `b_captcha`
  ADD UNIQUE KEY `UX_B_CAPTCHA` (`ID`);

--
-- Индексы таблицы `b_cars`
--
ALTER TABLE `b_cars`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UF_VIN` (`UF_VIN`(17));

--
-- Индексы таблицы `b_checklist`
--
ALTER TABLE `b_checklist`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_component_params`
--
ALTER TABLE `b_component_params`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_comp_params_name` (`COMPONENT_NAME`),
  ADD KEY `ix_comp_params_path` (`SITE_ID`,`REAL_PATH`),
  ADD KEY `ix_comp_params_sname` (`SITE_ID`,`COMPONENT_NAME`);

--
-- Индексы таблицы `b_composite_log`
--
ALTER TABLE `b_composite_log`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_COMPOSITE_LOG_PAGE_ID` (`PAGE_ID`),
  ADD KEY `IX_B_COMPOSITE_LOG_HOST` (`HOST`),
  ADD KEY `IX_B_COMPOSITE_LOG_TYPE` (`TYPE`);

--
-- Индексы таблицы `b_composite_page`
--
ALTER TABLE `b_composite_page`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_COMPOSITE_PAGE_CACHE_KEY` (`CACHE_KEY`(100)),
  ADD KEY `IX_B_COMPOSITE_PAGE_VIEWED` (`LAST_VIEWED`),
  ADD KEY `IX_B_COMPOSITE_PAGE_HOST` (`HOST`);

--
-- Индексы таблицы `b_consent_agreement`
--
ALTER TABLE `b_consent_agreement`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_CONSENT_AGREEMENT_CODE` (`CODE`);

--
-- Индексы таблицы `b_consent_field`
--
ALTER TABLE `b_consent_field`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_CONSENT_FIELD_AG_ID` (`AGREEMENT_ID`);

--
-- Индексы таблицы `b_consent_user_consent`
--
ALTER TABLE `b_consent_user_consent`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_CONSENT_USER_CONSENT_USER_ORIGIN` (`USER_ID`,`ORIGIN_ID`),
  ADD KEY `ix_b_consent_user_consent_agreement_id_user_id` (`AGREEMENT_ID`,`USER_ID`);

--
-- Индексы таблицы `b_consent_user_consent_item`
--
ALTER TABLE `b_consent_user_consent_item`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_CONSENT_USER_ITEM_AG_ID` (`USER_CONSENT_ID`);

--
-- Индексы таблицы `b_counter_data`
--
ALTER TABLE `b_counter_data`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_culture`
--
ALTER TABLE `b_culture`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_entity_usage`
--
ALTER TABLE `b_entity_usage`
  ADD PRIMARY KEY (`USER_ID`,`CONTEXT`,`ENTITY_ID`,`ITEM_ID`),
  ADD KEY `IX_ENTITY_USAGE_ITEM_ID_INT` (`ITEM_ID_INT`),
  ADD KEY `IX_ENTITY_USAGE_LAST_USE_DATE` (`LAST_USE_DATE`);

--
-- Индексы таблицы `b_event`
--
ALTER TABLE `b_event`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_success` (`SUCCESS_EXEC`),
  ADD KEY `ix_b_event_date_exec` (`DATE_EXEC`);

--
-- Индексы таблицы `b_event_attachment`
--
ALTER TABLE `b_event_attachment`
  ADD PRIMARY KEY (`EVENT_ID`,`FILE_ID`);

--
-- Индексы таблицы `b_event_log`
--
ALTER TABLE `b_event_log`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_event_log_time` (`TIMESTAMP_X`),
  ADD KEY `ix_b_event_log_audit_type_time` (`AUDIT_TYPE_ID`,`TIMESTAMP_X`);

--
-- Индексы таблицы `b_event_message`
--
ALTER TABLE `b_event_message`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_event_message_name` (`EVENT_NAME`(50));

--
-- Индексы таблицы `b_event_message_attachment`
--
ALTER TABLE `b_event_message_attachment`
  ADD PRIMARY KEY (`EVENT_MESSAGE_ID`,`FILE_ID`);

--
-- Индексы таблицы `b_event_message_site`
--
ALTER TABLE `b_event_message_site`
  ADD PRIMARY KEY (`EVENT_MESSAGE_ID`,`SITE_ID`);

--
-- Индексы таблицы `b_event_type`
--
ALTER TABLE `b_event_type`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_1` (`EVENT_NAME`,`LID`);

--
-- Индексы таблицы `b_favorite`
--
ALTER TABLE `b_favorite`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_feature_flag`
--
ALTER TABLE `b_feature_flag`
  ADD PRIMARY KEY (`CODE`),
  ADD KEY `ix_b_feature_flag_module_id` (`MODULE_ID`);

--
-- Индексы таблицы `b_feature_flag_rule`
--
ALTER TABLE `b_feature_flag_rule`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_feature_flag_rule_feature_code` (`FEATURE_CODE`);

--
-- Индексы таблицы `b_file`
--
ALTER TABLE `b_file`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_FILE_EXTERNAL_ID` (`EXTERNAL_ID`);

--
-- Индексы таблицы `b_file_duplicate`
--
ALTER TABLE `b_file_duplicate`
  ADD PRIMARY KEY (`DUPLICATE_ID`,`ORIGINAL_ID`),
  ADD KEY `ix_file_duplicate_original_del` (`ORIGINAL_ID`,`ORIGINAL_DELETED`);

--
-- Индексы таблицы `b_file_hash`
--
ALTER TABLE `b_file_hash`
  ADD PRIMARY KEY (`FILE_ID`),
  ADD KEY `ix_file_hash_size_hash` (`FILE_SIZE`,`FILE_HASH`);

--
-- Индексы таблицы `b_file_preview`
--
ALTER TABLE `b_file_preview`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_FILE_PL_TOUCH` (`TOUCHED_AT`),
  ADD KEY `IX_B_FILE_PL_FILE` (`FILE_ID`);

--
-- Индексы таблицы `b_file_search`
--
ALTER TABLE `b_file_search`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_file_version`
--
ALTER TABLE `b_file_version`
  ADD PRIMARY KEY (`ORIGINAL_ID`),
  ADD UNIQUE KEY `ux_file_version_version` (`VERSION_ID`);

--
-- Индексы таблицы `b_filters`
--
ALTER TABLE `b_filters`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_finder_dest`
--
ALTER TABLE `b_finder_dest`
  ADD PRIMARY KEY (`USER_ID`,`CODE`,`CONTEXT`),
  ADD KEY `IX_FINDER_DEST` (`CODE_TYPE`);

--
-- Индексы таблицы `b_geoip_handlers`
--
ALTER TABLE `b_geoip_handlers`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_geoname`
--
ALTER TABLE `b_geoname`
  ADD PRIMARY KEY (`ID`,`LANGUAGE_CODE`);

--
-- Индексы таблицы `b_group`
--
ALTER TABLE `b_group`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_group_collection_task`
--
ALTER TABLE `b_group_collection_task`
  ADD PRIMARY KEY (`GROUP_ID`,`TASK_ID`,`COLLECTION_ID`);

--
-- Индексы таблицы `b_group_subordinate`
--
ALTER TABLE `b_group_subordinate`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_group_task`
--
ALTER TABLE `b_group_task`
  ADD PRIMARY KEY (`GROUP_ID`,`TASK_ID`);

--
-- Индексы таблицы `b_hlblock_entity`
--
ALTER TABLE `b_hlblock_entity`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_hlblock_entity_rights`
--
ALTER TABLE `b_hlblock_entity_rights`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_hot_keys`
--
ALTER TABLE `b_hot_keys`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ix_b_hot_keys_co_u` (`CODE_ID`,`USER_ID`),
  ADD KEY `ix_hot_keys_user` (`USER_ID`);

--
-- Индексы таблицы `b_hot_keys_code`
--
ALTER TABLE `b_hot_keys_code`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_hot_keys_code_cn` (`CLASS_NAME`),
  ADD KEY `ix_hot_keys_code_url` (`URL`);

--
-- Индексы таблицы `b_lang`
--
ALTER TABLE `b_lang`
  ADD PRIMARY KEY (`LID`),
  ADD KEY `ix_b_lang_def_active` (`DEF`,`ACTIVE`);

--
-- Индексы таблицы `b_language`
--
ALTER TABLE `b_language`
  ADD PRIMARY KEY (`LID`);

--
-- Индексы таблицы `b_lang_domain`
--
ALTER TABLE `b_lang_domain`
  ADD PRIMARY KEY (`LID`,`DOMAIN`);

--
-- Индексы таблицы `b_location_hierarchy`
--
ALTER TABLE `b_location_hierarchy`
  ADD PRIMARY KEY (`ANCESTOR_ID`,`DESCENDANT_ID`),
  ADD KEY `IX_LOC_LH_D` (`DESCENDANT_ID`);

--
-- Индексы таблицы `b_log_notification`
--
ALTER TABLE `b_log_notification`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_log_notification_action`
--
ALTER TABLE `b_log_notification_action`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_log_notification_action_notification_id` (`NOTIFICATION_ID`);

--
-- Индексы таблицы `b_main_mail_blacklist`
--
ALTER TABLE `b_main_mail_blacklist`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_B_MAIN_MAIL_BLACKLIST_CODE` (`CODE`);

--
-- Индексы таблицы `b_main_mail_sender`
--
ALTER TABLE `b_main_mail_sender`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_MAIN_MAIL_SENDER_USER_ID` (`USER_ID`,`IS_CONFIRMED`,`IS_PUBLIC`),
  ADD KEY `IX_B_MAIN_MAIL_SENDER_EMAIL` (`EMAIL`);

--
-- Индексы таблицы `b_main_mail_sender_send_counter`
--
ALTER TABLE `b_main_mail_sender_send_counter`
  ADD PRIMARY KEY (`DATE_STAT`,`EMAIL`);

--
-- Индексы таблицы `b_main_messenger_message`
--
ALTER TABLE `b_main_messenger_message`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_QUEUE_ID_STATUS_AVAILABLE_AT` (`QUEUE_ID`,`STATUS`,`AVAILABLE_AT`),
  ADD KEY `IX_STATUS_AVAILABLE_AT` (`STATUS`,`UPDATED_AT`);

--
-- Индексы таблицы `b_medialib_collection`
--
ALTER TABLE `b_medialib_collection`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_medialib_collection_item`
--
ALTER TABLE `b_medialib_collection_item`
  ADD PRIMARY KEY (`ITEM_ID`,`COLLECTION_ID`);

--
-- Индексы таблицы `b_medialib_item`
--
ALTER TABLE `b_medialib_item`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_medialib_type`
--
ALTER TABLE `b_medialib_type`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_module`
--
ALTER TABLE `b_module`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_module_group`
--
ALTER TABLE `b_module_group`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_GROUP_MODULE` (`MODULE_ID`,`GROUP_ID`,`SITE_ID`);

--
-- Индексы таблицы `b_module_to_module`
--
ALTER TABLE `b_module_to_module`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_module_to_module_unique_id` (`UNIQUE_ID`),
  ADD KEY `ix_module_to_module` (`FROM_MODULE_ID`(20),`MESSAGE_ID`(20),`TO_MODULE_ID`(20),`TO_CLASS`(20),`TO_METHOD`(20));

--
-- Индексы таблицы `b_numerator`
--
ALTER TABLE `b_numerator`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_numerator_code` (`CODE`);

--
-- Индексы таблицы `b_numerator_sequence`
--
ALTER TABLE `b_numerator_sequence`
  ADD PRIMARY KEY (`NUMERATOR_ID`,`KEY`);

--
-- Индексы таблицы `b_operation`
--
ALTER TABLE `b_operation`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_option`
--
ALTER TABLE `b_option`
  ADD PRIMARY KEY (`MODULE_ID`,`NAME`),
  ADD KEY `ix_option_name` (`NAME`);

--
-- Индексы таблицы `b_option_site`
--
ALTER TABLE `b_option_site`
  ADD PRIMARY KEY (`MODULE_ID`,`NAME`,`SITE_ID`),
  ADD KEY `ix_option_site_module_site` (`MODULE_ID`,`SITE_ID`);

--
-- Индексы таблицы `b_persistent_storage`
--
ALTER TABLE `b_persistent_storage`
  ADD PRIMARY KEY (`KEY`),
  ADD KEY `B_PERSISTENT_STORAGE_IX1` (`EXPIRED_AT`);

--
-- Индексы таблицы `b_rating`
--
ALTER TABLE `b_rating`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_rating_component`
--
ALTER TABLE `b_rating_component`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_RATING_ID_1` (`RATING_ID`,`ACTIVE`,`NEXT_CALCULATION`);

--
-- Индексы таблицы `b_rating_component_results`
--
ALTER TABLE `b_rating_component_results`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_ENTITY_TYPE_ID` (`ENTITY_TYPE_ID`),
  ADD KEY `IX_COMPLEX_NAME` (`COMPLEX_NAME`),
  ADD KEY `IX_RATING_ID_2` (`RATING_ID`,`COMPLEX_NAME`);

--
-- Индексы таблицы `b_rating_prepare`
--
ALTER TABLE `b_rating_prepare`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_rating_results`
--
ALTER TABLE `b_rating_results`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_RATING_3` (`RATING_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`),
  ADD KEY `IX_RATING_4` (`RATING_ID`,`ENTITY_ID`);

--
-- Индексы таблицы `b_rating_rule`
--
ALTER TABLE `b_rating_rule`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_rating_rule_vetting`
--
ALTER TABLE `b_rating_rule_vetting`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RULE_ID` (`RULE_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`);

--
-- Индексы таблицы `b_rating_user`
--
ALTER TABLE `b_rating_user`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RATING_ID` (`RATING_ID`,`ENTITY_ID`),
  ADD KEY `IX_B_RAT_USER_2` (`ENTITY_ID`);

--
-- Индексы таблицы `b_rating_vote`
--
ALTER TABLE `b_rating_vote`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_RAT_VOTE_ID` (`RATING_VOTING_ID`,`USER_ID`),
  ADD KEY `IX_RAT_VOTE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`USER_ID`),
  ADD KEY `IX_RAT_VOTE_ID_3` (`OWNER_ID`,`CREATED`),
  ADD KEY `IX_RAT_VOTE_ID_5` (`CREATED`,`VALUE`),
  ADD KEY `IX_RAT_VOTE_ID_6` (`ACTIVE`),
  ADD KEY `IX_RAT_VOTE_ID_7` (`RATING_VOTING_ID`,`CREATED`),
  ADD KEY `IX_RAT_VOTE_ID_8` (`ENTITY_TYPE_ID`,`CREATED`),
  ADD KEY `IX_RAT_VOTE_ID_9` (`CREATED`,`USER_ID`),
  ADD KEY `IX_RAT_VOTE_ID_10` (`USER_ID`,`OWNER_ID`);

--
-- Индексы таблицы `b_rating_vote_group`
--
ALTER TABLE `b_rating_vote_group`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RATING_ID` (`GROUP_ID`,`TYPE`);

--
-- Индексы таблицы `b_rating_voting`
--
ALTER TABLE `b_rating_voting`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_ENTITY_TYPE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`ACTIVE`),
  ADD KEY `IX_ENTITY_TYPE_ID_4` (`TOTAL_VALUE`);

--
-- Индексы таблицы `b_rating_voting_prepare`
--
ALTER TABLE `b_rating_voting_prepare`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_RATING_VOTING_ID` (`RATING_VOTING_ID`);

--
-- Индексы таблицы `b_rating_voting_reaction`
--
ALTER TABLE `b_rating_voting_reaction`
  ADD PRIMARY KEY (`ENTITY_TYPE_ID`,`ENTITY_ID`,`REACTION`);

--
-- Индексы таблицы `b_rating_weight`
--
ALTER TABLE `b_rating_weight`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_security_sitecheck`
--
ALTER TABLE `b_security_sitecheck`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_sec_filter_mask`
--
ALTER TABLE `b_sec_filter_mask`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_sec_frame_mask`
--
ALTER TABLE `b_sec_frame_mask`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_sec_iprule`
--
ALTER TABLE `b_sec_iprule`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_sec_iprule_active_to` (`ACTIVE_TO`);

--
-- Индексы таблицы `b_sec_iprule_excl_ip`
--
ALTER TABLE `b_sec_iprule_excl_ip`
  ADD PRIMARY KEY (`IPRULE_ID`,`RULE_IP`);

--
-- Индексы таблицы `b_sec_iprule_excl_mask`
--
ALTER TABLE `b_sec_iprule_excl_mask`
  ADD PRIMARY KEY (`IPRULE_ID`,`RULE_MASK`);

--
-- Индексы таблицы `b_sec_iprule_incl_ip`
--
ALTER TABLE `b_sec_iprule_incl_ip`
  ADD PRIMARY KEY (`IPRULE_ID`,`RULE_IP`);

--
-- Индексы таблицы `b_sec_iprule_incl_mask`
--
ALTER TABLE `b_sec_iprule_incl_mask`
  ADD PRIMARY KEY (`IPRULE_ID`,`RULE_MASK`);

--
-- Индексы таблицы `b_sec_recovery_codes`
--
ALTER TABLE `b_sec_recovery_codes`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_sec_recovery_codes_user_id` (`USER_ID`);

--
-- Индексы таблицы `b_sec_session`
--
ALTER TABLE `b_sec_session`
  ADD PRIMARY KEY (`SESSION_ID`),
  ADD KEY `ix_b_sec_session_time` (`TIMESTAMP_X`);

--
-- Индексы таблицы `b_sec_user`
--
ALTER TABLE `b_sec_user`
  ADD PRIMARY KEY (`USER_ID`);

--
-- Индексы таблицы `b_sec_vendor_notification`
--
ALTER TABLE `b_sec_vendor_notification`
  ADD PRIMARY KEY (`VENDOR_ID`);

--
-- Индексы таблицы `b_sec_vendor_notification_sign`
--
ALTER TABLE `b_sec_vendor_notification_sign`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `USER_ID` (`USER_ID`,`NOTIFICATION_VENDOR_ID`);

--
-- Индексы таблицы `b_sec_virus`
--
ALTER TABLE `b_sec_virus`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_sec_white_list`
--
ALTER TABLE `b_sec_white_list`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_sec_wwall_rules`
--
ALTER TABLE `b_sec_wwall_rules`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_sec_xscan_results`
--
ALTER TABLE `b_sec_xscan_results`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `b_short_uri`
--
ALTER TABLE `b_short_uri`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ux_b_short_uri_1` (`SHORT_URI_CRC`),
  ADD KEY `ux_b_short_uri_2` (`URI_CRC`);

--
-- Индексы таблицы `b_sidepanel_toolbar`
--
ALTER TABLE `b_sidepanel_toolbar`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UX_SIDEPANEL_TOOLBAR` (`USER_ID`,`CONTEXT`);

--
-- Индексы таблицы `b_sidepanel_toolbar_item`
--
ALTER TABLE `b_sidepanel_toolbar_item`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `TOOLBAR_ID` (`TOOLBAR_ID`,`ENTITY_TYPE`,`ENTITY_ID`),
  ADD KEY `IX_SP_TOOLBAR_ITEM_TOOLBAR_ID_USE_DATE` (`TOOLBAR_ID`,`LAST_USE_DATE`);

--
-- Индексы таблицы `b_site_template`
--
ALTER TABLE `b_site_template`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_site_template_site` (`SITE_ID`);

--
-- Индексы таблицы `b_smile`
--
ALTER TABLE `b_smile`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_smile_lang`
--
ALTER TABLE `b_smile_lang`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UX_SMILE_SL` (`TYPE`,`SID`,`LID`);

--
-- Индексы таблицы `b_smile_set`
--
ALTER TABLE `b_smile_set`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_sms_template`
--
ALTER TABLE `b_sms_template`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_sms_message_name` (`EVENT_NAME`(50));

--
-- Индексы таблицы `b_sms_template_site`
--
ALTER TABLE `b_sms_template_site`
  ADD PRIMARY KEY (`TEMPLATE_ID`,`SITE_ID`);

--
-- Индексы таблицы `b_sm_version_history`
--
ALTER TABLE `b_sm_version_history`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_statuses`
--
ALTER TABLE `b_statuses`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_sticker`
--
ALTER TABLE `b_sticker`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_sticker_group_task`
--
ALTER TABLE `b_sticker_group_task`
  ADD PRIMARY KEY (`GROUP_ID`,`TASK_ID`);

--
-- Индексы таблицы `b_task`
--
ALTER TABLE `b_task`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_task` (`MODULE_ID`,`BINDING`,`LETTER`,`SYS`);

--
-- Индексы таблицы `b_task_operation`
--
ALTER TABLE `b_task_operation`
  ADD PRIMARY KEY (`TASK_ID`,`OPERATION_ID`);

--
-- Индексы таблицы `b_test_drives`
--
ALTER TABLE `b_test_drives`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_ui_avatar_mask_access`
--
ALTER TABLE `b_ui_avatar_mask_access`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `B_UI_AVATAR_MASK_RIGHT_3` (`ITEM_ID`,`ACCESS_CODE`),
  ADD KEY `B_UI_AVATAR_MASK_RIGHT_1` (`ITEM_ID`),
  ADD KEY `B_UI_AVATAR_MASK_RIGHT_2` (`ACCESS_CODE`);

--
-- Индексы таблицы `b_ui_avatar_mask_file_deleted`
--
ALTER TABLE `b_ui_avatar_mask_file_deleted`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `B_UI_AVATAR_MASK_FILE_DELETED_1` (`ENTITY`),
  ADD KEY `B_UI_AVATAR_MASK_FILE_DELETED_2` (`ITEM_ID`),
  ADD KEY `B_UI_AVATAR_MASK_FILE_DELETED_3` (`FILE_ID`);

--
-- Индексы таблицы `b_ui_avatar_mask_group`
--
ALTER TABLE `b_ui_avatar_mask_group`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_UI_AVATAR_MASK_GROUP_OWNER` (`OWNER_ID`,`OWNER_TYPE`);

--
-- Индексы таблицы `b_ui_avatar_mask_item`
--
ALTER TABLE `b_ui_avatar_mask_item`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `B_UI_AVATAR_MASK_ITEM_OWNER` (`OWNER_TYPE`,`OWNER_ID`),
  ADD KEY `B_UI_AVATAR_MASK_ITEM_FILE_ID` (`FILE_ID`);

--
-- Индексы таблицы `b_ui_avatar_mask_item_applied_to`
--
ALTER TABLE `b_ui_avatar_mask_item_applied_to`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `b_ui_avatar_mask_item_applied1` (`FILE_ID`,`ITEM_ID`),
  ADD KEY `b_ui_avatar_mask_item_applied2` (`ITEM_ID`),
  ADD KEY `b_ui_avatar_mask_item_applied3` (`USER_ID`);

--
-- Индексы таблицы `b_ui_avatar_mask_recently_used`
--
ALTER TABLE `b_ui_avatar_mask_recently_used`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `B_UI_AVATAR_MASK_ITEM_R_OWNER` (`ITEM_ID`,`USER_ID`);

--
-- Индексы таблицы `b_ui_entity_editor_config`
--
ALTER TABLE `b_ui_entity_editor_config`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ENTITY_TYPE_ID` (`ENTITY_TYPE_ID`),
  ADD KEY `CATEGORY` (`CATEGORY`);

--
-- Индексы таблицы `b_ui_entity_editor_config_ac`
--
ALTER TABLE `b_ui_entity_editor_config_ac`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ACCESS_CODE` (`ACCESS_CODE`),
  ADD KEY `CONFIG_ID` (`CONFIG_ID`);

--
-- Индексы таблицы `b_ui_file_uploader_temp_file`
--
ALTER TABLE `b_ui_file_uploader_temp_file`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_B_UI_UPLOADER_GUID` (`GUID`),
  ADD KEY `IX_B_UI_UPLOADER_FILE_ID` (`FILE_ID`),
  ADD KEY `IX_B_UI_UPLOADER_CREATED_AT` (`CREATED_AT`);

--
-- Индексы таблицы `b_ui_file_uploader_temp_file_part`
--
ALTER TABLE `b_ui_file_uploader_temp_file_part`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UX_B_UI_UPLOADER_PART_FILE_NO` (`TEMP_FILE_ID`,`PART_NO`);

--
-- Индексы таблицы `b_undo`
--
ALTER TABLE `b_undo`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_urlpreview_metadata`
--
ALTER TABLE `b_urlpreview_metadata`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_URLPREVIEW_METADATA_URL` (`URL`(255));

--
-- Индексы таблицы `b_urlpreview_route`
--
ALTER TABLE `b_urlpreview_route`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UX_URLPREVIEW_ROUTE_ROUTE` (`ROUTE`(255));

--
-- Индексы таблицы `b_user`
--
ALTER TABLE `b_user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ix_login` (`LOGIN`,`EXTERNAL_AUTH_ID`),
  ADD KEY `ix_b_user_email` (`EMAIL`),
  ADD KEY `ix_b_user_activity_date` (`LAST_ACTIVITY_DATE`),
  ADD KEY `IX_B_USER_XML_ID` (`XML_ID`),
  ADD KEY `ix_user_last_login` (`LAST_LOGIN`),
  ADD KEY `ix_user_date_register` (`DATE_REGISTER`),
  ADD KEY `ix_b_user_external_auth_id_active` (`EXTERNAL_AUTH_ID`,`ACTIVE`),
  ADD KEY `ix_b_user_personal_birthdate` (`PERSONAL_BIRTHDATE`);

--
-- Индексы таблицы `b_user_access`
--
ALTER TABLE `b_user_access`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_ua_user_access` (`USER_ID`,`ACCESS_CODE`),
  ADD KEY `ix_ua_user_provider` (`USER_ID`,`PROVIDER_ID`),
  ADD KEY `ix_ua_provider` (`PROVIDER_ID`),
  ADD KEY `ix_b_user_access_access_code_user_id` (`ACCESS_CODE`,`USER_ID`);

--
-- Индексы таблицы `b_user_access_check`
--
ALTER TABLE `b_user_access_check`
  ADD UNIQUE KEY `ux_uac_user_provider_date` (`USER_ID`,`PROVIDER_ID`,`DATE_CHECK`);

--
-- Индексы таблицы `b_user_auth_action`
--
ALTER TABLE `b_user_auth_action`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_auth_action_user` (`USER_ID`,`PRIORITY`),
  ADD KEY `ix_auth_action_date` (`ACTION_DATE`);

--
-- Индексы таблицы `b_user_auth_code`
--
ALTER TABLE `b_user_auth_code`
  ADD PRIMARY KEY (`USER_ID`,`CODE_TYPE`);

--
-- Индексы таблицы `b_user_counter`
--
ALTER TABLE `b_user_counter`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_user_counter_user_site_code` (`USER_ID`,`SITE_ID`,`CODE`),
  ADD KEY `ix_buc_tag` (`TAG`),
  ADD KEY `ix_buc_code` (`CODE`),
  ADD KEY `ix_buc_ts` (`TIMESTAMP_X`),
  ADD KEY `ix_buc_sent_userid` (`SENT`,`USER_ID`);

--
-- Индексы таблицы `b_user_device`
--
ALTER TABLE `b_user_device`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_user_device_user` (`USER_ID`,`DEVICE_UID`),
  ADD KEY `ix_b_user_device_user_id_cookable` (`USER_ID`,`COOKABLE`),
  ADD KEY `ix_b_user_device_user_id_app_password_id` (`USER_ID`,`APP_PASSWORD_ID`);

--
-- Индексы таблицы `b_user_device_login`
--
ALTER TABLE `b_user_device_login`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_user_device_login_device` (`DEVICE_ID`),
  ADD KEY `ix_user_device_login_date` (`LOGIN_DATE`);

--
-- Индексы таблицы `b_user_digest`
--
ALTER TABLE `b_user_digest`
  ADD PRIMARY KEY (`USER_ID`);

--
-- Индексы таблицы `b_user_field`
--
ALTER TABLE `b_user_field`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_user_type_entity` (`ENTITY_ID`,`FIELD_NAME`);

--
-- Индексы таблицы `b_user_field_confirm`
--
ALTER TABLE `b_user_field_confirm`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_user_field_confirm1` (`USER_ID`,`CONFIRM_CODE`);

--
-- Индексы таблицы `b_user_field_enum`
--
ALTER TABLE `b_user_field_enum`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_user_field_enum` (`USER_FIELD_ID`,`XML_ID`),
  ADD KEY `ix_b_user_field_enum_def` (`DEF`);

--
-- Индексы таблицы `b_user_field_lang`
--
ALTER TABLE `b_user_field_lang`
  ADD PRIMARY KEY (`USER_FIELD_ID`,`LANGUAGE_ID`);

--
-- Индексы таблицы `b_user_field_permission`
--
ALTER TABLE `b_user_field_permission`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ROLE_ID` (`ENTITY_TYPE_ID`),
  ADD KEY `GROUP_ID` (`USER_FIELD_ID`),
  ADD KEY `PERMISSION_ID` (`PERMISSION_ID`);

--
-- Индексы таблицы `b_user_group`
--
ALTER TABLE `b_user_group`
  ADD UNIQUE KEY `ix_user_group` (`USER_ID`,`GROUP_ID`),
  ADD KEY `ix_user_group_group` (`GROUP_ID`);

--
-- Индексы таблицы `b_user_hit_auth`
--
ALTER TABLE `b_user_hit_auth`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_USER_HIT_AUTH_1` (`HASH`),
  ADD KEY `IX_USER_HIT_AUTH_2` (`USER_ID`),
  ADD KEY `IX_USER_HIT_AUTH_3` (`TIMESTAMP_X`);

--
-- Индексы таблицы `b_user_index`
--
ALTER TABLE `b_user_index`
  ADD PRIMARY KEY (`USER_ID`);
ALTER TABLE `b_user_index` ADD FULLTEXT KEY `IXF_B_USER_INDEX_1` (`SEARCH_USER_CONTENT`);
ALTER TABLE `b_user_index` ADD FULLTEXT KEY `IXF_B_USER_INDEX_2` (`SEARCH_DEPARTMENT_CONTENT`);
ALTER TABLE `b_user_index` ADD FULLTEXT KEY `IXF_B_USER_INDEX_3` (`SEARCH_ADMIN_CONTENT`);

--
-- Индексы таблицы `b_user_option`
--
ALTER TABLE `b_user_option`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_user_category_name` (`USER_ID`,`CATEGORY`,`NAME`),
  ADD KEY `ix_b_user_option_category_name` (`CATEGORY`,`NAME`);

--
-- Индексы таблицы `b_user_password`
--
ALTER TABLE `b_user_password`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_user_password_user_date` (`USER_ID`,`DATE_CHANGE`);

--
-- Индексы таблицы `b_user_phone_auth`
--
ALTER TABLE `b_user_phone_auth`
  ADD PRIMARY KEY (`USER_ID`),
  ADD UNIQUE KEY `ix_user_phone_auth_number` (`PHONE_NUMBER`);

--
-- Индексы таблицы `b_user_profile_history`
--
ALTER TABLE `b_user_profile_history`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_profile_history_user` (`USER_ID`),
  ADD KEY `ix_profile_history_date` (`DATE_INSERT`);

--
-- Индексы таблицы `b_user_profile_record`
--
ALTER TABLE `b_user_profile_record`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_profile_record_history_field` (`HISTORY_ID`,`FIELD`);

--
-- Индексы таблицы `b_user_session`
--
ALTER TABLE `b_user_session`
  ADD PRIMARY KEY (`SESSION_ID`),
  ADD KEY `ix_user_session_time` (`TIMESTAMP_X`);

--
-- Индексы таблицы `b_user_stored_auth`
--
ALTER TABLE `b_user_stored_auth`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ux_user_hash` (`USER_ID`);

--
-- Индексы таблицы `b_utm_blog_comment`
--
ALTER TABLE `b_utm_blog_comment`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_utm_blog_comment_2` (`VALUE_ID`),
  ADD KEY `ix_utm_blog_comment_4` (`FIELD_ID`,`VALUE_ID`,`VALUE_INT`);

--
-- Индексы таблицы `b_utm_blog_post`
--
ALTER TABLE `b_utm_blog_post`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_utm_blog_post_2` (`VALUE_ID`),
  ADD KEY `ix_utm_blog_post_4` (`FIELD_ID`,`VALUE_ID`,`VALUE_INT`);

--
-- Индексы таблицы `b_utm_forum_message`
--
ALTER TABLE `b_utm_forum_message`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_utm_forum_message_2` (`VALUE_ID`),
  ADD KEY `ix_utm_forum_message_4` (`FIELD_ID`,`VALUE_ID`,`VALUE_INT`);

--
-- Индексы таблицы `b_uts_blog_comment`
--
ALTER TABLE `b_uts_blog_comment`
  ADD PRIMARY KEY (`VALUE_ID`);

--
-- Индексы таблицы `b_uts_blog_post`
--
ALTER TABLE `b_uts_blog_post`
  ADD PRIMARY KEY (`VALUE_ID`);

--
-- Индексы таблицы `b_uts_forum_message`
--
ALTER TABLE `b_uts_forum_message`
  ADD PRIMARY KEY (`VALUE_ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `b_admin_notify`
--
ALTER TABLE `b_admin_notify`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `b_admin_notify_lang`
--
ALTER TABLE `b_admin_notify_lang`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_agent`
--
ALTER TABLE `b_agent`
  MODIFY `ID` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT для таблицы `b_app_password`
--
ALTER TABLE `b_app_password`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_cache_clean_path`
--
ALTER TABLE `b_cache_clean_path`
  MODIFY `ID` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT для таблицы `b_cache_tag`
--
ALTER TABLE `b_cache_tag`
  MODIFY `ID` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_cars`
--
ALTER TABLE `b_cars`
  MODIFY `ID` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT для таблицы `b_checklist`
--
ALTER TABLE `b_checklist`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_component_params`
--
ALTER TABLE `b_component_params`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_composite_log`
--
ALTER TABLE `b_composite_log`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_composite_page`
--
ALTER TABLE `b_composite_page`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_consent_agreement`
--
ALTER TABLE `b_consent_agreement`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_consent_field`
--
ALTER TABLE `b_consent_field`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_consent_user_consent`
--
ALTER TABLE `b_consent_user_consent`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_consent_user_consent_item`
--
ALTER TABLE `b_consent_user_consent_item`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_culture`
--
ALTER TABLE `b_culture`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `b_event`
--
ALTER TABLE `b_event`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_event_log`
--
ALTER TABLE `b_event_log`
  MODIFY `ID` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `b_event_message`
--
ALTER TABLE `b_event_message`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT для таблицы `b_event_type`
--
ALTER TABLE `b_event_type`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT для таблицы `b_favorite`
--
ALTER TABLE `b_favorite`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_feature_flag_rule`
--
ALTER TABLE `b_feature_flag_rule`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_file`
--
ALTER TABLE `b_file`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_file_preview`
--
ALTER TABLE `b_file_preview`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_file_search`
--
ALTER TABLE `b_file_search`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_filters`
--
ALTER TABLE `b_filters`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_geoip_handlers`
--
ALTER TABLE `b_geoip_handlers`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `b_group`
--
ALTER TABLE `b_group`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `b_hlblock_entity`
--
ALTER TABLE `b_hlblock_entity`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `b_hlblock_entity_rights`
--
ALTER TABLE `b_hlblock_entity_rights`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_hot_keys`
--
ALTER TABLE `b_hot_keys`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `b_hot_keys_code`
--
ALTER TABLE `b_hot_keys_code`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT для таблицы `b_log_notification`
--
ALTER TABLE `b_log_notification`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_log_notification_action`
--
ALTER TABLE `b_log_notification_action`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_main_mail_blacklist`
--
ALTER TABLE `b_main_mail_blacklist`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_main_mail_sender`
--
ALTER TABLE `b_main_mail_sender`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_main_messenger_message`
--
ALTER TABLE `b_main_messenger_message`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_medialib_collection`
--
ALTER TABLE `b_medialib_collection`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_medialib_item`
--
ALTER TABLE `b_medialib_item`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_medialib_type`
--
ALTER TABLE `b_medialib_type`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `b_module_group`
--
ALTER TABLE `b_module_group`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_module_to_module`
--
ALTER TABLE `b_module_to_module`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=357;

--
-- AUTO_INCREMENT для таблицы `b_numerator`
--
ALTER TABLE `b_numerator`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_operation`
--
ALTER TABLE `b_operation`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT для таблицы `b_rating`
--
ALTER TABLE `b_rating`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `b_rating_component`
--
ALTER TABLE `b_rating_component`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rating_component_results`
--
ALTER TABLE `b_rating_component_results`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rating_results`
--
ALTER TABLE `b_rating_results`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rating_rule`
--
ALTER TABLE `b_rating_rule`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `b_rating_rule_vetting`
--
ALTER TABLE `b_rating_rule_vetting`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rating_user`
--
ALTER TABLE `b_rating_user`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `b_rating_vote`
--
ALTER TABLE `b_rating_vote`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rating_vote_group`
--
ALTER TABLE `b_rating_vote_group`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `b_rating_voting`
--
ALTER TABLE `b_rating_voting`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rating_voting_prepare`
--
ALTER TABLE `b_rating_voting_prepare`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rating_weight`
--
ALTER TABLE `b_rating_weight`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `b_security_sitecheck`
--
ALTER TABLE `b_security_sitecheck`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_sec_filter_mask`
--
ALTER TABLE `b_sec_filter_mask`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_sec_frame_mask`
--
ALTER TABLE `b_sec_frame_mask`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_sec_iprule`
--
ALTER TABLE `b_sec_iprule`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_sec_recovery_codes`
--
ALTER TABLE `b_sec_recovery_codes`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_sec_vendor_notification_sign`
--
ALTER TABLE `b_sec_vendor_notification_sign`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_sec_wwall_rules`
--
ALTER TABLE `b_sec_wwall_rules`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_sec_xscan_results`
--
ALTER TABLE `b_sec_xscan_results`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_short_uri`
--
ALTER TABLE `b_short_uri`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_sidepanel_toolbar`
--
ALTER TABLE `b_sidepanel_toolbar`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_sidepanel_toolbar_item`
--
ALTER TABLE `b_sidepanel_toolbar_item`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_site_template`
--
ALTER TABLE `b_site_template`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_smile`
--
ALTER TABLE `b_smile`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `b_smile_lang`
--
ALTER TABLE `b_smile_lang`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT для таблицы `b_smile_set`
--
ALTER TABLE `b_smile_set`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `b_sms_template`
--
ALTER TABLE `b_sms_template`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `b_sm_version_history`
--
ALTER TABLE `b_sm_version_history`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_statuses`
--
ALTER TABLE `b_statuses`
  MODIFY `ID` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `b_sticker`
--
ALTER TABLE `b_sticker`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_task`
--
ALTER TABLE `b_task`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT для таблицы `b_test_drives`
--
ALTER TABLE `b_test_drives`
  MODIFY `ID` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `b_ui_avatar_mask_access`
--
ALTER TABLE `b_ui_avatar_mask_access`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_ui_avatar_mask_file_deleted`
--
ALTER TABLE `b_ui_avatar_mask_file_deleted`
  MODIFY `ID` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_ui_avatar_mask_group`
--
ALTER TABLE `b_ui_avatar_mask_group`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_ui_avatar_mask_item`
--
ALTER TABLE `b_ui_avatar_mask_item`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_ui_avatar_mask_item_applied_to`
--
ALTER TABLE `b_ui_avatar_mask_item_applied_to`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_ui_avatar_mask_recently_used`
--
ALTER TABLE `b_ui_avatar_mask_recently_used`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_ui_entity_editor_config`
--
ALTER TABLE `b_ui_entity_editor_config`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_ui_entity_editor_config_ac`
--
ALTER TABLE `b_ui_entity_editor_config_ac`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_ui_file_uploader_temp_file`
--
ALTER TABLE `b_ui_file_uploader_temp_file`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_ui_file_uploader_temp_file_part`
--
ALTER TABLE `b_ui_file_uploader_temp_file_part`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_urlpreview_metadata`
--
ALTER TABLE `b_urlpreview_metadata`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_urlpreview_route`
--
ALTER TABLE `b_urlpreview_route`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `b_user`
--
ALTER TABLE `b_user`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `b_user_access`
--
ALTER TABLE `b_user_access`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `b_user_auth_action`
--
ALTER TABLE `b_user_auth_action`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `b_user_counter`
--
ALTER TABLE `b_user_counter`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_user_device`
--
ALTER TABLE `b_user_device`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_user_device_login`
--
ALTER TABLE `b_user_device_login`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_user_field`
--
ALTER TABLE `b_user_field`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `b_user_field_confirm`
--
ALTER TABLE `b_user_field_confirm`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_user_field_enum`
--
ALTER TABLE `b_user_field_enum`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_user_field_permission`
--
ALTER TABLE `b_user_field_permission`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_user_hit_auth`
--
ALTER TABLE `b_user_hit_auth`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_user_option`
--
ALTER TABLE `b_user_option`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `b_user_password`
--
ALTER TABLE `b_user_password`
  MODIFY `ID` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `b_user_profile_history`
--
ALTER TABLE `b_user_profile_history`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_user_profile_record`
--
ALTER TABLE `b_user_profile_record`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_user_stored_auth`
--
ALTER TABLE `b_user_stored_auth`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `b_utm_blog_comment`
--
ALTER TABLE `b_utm_blog_comment`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_utm_blog_post`
--
ALTER TABLE `b_utm_blog_post`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_utm_forum_message`
--
ALTER TABLE `b_utm_forum_message`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
