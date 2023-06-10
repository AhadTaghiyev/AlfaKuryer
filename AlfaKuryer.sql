-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost
-- Üretim Zamanı: 10 Haz 2023, 12:23:31
-- Sunucu sürümü: 8.0.33
-- PHP Sürümü: 8.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `AlfaKuryer`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Adresses`
--

CREATE TABLE `Adresses` (
  `Id` int NOT NULL,
  `UserAdres` longtext NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) NOT NULL,
  `ApplicationUserId` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `Adresses`
--

INSERT INTO `Adresses` (`Id`, `UserAdres`, `IsDeleted`, `CreatedAt`, `UpdatedAt`, `ApplicationUserId`) VALUES
(38, 'baku', 1, '2023-06-09 00:39:39.728690', '2023-06-09 20:06:36.735394', 'feb82fd5-8745-4e0a-bc81-d84ac388fbde'),
(39, 'Telnov baku', 1, '2023-06-09 15:21:28.243092', '2023-06-09 15:21:37.621746', 'def65824-c0a1-4077-a3a1-0e7e2a97f69d'),
(40, 'Telnov baku', 1, '2023-06-09 15:21:37.621729', '2023-06-09 15:22:39.915243', 'def65824-c0a1-4077-a3a1-0e7e2a97f69d'),
(41, 'Telnov baku', 1, '2023-06-09 15:22:39.915204', '2023-06-09 15:25:40.586403', 'def65824-c0a1-4077-a3a1-0e7e2a97f69d'),
(42, '222', 1, '2023-06-09 15:22:39.915243', '2023-06-09 15:25:40.586425', 'def65824-c0a1-4077-a3a1-0e7e2a97f69d'),
(43, 'Telnov baku', 0, '2023-06-09 15:25:40.586369', '0001-01-01 00:00:00.000000', 'def65824-c0a1-4077-a3a1-0e7e2a97f69d'),
(44, '222', 0, '2023-06-09 15:25:40.586403', '0001-01-01 00:00:00.000000', 'def65824-c0a1-4077-a3a1-0e7e2a97f69d'),
(45, 'baku', 0, '2023-06-09 20:06:36.735345', '0001-01-01 00:00:00.000000', 'feb82fd5-8745-4e0a-bc81-d84ac388fbde');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ApplicationUserDistricts`
--

CREATE TABLE `ApplicationUserDistricts` (
  `Id` int NOT NULL,
  `ApplicationUserId` varchar(255) NOT NULL,
  `DistrictId` int NOT NULL,
  `CityId` int DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `ApplicationUserDistricts`
--

INSERT INTO `ApplicationUserDistricts` (`Id`, `ApplicationUserId`, `DistrictId`, `CityId`, `IsDeleted`, `CreatedAt`, `UpdatedAt`) VALUES
(31, 'e0e54582-d696-442f-9514-6356dc585ea9', 2, NULL, 0, '2023-06-09 11:05:46.400535', '0001-01-01 00:00:00.000000'),
(32, '194ae339-73df-4d9c-b7d4-5877bbc900f3', 5, NULL, 0, '2023-06-09 11:06:25.163230', '0001-01-01 00:00:00.000000');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `AspNetRoleClaims`
--

CREATE TABLE `AspNetRoleClaims` (
  `Id` int NOT NULL,
  `RoleId` varchar(255) NOT NULL,
  `ClaimType` longtext,
  `ClaimValue` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `AspNetRoles`
--

CREATE TABLE `AspNetRoles` (
  `Id` varchar(255) NOT NULL,
  `Name` varchar(256) DEFAULT NULL,
  `NormalizedName` varchar(256) DEFAULT NULL,
  `ConcurrencyStamp` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `AspNetRoles`
--

INSERT INTO `AspNetRoles` (`Id`, `Name`, `NormalizedName`, `ConcurrencyStamp`) VALUES
('570e7c94-4247-4b71-83d2-12ad6592985c', 'User', 'USER', NULL),
('809ecbe9-1da6-43a2-ba5b-3a2adaa7fcb8', 'Company', 'COMPANY', NULL),
('80c0b8da-c843-487f-8c91-5da254298be0', 'Courier', 'COURIER', NULL),
('Cassir', 'Cassir', 'CASSIR', ''),
('ebab7aa3-fa29-41c2-a312-7022d89a5f22', 'SuperAdmin', 'SUPERADMIN', NULL),
('ecec189f-09aa-43d1-a6af-72a1f0b81a87', 'Admin', 'ADMIN', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `AspNetUserClaims`
--

CREATE TABLE `AspNetUserClaims` (
  `Id` int NOT NULL,
  `UserId` varchar(255) NOT NULL,
  `ClaimType` longtext,
  `ClaimValue` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `AspNetUserLogins`
--

CREATE TABLE `AspNetUserLogins` (
  `LoginProvider` varchar(255) NOT NULL,
  `ProviderKey` varchar(255) NOT NULL,
  `ProviderDisplayName` longtext,
  `UserId` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `AspNetUserRoles`
--

CREATE TABLE `AspNetUserRoles` (
  `UserId` varchar(255) NOT NULL,
  `RoleId` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `AspNetUserRoles`
--

INSERT INTO `AspNetUserRoles` (`UserId`, `RoleId`) VALUES
('feb82fd5-8745-4e0a-bc81-d84ac388fbde', '570e7c94-4247-4b71-83d2-12ad6592985c'),
('def65824-c0a1-4077-a3a1-0e7e2a97f69d', '809ecbe9-1da6-43a2-ba5b-3a2adaa7fcb8'),
('194ae339-73df-4d9c-b7d4-5877bbc900f3', '80c0b8da-c843-487f-8c91-5da254298be0'),
('e0e54582-d696-442f-9514-6356dc585ea9', '80c0b8da-c843-487f-8c91-5da254298be0'),
('92ea4c07-ad8c-4819-9f0f-46e698dda728', 'Cassir'),
('c18c4ee7-9bde-456d-a271-3496750f77eb', 'ebab7aa3-fa29-41c2-a312-7022d89a5f22'),
('dbe79108-af82-4752-a3a1-821da2fb7ac6', 'ebab7aa3-fa29-41c2-a312-7022d89a5f22');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `AspNetUsers`
--

CREATE TABLE `AspNetUsers` (
  `Id` varchar(255) NOT NULL,
  `Name` longtext NOT NULL,
  `Surname` longtext,
  `Birthday` datetime(6) NOT NULL,
  `Citizen` longtext,
  `DocumentNo` longtext,
  `Identification` longtext,
  `CompanyTin` longtext,
  `Status` tinyint(1) NOT NULL,
  `Role` longtext NOT NULL,
  `Adress` longtext,
  `CityId` int DEFAULT NULL,
  `UserName` varchar(256) DEFAULT NULL,
  `NormalizedUserName` varchar(256) DEFAULT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `NormalizedEmail` varchar(256) DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext,
  `SecurityStamp` longtext,
  `ConcurrencyStamp` longtext,
  `PhoneNumber` longtext,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int NOT NULL,
  `MessgaeBy` tinyint(1) DEFAULT NULL,
  `OtpCode` longtext,
  `AccountIsCompleet` tinyint(1) NOT NULL DEFAULT '0',
  `CourierSalaryForFast` double DEFAULT NULL,
  `CourierSalaryForSimple` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `AspNetUsers`
--

INSERT INTO `AspNetUsers` (`Id`, `Name`, `Surname`, `Birthday`, `Citizen`, `DocumentNo`, `Identification`, `CompanyTin`, `Status`, `Role`, `Adress`, `CityId`, `UserName`, `NormalizedUserName`, `Email`, `NormalizedEmail`, `EmailConfirmed`, `PasswordHash`, `SecurityStamp`, `ConcurrencyStamp`, `PhoneNumber`, `PhoneNumberConfirmed`, `TwoFactorEnabled`, `LockoutEnd`, `LockoutEnabled`, `AccessFailedCount`, `MessgaeBy`, `OtpCode`, `AccountIsCompleet`, `CourierSalaryForFast`, `CourierSalaryForSimple`) VALUES
('194ae339-73df-4d9c-b7d4-5877bbc900f3', 'Gence', 'Kuriyer', '0001-01-01 00:00:00.000000', NULL, NULL, NULL, NULL, 1, 'Courier', NULL, 2, 'A11059966', 'A11059966', 'Gence1@mail.ru', 'GENCE1@MAIL.RU', 1, 'AQAAAAIAAYagAAAAEMEiXgLbQFb9f34LSDd15ge6SRGgFfQndOzeuVVBiqqKq1h8YrIBXDdxmx5sB2LznA==', 'RSWBA5GXFTCANUGWY66UUFEXXWLNP3CT', 'fab1a122-e283-4fed-90b1-c08f6482e9d4', '994515619425', 0, 0, NULL, 1, 0, 0, NULL, 0, 2, 0.8),
('92ea4c07-ad8c-4819-9f0f-46e698dda728', 'Cassir', 'Cassir', '0001-01-01 00:00:00.000000', NULL, NULL, NULL, NULL, 1, 'Cassir', NULL, NULL, 'A57218725', 'A57218725', 'Cassir@mail.ru', 'CASSIR@MAIL.RU', 1, 'AQAAAAIAAYagAAAAEGHwpMSul+/ex300LbywYG6s3+lpEZNfW87sOyfShu+nkWsc1zMAIShrbsuCJg2NBA==', 'FSHFYKHZ6GHPC52MHPUPJIJX43HCVPT3', '209f52eb-ef70-4d99-a218-0e2afa8d9681', '994515619425', 0, 0, NULL, 1, 0, 0, NULL, 0, NULL, NULL),
('c18c4ee7-9bde-456d-a271-3496750f77eb', 'SeuperAdmin', 'SuperAdmin', '0001-01-01 00:00:00.000000', NULL, NULL, NULL, NULL, 1, 'SuperAdmin', NULL, NULL, 'A25853870', 'A25853870', 'Admin@alfa.az', 'ADMIN@ALFA.AZ', 1, 'AQAAAAIAAYagAAAAEBYEFqvxkM/20OEFJ40JG6yerTpLFAr5k46uVfOxVuj8jKTjwZkNZFi8RtXxZ7a8xw==', 'M7T45JNU52TJ6T7YIWITDGDGY3UDR6PG', '975afea4-a7c7-4cb8-8f01-596984895a7a', '994515619425', 0, 0, NULL, 1, 0, 0, NULL, 0, NULL, NULL),
('dbe79108-af82-4752-a3a1-821da2fb7ac6', 'SuperAdmin', 'SuperAdmin', '0001-01-01 00:00:00.000000', NULL, NULL, NULL, NULL, 1, 'SuperAdmin', NULL, NULL, 'A36131146', 'A36131146', 'Superadmin@alfa.az', 'SUPERADMIN@ALFA.AZ', 1, 'AQAAAAIAAYagAAAAEHoYlInqXZoKiZS8orPGR0VIgAuIbLAm5G4MTUheuJ6z8ptkZOukU0P3rv6OPprdxw==', '5JLWSQLD76Q5PH44PZYVYDXN4FKF74D5', 'b19c1621-df93-4b94-91fb-c3b962fa0da8', '994554444444', 0, 0, NULL, 1, 0, 0, NULL, 0, NULL, NULL),
('def65824-c0a1-4077-a3a1-0e7e2a97f69d', 'Test', NULL, '0001-01-01 00:00:00.000000', NULL, NULL, NULL, 'higkghi', 1, 'Company', NULL, NULL, 'A76023808', 'A76023808', 'taghiyev.ahad@gmail.com', 'TAGHIYEV.AHAD@GMAIL.COM', 1, 'AQAAAAIAAYagAAAAEFi2PpPh/9e06z12jR3Uv4Iro1nAuM4rpwVdV6JVNGzFvo3x7Slp0LBUH2INE7flxw==', 'XA7BB5B4TTNO37FUOY374EMQMASO33IK', 'f2fea7ab-2e1f-4bbb-a372-208a819fc9f7', '994515467654', 0, 0, NULL, 1, 0, 1, NULL, 1, NULL, NULL),
('e0e54582-d696-442f-9514-6356dc585ea9', 'Baki', 'Kuryer', '0001-01-01 00:00:00.000000', NULL, NULL, NULL, NULL, 1, 'Courier', NULL, 1, 'A25950695', 'A25950695', 'Baki@mail.ru', 'BAKI@MAIL.RU', 1, 'AQAAAAIAAYagAAAAEK8FeTZ6bwdgHzhQS2nA1sYAOoyh6UbCT7nEmOj8MmEEQyChFTPpkIqH0+n0+f5TlQ==', '5QDNCC2DCM7ZJW7ETY3VY3AR2FGV6TAK', 'a6fa2521-d78f-4571-8692-dd561f7088e7', '994515619425', 0, 0, NULL, 1, 0, 0, NULL, 0, 2, 0.8),
('feb82fd5-8745-4e0a-bc81-d84ac388fbde', 'Ahad', 'Taghiyev', '1999-02-06 00:00:00.000000', 'Aze', 'AA56475898', '7kjd22ss', NULL, 1, 'User', NULL, NULL, 'A66116268', 'A66116268', 'ahadvt@code.edu.az', 'AHADVT@CODE.EDU.AZ', 1, 'AQAAAAIAAYagAAAAEFNtVjiELOSRZB+/NvFzwi/HPnCpGXTXg1TPorL9tpPbO45WiDLp+iWq0BvivjWLNg==', 'FHYTTDYA2GV5QE5WLDCG6RM6ZSVQGM64', 'e021a70c-fdba-4fc2-a36d-cf65fe42046a', '994515619425', 0, 0, NULL, 1, 0, 1, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `AspNetUserTokens`
--

CREATE TABLE `AspNetUserTokens` (
  `UserId` varchar(255) NOT NULL,
  `LoginProvider` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `CassirBalances`
--

CREATE TABLE `CassirBalances` (
  `Id` int NOT NULL,
  `OrderNumber` int NOT NULL,
  `ApplicationUserId` varchar(255) NOT NULL,
  `IsCash` tinyint(1) NOT NULL,
  `IsFast` tinyint(1) NOT NULL,
  `OrderPrice` double NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `CassirBalances`
--

INSERT INTO `CassirBalances` (`Id`, `OrderNumber`, `ApplicationUserId`, `IsCash`, `IsFast`, `OrderPrice`, `IsDeleted`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 0, '92ea4c07-ad8c-4819-9f0f-46e698dda728', 0, 0, 6, 0, '2023-06-09 17:03:32.092178', '0001-01-01 00:00:00.000000'),
(2, 0, '92ea4c07-ad8c-4819-9f0f-46e698dda728', 1, 0, 6, 0, '2023-06-09 17:03:54.391137', '0001-01-01 00:00:00.000000'),
(3, 63, '92ea4c07-ad8c-4819-9f0f-46e698dda728', 0, 0, 6, 0, '2023-06-09 17:16:10.243228', '0001-01-01 00:00:00.000000');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Cities`
--

CREATE TABLE `Cities` (
  `Id` int NOT NULL,
  `Name` longtext NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `Cities`
--

INSERT INTO `Cities` (`Id`, `Name`, `IsDeleted`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 'Bakı', 0, '2023-06-01 15:49:03.508669', '2023-06-09 12:32:12.603909'),
(2, 'Gəncə', 0, '2023-06-01 15:49:09.720925', '2023-06-09 12:32:52.909551'),
(3, 'Lənkəran', 0, '2023-06-01 15:49:16.861417', '0001-01-01 00:00:00.000000'),
(4, 'Şamaxı', 0, '2023-06-01 20:27:41.456645', '0001-01-01 00:00:00.000000');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `CourierBalances`
--

CREATE TABLE `CourierBalances` (
  `Id` int NOT NULL,
  `CouruyerSalary` double NOT NULL,
  `ApplicationUserId` varchar(255) NOT NULL,
  `OrderId` int DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) NOT NULL,
  `IsCash` tinyint(1) NOT NULL DEFAULT '0',
  `IsFast` tinyint(1) NOT NULL DEFAULT '0',
  `OrderNumber` int NOT NULL DEFAULT '0',
  `OrderPrice` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `CourierBalances`
--

INSERT INTO `CourierBalances` (`Id`, `CouruyerSalary`, `ApplicationUserId`, `OrderId`, `IsDeleted`, `CreatedAt`, `UpdatedAt`, `IsCash`, `IsFast`, `OrderNumber`, `OrderPrice`) VALUES
(1, 0.8, 'e0e54582-d696-442f-9514-6356dc585ea9', NULL, 0, '2023-06-09 12:31:04.416606', '0001-01-01 00:00:00.000000', 1, 0, 57, 12),
(2, 0.8, 'e0e54582-d696-442f-9514-6356dc585ea9', NULL, 0, '2023-06-09 12:31:09.093890', '0001-01-01 00:00:00.000000', 1, 0, 59, 6),
(3, 0.8, 'e0e54582-d696-442f-9514-6356dc585ea9', NULL, 0, '2023-06-09 12:31:15.832881', '0001-01-01 00:00:00.000000', 1, 0, 58, 12),
(4, 0.8, 'e0e54582-d696-442f-9514-6356dc585ea9', NULL, 0, '2023-06-09 12:32:08.730217', '0001-01-01 00:00:00.000000', 1, 0, 59, 6),
(5, 0.8, '194ae339-73df-4d9c-b7d4-5877bbc900f3', NULL, 0, '2023-06-09 12:32:44.315763', '0001-01-01 00:00:00.000000', 1, 0, 57, 12),
(6, 0.8, '194ae339-73df-4d9c-b7d4-5877bbc900f3', NULL, 0, '2023-06-09 12:32:50.188257', '0001-01-01 00:00:00.000000', 1, 0, 58, 12);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Districts`
--

CREATE TABLE `Districts` (
  `Id` int NOT NULL,
  `Name` longtext NOT NULL,
  `CityId` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `Districts`
--

INSERT INTO `Districts` (`Id`, `Name`, `CityId`, `IsDeleted`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 'Nərimanov', 1, 0, '2023-06-01 15:49:24.752152', '0001-01-01 00:00:00.000000'),
(2, 'Gənclik', 1, 0, '2023-06-01 15:49:30.558987', '0001-01-01 00:00:00.000000'),
(3, 'Həzi Aslanov', 1, 0, '2023-06-01 15:49:37.221675', '0001-01-01 00:00:00.000000'),
(4, 'Əhmədli', 1, 0, '2023-06-01 20:28:03.121081', '0001-01-01 00:00:00.000000'),
(5, 'Gence', 2, 0, '2023-06-04 15:26:19.960791', '0001-01-01 00:00:00.000000');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Hangfire_AggregatedCounter`
--

CREATE TABLE `Hangfire_AggregatedCounter` (
  `Id` int NOT NULL,
  `Key` varchar(100) NOT NULL,
  `Value` int NOT NULL,
  `ExpireAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `Hangfire_AggregatedCounter`
--

INSERT INTO `Hangfire_AggregatedCounter` (`Id`, `Key`, `Value`, `ExpireAt`) VALUES
(1, 'stats:succeeded:2023-06-01', 13, '2023-07-01 18:01:58'),
(3, 'stats:succeeded', 216, NULL),
(25, 'stats:deleted:2023-06-02', 1, '2023-07-02 13:36:38'),
(27, 'stats:deleted', 2, NULL),
(28, 'stats:succeeded:2023-06-02', 9, '2023-07-02 15:15:40'),
(38, 'stats:succeeded:2023-06-03', 1, '2023-07-03 10:33:58'),
(41, 'stats:succeeded:2023-06-04', 63, '2023-07-04 17:29:57'),
(43, 'stats:deleted:2023-06-04', 2, '2023-07-04 10:33:24'),
(84, 'stats:succeeded:2023-06-06', 17, '2023-07-06 10:59:51'),
(100, 'stats:succeeded:2023-06-08', 51, '2023-07-08 21:11:49'),
(133, 'stats:succeeded:2023-06-09', 64, '2023-07-09 11:21:03'),
(150, 'stats:succeeded:2023-06-09-11', 1, '2023-06-10 11:21:03');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Hangfire_Counter`
--

CREATE TABLE `Hangfire_Counter` (
  `Id` int NOT NULL,
  `Key` varchar(100) NOT NULL,
  `Value` int NOT NULL,
  `ExpireAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Hangfire_DistributedLock`
--

CREATE TABLE `Hangfire_DistributedLock` (
  `Resource` varchar(100) NOT NULL,
  `CreatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Hangfire_Hash`
--

CREATE TABLE `Hangfire_Hash` (
  `Id` int NOT NULL,
  `Key` varchar(100) NOT NULL,
  `Field` varchar(40) NOT NULL,
  `Value` longtext,
  `ExpireAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Hangfire_Job`
--

CREATE TABLE `Hangfire_Job` (
  `Id` int NOT NULL,
  `StateId` int DEFAULT NULL,
  `StateName` varchar(20) DEFAULT NULL,
  `InvocationData` longtext NOT NULL,
  `Arguments` longtext NOT NULL,
  `CreatedAt` datetime NOT NULL,
  `ExpireAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `Hangfire_Job`
--

INSERT INTO `Hangfire_Job` (`Id`, `StateId`, `StateName`, `InvocationData`, `Arguments`, `CreatedAt`, `ExpireAt`) VALUES
(218, 1235, 'Succeeded', '{\"Type\":\"AlfaKuryer.Infrastucture.ExtornerlServices.MailService, AlfaKuryer.Infrastucture, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\",\"Method\":\"Send\",\"ParameterTypes\":\"[\\\"System.String, System.Private.CoreLib, Version=7.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\",\\\"System.String, System.Private.CoreLib, Version=7.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\",\\\"System.String, System.Private.CoreLib, Version=7.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"taghiyev.ahad@gmail.com\\\\\\\"\\\",\\\"\\\\\\\"https://localhost:7179/Account/VerfiyEmail?email=taghiyev.ahad%40gmail.com&token=CfDJ8Dx8NldnQlZMizZbHqWtIS2FkqEcTd934DGRl0r02ZX5Q88%2Bp0mrA%2BrB4n0MYEKAKGjW8SXcBD6Y6kt%2FRy1M4gC3bMdHX9YLisH3lLuzQyDhGWZEHwZbopbEdvMd15NqTve4%2BggggU0ePEoAmd7zF4iVbvn0GeFSVYr4lOTv58UvLoTOEtfaJVbjFV5bdx4BZy85O8Z%2B7aXy3UrGNcEJte6u%2FK29ZuLGy%2BhcXdHkrDSCFQx1AVfzj8nbSYzopHjNPw%3D%3D\\\\\\\"\\\",\\\"\\\\\\\"Test\\\\\\\"\\\"]\"}', '[\"\\\"taghiyev.ahad@gmail.com\\\"\",\"\\\"https://localhost:7179/Account/VerfiyEmail?email=taghiyev.ahad%40gmail.com&token=CfDJ8Dx8NldnQlZMizZbHqWtIS2FkqEcTd934DGRl0r02ZX5Q88%2Bp0mrA%2BrB4n0MYEKAKGjW8SXcBD6Y6kt%2FRy1M4gC3bMdHX9YLisH3lLuzQyDhGWZEHwZbopbEdvMd15NqTve4%2BggggU0ePEoAmd7zF4iVbvn0GeFSVYr4lOTv58UvLoTOEtfaJVbjFV5bdx4BZy85O8Z%2B7aXy3UrGNcEJte6u%2FK29ZuLGy%2BhcXdHkrDSCFQx1AVfzj8nbSYzopHjNPw%3D%3D\\\"\",\"\\\"Test\\\"\"]', '2023-06-09 11:20:39', '2023-06-10 11:21:03');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Hangfire_JobParameter`
--

CREATE TABLE `Hangfire_JobParameter` (
  `Id` int NOT NULL,
  `JobId` int NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `Hangfire_JobParameter`
--

INSERT INTO `Hangfire_JobParameter` (`Id`, `JobId`, `Name`, `Value`) VALUES
(1, 1, 'CurrentCulture', '\"en-US\"'),
(2, 1, 'CurrentUICulture', '\"en-US\"'),
(3, 2, 'CurrentCulture', '\"en-US\"'),
(4, 2, 'CurrentUICulture', '\"en-US\"'),
(5, 3, 'CurrentCulture', '\"az-AZ\"'),
(6, 3, 'CurrentUICulture', '\"az-AZ\"'),
(7, 4, 'CurrentCulture', '\"az-AZ\"'),
(8, 4, 'CurrentUICulture', '\"az-AZ\"'),
(9, 5, 'CurrentCulture', '\"az-AZ\"'),
(10, 5, 'CurrentUICulture', '\"az-AZ\"'),
(11, 6, 'CurrentCulture', '\"az-AZ\"'),
(12, 6, 'CurrentUICulture', '\"az-AZ\"'),
(13, 7, 'CurrentCulture', '\"az-AZ\"'),
(14, 7, 'CurrentUICulture', '\"az-AZ\"'),
(15, 8, 'CurrentCulture', '\"az-AZ\"'),
(16, 8, 'CurrentUICulture', '\"az-AZ\"'),
(17, 9, 'CurrentCulture', '\"az-AZ\"'),
(18, 9, 'CurrentUICulture', '\"az-AZ\"'),
(19, 10, 'CurrentCulture', '\"az-AZ\"'),
(20, 10, 'CurrentUICulture', '\"az-AZ\"'),
(21, 11, 'CurrentCulture', '\"az-AZ\"'),
(22, 11, 'CurrentUICulture', '\"az-AZ\"'),
(23, 12, 'CurrentCulture', '\"az-AZ\"'),
(24, 12, 'CurrentUICulture', '\"az-AZ\"'),
(25, 13, 'CurrentCulture', '\"az-AZ\"'),
(26, 13, 'CurrentUICulture', '\"az-AZ\"'),
(27, 14, 'CurrentCulture', '\"az-AZ\"'),
(28, 14, 'CurrentUICulture', '\"az-AZ\"'),
(29, 15, 'CurrentCulture', '\"az-AZ\"'),
(30, 15, 'CurrentUICulture', '\"az-AZ\"'),
(31, 16, 'CurrentCulture', '\"az-AZ\"'),
(32, 16, 'CurrentUICulture', '\"az-AZ\"'),
(33, 17, 'CurrentCulture', '\"az-AZ\"'),
(34, 17, 'CurrentUICulture', '\"az-AZ\"'),
(35, 18, 'CurrentCulture', '\"az-AZ\"'),
(36, 18, 'CurrentUICulture', '\"az-AZ\"'),
(37, 19, 'CurrentCulture', '\"az-AZ\"'),
(38, 19, 'CurrentUICulture', '\"az-AZ\"'),
(39, 20, 'CurrentCulture', '\"az-AZ\"'),
(40, 20, 'CurrentUICulture', '\"az-AZ\"'),
(41, 21, 'CurrentCulture', '\"az-AZ\"'),
(42, 21, 'CurrentUICulture', '\"az-AZ\"'),
(43, 22, 'CurrentCulture', '\"az-AZ\"'),
(44, 22, 'CurrentUICulture', '\"az-AZ\"'),
(45, 23, 'CurrentCulture', '\"az-AZ\"'),
(46, 23, 'CurrentUICulture', '\"az-AZ\"'),
(47, 24, 'CurrentCulture', '\"az-AZ\"'),
(48, 24, 'CurrentUICulture', '\"az-AZ\"'),
(49, 25, 'CurrentCulture', '\"az-AZ\"'),
(50, 25, 'CurrentUICulture', '\"az-AZ\"'),
(51, 26, 'CurrentCulture', '\"az-AZ\"'),
(52, 26, 'CurrentUICulture', '\"az-AZ\"'),
(53, 27, 'CurrentCulture', '\"az-AZ\"'),
(54, 27, 'CurrentUICulture', '\"az-AZ\"'),
(55, 28, 'CurrentCulture', '\"az-AZ\"'),
(56, 28, 'CurrentUICulture', '\"az-AZ\"'),
(57, 29, 'CurrentCulture', '\"az-AZ\"'),
(58, 29, 'CurrentUICulture', '\"az-AZ\"'),
(59, 30, 'CurrentCulture', '\"az-AZ\"'),
(60, 30, 'CurrentUICulture', '\"az-AZ\"'),
(61, 31, 'CurrentCulture', '\"az-AZ\"'),
(62, 31, 'CurrentUICulture', '\"az-AZ\"'),
(63, 32, 'CurrentCulture', '\"az-AZ\"'),
(64, 32, 'CurrentUICulture', '\"az-AZ\"'),
(65, 33, 'CurrentCulture', '\"az-AZ\"'),
(66, 33, 'CurrentUICulture', '\"az-AZ\"'),
(67, 34, 'CurrentCulture', '\"az-AZ\"'),
(68, 34, 'CurrentUICulture', '\"az-AZ\"'),
(69, 35, 'CurrentCulture', '\"az-AZ\"'),
(70, 35, 'CurrentUICulture', '\"az-AZ\"'),
(71, 36, 'CurrentCulture', '\"az-AZ\"'),
(72, 36, 'CurrentUICulture', '\"az-AZ\"'),
(73, 37, 'CurrentCulture', '\"az-AZ\"'),
(74, 37, 'CurrentUICulture', '\"az-AZ\"'),
(75, 38, 'CurrentCulture', '\"az-AZ\"'),
(76, 38, 'CurrentUICulture', '\"az-AZ\"'),
(77, 39, 'CurrentCulture', '\"az-AZ\"'),
(78, 39, 'CurrentUICulture', '\"az-AZ\"'),
(79, 40, 'CurrentCulture', '\"az-AZ\"'),
(80, 40, 'CurrentUICulture', '\"az-AZ\"'),
(81, 41, 'CurrentCulture', '\"az-AZ\"'),
(82, 41, 'CurrentUICulture', '\"az-AZ\"'),
(83, 42, 'CurrentCulture', '\"az-AZ\"'),
(84, 42, 'CurrentUICulture', '\"az-AZ\"'),
(85, 43, 'CurrentCulture', '\"az-AZ\"'),
(86, 43, 'CurrentUICulture', '\"az-AZ\"'),
(87, 44, 'CurrentCulture', '\"az-AZ\"'),
(88, 44, 'CurrentUICulture', '\"az-AZ\"'),
(89, 45, 'CurrentCulture', '\"az-AZ\"'),
(90, 45, 'CurrentUICulture', '\"az-AZ\"'),
(91, 46, 'CurrentCulture', '\"az-AZ\"'),
(92, 46, 'CurrentUICulture', '\"az-AZ\"'),
(93, 47, 'CurrentCulture', '\"az-AZ\"'),
(94, 47, 'CurrentUICulture', '\"az-AZ\"'),
(95, 48, 'CurrentCulture', '\"az-AZ\"'),
(96, 48, 'CurrentUICulture', '\"az-AZ\"'),
(97, 49, 'CurrentCulture', '\"az-AZ\"'),
(98, 49, 'CurrentUICulture', '\"az-AZ\"'),
(99, 50, 'CurrentCulture', '\"az-AZ\"'),
(100, 50, 'CurrentUICulture', '\"az-AZ\"'),
(101, 51, 'CurrentCulture', '\"az-AZ\"'),
(102, 51, 'CurrentUICulture', '\"az-AZ\"'),
(103, 52, 'CurrentCulture', '\"az-AZ\"'),
(104, 52, 'CurrentUICulture', '\"az-AZ\"'),
(105, 53, 'CurrentCulture', '\"az-AZ\"'),
(106, 53, 'CurrentUICulture', '\"az-AZ\"'),
(107, 53, 'RetryCount', '3'),
(110, 54, 'CurrentCulture', '\"az-AZ\"'),
(111, 54, 'CurrentUICulture', '\"az-AZ\"'),
(112, 55, 'CurrentCulture', '\"az-AZ\"'),
(113, 55, 'CurrentUICulture', '\"az-AZ\"'),
(114, 56, 'CurrentCulture', '\"az-AZ\"'),
(115, 56, 'CurrentUICulture', '\"az-AZ\"'),
(116, 56, 'RetryCount', '1'),
(117, 57, 'CurrentCulture', '\"az-AZ\"'),
(118, 57, 'CurrentUICulture', '\"az-AZ\"'),
(119, 58, 'CurrentCulture', '\"az-AZ\"'),
(120, 58, 'CurrentUICulture', '\"az-AZ\"'),
(121, 59, 'CurrentCulture', '\"az-AZ\"'),
(122, 59, 'CurrentUICulture', '\"az-AZ\"'),
(123, 60, 'CurrentCulture', '\"az-AZ\"'),
(124, 60, 'CurrentUICulture', '\"az-AZ\"'),
(125, 61, 'CurrentCulture', '\"az-AZ\"'),
(126, 61, 'CurrentUICulture', '\"az-AZ\"'),
(127, 62, 'CurrentCulture', '\"az-AZ\"'),
(128, 62, 'CurrentUICulture', '\"az-AZ\"'),
(129, 63, 'CurrentCulture', '\"az-AZ\"'),
(130, 63, 'CurrentUICulture', '\"az-AZ\"'),
(131, 64, 'CurrentCulture', '\"az-AZ\"'),
(132, 64, 'CurrentUICulture', '\"az-AZ\"'),
(133, 65, 'CurrentCulture', '\"az-AZ\"'),
(134, 65, 'CurrentUICulture', '\"az-AZ\"'),
(135, 66, 'CurrentCulture', '\"az-AZ\"'),
(136, 66, 'CurrentUICulture', '\"az-AZ\"'),
(137, 67, 'CurrentCulture', '\"az-AZ\"'),
(138, 67, 'CurrentUICulture', '\"az-AZ\"'),
(139, 68, 'CurrentCulture', '\"az-AZ\"'),
(140, 68, 'CurrentUICulture', '\"az-AZ\"'),
(141, 69, 'CurrentCulture', '\"az-AZ\"'),
(142, 69, 'CurrentUICulture', '\"az-AZ\"'),
(143, 70, 'CurrentCulture', '\"az-AZ\"'),
(144, 70, 'CurrentUICulture', '\"az-AZ\"'),
(145, 71, 'CurrentCulture', '\"az-AZ\"'),
(146, 71, 'CurrentUICulture', '\"az-AZ\"'),
(147, 72, 'CurrentCulture', '\"az-AZ\"'),
(148, 72, 'CurrentUICulture', '\"az-AZ\"'),
(149, 73, 'CurrentCulture', '\"az-AZ\"'),
(150, 73, 'CurrentUICulture', '\"az-AZ\"'),
(151, 74, 'CurrentCulture', '\"az-AZ\"'),
(152, 74, 'CurrentUICulture', '\"az-AZ\"'),
(153, 75, 'CurrentCulture', '\"az-AZ\"'),
(154, 75, 'CurrentUICulture', '\"az-AZ\"'),
(155, 76, 'CurrentCulture', '\"az-AZ\"'),
(156, 76, 'CurrentUICulture', '\"az-AZ\"'),
(157, 77, 'CurrentCulture', '\"az-AZ\"'),
(158, 77, 'CurrentUICulture', '\"az-AZ\"'),
(159, 78, 'CurrentCulture', '\"az-AZ\"'),
(160, 78, 'CurrentUICulture', '\"az-AZ\"'),
(161, 79, 'CurrentCulture', '\"az-AZ\"'),
(162, 79, 'CurrentUICulture', '\"az-AZ\"'),
(163, 80, 'CurrentCulture', '\"az-AZ\"'),
(164, 80, 'CurrentUICulture', '\"az-AZ\"'),
(165, 81, 'CurrentCulture', '\"az-AZ\"'),
(166, 81, 'CurrentUICulture', '\"az-AZ\"'),
(167, 82, 'CurrentCulture', '\"az-AZ\"'),
(168, 82, 'CurrentUICulture', '\"az-AZ\"'),
(169, 83, 'CurrentCulture', '\"az-AZ\"'),
(170, 83, 'CurrentUICulture', '\"az-AZ\"'),
(171, 84, 'CurrentCulture', '\"az-AZ\"'),
(172, 84, 'CurrentUICulture', '\"az-AZ\"'),
(173, 85, 'CurrentCulture', '\"az-AZ\"'),
(174, 85, 'CurrentUICulture', '\"az-AZ\"'),
(175, 86, 'CurrentCulture', '\"az-AZ\"'),
(176, 86, 'CurrentUICulture', '\"az-AZ\"'),
(177, 87, 'CurrentCulture', '\"az-AZ\"'),
(178, 87, 'CurrentUICulture', '\"az-AZ\"'),
(179, 88, 'CurrentCulture', '\"az-AZ\"'),
(180, 88, 'CurrentUICulture', '\"az-AZ\"'),
(181, 89, 'CurrentCulture', '\"az-AZ\"'),
(182, 89, 'CurrentUICulture', '\"az-AZ\"'),
(183, 90, 'CurrentCulture', '\"az-AZ\"'),
(184, 90, 'CurrentUICulture', '\"az-AZ\"'),
(185, 91, 'CurrentCulture', '\"az-AZ\"'),
(186, 91, 'CurrentUICulture', '\"az-AZ\"'),
(187, 92, 'CurrentCulture', '\"az-AZ\"'),
(188, 92, 'CurrentUICulture', '\"az-AZ\"'),
(189, 93, 'CurrentCulture', '\"az-AZ\"'),
(190, 93, 'CurrentUICulture', '\"az-AZ\"'),
(191, 94, 'CurrentCulture', '\"az-AZ\"'),
(192, 94, 'CurrentUICulture', '\"az-AZ\"'),
(193, 95, 'CurrentCulture', '\"az-AZ\"'),
(194, 95, 'CurrentUICulture', '\"az-AZ\"'),
(195, 96, 'CurrentCulture', '\"az-AZ\"'),
(196, 96, 'CurrentUICulture', '\"az-AZ\"'),
(197, 97, 'CurrentCulture', '\"az-AZ\"'),
(198, 97, 'CurrentUICulture', '\"az-AZ\"'),
(199, 98, 'CurrentCulture', '\"az-AZ\"'),
(200, 98, 'CurrentUICulture', '\"az-AZ\"'),
(201, 99, 'CurrentCulture', '\"az-AZ\"'),
(202, 99, 'CurrentUICulture', '\"az-AZ\"'),
(203, 100, 'CurrentCulture', '\"az-AZ\"'),
(204, 100, 'CurrentUICulture', '\"az-AZ\"'),
(205, 101, 'CurrentCulture', '\"az-AZ\"'),
(206, 101, 'CurrentUICulture', '\"az-AZ\"'),
(207, 102, 'CurrentCulture', '\"az-AZ\"'),
(208, 102, 'CurrentUICulture', '\"az-AZ\"'),
(209, 103, 'CurrentCulture', '\"az-AZ\"'),
(210, 103, 'CurrentUICulture', '\"az-AZ\"'),
(211, 104, 'CurrentCulture', '\"az-AZ\"'),
(212, 104, 'CurrentUICulture', '\"az-AZ\"'),
(213, 105, 'CurrentCulture', '\"az-AZ\"'),
(214, 105, 'CurrentUICulture', '\"az-AZ\"'),
(215, 106, 'CurrentCulture', '\"az-AZ\"'),
(216, 106, 'CurrentUICulture', '\"az-AZ\"'),
(217, 107, 'CurrentCulture', '\"az-AZ\"'),
(218, 107, 'CurrentUICulture', '\"az-AZ\"'),
(219, 108, 'CurrentCulture', '\"az-AZ\"'),
(220, 108, 'CurrentUICulture', '\"az-AZ\"'),
(221, 105, 'RetryCount', '9'),
(222, 106, 'RetryCount', '9'),
(223, 104, 'RetryCount', '7'),
(224, 107, 'RetryCount', '9'),
(229, 108, 'RetryCount', '7'),
(259, 109, 'CurrentCulture', '\"az-AZ\"'),
(260, 109, 'CurrentUICulture', '\"az-AZ\"'),
(264, 110, 'CurrentCulture', '\"az-AZ\"'),
(265, 110, 'CurrentUICulture', '\"az-AZ\"'),
(266, 110, 'RetryCount', '2'),
(268, 111, 'CurrentCulture', '\"az-AZ\"'),
(269, 111, 'CurrentUICulture', '\"az-AZ\"'),
(270, 112, 'CurrentCulture', '\"az-AZ\"'),
(271, 112, 'CurrentUICulture', '\"az-AZ\"'),
(272, 113, 'CurrentCulture', '\"az-AZ\"'),
(273, 113, 'CurrentUICulture', '\"az-AZ\"'),
(274, 114, 'CurrentCulture', '\"az-AZ\"'),
(275, 114, 'CurrentUICulture', '\"az-AZ\"'),
(276, 115, 'CurrentCulture', '\"az-AZ\"'),
(277, 115, 'CurrentUICulture', '\"az-AZ\"'),
(278, 116, 'CurrentCulture', '\"az-AZ\"'),
(279, 116, 'CurrentUICulture', '\"az-AZ\"'),
(280, 117, 'CurrentCulture', '\"az-AZ\"'),
(281, 117, 'CurrentUICulture', '\"az-AZ\"'),
(282, 118, 'CurrentCulture', '\"az-AZ\"'),
(283, 118, 'CurrentUICulture', '\"az-AZ\"'),
(284, 119, 'CurrentCulture', '\"az-AZ\"'),
(285, 119, 'CurrentUICulture', '\"az-AZ\"'),
(286, 120, 'CurrentCulture', '\"az-AZ\"'),
(287, 120, 'CurrentUICulture', '\"az-AZ\"'),
(288, 121, 'CurrentCulture', '\"az-AZ\"'),
(289, 121, 'CurrentUICulture', '\"az-AZ\"'),
(290, 122, 'CurrentCulture', '\"az-AZ\"'),
(291, 122, 'CurrentUICulture', '\"az-AZ\"'),
(292, 120, 'RetryCount', '1'),
(293, 119, 'RetryCount', '1'),
(294, 123, 'CurrentCulture', '\"az-AZ\"'),
(295, 123, 'CurrentUICulture', '\"az-AZ\"'),
(296, 124, 'CurrentCulture', '\"az-AZ\"'),
(297, 124, 'CurrentUICulture', '\"az-AZ\"'),
(298, 125, 'CurrentCulture', '\"az-AZ\"'),
(299, 125, 'CurrentUICulture', '\"az-AZ\"'),
(300, 125, 'RetryCount', '1'),
(301, 126, 'CurrentCulture', '\"az-AZ\"'),
(302, 126, 'CurrentUICulture', '\"az-AZ\"'),
(303, 127, 'CurrentCulture', '\"az-AZ\"'),
(304, 127, 'CurrentUICulture', '\"az-AZ\"'),
(305, 128, 'CurrentCulture', '\"az-AZ\"'),
(306, 128, 'CurrentUICulture', '\"az-AZ\"'),
(307, 129, 'CurrentCulture', '\"az-AZ\"'),
(308, 129, 'CurrentUICulture', '\"az-AZ\"'),
(309, 129, 'RetryCount', '1'),
(310, 130, 'CurrentCulture', '\"az-AZ\"'),
(311, 130, 'CurrentUICulture', '\"az-AZ\"'),
(312, 131, 'CurrentCulture', '\"az-AZ\"'),
(313, 131, 'CurrentUICulture', '\"az-AZ\"'),
(314, 132, 'CurrentCulture', '\"az-AZ\"'),
(315, 132, 'CurrentUICulture', '\"az-AZ\"'),
(316, 133, 'CurrentCulture', '\"az-AZ\"'),
(317, 133, 'CurrentUICulture', '\"az-AZ\"'),
(318, 134, 'CurrentCulture', '\"az-AZ\"'),
(319, 134, 'CurrentUICulture', '\"az-AZ\"'),
(320, 135, 'CurrentCulture', '\"az-AZ\"'),
(321, 135, 'CurrentUICulture', '\"az-AZ\"'),
(322, 136, 'CurrentCulture', '\"az-AZ\"'),
(323, 136, 'CurrentUICulture', '\"az-AZ\"'),
(324, 131, 'RetryCount', '3'),
(326, 136, 'RetryCount', '2'),
(327, 137, 'CurrentCulture', '\"az-AZ\"'),
(328, 137, 'CurrentUICulture', '\"az-AZ\"'),
(329, 138, 'CurrentCulture', '\"az-AZ\"'),
(330, 138, 'CurrentUICulture', '\"az-AZ\"'),
(331, 139, 'CurrentCulture', '\"az-AZ\"'),
(332, 139, 'CurrentUICulture', '\"az-AZ\"'),
(333, 140, 'CurrentCulture', '\"az-AZ\"'),
(334, 140, 'CurrentUICulture', '\"az-AZ\"'),
(335, 141, 'CurrentCulture', '\"az-AZ\"'),
(336, 141, 'CurrentUICulture', '\"az-AZ\"'),
(339, 142, 'CurrentCulture', '\"az-AZ\"'),
(340, 142, 'CurrentUICulture', '\"az-AZ\"'),
(341, 143, 'CurrentCulture', '\"az-AZ\"'),
(342, 143, 'CurrentUICulture', '\"az-AZ\"'),
(343, 144, 'CurrentCulture', '\"az-AZ\"'),
(344, 144, 'CurrentUICulture', '\"az-AZ\"'),
(345, 145, 'CurrentCulture', '\"az-AZ\"'),
(346, 145, 'CurrentUICulture', '\"az-AZ\"'),
(347, 146, 'CurrentCulture', '\"az-AZ\"'),
(348, 146, 'CurrentUICulture', '\"az-AZ\"'),
(349, 147, 'CurrentCulture', '\"az-AZ\"'),
(350, 147, 'CurrentUICulture', '\"az-AZ\"'),
(351, 148, 'CurrentCulture', '\"az-AZ\"'),
(352, 148, 'CurrentUICulture', '\"az-AZ\"'),
(353, 146, 'RetryCount', '1'),
(354, 149, 'CurrentCulture', '\"az-AZ\"'),
(355, 149, 'CurrentUICulture', '\"az-AZ\"'),
(356, 150, 'CurrentCulture', '\"az-AZ\"'),
(357, 150, 'CurrentUICulture', '\"az-AZ\"'),
(358, 151, 'CurrentCulture', '\"az-AZ\"'),
(359, 151, 'CurrentUICulture', '\"az-AZ\"'),
(360, 152, 'CurrentCulture', '\"az-AZ\"'),
(361, 152, 'CurrentUICulture', '\"az-AZ\"'),
(362, 153, 'CurrentCulture', '\"az-AZ\"'),
(363, 153, 'CurrentUICulture', '\"az-AZ\"'),
(364, 154, 'CurrentCulture', '\"az-AZ\"'),
(365, 154, 'CurrentUICulture', '\"az-AZ\"'),
(366, 155, 'CurrentCulture', '\"az-AZ\"'),
(367, 155, 'CurrentUICulture', '\"az-AZ\"'),
(368, 156, 'CurrentCulture', '\"az-AZ\"'),
(369, 156, 'CurrentUICulture', '\"az-AZ\"'),
(370, 157, 'CurrentCulture', '\"az-AZ\"'),
(371, 157, 'CurrentUICulture', '\"az-AZ\"'),
(372, 158, 'CurrentCulture', '\"az-AZ\"'),
(373, 158, 'CurrentUICulture', '\"az-AZ\"'),
(374, 159, 'CurrentCulture', '\"az-AZ\"'),
(375, 159, 'CurrentUICulture', '\"az-AZ\"'),
(376, 160, 'CurrentCulture', '\"az-AZ\"'),
(377, 160, 'CurrentUICulture', '\"az-AZ\"'),
(378, 161, 'CurrentCulture', '\"az-AZ\"'),
(379, 161, 'CurrentUICulture', '\"az-AZ\"'),
(380, 162, 'CurrentCulture', '\"az-AZ\"'),
(381, 162, 'CurrentUICulture', '\"az-AZ\"'),
(382, 163, 'CurrentCulture', '\"az-AZ\"'),
(383, 163, 'CurrentUICulture', '\"az-AZ\"'),
(384, 164, 'CurrentCulture', '\"az-AZ\"'),
(385, 164, 'CurrentUICulture', '\"az-AZ\"'),
(386, 165, 'CurrentCulture', '\"az-AZ\"'),
(387, 165, 'CurrentUICulture', '\"az-AZ\"'),
(388, 166, 'CurrentCulture', '\"az-AZ\"'),
(389, 166, 'CurrentUICulture', '\"az-AZ\"'),
(390, 167, 'CurrentCulture', '\"az-AZ\"'),
(391, 167, 'CurrentUICulture', '\"az-AZ\"'),
(392, 168, 'CurrentCulture', '\"az-AZ\"'),
(393, 168, 'CurrentUICulture', '\"az-AZ\"'),
(394, 169, 'CurrentCulture', '\"az-AZ\"'),
(395, 169, 'CurrentUICulture', '\"az-AZ\"'),
(396, 170, 'CurrentCulture', '\"az-AZ\"'),
(397, 170, 'CurrentUICulture', '\"az-AZ\"'),
(398, 171, 'CurrentCulture', '\"az-AZ\"'),
(399, 171, 'CurrentUICulture', '\"az-AZ\"'),
(400, 172, 'CurrentCulture', '\"az-AZ\"'),
(401, 172, 'CurrentUICulture', '\"az-AZ\"'),
(402, 173, 'CurrentCulture', '\"az-AZ\"'),
(403, 173, 'CurrentUICulture', '\"az-AZ\"'),
(404, 174, 'CurrentCulture', '\"az-AZ\"'),
(405, 174, 'CurrentUICulture', '\"az-AZ\"'),
(406, 175, 'CurrentCulture', '\"az-AZ\"'),
(407, 175, 'CurrentUICulture', '\"az-AZ\"'),
(408, 159, 'RetryCount', '2'),
(409, 160, 'RetryCount', '1'),
(410, 161, 'RetryCount', '1'),
(411, 164, 'RetryCount', '1'),
(412, 165, 'RetryCount', '2'),
(413, 167, 'RetryCount', '2'),
(414, 173, 'RetryCount', '1'),
(415, 175, 'RetryCount', '1'),
(416, 174, 'RetryCount', '1'),
(419, 176, 'CurrentCulture', '\"az-AZ\"'),
(420, 176, 'CurrentUICulture', '\"az-AZ\"'),
(421, 177, 'CurrentCulture', '\"az-AZ\"'),
(422, 177, 'CurrentUICulture', '\"az-AZ\"'),
(423, 178, 'CurrentCulture', '\"az-AZ\"'),
(424, 178, 'CurrentUICulture', '\"az-AZ\"'),
(425, 179, 'CurrentCulture', '\"az-AZ\"'),
(426, 179, 'CurrentUICulture', '\"az-AZ\"'),
(427, 180, 'CurrentCulture', '\"az-AZ\"'),
(428, 180, 'CurrentUICulture', '\"az-AZ\"'),
(429, 181, 'CurrentCulture', '\"az-AZ\"'),
(430, 181, 'CurrentUICulture', '\"az-AZ\"'),
(431, 182, 'CurrentCulture', '\"az-AZ\"'),
(432, 182, 'CurrentUICulture', '\"az-AZ\"'),
(433, 183, 'CurrentCulture', '\"az-AZ\"'),
(434, 183, 'CurrentUICulture', '\"az-AZ\"'),
(435, 184, 'CurrentCulture', '\"az-AZ\"'),
(436, 184, 'CurrentUICulture', '\"az-AZ\"'),
(437, 184, 'RetryCount', '3'),
(438, 182, 'RetryCount', '1'),
(439, 183, 'RetryCount', '2'),
(440, 181, 'RetryCount', '1'),
(445, 185, 'CurrentCulture', '\"az-AZ\"'),
(446, 185, 'CurrentUICulture', '\"az-AZ\"'),
(447, 186, 'CurrentCulture', '\"az-AZ\"'),
(448, 186, 'CurrentUICulture', '\"az-AZ\"'),
(449, 187, 'CurrentCulture', '\"az-AZ\"'),
(450, 187, 'CurrentUICulture', '\"az-AZ\"'),
(451, 188, 'CurrentCulture', '\"az-AZ\"'),
(452, 188, 'CurrentUICulture', '\"az-AZ\"'),
(453, 189, 'CurrentCulture', '\"az-AZ\"'),
(454, 189, 'CurrentUICulture', '\"az-AZ\"'),
(455, 190, 'CurrentCulture', '\"az-AZ\"'),
(456, 190, 'CurrentUICulture', '\"az-AZ\"'),
(457, 191, 'CurrentCulture', '\"az-AZ\"'),
(458, 191, 'CurrentUICulture', '\"az-AZ\"'),
(459, 192, 'CurrentCulture', '\"az-AZ\"'),
(460, 192, 'CurrentUICulture', '\"az-AZ\"'),
(461, 193, 'CurrentCulture', '\"az-AZ\"'),
(462, 193, 'CurrentUICulture', '\"az-AZ\"'),
(463, 189, 'RetryCount', '1'),
(464, 193, 'RetryCount', '1'),
(465, 194, 'CurrentCulture', '\"az-AZ\"'),
(466, 194, 'CurrentUICulture', '\"az-AZ\"'),
(467, 195, 'CurrentCulture', '\"az-AZ\"'),
(468, 195, 'CurrentUICulture', '\"az-AZ\"'),
(469, 196, 'CurrentCulture', '\"az-AZ\"'),
(470, 196, 'CurrentUICulture', '\"az-AZ\"'),
(471, 197, 'CurrentCulture', '\"az-AZ\"'),
(472, 197, 'CurrentUICulture', '\"az-AZ\"'),
(473, 198, 'CurrentCulture', '\"az-AZ\"'),
(474, 198, 'CurrentUICulture', '\"az-AZ\"'),
(475, 199, 'CurrentCulture', '\"az-AZ\"'),
(476, 199, 'CurrentUICulture', '\"az-AZ\"'),
(477, 200, 'CurrentCulture', '\"az-AZ\"'),
(478, 200, 'CurrentUICulture', '\"az-AZ\"'),
(479, 201, 'CurrentCulture', '\"az-AZ\"'),
(480, 201, 'CurrentUICulture', '\"az-AZ\"'),
(481, 202, 'CurrentCulture', '\"az-AZ\"'),
(482, 202, 'CurrentUICulture', '\"az-AZ\"'),
(483, 203, 'CurrentCulture', '\"az-AZ\"'),
(484, 203, 'CurrentUICulture', '\"az-AZ\"'),
(485, 204, 'CurrentCulture', '\"az-AZ\"'),
(486, 204, 'CurrentUICulture', '\"az-AZ\"'),
(487, 205, 'CurrentCulture', '\"az-AZ\"'),
(488, 205, 'CurrentUICulture', '\"az-AZ\"'),
(489, 206, 'CurrentCulture', '\"az-AZ\"'),
(490, 206, 'CurrentUICulture', '\"az-AZ\"'),
(491, 207, 'CurrentCulture', '\"az-AZ\"'),
(492, 207, 'CurrentUICulture', '\"az-AZ\"'),
(493, 208, 'CurrentCulture', '\"az-AZ\"'),
(494, 208, 'CurrentUICulture', '\"az-AZ\"'),
(495, 209, 'CurrentCulture', '\"az-AZ\"'),
(496, 209, 'CurrentUICulture', '\"az-AZ\"'),
(497, 210, 'CurrentCulture', '\"az-AZ\"'),
(498, 210, 'CurrentUICulture', '\"az-AZ\"'),
(499, 211, 'CurrentCulture', '\"az-AZ\"'),
(500, 211, 'CurrentUICulture', '\"az-AZ\"'),
(501, 212, 'CurrentCulture', '\"az-AZ\"'),
(502, 212, 'CurrentUICulture', '\"az-AZ\"'),
(503, 213, 'CurrentCulture', '\"az-AZ\"'),
(504, 213, 'CurrentUICulture', '\"az-AZ\"'),
(505, 214, 'CurrentCulture', '\"az-AZ\"'),
(506, 214, 'CurrentUICulture', '\"az-AZ\"'),
(507, 215, 'CurrentCulture', '\"az-AZ\"'),
(508, 215, 'CurrentUICulture', '\"az-AZ\"'),
(509, 216, 'CurrentCulture', '\"az-AZ\"'),
(510, 216, 'CurrentUICulture', '\"az-AZ\"'),
(511, 217, 'CurrentCulture', '\"az-AZ\"'),
(512, 217, 'CurrentUICulture', '\"az-AZ\"'),
(513, 207, 'RetryCount', '1'),
(514, 208, 'RetryCount', '1'),
(515, 206, 'RetryCount', '1'),
(516, 209, 'RetryCount', '1'),
(517, 214, 'RetryCount', '1'),
(518, 213, 'RetryCount', '1'),
(519, 212, 'RetryCount', '1'),
(520, 218, 'CurrentCulture', '\"az-AZ\"'),
(521, 218, 'CurrentUICulture', '\"az-AZ\"');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Hangfire_JobQueue`
--

CREATE TABLE `Hangfire_JobQueue` (
  `Id` int NOT NULL,
  `JobId` int NOT NULL,
  `Queue` varchar(50) NOT NULL,
  `FetchedAt` datetime DEFAULT NULL,
  `FetchToken` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Hangfire_JobState`
--

CREATE TABLE `Hangfire_JobState` (
  `Id` int NOT NULL,
  `JobId` int NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Reason` varchar(100) DEFAULT NULL,
  `CreatedAt` datetime NOT NULL,
  `Data` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Hangfire_List`
--

CREATE TABLE `Hangfire_List` (
  `Id` int NOT NULL,
  `Key` varchar(100) NOT NULL,
  `Value` longtext,
  `ExpireAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Hangfire_Server`
--

CREATE TABLE `Hangfire_Server` (
  `Id` varchar(100) NOT NULL,
  `Data` longtext NOT NULL,
  `LastHeartbeat` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `Hangfire_Server`
--

INSERT INTO `Hangfire_Server` (`Id`, `Data`, `LastHeartbeat`) VALUES
('3f0c08ea-1479-482c-b73e-f7110c85bae3', '{\"WorkerCount\":20,\"Queues\":[\"default\"],\"StartedAt\":\"2023-06-10T10:52:07.209054Z\"}', '2023-06-10 11:04:08');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Hangfire_Set`
--

CREATE TABLE `Hangfire_Set` (
  `Id` int NOT NULL,
  `Key` varchar(100) NOT NULL,
  `Value` varchar(256) NOT NULL,
  `Score` float NOT NULL,
  `ExpireAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Hangfire_State`
--

CREATE TABLE `Hangfire_State` (
  `Id` int NOT NULL,
  `JobId` int NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Reason` varchar(100) DEFAULT NULL,
  `CreatedAt` datetime NOT NULL,
  `Data` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `Hangfire_State`
--

INSERT INTO `Hangfire_State` (`Id`, `JobId`, `Name`, `Reason`, `CreatedAt`, `Data`) VALUES
(1, 1, 'Scheduled', NULL, '2023-06-01 12:37:33', '{\"EnqueueAt\":\"2023-06-01T12:37:34.3774420Z\",\"ScheduledAt\":\"2023-06-01T12:37:33.3774870Z\"}'),
(2, 1, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-01 12:37:40', '{\"EnqueuedAt\":\"2023-06-01T12:37:39.6900440Z\",\"Queue\":\"default\"}'),
(3, 1, 'Processing', NULL, '2023-06-01 12:37:55', '{\"StartedAt\":\"2023-06-01T12:37:54.6668020Z\",\"ServerId\":\"82c6b935-3f7d-4fc4-9b66-f7c92369e505\",\"WorkerId\":\"00646fb9-18a9-4de3-b52a-4203acc6e734\"}'),
(4, 1, 'Succeeded', NULL, '2023-06-01 12:37:57', '{\"SucceededAt\":\"2023-06-01T12:37:57.1430600Z\",\"PerformanceDuration\":\"2461\",\"Latency\":\"21681\"}'),
(5, 2, 'Scheduled', NULL, '2023-06-01 13:16:45', '{\"EnqueueAt\":\"2023-06-01T13:16:46.0434180Z\",\"ScheduledAt\":\"2023-06-01T13:16:45.0434590Z\"}'),
(6, 2, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-01 13:16:50', '{\"EnqueuedAt\":\"2023-06-01T13:16:50.4336860Z\",\"Queue\":\"default\"}'),
(7, 2, 'Processing', NULL, '2023-06-01 13:17:05', '{\"StartedAt\":\"2023-06-01T13:17:05.4087540Z\",\"ServerId\":\"098c79dd-09d9-43e0-b984-dcabb08d2cf4\",\"WorkerId\":\"899ec96d-87dd-47ed-87ea-44e4c69ccd57\"}'),
(8, 2, 'Succeeded', NULL, '2023-06-01 13:17:08', '{\"SucceededAt\":\"2023-06-01T13:17:07.8463980Z\",\"PerformanceDuration\":\"2418\",\"Latency\":\"20427\"}'),
(9, 3, 'Scheduled', NULL, '2023-06-01 14:54:05', '{\"EnqueueAt\":\"2023-06-01T14:54:05.7041570Z\",\"ScheduledAt\":\"2023-06-01T14:54:04.7041940Z\"}'),
(10, 3, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-01 14:54:24', '{\"EnqueuedAt\":\"2023-06-01T14:54:24.2745770Z\",\"Queue\":\"default\"}'),
(11, 3, 'Processing', NULL, '2023-06-01 14:54:39', '{\"StartedAt\":\"2023-06-01T14:54:39.2933670Z\",\"ServerId\":\"67950535-49ba-43bc-947d-3a2a95eb3ee3\",\"WorkerId\":\"856b4663-7a45-438a-aa1a-df9733c4193c\"}'),
(12, 3, 'Succeeded', NULL, '2023-06-01 14:54:42', '{\"SucceededAt\":\"2023-06-01T14:54:41.8352950Z\",\"PerformanceDuration\":\"2529\",\"Latency\":\"34305\"}'),
(13, 4, 'Scheduled', NULL, '2023-06-01 16:30:47', '{\"EnqueueAt\":\"2023-06-01T16:30:47.8963650Z\",\"ScheduledAt\":\"2023-06-01T16:30:46.8964150Z\"}'),
(14, 4, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-01 16:30:55', '{\"EnqueuedAt\":\"2023-06-01T16:30:55.2780040Z\",\"Queue\":\"default\"}'),
(15, 4, 'Processing', NULL, '2023-06-01 16:31:10', '{\"StartedAt\":\"2023-06-01T16:31:10.1867670Z\",\"ServerId\":\"97c3af55-4289-4019-8e39-825394e8d9be\",\"WorkerId\":\"d962a60c-f3d4-4f80-956e-5fce65e52c2c\"}'),
(16, 4, 'Succeeded', NULL, '2023-06-01 16:31:12', '{\"SucceededAt\":\"2023-06-01T16:31:12.1772580Z\",\"PerformanceDuration\":\"1974\",\"Latency\":\"23201\"}'),
(17, 5, 'Scheduled', NULL, '2023-06-01 16:31:56', '{\"EnqueueAt\":\"2023-06-01T16:31:56.9605230Z\",\"ScheduledAt\":\"2023-06-01T16:31:55.9605250Z\"}'),
(18, 5, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-01 16:32:10', '{\"EnqueuedAt\":\"2023-06-01T16:32:10.4867880Z\",\"Queue\":\"default\"}'),
(19, 5, 'Processing', NULL, '2023-06-01 16:32:12', '{\"StartedAt\":\"2023-06-01T16:32:12.2347930Z\",\"ServerId\":\"97c3af55-4289-4019-8e39-825394e8d9be\",\"WorkerId\":\"d962a60c-f3d4-4f80-956e-5fce65e52c2c\"}'),
(20, 5, 'Succeeded', NULL, '2023-06-01 16:32:14', '{\"SucceededAt\":\"2023-06-01T16:32:13.9253200Z\",\"PerformanceDuration\":\"1681\",\"Latency\":\"16243\"}'),
(21, 6, 'Scheduled', NULL, '2023-06-01 16:34:57', '{\"EnqueueAt\":\"2023-06-01T16:34:58.3392240Z\",\"ScheduledAt\":\"2023-06-01T16:34:57.3392260Z\"}'),
(22, 6, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-01 16:35:11', '{\"EnqueuedAt\":\"2023-06-01T16:35:10.5537820Z\",\"Queue\":\"default\"}'),
(23, 6, 'Processing', NULL, '2023-06-01 16:35:14', '{\"StartedAt\":\"2023-06-01T16:35:13.9990260Z\",\"ServerId\":\"97c3af55-4289-4019-8e39-825394e8d9be\",\"WorkerId\":\"d962a60c-f3d4-4f80-956e-5fce65e52c2c\"}'),
(24, 6, 'Succeeded', NULL, '2023-06-01 16:35:16', '{\"SucceededAt\":\"2023-06-01T16:35:15.7348720Z\",\"PerformanceDuration\":\"1728\",\"Latency\":\"17006\"}'),
(25, 7, 'Scheduled', NULL, '2023-06-01 16:39:43', '{\"EnqueueAt\":\"2023-06-01T16:39:43.5275230Z\",\"ScheduledAt\":\"2023-06-01T16:39:42.5275230Z\"}'),
(26, 7, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-01 16:40:43', '{\"EnqueuedAt\":\"2023-06-01T16:40:42.6459720Z\",\"Queue\":\"default\"}'),
(27, 7, 'Processing', NULL, '2023-06-01 16:40:43', '{\"StartedAt\":\"2023-06-01T16:40:42.7861690Z\",\"ServerId\":\"97c3af55-4289-4019-8e39-825394e8d9be\",\"WorkerId\":\"7bdd8e7a-a300-456f-abf4-7938ea6c0059\"}'),
(28, 7, 'Succeeded', NULL, '2023-06-01 16:40:45', '{\"SucceededAt\":\"2023-06-01T16:40:44.6204400Z\",\"PerformanceDuration\":\"1827\",\"Latency\":\"59793\"}'),
(29, 8, 'Scheduled', NULL, '2023-06-01 16:42:05', '{\"EnqueueAt\":\"2023-06-01T16:42:05.8600850Z\",\"ScheduledAt\":\"2023-06-01T16:42:04.8600870Z\"}'),
(30, 8, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-01 16:42:43', '{\"EnqueuedAt\":\"2023-06-01T16:42:42.7182380Z\",\"Queue\":\"default\"}'),
(31, 8, 'Processing', NULL, '2023-06-01 16:42:43', '{\"StartedAt\":\"2023-06-01T16:42:42.8164450Z\",\"ServerId\":\"97c3af55-4289-4019-8e39-825394e8d9be\",\"WorkerId\":\"c59c2e00-b2a0-4262-aeb7-d6531f601049\"}'),
(32, 8, 'Succeeded', NULL, '2023-06-01 16:42:45', '{\"SucceededAt\":\"2023-06-01T16:42:44.7065920Z\",\"PerformanceDuration\":\"1883\",\"Latency\":\"37823\"}'),
(33, 9, 'Scheduled', NULL, '2023-06-01 17:14:33', '{\"EnqueueAt\":\"2023-06-01T17:14:34.4248920Z\",\"ScheduledAt\":\"2023-06-01T17:14:33.4248930Z\"}'),
(34, 9, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-01 17:14:46', '{\"EnqueuedAt\":\"2023-06-01T17:14:45.8672560Z\",\"Queue\":\"default\"}'),
(35, 9, 'Processing', NULL, '2023-06-01 17:14:47', '{\"StartedAt\":\"2023-06-01T17:14:46.6441470Z\",\"ServerId\":\"97c3af55-4289-4019-8e39-825394e8d9be\",\"WorkerId\":\"d962a60c-f3d4-4f80-956e-5fce65e52c2c\"}'),
(36, 9, 'Succeeded', NULL, '2023-06-01 17:14:49', '{\"SucceededAt\":\"2023-06-01T17:14:49.0665410Z\",\"PerformanceDuration\":\"2414\",\"Latency\":\"13651\"}'),
(37, 10, 'Scheduled', NULL, '2023-06-01 17:20:24', '{\"EnqueueAt\":\"2023-06-01T17:20:24.6527820Z\",\"ScheduledAt\":\"2023-06-01T17:20:23.6527850Z\"}'),
(38, 10, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-01 17:21:16', '{\"EnqueuedAt\":\"2023-06-01T17:21:16.0462040Z\",\"Queue\":\"default\"}'),
(39, 10, 'Processing', NULL, '2023-06-01 17:21:19', '{\"StartedAt\":\"2023-06-01T17:21:19.1952300Z\",\"ServerId\":\"97c3af55-4289-4019-8e39-825394e8d9be\",\"WorkerId\":\"d962a60c-f3d4-4f80-956e-5fce65e52c2c\"}'),
(40, 10, 'Succeeded', NULL, '2023-06-01 17:21:21', '{\"SucceededAt\":\"2023-06-01T17:21:21.3868660Z\",\"PerformanceDuration\":\"2185\",\"Latency\":\"55201\"}'),
(41, 11, 'Scheduled', NULL, '2023-06-01 17:53:52', '{\"EnqueueAt\":\"2023-06-01T17:53:52.8292720Z\",\"ScheduledAt\":\"2023-06-01T17:53:51.8292740Z\"}'),
(42, 11, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-01 17:53:54', '{\"EnqueuedAt\":\"2023-06-01T17:53:53.6787580Z\",\"Queue\":\"default\"}'),
(43, 11, 'Processing', NULL, '2023-06-01 17:54:09', '{\"StartedAt\":\"2023-06-01T17:54:08.6233950Z\",\"ServerId\":\"97c3af55-4289-4019-8e39-825394e8d9be\",\"WorkerId\":\"8c5a1541-988e-44b9-8671-dcaa50c8d122\"}'),
(44, 11, 'Succeeded', NULL, '2023-06-01 17:54:11', '{\"SucceededAt\":\"2023-06-01T17:54:11.0663290Z\",\"PerformanceDuration\":\"2430\",\"Latency\":\"16635\"}'),
(45, 12, 'Scheduled', NULL, '2023-06-01 17:58:49', '{\"EnqueueAt\":\"2023-06-01T17:58:49.6878770Z\",\"ScheduledAt\":\"2023-06-01T17:58:48.6879380Z\"}'),
(46, 12, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-01 17:59:36', '{\"EnqueuedAt\":\"2023-06-01T17:59:36.3502170Z\",\"Queue\":\"default\"}'),
(47, 12, 'Processing', NULL, '2023-06-01 17:59:36', '{\"StartedAt\":\"2023-06-01T17:59:36.4947130Z\",\"ServerId\":\"93dcf8d0-1dc8-4626-b09d-d36eaac38b99\",\"WorkerId\":\"e35bde78-ad1e-4ed1-b2dc-e5abe6bf752f\"}'),
(48, 12, 'Succeeded', NULL, '2023-06-01 17:59:39', '{\"SucceededAt\":\"2023-06-01T17:59:38.8981160Z\",\"PerformanceDuration\":\"2395\",\"Latency\":\"47502\"}'),
(49, 13, 'Scheduled', NULL, '2023-06-01 18:01:11', '{\"EnqueueAt\":\"2023-06-01T18:01:12.4663460Z\",\"ScheduledAt\":\"2023-06-01T18:01:11.4663650Z\"}'),
(50, 13, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-01 18:01:41', '{\"EnqueuedAt\":\"2023-06-01T18:01:41.1131580Z\",\"Queue\":\"default\"}'),
(51, 13, 'Processing', NULL, '2023-06-01 18:01:56', '{\"StartedAt\":\"2023-06-01T18:01:56.1269740Z\",\"ServerId\":\"24b7b8cc-b40b-42d0-9d51-c55e85011748\",\"WorkerId\":\"369c155b-1662-4a10-8b1c-a8dd77a7b262\"}'),
(52, 13, 'Succeeded', NULL, '2023-06-01 18:01:58', '{\"SucceededAt\":\"2023-06-01T18:01:57.8738360Z\",\"PerformanceDuration\":\"1733\",\"Latency\":\"45139\"}'),
(53, 14, 'Scheduled', NULL, '2023-06-02 13:34:05', '{\"EnqueueAt\":\"2023-06-02T13:34:06.1863740Z\",\"ScheduledAt\":\"2023-06-02T13:34:05.1864050Z\"}'),
(54, 14, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-02 13:34:58', '{\"EnqueuedAt\":\"2023-06-02T13:34:58.0239490Z\",\"Queue\":\"default\"}'),
(55, 14, 'Processing', NULL, '2023-06-02 13:35:13', '{\"StartedAt\":\"2023-06-02T13:35:13.0017790Z\",\"ServerId\":\"d554bbec-c424-437f-8607-9bb3ea294315\",\"WorkerId\":\"a1cb777d-bae2-4642-9d36-25c43e667a1f\"}'),
(56, 14, 'Enqueued', 'Triggered via Dashboard UI', '2023-06-02 13:36:24', '{\"EnqueuedAt\":\"2023-06-02T13:36:23.8189090Z\",\"Queue\":\"default\"}'),
(57, 14, 'Processing', NULL, '2023-06-02 13:36:28', '{\"StartedAt\":\"2023-06-02T13:36:28.1261830Z\",\"ServerId\":\"01fd9f7b-2902-467c-b92e-1e05c9cc03f5\",\"WorkerId\":\"c22244f3-bbba-4bec-b9cf-0a750e7621a7\"}'),
(58, 14, 'Deleted', 'Triggered via Dashboard UI', '2023-06-02 13:36:38', '{\"DeletedAt\":\"2023-06-02T13:36:38.2748130Z\"}'),
(59, 15, 'Scheduled', NULL, '2023-06-02 13:39:01', '{\"EnqueueAt\":\"2023-06-02T13:39:01.5646600Z\",\"ScheduledAt\":\"2023-06-02T13:39:00.5647000Z\"}'),
(60, 15, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-02 13:39:17', '{\"EnqueuedAt\":\"2023-06-02T13:39:16.6235900Z\",\"Queue\":\"default\"}'),
(61, 15, 'Processing', NULL, '2023-06-02 13:39:32', '{\"StartedAt\":\"2023-06-02T13:39:31.5084960Z\",\"ServerId\":\"9e67e265-9224-41f6-b71c-ff5183086f9d\",\"WorkerId\":\"14c1af4d-cadd-4247-917e-03e8522eb21c\"}'),
(62, 16, 'Scheduled', NULL, '2023-06-02 13:44:30', '{\"EnqueueAt\":\"2023-06-02T13:44:30.9547170Z\",\"ScheduledAt\":\"2023-06-02T13:44:29.9547700Z\"}'),
(63, 16, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-02 13:44:34', '{\"EnqueuedAt\":\"2023-06-02T13:44:33.9105600Z\",\"Queue\":\"default\"}'),
(64, 16, 'Processing', NULL, '2023-06-02 13:44:49', '{\"StartedAt\":\"2023-06-02T13:44:48.8979520Z\",\"ServerId\":\"ecb71748-ad1a-4b04-bc73-14d59bf925e0\",\"WorkerId\":\"b032048a-64de-4afa-864e-ce4dadd925e2\"}'),
(65, 16, 'Succeeded', NULL, '2023-06-02 13:45:17', '{\"SucceededAt\":\"2023-06-02T13:45:16.8101680Z\",\"PerformanceDuration\":\"27902\",\"Latency\":\"18907\"}'),
(66, 17, 'Scheduled', NULL, '2023-06-02 13:56:44', '{\"EnqueueAt\":\"2023-06-02T13:56:45.4015890Z\",\"ScheduledAt\":\"2023-06-02T13:56:44.4017340Z\"}'),
(67, 17, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-02 13:56:48', '{\"EnqueuedAt\":\"2023-06-02T13:56:47.9376930Z\",\"Queue\":\"default\"}'),
(68, 17, 'Processing', NULL, '2023-06-02 13:57:03', '{\"StartedAt\":\"2023-06-02T13:57:02.9497940Z\",\"ServerId\":\"7b780bd7-c1fb-4148-8bd5-47a77143a769\",\"WorkerId\":\"0d889c67-092c-495a-b409-c3a5bff8c8c9\"}'),
(69, 17, 'Succeeded', NULL, '2023-06-02 13:57:23', '{\"SucceededAt\":\"2023-06-02T13:57:23.3263310Z\",\"PerformanceDuration\":\"20365\",\"Latency\":\"18960\"}'),
(70, 15, 'Processing', NULL, '2023-06-02 14:09:57', '{\"StartedAt\":\"2023-06-02T14:09:56.8272650Z\",\"ServerId\":\"f656dd3a-b2b9-4dc4-81ae-6926e499c733\",\"WorkerId\":\"53f8b74d-2f17-487d-8575-472457edaf44\"}'),
(71, 15, 'Succeeded', NULL, '2023-06-02 14:10:09', '{\"SucceededAt\":\"2023-06-02T14:10:09.4229770Z\",\"PerformanceDuration\":\"12555\",\"Latency\":\"1855867\"}'),
(72, 18, 'Scheduled', NULL, '2023-06-02 14:20:41', '{\"EnqueueAt\":\"2023-06-02T14:20:41.8360340Z\",\"ScheduledAt\":\"2023-06-02T14:20:40.8360690Z\"}'),
(73, 18, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-02 14:22:31', '{\"EnqueuedAt\":\"2023-06-02T14:22:31.3604460Z\",\"Queue\":\"default\"}'),
(74, 18, 'Processing', NULL, '2023-06-02 14:22:39', '{\"StartedAt\":\"2023-06-02T14:22:39.1345140Z\",\"ServerId\":\"34036efe-cd0c-484d-b2a8-6d46a7516961\",\"WorkerId\":\"f97e0ba1-523d-49ee-acce-506f100da129\"}'),
(75, 18, 'Succeeded', NULL, '2023-06-02 14:22:46', '{\"SucceededAt\":\"2023-06-02T14:22:45.9410200Z\",\"PerformanceDuration\":\"6758\",\"Latency\":\"118182\"}'),
(76, 19, 'Scheduled', NULL, '2023-06-02 14:23:35', '{\"EnqueueAt\":\"2023-06-02T14:23:35.6237910Z\",\"ScheduledAt\":\"2023-06-02T14:23:34.6238280Z\"}'),
(77, 19, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-02 14:24:08', '{\"EnqueuedAt\":\"2023-06-02T14:24:07.7467760Z\",\"Queue\":\"default\"}'),
(78, 19, 'Processing', NULL, '2023-06-02 14:24:12', '{\"StartedAt\":\"2023-06-02T14:24:12.2732270Z\",\"ServerId\":\"34036efe-cd0c-484d-b2a8-6d46a7516961\",\"WorkerId\":\"9c206b42-d728-44e4-8b8d-d4bade8c1b0d\"}'),
(79, 19, 'Succeeded', NULL, '2023-06-02 14:24:15', '{\"SucceededAt\":\"2023-06-02T14:24:14.9215420Z\",\"PerformanceDuration\":\"2640\",\"Latency\":\"37281\"}'),
(80, 20, 'Scheduled', NULL, '2023-06-02 15:13:43', '{\"EnqueueAt\":\"2023-06-02T15:13:52.9060820Z\",\"ScheduledAt\":\"2023-06-02T15:13:42.9061170Z\"}'),
(81, 20, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-02 15:13:53', '{\"EnqueuedAt\":\"2023-06-02T15:13:52.8889120Z\",\"Queue\":\"default\"}'),
(82, 20, 'Processing', NULL, '2023-06-02 15:14:08', '{\"StartedAt\":\"2023-06-02T15:14:07.8630940Z\",\"ServerId\":\"4643cc01-4456-4186-8957-f45c00f59735\",\"WorkerId\":\"9fe47061-74a2-4764-87e4-f7ec28fd412b\"}'),
(83, 21, 'Scheduled', NULL, '2023-06-02 15:14:08', '{\"EnqueueAt\":\"2023-06-02T15:14:17.9555590Z\",\"ScheduledAt\":\"2023-06-02T15:14:07.9555600Z\"}'),
(84, 22, 'Scheduled', NULL, '2023-06-02 15:14:08', '{\"EnqueueAt\":\"2023-06-02T15:14:17.9635000Z\",\"ScheduledAt\":\"2023-06-02T15:14:07.9635000Z\"}'),
(85, 23, 'Scheduled', NULL, '2023-06-02 15:14:08', '{\"EnqueueAt\":\"2023-06-02T15:14:17.9672580Z\",\"ScheduledAt\":\"2023-06-02T15:14:07.9672580Z\"}'),
(86, 20, 'Succeeded', NULL, '2023-06-02 15:14:08', '{\"SucceededAt\":\"2023-06-02T15:14:07.9709370Z\",\"PerformanceDuration\":\"94\",\"Latency\":\"24875\"}'),
(87, 21, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-02 15:15:23', '{\"EnqueuedAt\":\"2023-06-02T15:15:22.9893580Z\",\"Queue\":\"default\"}'),
(88, 22, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-02 15:15:23', '{\"EnqueuedAt\":\"2023-06-02T15:15:22.9965190Z\",\"Queue\":\"default\"}'),
(89, 23, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-02 15:15:23', '{\"EnqueuedAt\":\"2023-06-02T15:15:23.0020460Z\",\"Queue\":\"default\"}'),
(90, 22, 'Processing', NULL, '2023-06-02 15:15:38', '{\"StartedAt\":\"2023-06-02T15:15:37.8816810Z\",\"ServerId\":\"4643cc01-4456-4186-8957-f45c00f59735\",\"WorkerId\":\"e4013fa8-5dec-4a14-838d-3a7a43fa0127\"}'),
(91, 21, 'Processing', NULL, '2023-06-02 15:15:38', '{\"StartedAt\":\"2023-06-02T15:15:37.8813880Z\",\"ServerId\":\"4643cc01-4456-4186-8957-f45c00f59735\",\"WorkerId\":\"9f544d62-0c3e-4897-a596-603f8f720ff6\"}'),
(92, 23, 'Processing', NULL, '2023-06-02 15:15:38', '{\"StartedAt\":\"2023-06-02T15:15:37.8858340Z\",\"ServerId\":\"4643cc01-4456-4186-8957-f45c00f59735\",\"WorkerId\":\"448ba4e7-6a3a-488a-8010-116229738a8b\"}'),
(93, 22, 'Succeeded', NULL, '2023-06-02 15:15:39', '{\"SucceededAt\":\"2023-06-02T15:15:38.4969950Z\",\"PerformanceDuration\":\"604\",\"Latency\":\"89892\"}'),
(94, 21, 'Succeeded', NULL, '2023-06-02 15:15:39', '{\"SucceededAt\":\"2023-06-02T15:15:38.5181100Z\",\"PerformanceDuration\":\"625\",\"Latency\":\"89892\"}'),
(95, 23, 'Succeeded', NULL, '2023-06-02 15:15:40', '{\"SucceededAt\":\"2023-06-02T15:15:39.6338350Z\",\"PerformanceDuration\":\"1739\",\"Latency\":\"89894\"}'),
(96, 24, 'Scheduled', NULL, '2023-06-03 10:32:37', '{\"EnqueueAt\":\"2023-06-03T10:32:37.8715290Z\",\"ScheduledAt\":\"2023-06-03T10:32:36.8715490Z\"}'),
(97, 24, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-03 10:33:41', '{\"EnqueuedAt\":\"2023-06-03T10:33:40.7624030Z\",\"Queue\":\"default\"}'),
(98, 24, 'Processing', NULL, '2023-06-03 10:33:56', '{\"StartedAt\":\"2023-06-03T10:33:55.6888570Z\",\"ServerId\":\"007d1e1e-0a3f-43be-8274-ada8dba1db7d\",\"WorkerId\":\"d04a5833-bb0e-4dd3-9269-e371534dd987\"}'),
(99, 24, 'Succeeded', NULL, '2023-06-03 10:33:58', '{\"SucceededAt\":\"2023-06-03T10:33:57.7702370Z\",\"PerformanceDuration\":\"2067\",\"Latency\":\"78701\"}'),
(100, 25, 'Scheduled', NULL, '2023-06-04 09:51:28', '{\"EnqueueAt\":\"2023-06-04T09:51:29.0549260Z\",\"ScheduledAt\":\"2023-06-04T09:51:28.0549540Z\"}'),
(101, 25, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 09:51:43', '{\"EnqueuedAt\":\"2023-06-04T09:51:43.0810660Z\",\"Queue\":\"default\"}'),
(102, 25, 'Processing', NULL, '2023-06-04 09:52:09', '{\"StartedAt\":\"2023-06-04T09:52:08.7754250Z\",\"ServerId\":\"0266d5e8-378f-4cea-959d-fd836185b0e6\",\"WorkerId\":\"47bb0c0f-f6c8-4dc9-853c-521319ff817a\"}'),
(103, 26, 'Scheduled', NULL, '2023-06-04 09:55:16', '{\"EnqueueAt\":\"2023-06-04T09:55:17.0498860Z\",\"ScheduledAt\":\"2023-06-04T09:55:16.0499170Z\"}'),
(104, 26, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 09:55:32', '{\"EnqueuedAt\":\"2023-06-04T09:55:29.6990220Z\",\"Queue\":\"default\"}'),
(105, 26, 'Processing', NULL, '2023-06-04 09:56:04', '{\"StartedAt\":\"2023-06-04T09:56:04.2887130Z\",\"ServerId\":\"e1ce7bd5-5991-4de2-a996-8c76c93a9d4f\",\"WorkerId\":\"174ee135-fbfb-4b4b-9cc2-03e796eb8f74\"}'),
(106, 26, 'Succeeded', NULL, '2023-06-04 09:56:05', '{\"SucceededAt\":\"2023-06-04T09:56:04.8701720Z\",\"PerformanceDuration\":\"571\",\"Latency\":\"48298\"}'),
(107, 25, 'Deleted', 'Triggered via Dashboard UI', '2023-06-04 09:56:37', '{\"DeletedAt\":\"2023-06-04T09:56:36.9792910Z\"}'),
(108, 25, 'Enqueued', 'Triggered via Dashboard UI', '2023-06-04 09:56:51', '{\"EnqueuedAt\":\"2023-06-04T09:56:51.0452230Z\",\"Queue\":\"default\"}'),
(109, 25, 'Processing', NULL, '2023-06-04 09:57:04', '{\"StartedAt\":\"2023-06-04T09:57:04.1734050Z\",\"ServerId\":\"e1ce7bd5-5991-4de2-a996-8c76c93a9d4f\",\"WorkerId\":\"293d1670-cd8c-440b-abc1-531323dcc0d1\"}'),
(110, 25, 'Succeeded', NULL, '2023-06-04 09:57:04', '{\"SucceededAt\":\"2023-06-04T09:57:04.3446620Z\",\"PerformanceDuration\":\"162\",\"Latency\":\"336182\"}'),
(111, 27, 'Scheduled', NULL, '2023-06-04 10:11:25', '{\"EnqueueAt\":\"2023-06-04T10:11:25.8512100Z\",\"ScheduledAt\":\"2023-06-04T10:11:24.8512330Z\"}'),
(112, 27, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 10:12:19', '{\"EnqueuedAt\":\"2023-06-04T10:12:19.0793750Z\",\"Queue\":\"default\"}'),
(113, 27, 'Processing', NULL, '2023-06-04 10:12:34', '{\"StartedAt\":\"2023-06-04T10:12:34.0617760Z\",\"ServerId\":\"7bfb7e82-2402-478d-9ae0-84863a2076bf\",\"WorkerId\":\"299c861e-a0c6-41cb-a049-bfe88af9b706\"}'),
(114, 27, 'Succeeded', NULL, '2023-06-04 10:12:35', '{\"SucceededAt\":\"2023-06-04T10:12:34.6508230Z\",\"PerformanceDuration\":\"575\",\"Latency\":\"69074\"}'),
(115, 28, 'Scheduled', NULL, '2023-06-04 10:16:32', '{\"EnqueueAt\":\"2023-06-04T10:16:32.9739090Z\",\"ScheduledAt\":\"2023-06-04T10:16:31.9739310Z\"}'),
(116, 28, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 10:16:37', '{\"EnqueuedAt\":\"2023-06-04T10:16:36.7042370Z\",\"Queue\":\"default\"}'),
(117, 28, 'Processing', NULL, '2023-06-04 10:17:02', '{\"StartedAt\":\"2023-06-04T10:17:02.4417330Z\",\"ServerId\":\"6758a4fa-3a27-40c3-8fae-c659b66e6710\",\"WorkerId\":\"356b5f96-a4c3-44db-8376-e4557a416571\"}'),
(118, 29, 'Scheduled', NULL, '2023-06-04 10:18:41', '{\"EnqueueAt\":\"2023-06-04T10:18:41.7480020Z\",\"ScheduledAt\":\"2023-06-04T10:18:40.7480250Z\"}'),
(119, 29, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 10:18:50', '{\"EnqueuedAt\":\"2023-06-04T10:18:49.8329890Z\",\"Queue\":\"default\"}'),
(120, 30, 'Scheduled', NULL, '2023-06-04 10:18:55', '{\"EnqueueAt\":\"2023-06-04T10:18:56.4221200Z\",\"ScheduledAt\":\"2023-06-04T10:18:55.4221220Z\"}'),
(121, 29, 'Processing', NULL, '2023-06-04 10:19:06', '{\"StartedAt\":\"2023-06-04T10:19:05.7852140Z\",\"ServerId\":\"dcc9aa0c-3ae2-4386-95f2-989f27ed82e8\",\"WorkerId\":\"6f7d21e3-edb8-4a4f-9e77-721c3e191e18\"}'),
(122, 30, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 10:19:06', '{\"EnqueuedAt\":\"2023-06-04T10:19:05.8163650Z\",\"Queue\":\"default\"}'),
(123, 30, 'Processing', NULL, '2023-06-04 10:19:31', '{\"StartedAt\":\"2023-06-04T10:19:30.7487310Z\",\"ServerId\":\"dcc9aa0c-3ae2-4386-95f2-989f27ed82e8\",\"WorkerId\":\"84115fbd-1946-44c1-9b38-6f50c36961b8\"}'),
(124, 29, 'Succeeded', NULL, '2023-06-04 10:19:31', '{\"SucceededAt\":\"2023-06-04T10:19:30.7455660Z\",\"PerformanceDuration\":\"24925\",\"Latency\":\"24819\"}'),
(125, 30, 'Succeeded', NULL, '2023-06-04 10:19:34', '{\"SucceededAt\":\"2023-06-04T10:19:33.5977420Z\",\"PerformanceDuration\":\"2845\",\"Latency\":\"35752\"}'),
(126, 31, 'Scheduled', NULL, '2023-06-04 10:22:53', '{\"EnqueueAt\":\"2023-06-04T10:22:54.4527420Z\",\"ScheduledAt\":\"2023-06-04T10:22:53.4527680Z\"}'),
(127, 31, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 10:23:04', '{\"EnqueuedAt\":\"2023-06-04T10:23:04.3462440Z\",\"Queue\":\"default\"}'),
(128, 31, 'Processing', NULL, '2023-06-04 10:23:19', '{\"StartedAt\":\"2023-06-04T10:23:19.3396590Z\",\"ServerId\":\"575d5259-1ccb-4e12-89c8-0c3032c9e547\",\"WorkerId\":\"506c86f1-a095-41c4-9dff-48db160fcc3e\"}'),
(129, 31, 'Succeeded', NULL, '2023-06-04 10:23:30', '{\"SucceededAt\":\"2023-06-04T10:23:30.1977330Z\",\"PerformanceDuration\":\"10845\",\"Latency\":\"26351\"}'),
(130, 32, 'Scheduled', NULL, '2023-06-04 10:24:56', '{\"EnqueueAt\":\"2023-06-04T10:24:57.1542820Z\",\"ScheduledAt\":\"2023-06-04T10:24:56.1543190Z\"}'),
(131, 32, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 10:25:11', '{\"EnqueuedAt\":\"2023-06-04T10:25:11.1549740Z\",\"Queue\":\"default\"}'),
(132, 32, 'Processing', NULL, '2023-06-04 10:25:24', '{\"StartedAt\":\"2023-06-04T10:25:24.4728250Z\",\"ServerId\":\"1e148ebd-a201-4976-bd93-43e53dbe7c43\",\"WorkerId\":\"6fa34b41-1e0e-47d3-ad03-16ca1a476b3c\"}'),
(133, 32, 'Succeeded', NULL, '2023-06-04 10:25:33', '{\"SucceededAt\":\"2023-06-04T10:25:33.3216150Z\",\"PerformanceDuration\":\"8833\",\"Latency\":\"28487\"}'),
(134, 33, 'Scheduled', NULL, '2023-06-04 10:32:47', '{\"EnqueueAt\":\"2023-06-04T10:32:47.7408030Z\",\"ScheduledAt\":\"2023-06-04T10:32:46.7408440Z\"}'),
(135, 28, 'Deleted', 'Triggered via Dashboard UI', '2023-06-04 10:33:24', '{\"DeletedAt\":\"2023-06-04T10:33:23.7121120Z\"}'),
(136, 33, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 10:33:40', '{\"EnqueuedAt\":\"2023-06-04T10:33:39.8740040Z\",\"Queue\":\"default\"}'),
(137, 33, 'Processing', NULL, '2023-06-04 10:33:55', '{\"StartedAt\":\"2023-06-04T10:33:54.7975340Z\",\"ServerId\":\"bafda96b-cd81-4d57-8179-bf1c829baa54\",\"WorkerId\":\"fb119f53-415f-4afa-940a-2767325c23eb\"}'),
(138, 33, 'Succeeded', NULL, '2023-06-04 10:34:08', '{\"SucceededAt\":\"2023-06-04T10:34:08.1917760Z\",\"PerformanceDuration\":\"13389\",\"Latency\":\"67802\"}'),
(139, 34, 'Scheduled', NULL, '2023-06-04 10:39:24', '{\"EnqueueAt\":\"2023-06-04T10:39:24.5676350Z\",\"ScheduledAt\":\"2023-06-04T10:39:23.5676550Z\"}'),
(140, 34, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 10:40:13', '{\"EnqueuedAt\":\"2023-06-04T10:40:13.0047850Z\",\"Queue\":\"default\"}'),
(141, 34, 'Processing', NULL, '2023-06-04 10:40:28', '{\"StartedAt\":\"2023-06-04T10:40:27.9870470Z\",\"ServerId\":\"5c84bf44-c735-4d8b-959c-255d141aeb52\",\"WorkerId\":\"032e3043-c701-4c91-8dc6-67ebdf4ed56b\"}'),
(142, 34, 'Succeeded', NULL, '2023-06-04 10:40:31', '{\"SucceededAt\":\"2023-06-04T10:40:31.4548770Z\",\"PerformanceDuration\":\"3461\",\"Latency\":\"63992\"}'),
(143, 35, 'Scheduled', NULL, '2023-06-04 11:29:21', '{\"EnqueueAt\":\"2023-06-04T11:29:21.6934460Z\",\"ScheduledAt\":\"2023-06-04T11:29:20.6934760Z\"}'),
(144, 35, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 11:29:36', '{\"EnqueuedAt\":\"2023-06-04T11:29:35.6283530Z\",\"Queue\":\"default\"}'),
(145, 35, 'Processing', NULL, '2023-06-04 11:29:51', '{\"StartedAt\":\"2023-06-04T11:29:50.6105050Z\",\"ServerId\":\"c8c4ce9b-91d6-4925-a331-5d718810e214\",\"WorkerId\":\"54f839b2-66aa-4d82-8e66-2f970198accd\"}'),
(146, 35, 'Succeeded', NULL, '2023-06-04 11:29:55', '{\"SucceededAt\":\"2023-06-04T11:29:54.9527190Z\",\"PerformanceDuration\":\"4329\",\"Latency\":\"29622\"}'),
(147, 36, 'Scheduled', NULL, '2023-06-04 11:30:10', '{\"EnqueueAt\":\"2023-06-04T11:30:11.2727330Z\",\"ScheduledAt\":\"2023-06-04T11:30:10.2727350Z\"}'),
(148, 36, 'Enqueued', 'Triggered via Dashboard UI', '2023-06-04 11:31:17', '{\"EnqueuedAt\":\"2023-06-04T11:31:16.5752610Z\",\"Queue\":\"default\"}'),
(149, 36, 'Processing', NULL, '2023-06-04 11:31:21', '{\"StartedAt\":\"2023-06-04T11:31:20.6585710Z\",\"ServerId\":\"c8c4ce9b-91d6-4925-a331-5d718810e214\",\"WorkerId\":\"139783cb-1e2d-485b-97fe-980f6113e820\"}'),
(150, 36, 'Succeeded', NULL, '2023-06-04 11:31:24', '{\"SucceededAt\":\"2023-06-04T11:31:23.5564380Z\",\"PerformanceDuration\":\"2891\",\"Latency\":\"70665\"}'),
(151, 37, 'Scheduled', NULL, '2023-06-04 11:31:37', '{\"EnqueueAt\":\"2023-06-04T11:31:37.5998150Z\",\"ScheduledAt\":\"2023-06-04T11:31:36.5998150Z\"}'),
(152, 37, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 11:31:39', '{\"EnqueuedAt\":\"2023-06-04T11:31:39.3781790Z\",\"Queue\":\"default\"}'),
(153, 37, 'Processing', NULL, '2023-06-04 11:31:40', '{\"StartedAt\":\"2023-06-04T11:31:40.0205390Z\",\"ServerId\":\"c8c4ce9b-91d6-4925-a331-5d718810e214\",\"WorkerId\":\"54f839b2-66aa-4d82-8e66-2f970198accd\"}'),
(154, 37, 'Succeeded', NULL, '2023-06-04 11:31:42', '{\"SucceededAt\":\"2023-06-04T11:31:42.4388890Z\",\"PerformanceDuration\":\"2410\",\"Latency\":\"3028\"}'),
(155, 38, 'Scheduled', NULL, '2023-06-04 11:31:50', '{\"EnqueueAt\":\"2023-06-04T11:31:51.0131240Z\",\"ScheduledAt\":\"2023-06-04T11:31:50.0131260Z\"}'),
(156, 38, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 11:31:54', '{\"EnqueuedAt\":\"2023-06-04T11:31:54.3979310Z\",\"Queue\":\"default\"}'),
(157, 38, 'Processing', NULL, '2023-06-04 11:31:57', '{\"StartedAt\":\"2023-06-04T11:31:57.4554240Z\",\"ServerId\":\"c8c4ce9b-91d6-4925-a331-5d718810e214\",\"WorkerId\":\"54f839b2-66aa-4d82-8e66-2f970198accd\"}'),
(158, 38, 'Succeeded', NULL, '2023-06-04 11:32:00', '{\"SucceededAt\":\"2023-06-04T11:31:59.8363440Z\",\"PerformanceDuration\":\"2373\",\"Latency\":\"7462\"}'),
(159, 39, 'Scheduled', NULL, '2023-06-04 11:32:08', '{\"EnqueueAt\":\"2023-06-04T11:32:08.8166110Z\",\"ScheduledAt\":\"2023-06-04T11:32:07.8166130Z\"}'),
(160, 39, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 11:32:09', '{\"EnqueuedAt\":\"2023-06-04T11:32:09.4197920Z\",\"Queue\":\"default\"}'),
(161, 39, 'Processing', NULL, '2023-06-04 11:32:15', '{\"StartedAt\":\"2023-06-04T11:32:14.8540420Z\",\"ServerId\":\"c8c4ce9b-91d6-4925-a331-5d718810e214\",\"WorkerId\":\"54f839b2-66aa-4d82-8e66-2f970198accd\"}'),
(162, 39, 'Succeeded', NULL, '2023-06-04 11:32:18', '{\"SucceededAt\":\"2023-06-04T11:32:17.5811340Z\",\"PerformanceDuration\":\"2719\",\"Latency\":\"6862\"}'),
(163, 40, 'Scheduled', NULL, '2023-06-04 11:55:09', '{\"EnqueueAt\":\"2023-06-04T11:55:09.7752210Z\",\"ScheduledAt\":\"2023-06-04T11:55:08.7752440Z\"}'),
(164, 40, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 11:55:54', '{\"EnqueuedAt\":\"2023-06-04T11:55:12.2326510Z\",\"Queue\":\"default\"}'),
(165, 40, 'Processing', NULL, '2023-06-04 11:56:00', '{\"StartedAt\":\"2023-06-04T11:55:59.4962770Z\",\"ServerId\":\"c5847cb4-c9d4-4c7e-b906-be1c831e72ef\",\"WorkerId\":\"6b12fff1-7a8a-4e95-b5c6-12e3ebb3e317\"}'),
(166, 40, 'Succeeded', NULL, '2023-06-04 11:56:07', '{\"SucceededAt\":\"2023-06-04T11:56:07.1410980Z\",\"PerformanceDuration\":\"7632\",\"Latency\":\"50508\"}'),
(167, 41, 'Scheduled', NULL, '2023-06-04 12:00:01', '{\"EnqueueAt\":\"2023-06-04T12:00:02.3832200Z\",\"ScheduledAt\":\"2023-06-04T12:00:01.3832470Z\"}'),
(168, 42, 'Scheduled', NULL, '2023-06-04 12:00:41', '{\"EnqueueAt\":\"2023-06-04T12:00:41.7704240Z\",\"ScheduledAt\":\"2023-06-04T12:00:40.7704270Z\"}'),
(169, 43, 'Scheduled', NULL, '2023-06-04 12:00:56', '{\"EnqueueAt\":\"2023-06-04T12:00:56.7200510Z\",\"ScheduledAt\":\"2023-06-04T12:00:55.7200540Z\"}'),
(170, 41, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 12:01:11', '{\"EnqueuedAt\":\"2023-06-04T12:01:10.4742350Z\",\"Queue\":\"default\"}'),
(171, 42, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 12:01:11', '{\"EnqueuedAt\":\"2023-06-04T12:01:10.5493490Z\",\"Queue\":\"default\"}'),
(172, 43, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 12:01:11', '{\"EnqueuedAt\":\"2023-06-04T12:01:10.5531470Z\",\"Queue\":\"default\"}'),
(173, 41, 'Processing', NULL, '2023-06-04 12:01:23', '{\"StartedAt\":\"2023-06-04T12:01:23.3604150Z\",\"ServerId\":\"2eb9ef0f-5693-42b1-9ba2-bdaf5284f51b\",\"WorkerId\":\"559da5f9-942f-4625-8a7d-406006bd7a13\"}'),
(174, 43, 'Processing', NULL, '2023-06-04 12:01:23', '{\"StartedAt\":\"2023-06-04T12:01:23.3610620Z\",\"ServerId\":\"2eb9ef0f-5693-42b1-9ba2-bdaf5284f51b\",\"WorkerId\":\"eaa590f0-b676-4e4c-88aa-7ab305eb5d24\"}'),
(175, 42, 'Processing', NULL, '2023-06-04 12:01:23', '{\"StartedAt\":\"2023-06-04T12:01:23.3605850Z\",\"ServerId\":\"2eb9ef0f-5693-42b1-9ba2-bdaf5284f51b\",\"WorkerId\":\"a06f70d6-8dcb-45a1-87e2-4f3eb1b1c477\"}'),
(176, 42, 'Succeeded', NULL, '2023-06-04 12:01:29', '{\"SucceededAt\":\"2023-06-04T12:01:28.6875350Z\",\"PerformanceDuration\":\"5317\",\"Latency\":\"42369\"}'),
(177, 41, 'Succeeded', NULL, '2023-06-04 12:01:29', '{\"SucceededAt\":\"2023-06-04T12:01:28.6875060Z\",\"PerformanceDuration\":\"5317\",\"Latency\":\"82369\"}'),
(178, 43, 'Succeeded', NULL, '2023-06-04 12:01:29', '{\"SucceededAt\":\"2023-06-04T12:01:28.6875230Z\",\"PerformanceDuration\":\"5317\",\"Latency\":\"27369\"}'),
(179, 44, 'Scheduled', NULL, '2023-06-04 12:37:02', '{\"EnqueueAt\":\"2023-06-04T12:37:02.7572800Z\",\"ScheduledAt\":\"2023-06-04T12:37:01.7573270Z\"}'),
(180, 45, 'Scheduled', NULL, '2023-06-04 12:37:03', '{\"EnqueueAt\":\"2023-06-04T12:37:03.8991150Z\",\"ScheduledAt\":\"2023-06-04T12:37:02.8991180Z\"}'),
(181, 46, 'Scheduled', NULL, '2023-06-04 12:37:04', '{\"EnqueueAt\":\"2023-06-04T12:37:04.9465180Z\",\"ScheduledAt\":\"2023-06-04T12:37:03.9465210Z\"}'),
(182, 47, 'Scheduled', NULL, '2023-06-04 12:37:05', '{\"EnqueueAt\":\"2023-06-04T12:37:05.6427940Z\",\"ScheduledAt\":\"2023-06-04T12:37:04.6427970Z\"}'),
(183, 48, 'Scheduled', NULL, '2023-06-04 12:37:05', '{\"EnqueueAt\":\"2023-06-04T12:37:06.4351450Z\",\"ScheduledAt\":\"2023-06-04T12:37:05.4351470Z\"}'),
(184, 49, 'Scheduled', NULL, '2023-06-04 12:37:06', '{\"EnqueueAt\":\"2023-06-04T12:37:06.9983760Z\",\"ScheduledAt\":\"2023-06-04T12:37:05.9983790Z\"}'),
(185, 50, 'Scheduled', NULL, '2023-06-04 12:37:07', '{\"EnqueueAt\":\"2023-06-04T12:37:08.0649970Z\",\"ScheduledAt\":\"2023-06-04T12:37:07.0650010Z\"}'),
(186, 44, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 12:37:24', '{\"EnqueuedAt\":\"2023-06-04T12:37:24.3168490Z\",\"Queue\":\"default\"}'),
(187, 45, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 12:37:24', '{\"EnqueuedAt\":\"2023-06-04T12:37:24.3697540Z\",\"Queue\":\"default\"}'),
(188, 46, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 12:37:24', '{\"EnqueuedAt\":\"2023-06-04T12:37:24.3773840Z\",\"Queue\":\"default\"}'),
(189, 47, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 12:37:24', '{\"EnqueuedAt\":\"2023-06-04T12:37:24.3833120Z\",\"Queue\":\"default\"}'),
(190, 48, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 12:37:24', '{\"EnqueuedAt\":\"2023-06-04T12:37:24.3879000Z\",\"Queue\":\"default\"}'),
(191, 49, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 12:37:24', '{\"EnqueuedAt\":\"2023-06-04T12:37:24.3922370Z\",\"Queue\":\"default\"}'),
(192, 50, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 12:37:24', '{\"EnqueuedAt\":\"2023-06-04T12:37:24.3954860Z\",\"Queue\":\"default\"}'),
(193, 49, 'Processing', NULL, '2023-06-04 12:37:39', '{\"StartedAt\":\"2023-06-04T12:37:39.0317340Z\",\"ServerId\":\"40094e92-1af4-4af2-87ab-6e880d9b5dd5\",\"WorkerId\":\"c88efcf0-c6e6-4a13-aa12-770688407b0e\"}'),
(194, 47, 'Processing', NULL, '2023-06-04 12:37:39', '{\"StartedAt\":\"2023-06-04T12:37:39.0197310Z\",\"ServerId\":\"40094e92-1af4-4af2-87ab-6e880d9b5dd5\",\"WorkerId\":\"20d67b13-47fd-4d10-be4b-fbf9953ca259\"}'),
(195, 46, 'Processing', NULL, '2023-06-04 12:37:39', '{\"StartedAt\":\"2023-06-04T12:37:39.0150030Z\",\"ServerId\":\"40094e92-1af4-4af2-87ab-6e880d9b5dd5\",\"WorkerId\":\"f7042467-1f26-4d2e-899a-0f7c0fc4ef3d\"}'),
(196, 50, 'Processing', NULL, '2023-06-04 12:37:39', '{\"StartedAt\":\"2023-06-04T12:37:39.0329400Z\",\"ServerId\":\"40094e92-1af4-4af2-87ab-6e880d9b5dd5\",\"WorkerId\":\"72319435-07d6-48ce-b057-11f411848285\"}'),
(197, 48, 'Processing', NULL, '2023-06-04 12:37:39', '{\"StartedAt\":\"2023-06-04T12:37:39.0282010Z\",\"ServerId\":\"40094e92-1af4-4af2-87ab-6e880d9b5dd5\",\"WorkerId\":\"1e6067b9-fa26-47c0-87d0-7648808cd735\"}'),
(198, 44, 'Processing', NULL, '2023-06-04 12:37:39', '{\"StartedAt\":\"2023-06-04T12:37:39.0128470Z\",\"ServerId\":\"40094e92-1af4-4af2-87ab-6e880d9b5dd5\",\"WorkerId\":\"78f381a3-fd67-46e9-b3aa-ff627f890542\"}'),
(199, 45, 'Processing', NULL, '2023-06-04 12:37:39', '{\"StartedAt\":\"2023-06-04T12:37:39.0148370Z\",\"ServerId\":\"40094e92-1af4-4af2-87ab-6e880d9b5dd5\",\"WorkerId\":\"3dd74477-9b87-4080-928e-dde97abef52a\"}'),
(200, 50, 'Succeeded', NULL, '2023-06-04 12:37:47', '{\"SucceededAt\":\"2023-06-04T12:37:47.1786870Z\",\"PerformanceDuration\":\"8087\",\"Latency\":\"32091\"}'),
(201, 45, 'Succeeded', NULL, '2023-06-04 12:37:47', '{\"SucceededAt\":\"2023-06-04T12:37:47.1786700Z\",\"PerformanceDuration\":\"8087\",\"Latency\":\"36090\"}'),
(202, 49, 'Succeeded', NULL, '2023-06-04 12:37:47', '{\"SucceededAt\":\"2023-06-04T12:37:47.1786840Z\",\"PerformanceDuration\":\"8087\",\"Latency\":\"33091\"}'),
(203, 44, 'Succeeded', NULL, '2023-06-04 12:37:47', '{\"SucceededAt\":\"2023-06-04T12:37:47.1786780Z\",\"PerformanceDuration\":\"8087\",\"Latency\":\"37090\"}'),
(204, 46, 'Succeeded', NULL, '2023-06-04 12:37:48', '{\"SucceededAt\":\"2023-06-04T12:37:47.5288420Z\",\"PerformanceDuration\":\"8437\",\"Latency\":\"35090\"}'),
(205, 47, 'Succeeded', NULL, '2023-06-04 12:37:48', '{\"SucceededAt\":\"2023-06-04T12:37:47.5262540Z\",\"PerformanceDuration\":\"8435\",\"Latency\":\"34091\"}'),
(206, 48, 'Succeeded', NULL, '2023-06-04 12:37:48', '{\"SucceededAt\":\"2023-06-04T12:37:47.5321220Z\",\"PerformanceDuration\":\"8440\",\"Latency\":\"34091\"}'),
(207, 51, 'Scheduled', NULL, '2023-06-04 12:38:48', '{\"EnqueueAt\":\"2023-06-04T12:38:48.6875970Z\",\"ScheduledAt\":\"2023-06-04T12:38:47.6876210Z\"}'),
(208, 52, 'Scheduled', NULL, '2023-06-04 12:39:18', '{\"EnqueueAt\":\"2023-06-04T12:39:18.5527030Z\",\"ScheduledAt\":\"2023-06-04T12:39:17.5527040Z\"}'),
(209, 51, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 12:39:36', '{\"EnqueuedAt\":\"2023-06-04T12:39:35.5827680Z\",\"Queue\":\"default\"}'),
(210, 52, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 12:39:36', '{\"EnqueuedAt\":\"2023-06-04T12:39:35.6434390Z\",\"Queue\":\"default\"}'),
(211, 52, 'Processing', NULL, '2023-06-04 12:39:50', '{\"StartedAt\":\"2023-06-04T12:39:49.6865400Z\",\"ServerId\":\"09de3be7-04ac-4627-a73b-898a9ca78ca3\",\"WorkerId\":\"d9e36c6f-d4fd-4018-918a-985a02b22b06\"}'),
(212, 51, 'Processing', NULL, '2023-06-04 12:39:50', '{\"StartedAt\":\"2023-06-04T12:39:49.6865150Z\",\"ServerId\":\"09de3be7-04ac-4627-a73b-898a9ca78ca3\",\"WorkerId\":\"fc151383-2388-498f-847b-3803bc5248fb\"}'),
(213, 52, 'Succeeded', NULL, '2023-06-04 12:41:40', '{\"SucceededAt\":\"2023-06-04T12:41:39.7508690Z\",\"PerformanceDuration\":\"110051\",\"Latency\":\"31697\"}'),
(214, 51, 'Succeeded', NULL, '2023-06-04 12:41:40', '{\"SucceededAt\":\"2023-06-04T12:41:39.7508770Z\",\"PerformanceDuration\":\"110051\",\"Latency\":\"61697\"}'),
(215, 53, 'Scheduled', NULL, '2023-06-04 15:34:39', '{\"EnqueueAt\":\"2023-06-04T15:34:40.2994850Z\",\"ScheduledAt\":\"2023-06-04T15:34:39.2995180Z\"}'),
(216, 53, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 15:34:44', '{\"EnqueuedAt\":\"2023-06-04T15:34:43.9865720Z\",\"Queue\":\"default\"}'),
(217, 53, 'Processing', NULL, '2023-06-04 15:34:59', '{\"StartedAt\":\"2023-06-04T15:34:58.8866620Z\",\"ServerId\":\"d8a66077-742d-4eea-8a9e-3653c9ea5d7a\",\"WorkerId\":\"a80224fd-4911-4f14-bae8-37f88a08f2ed\"}'),
(218, 53, 'Failed', 'An exception occurred during performance of the job.', '2023-06-04 15:34:59', '{\"FailedAt\":\"2023-06-04T15:34:58.9766540Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at System.RuntimeMethodHandle.InvokeMethod(Object target, Void** arguments, Signature sig, Boolean isConstructor)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"d8a66077-742d-4eea-8a9e-3653c9ea5d7a\"}'),
(219, 53, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-04 15:34:59', '{\"EnqueueAt\":\"2023-06-04T15:35:40.9814790Z\",\"ScheduledAt\":\"2023-06-04T15:34:58.9814790Z\"}'),
(220, 53, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 15:36:44', '{\"EnqueuedAt\":\"2023-06-04T15:36:44.1103660Z\",\"Queue\":\"default\"}'),
(221, 53, 'Processing', NULL, '2023-06-04 15:36:59', '{\"StartedAt\":\"2023-06-04T15:36:58.9203200Z\",\"ServerId\":\"d8a66077-742d-4eea-8a9e-3653c9ea5d7a\",\"WorkerId\":\"fd62a081-e4f4-4be8-b1a3-a5164f671af1\"}'),
(222, 53, 'Failed', 'An exception occurred during performance of the job.', '2023-06-04 15:36:59', '{\"FailedAt\":\"2023-06-04T15:36:58.9618420Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"d8a66077-742d-4eea-8a9e-3653c9ea5d7a\"}'),
(223, 53, 'Scheduled', 'Retry attempt 2 of 10: Failure sending mail.', '2023-06-04 15:36:59', '{\"EnqueueAt\":\"2023-06-04T15:37:30.9685120Z\",\"ScheduledAt\":\"2023-06-04T15:36:58.9685120Z\"}'),
(224, 53, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 15:36:59', '{\"EnqueuedAt\":\"2023-06-04T15:36:59.1299880Z\",\"Queue\":\"default\"}'),
(225, 53, 'Processing', NULL, '2023-06-04 15:37:14', '{\"StartedAt\":\"2023-06-04T15:37:13.9270790Z\",\"ServerId\":\"d8a66077-742d-4eea-8a9e-3653c9ea5d7a\",\"WorkerId\":\"28b53b43-5102-42e4-8b82-381dff2a55fc\"}'),
(226, 53, 'Failed', 'An exception occurred during performance of the job.', '2023-06-04 15:37:14', '{\"FailedAt\":\"2023-06-04T15:37:13.9632230Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"d8a66077-742d-4eea-8a9e-3653c9ea5d7a\"}'),
(227, 53, 'Scheduled', 'Retry attempt 3 of 10: Failure sending mail.', '2023-06-04 15:37:14', '{\"EnqueueAt\":\"2023-06-04T15:39:02.9674510Z\",\"ScheduledAt\":\"2023-06-04T15:37:13.9674520Z\"}'),
(228, 53, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 15:38:44', '{\"EnqueuedAt\":\"2023-06-04T15:38:44.1696940Z\",\"Queue\":\"default\"}'),
(229, 53, 'Processing', NULL, '2023-06-04 15:38:59', '{\"StartedAt\":\"2023-06-04T15:38:58.9385640Z\",\"ServerId\":\"d8a66077-742d-4eea-8a9e-3653c9ea5d7a\",\"WorkerId\":\"ac4b6639-db89-4934-98ee-05565f3fd020\"}'),
(230, 53, 'Succeeded', NULL, '2023-06-04 15:39:01', '{\"SucceededAt\":\"2023-06-04T15:39:01.0822530Z\",\"PerformanceDuration\":\"2135\",\"Latency\":\"259946\"}'),
(231, 54, 'Scheduled', NULL, '2023-06-04 15:40:24', '{\"EnqueueAt\":\"2023-06-04T15:40:25.0472460Z\",\"ScheduledAt\":\"2023-06-04T15:40:24.0472460Z\"}'),
(232, 54, 'Enqueued', 'Triggered via Dashboard UI', '2023-06-04 15:40:46', '{\"EnqueuedAt\":\"2023-06-04T15:40:45.8007760Z\",\"Queue\":\"default\"}'),
(233, 54, 'Processing', NULL, '2023-06-04 15:40:46', '{\"StartedAt\":\"2023-06-04T15:40:46.1356290Z\",\"ServerId\":\"d8a66077-742d-4eea-8a9e-3653c9ea5d7a\",\"WorkerId\":\"ac4b6639-db89-4934-98ee-05565f3fd020\"}'),
(234, 54, 'Succeeded', NULL, '2023-06-04 15:40:47', '{\"SucceededAt\":\"2023-06-04T15:40:46.9325500Z\",\"PerformanceDuration\":\"790\",\"Latency\":\"22142\"}'),
(235, 54, 'Enqueued', 'Triggered via Dashboard UI', '2023-06-04 15:41:08', '{\"EnqueuedAt\":\"2023-06-04T15:41:08.1753770Z\",\"Queue\":\"default\"}'),
(236, 54, 'Processing', NULL, '2023-06-04 15:41:14', '{\"StartedAt\":\"2023-06-04T15:41:13.9720100Z\",\"ServerId\":\"d8a66077-742d-4eea-8a9e-3653c9ea5d7a\",\"WorkerId\":\"74f56ed1-a56a-43c6-ae3b-2a360a04be8e\"}'),
(237, 54, 'Succeeded', NULL, '2023-06-04 15:41:14', '{\"SucceededAt\":\"2023-06-04T15:41:14.1377240Z\",\"PerformanceDuration\":\"159\",\"Latency\":\"49978\"}'),
(238, 54, 'Enqueued', 'Triggered via Dashboard UI', '2023-06-04 15:41:32', '{\"EnqueuedAt\":\"2023-06-04T15:41:32.2977110Z\",\"Queue\":\"default\"}'),
(239, 54, 'Processing', NULL, '2023-06-04 15:41:44', '{\"StartedAt\":\"2023-06-04T15:41:43.9825900Z\",\"ServerId\":\"d8a66077-742d-4eea-8a9e-3653c9ea5d7a\",\"WorkerId\":\"4c623c94-460a-4754-8747-f9ba17cad3f8\"}'),
(240, 54, 'Succeeded', NULL, '2023-06-04 15:41:44', '{\"SucceededAt\":\"2023-06-04T15:41:44.1290750Z\",\"PerformanceDuration\":\"138\",\"Latency\":\"79990\"}'),
(241, 55, 'Scheduled', NULL, '2023-06-04 16:03:26', '{\"EnqueueAt\":\"2023-06-04T16:03:26.6072020Z\",\"ScheduledAt\":\"2023-06-04T16:03:25.6072920Z\"}'),
(242, 55, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 16:04:21', '{\"EnqueuedAt\":\"2023-06-04T16:04:21.1313490Z\",\"Queue\":\"default\"}'),
(243, 55, 'Processing', NULL, '2023-06-04 16:04:36', '{\"StartedAt\":\"2023-06-04T16:04:36.0340360Z\",\"ServerId\":\"785a97f4-711d-4f84-ae40-7f2bc14bf8d8\",\"WorkerId\":\"a4f0d5e5-346b-42be-8496-cead8138ea7a\"}'),
(244, 55, 'Succeeded', NULL, '2023-06-04 16:04:37', '{\"SucceededAt\":\"2023-06-04T16:04:36.7490330Z\",\"PerformanceDuration\":\"700\",\"Latency\":\"70047\"}'),
(245, 56, 'Scheduled', NULL, '2023-06-04 16:08:48', '{\"EnqueueAt\":\"2023-06-04T16:08:49.2479990Z\",\"ScheduledAt\":\"2023-06-04T16:08:48.2481110Z\"}'),
(246, 56, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 16:11:47', '{\"EnqueuedAt\":\"2023-06-04T16:11:46.8546210Z\",\"Queue\":\"default\"}'),
(247, 56, 'Processing', NULL, '2023-06-04 16:12:02', '{\"StartedAt\":\"2023-06-04T16:12:01.8501090Z\",\"ServerId\":\"dfe05f43-764a-4ba3-815f-c126100ae5f3\",\"WorkerId\":\"047671f9-cc3a-45d8-b80d-84b314a630d4\"}');
INSERT INTO `Hangfire_State` (`Id`, `JobId`, `Name`, `Reason`, `CreatedAt`, `Data`) VALUES
(248, 56, 'Failed', 'An exception occurred during performance of the job.', '2023-06-04 16:13:22', '{\"FailedAt\":\"2023-06-04T16:13:21.3808060Z\",\"ExceptionType\":\"System.Net.WebException\",\"ExceptionMessage\":\"The SSL connection could not be established, see inner exception.\",\"ExceptionDetails\":\"System.Net.WebException: The SSL connection could not be established, see inner exception.\\n ---> System.Net.Http.HttpRequestException: The SSL connection could not be established, see inner exception.\\n ---> System.IO.IOException:  Received an unexpected EOF or 0 bytes from the transport stream.\\n   at System.Net.Security.SslStream.ReceiveBlobAsync[TIOAdapter](CancellationToken cancellationToken)\\n   at System.Net.Security.SslStream.ForceAuthenticationAsync[TIOAdapter](Boolean receiveFirst, Byte[] reAuthenticationData, CancellationToken cancellationToken)\\n   at System.Net.Http.ConnectHelper.EstablishSslConnectionAsync(SslClientAuthenticationOptions sslOptions, HttpRequestMessage request, Boolean async, Stream stream, CancellationToken cancellationToken)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Http.ConnectHelper.EstablishSslConnectionAsync(SslClientAuthenticationOptions sslOptions, HttpRequestMessage request, Boolean async, Stream stream, CancellationToken cancellationToken)\\n   at System.Net.Http.HttpConnectionPool.ConnectAsync(HttpRequestMessage request, Boolean async, CancellationToken cancellationToken)\\n   at System.Net.Http.HttpConnectionPool.CreateHttp11ConnectionAsync(HttpRequestMessage request, Boolean async, CancellationToken cancellationToken)\\n   at System.Net.Http.HttpConnectionPool.AddHttp11ConnectionAsync(QueueItem queueItem)\\n   at System.Threading.Tasks.TaskCompletionSourceWithCancellation`1.WaitWithCancellation(CancellationToken cancellationToken)\\n   at System.Threading.Tasks.TaskCompletionSourceWithCancellation`1.WaitWithCancellationAsync(Boolean async, CancellationToken cancellationToken)\\n   at System.Net.Http.HttpConnectionPool.HttpConnectionWaiter`1.WaitForConnectionAsync(Boolean async, CancellationToken requestCancellationToken)\\n   at System.Net.Http.HttpConnectionPool.SendWithVersionDetectionAndRetryAsync(HttpRequestMessage request, Boolean async, Boolean doRequestAuth, CancellationToken cancellationToken)\\n   at System.Net.Http.HttpMessageHandlerStage.Send(HttpRequestMessage request, CancellationToken cancellationToken)\\n   at System.Net.Http.DiagnosticsHandler.SendAsync(HttpRequestMessage request, Boolean async, CancellationToken cancellationToken)\\n   at System.Net.Http.RedirectHandler.SendAsync(HttpRequestMessage request, Boolean async, CancellationToken cancellationToken)\\n   at System.Net.Http.HttpMessageHandlerStage.Send(HttpRequestMessage request, CancellationToken cancellationToken)\\n   at System.Net.Http.SocketsHttpHandler.Send(HttpRequestMessage request, CancellationToken cancellationToken)\\n   at System.Net.Http.HttpClient.Send(HttpRequestMessage request, HttpCompletionOption completionOption, CancellationToken cancellationToken)\\n   at System.Net.HttpWebRequest.SendRequest(Boolean async)\\n   at System.Net.HttpWebRequest.GetResponse()\\n   --- End of inner exception stack trace ---\\n   at System.Net.HttpWebRequest.GetResponse()\\n   at System.Net.WebClient.GetWebResponse(WebRequest request)\\n   at System.Net.WebClient.DownloadBits(WebRequest request, Stream writeStream)\\n   at System.Net.WebClient.UploadBits(WebRequest request, Stream readStream, Byte[] buffer, Int32 chunkSize, Byte[] header, Byte[] footer)\\n   at System.Net.WebClient.UploadDataInternal(Uri address, String method, Byte[] data, WebRequest& request)\\n   at System.Net.WebClient.UploadString(Uri address, String method, String data)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.SmsService.Send(String message, String phoneNumber) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/SmsService.cs:line 30\\n   at System.RuntimeMethodHandle.InvokeMethod(Object target, Void** arguments, Signature sig, Boolean isConstructor)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"dfe05f43-764a-4ba3-815f-c126100ae5f3\"}'),
(249, 56, 'Scheduled', 'Retry attempt 1 of 10: The SSL connection could not be established, see …', '2023-06-04 16:13:22', '{\"EnqueueAt\":\"2023-06-04T16:14:05.3908590Z\",\"ScheduledAt\":\"2023-06-04T16:13:21.3909040Z\"}'),
(250, 56, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 16:15:04', '{\"EnqueuedAt\":\"2023-06-04T16:15:03.7614910Z\",\"Queue\":\"default\"}'),
(251, 57, 'Scheduled', NULL, '2023-06-04 16:15:14', '{\"EnqueueAt\":\"2023-06-04T16:15:14.9706020Z\",\"ScheduledAt\":\"2023-06-04T16:15:13.9706410Z\"}'),
(252, 57, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 16:17:41', '{\"EnqueuedAt\":\"2023-06-04T16:17:40.3924560Z\",\"Queue\":\"default\"}'),
(253, 56, 'Processing', NULL, '2023-06-04 16:17:41', '{\"StartedAt\":\"2023-06-04T16:17:40.5500060Z\",\"ServerId\":\"e5298bb0-181d-4920-b40a-11209becfdc3\",\"WorkerId\":\"aface305-389f-4913-9f5d-d2a183513b14\"}'),
(254, 56, 'Succeeded', NULL, '2023-06-04 16:17:42', '{\"SucceededAt\":\"2023-06-04T16:17:41.6810700Z\",\"PerformanceDuration\":\"968\",\"Latency\":\"532712\"}'),
(255, 57, 'Processing', NULL, '2023-06-04 16:17:42', '{\"StartedAt\":\"2023-06-04T16:17:41.7053330Z\",\"ServerId\":\"e5298bb0-181d-4920-b40a-11209becfdc3\",\"WorkerId\":\"aface305-389f-4913-9f5d-d2a183513b14\"}'),
(256, 57, 'Succeeded', NULL, '2023-06-04 16:17:42', '{\"SucceededAt\":\"2023-06-04T16:17:41.8710870Z\",\"PerformanceDuration\":\"160\",\"Latency\":\"147710\"}'),
(257, 58, 'Scheduled', NULL, '2023-06-04 16:19:34', '{\"EnqueueAt\":\"2023-06-04T16:19:34.5981320Z\",\"ScheduledAt\":\"2023-06-04T16:19:33.5981570Z\"}'),
(258, 58, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 16:20:05', '{\"EnqueuedAt\":\"2023-06-04T16:20:03.2675780Z\",\"Queue\":\"default\"}'),
(259, 58, 'Processing', NULL, '2023-06-04 16:22:08', '{\"StartedAt\":\"2023-06-04T16:22:07.8570260Z\",\"ServerId\":\"f3f9574e-93e7-40a0-b82d-f5f876ee6bb5\",\"WorkerId\":\"2a926f62-66a8-424e-9741-cbeb78a8a5df\"}'),
(260, 58, 'Succeeded', NULL, '2023-06-04 16:22:09', '{\"SucceededAt\":\"2023-06-04T16:22:08.5055820Z\",\"PerformanceDuration\":\"578\",\"Latency\":\"153926\"}'),
(261, 59, 'Scheduled', NULL, '2023-06-04 16:23:53', '{\"EnqueueAt\":\"2023-06-04T16:23:53.8686500Z\",\"ScheduledAt\":\"2023-06-04T16:23:52.8686990Z\"}'),
(262, 59, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 16:25:05', '{\"EnqueuedAt\":\"2023-06-04T16:25:04.6126700Z\",\"Queue\":\"default\"}'),
(263, 59, 'Processing', NULL, '2023-06-04 16:25:20', '{\"StartedAt\":\"2023-06-04T16:25:19.5389420Z\",\"ServerId\":\"f3f9574e-93e7-40a0-b82d-f5f876ee6bb5\",\"WorkerId\":\"1aa444e3-e8a9-4933-b25b-b3c65ff6e18c\"}'),
(264, 59, 'Succeeded', NULL, '2023-06-04 16:25:20', '{\"SucceededAt\":\"2023-06-04T16:25:20.0441270Z\",\"PerformanceDuration\":\"495\",\"Latency\":\"86548\"}'),
(265, 60, 'Scheduled', NULL, '2023-06-04 16:26:48', '{\"EnqueueAt\":\"2023-06-04T16:26:49.1657250Z\",\"ScheduledAt\":\"2023-06-04T16:26:48.1657260Z\"}'),
(266, 60, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 16:27:59', '{\"EnqueuedAt\":\"2023-06-04T16:27:58.3141930Z\",\"Queue\":\"default\"}'),
(267, 60, 'Processing', NULL, '2023-06-04 16:28:13', '{\"StartedAt\":\"2023-06-04T16:28:13.3098790Z\",\"ServerId\":\"9af24c3d-16fd-4d4f-bf97-a366401c17a5\",\"WorkerId\":\"ff2f99fc-b1fb-4e73-a42e-55875f0cc7e9\"}'),
(268, 60, 'Succeeded', NULL, '2023-06-04 16:28:14', '{\"SucceededAt\":\"2023-06-04T16:28:13.8691000Z\",\"PerformanceDuration\":\"544\",\"Latency\":\"85323\"}'),
(269, 61, 'Scheduled', NULL, '2023-06-04 16:31:36', '{\"EnqueueAt\":\"2023-06-04T16:31:36.5588570Z\",\"ScheduledAt\":\"2023-06-04T16:31:35.5588820Z\"}'),
(270, 61, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 16:32:22', '{\"EnqueuedAt\":\"2023-06-04T16:32:21.4764110Z\",\"Queue\":\"default\"}'),
(271, 61, 'Processing', NULL, '2023-06-04 16:32:36', '{\"StartedAt\":\"2023-06-04T16:32:36.4906820Z\",\"ServerId\":\"617b1bbf-60c4-436f-ad54-ed16665b25ba\",\"WorkerId\":\"619f2a37-2d45-49a7-948a-1668fbeb2f24\"}'),
(272, 61, 'Succeeded', NULL, '2023-06-04 16:32:37', '{\"SucceededAt\":\"2023-06-04T16:32:37.0377770Z\",\"PerformanceDuration\":\"536\",\"Latency\":\"60500\"}'),
(273, 62, 'Scheduled', NULL, '2023-06-04 16:34:23', '{\"EnqueueAt\":\"2023-06-04T16:34:24.3643620Z\",\"ScheduledAt\":\"2023-06-04T16:34:23.3643640Z\"}'),
(274, 62, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 16:34:37', '{\"EnqueuedAt\":\"2023-06-04T16:34:36.5613530Z\",\"Queue\":\"default\"}'),
(275, 62, 'Processing', NULL, '2023-06-04 16:34:37', '{\"StartedAt\":\"2023-06-04T16:34:37.0990310Z\",\"ServerId\":\"617b1bbf-60c4-436f-ad54-ed16665b25ba\",\"WorkerId\":\"619f2a37-2d45-49a7-948a-1668fbeb2f24\"}'),
(276, 62, 'Succeeded', NULL, '2023-06-04 16:34:38', '{\"SucceededAt\":\"2023-06-04T16:34:37.6026900Z\",\"PerformanceDuration\":\"495\",\"Latency\":\"14107\"}'),
(277, 63, 'Scheduled', NULL, '2023-06-04 16:34:42', '{\"EnqueueAt\":\"2023-06-04T16:34:43.3818030Z\",\"ScheduledAt\":\"2023-06-04T16:34:42.3818050Z\"}'),
(278, 63, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 16:34:52', '{\"EnqueuedAt\":\"2023-06-04T16:34:51.5778500Z\",\"Queue\":\"default\"}'),
(279, 63, 'Processing', NULL, '2023-06-04 16:34:53', '{\"StartedAt\":\"2023-06-04T16:34:52.6257250Z\",\"ServerId\":\"617b1bbf-60c4-436f-ad54-ed16665b25ba\",\"WorkerId\":\"619f2a37-2d45-49a7-948a-1668fbeb2f24\"}'),
(280, 63, 'Succeeded', NULL, '2023-06-04 16:34:53', '{\"SucceededAt\":\"2023-06-04T16:34:52.7871630Z\",\"PerformanceDuration\":\"153\",\"Latency\":\"10634\"}'),
(281, 64, 'Scheduled', NULL, '2023-06-04 16:35:02', '{\"EnqueueAt\":\"2023-06-04T16:35:02.9235570Z\",\"ScheduledAt\":\"2023-06-04T16:35:01.9235590Z\"}'),
(282, 64, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 16:35:07', '{\"EnqueuedAt\":\"2023-06-04T16:35:06.5935960Z\",\"Queue\":\"default\"}'),
(283, 64, 'Processing', NULL, '2023-06-04 16:35:08', '{\"StartedAt\":\"2023-06-04T16:35:07.8061520Z\",\"ServerId\":\"617b1bbf-60c4-436f-ad54-ed16665b25ba\",\"WorkerId\":\"619f2a37-2d45-49a7-948a-1668fbeb2f24\"}'),
(284, 64, 'Succeeded', NULL, '2023-06-04 16:35:08', '{\"SucceededAt\":\"2023-06-04T16:35:07.9724260Z\",\"PerformanceDuration\":\"159\",\"Latency\":\"5812\"}'),
(285, 65, 'Scheduled', NULL, '2023-06-04 16:35:43', '{\"EnqueueAt\":\"2023-06-04T16:35:43.7066100Z\",\"ScheduledAt\":\"2023-06-04T16:35:42.7066120Z\"}'),
(286, 65, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 16:36:22', '{\"EnqueuedAt\":\"2023-06-04T16:36:21.6317390Z\",\"Queue\":\"default\"}'),
(287, 65, 'Processing', NULL, '2023-06-04 16:36:23', '{\"StartedAt\":\"2023-06-04T16:36:23.0121410Z\",\"ServerId\":\"617b1bbf-60c4-436f-ad54-ed16665b25ba\",\"WorkerId\":\"619f2a37-2d45-49a7-948a-1668fbeb2f24\"}'),
(288, 65, 'Succeeded', NULL, '2023-06-04 16:36:24', '{\"SucceededAt\":\"2023-06-04T16:36:23.5019570Z\",\"PerformanceDuration\":\"482\",\"Latency\":\"40019\"}'),
(289, 66, 'Scheduled', NULL, '2023-06-04 16:50:39', '{\"EnqueueAt\":\"2023-06-04T16:50:39.8050800Z\",\"ScheduledAt\":\"2023-06-04T16:50:38.8051090Z\"}'),
(290, 67, 'Scheduled', NULL, '2023-06-04 16:50:55', '{\"EnqueueAt\":\"2023-06-04T16:50:55.7739580Z\",\"ScheduledAt\":\"2023-06-04T16:50:54.7739610Z\"}'),
(291, 68, 'Scheduled', NULL, '2023-06-04 16:50:58', '{\"EnqueueAt\":\"2023-06-04T16:50:59.2466130Z\",\"ScheduledAt\":\"2023-06-04T16:50:58.2466160Z\"}'),
(292, 69, 'Scheduled', NULL, '2023-06-04 16:51:06', '{\"EnqueueAt\":\"2023-06-04T16:51:06.5719730Z\",\"ScheduledAt\":\"2023-06-04T16:51:05.5719760Z\"}'),
(293, 66, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 16:51:17', '{\"EnqueuedAt\":\"2023-06-04T16:51:17.4797090Z\",\"Queue\":\"default\"}'),
(294, 67, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 16:51:18', '{\"EnqueuedAt\":\"2023-06-04T16:51:17.5020650Z\",\"Queue\":\"default\"}'),
(295, 68, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 16:51:18', '{\"EnqueuedAt\":\"2023-06-04T16:51:17.5085810Z\",\"Queue\":\"default\"}'),
(296, 69, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 16:51:18', '{\"EnqueuedAt\":\"2023-06-04T16:51:17.5138630Z\",\"Queue\":\"default\"}'),
(297, 69, 'Processing', NULL, '2023-06-04 16:51:32', '{\"StartedAt\":\"2023-06-04T16:51:32.4744260Z\",\"ServerId\":\"a405587f-e862-4532-81c5-253feafdb2a0\",\"WorkerId\":\"b98e3d4d-841c-4b43-a62b-0dbec5e12ed9\"}'),
(298, 68, 'Processing', NULL, '2023-06-04 16:51:32', '{\"StartedAt\":\"2023-06-04T16:51:32.4744570Z\",\"ServerId\":\"a405587f-e862-4532-81c5-253feafdb2a0\",\"WorkerId\":\"02193ac3-8270-4fdc-8743-a38e3e21fb0d\"}'),
(299, 66, 'Processing', NULL, '2023-06-04 16:51:32', '{\"StartedAt\":\"2023-06-04T16:51:32.4743300Z\",\"ServerId\":\"a405587f-e862-4532-81c5-253feafdb2a0\",\"WorkerId\":\"bf9e657d-d982-475f-a682-e5cc775158ac\"}'),
(300, 67, 'Processing', NULL, '2023-06-04 16:51:32', '{\"StartedAt\":\"2023-06-04T16:51:32.4743230Z\",\"ServerId\":\"a405587f-e862-4532-81c5-253feafdb2a0\",\"WorkerId\":\"9797a3f1-ccbf-4c2c-aac6-3c99303646af\"}'),
(301, 69, 'Succeeded', NULL, '2023-06-04 16:51:33', '{\"SucceededAt\":\"2023-06-04T16:51:33.0108920Z\",\"PerformanceDuration\":\"528\",\"Latency\":\"26482\"}'),
(302, 66, 'Succeeded', NULL, '2023-06-04 16:51:33', '{\"SucceededAt\":\"2023-06-04T16:51:33.0156070Z\",\"PerformanceDuration\":\"533\",\"Latency\":\"53482\"}'),
(303, 68, 'Succeeded', NULL, '2023-06-04 16:51:33', '{\"SucceededAt\":\"2023-06-04T16:51:33.0100090Z\",\"PerformanceDuration\":\"527\",\"Latency\":\"34482\"}'),
(304, 67, 'Succeeded', NULL, '2023-06-04 16:51:33', '{\"SucceededAt\":\"2023-06-04T16:51:33.0207390Z\",\"PerformanceDuration\":\"538\",\"Latency\":\"37482\"}'),
(305, 70, 'Scheduled', NULL, '2023-06-04 16:52:43', '{\"EnqueueAt\":\"2023-06-04T16:52:43.8287240Z\",\"ScheduledAt\":\"2023-06-04T16:52:42.8290210Z\"}'),
(306, 70, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 16:53:21', '{\"EnqueuedAt\":\"2023-06-04T16:53:21.0741500Z\",\"Queue\":\"default\"}'),
(307, 70, 'Processing', NULL, '2023-06-04 16:53:36', '{\"StartedAt\":\"2023-06-04T16:53:36.0410180Z\",\"ServerId\":\"57aae917-3524-4706-ae02-f1fec42268a3\",\"WorkerId\":\"d38330dd-5a89-4f0d-81a9-619312b0c485\"}'),
(308, 70, 'Succeeded', NULL, '2023-06-04 16:58:19', '{\"SucceededAt\":\"2023-06-04T16:58:18.5643090Z\",\"PerformanceDuration\":\"282536\",\"Latency\":\"53055\"}'),
(309, 71, 'Scheduled', NULL, '2023-06-04 17:01:19', '{\"EnqueueAt\":\"2023-06-04T17:01:20.4235880Z\",\"ScheduledAt\":\"2023-06-04T17:01:19.4235900Z\"}'),
(310, 71, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 17:02:04', '{\"EnqueuedAt\":\"2023-06-04T17:02:03.7016720Z\",\"Queue\":\"default\"}'),
(311, 71, 'Processing', NULL, '2023-06-04 17:02:19', '{\"StartedAt\":\"2023-06-04T17:02:18.6446050Z\",\"ServerId\":\"57aae917-3524-4706-ae02-f1fec42268a3\",\"WorkerId\":\"6d2686af-dc1d-4214-b7a7-0899b1e60d97\"}'),
(312, 71, 'Succeeded', NULL, '2023-06-04 17:02:32', '{\"SucceededAt\":\"2023-06-04T17:02:31.8299340Z\",\"PerformanceDuration\":\"13175\",\"Latency\":\"59654\"}'),
(313, 72, 'Scheduled', NULL, '2023-06-04 17:06:18', '{\"EnqueueAt\":\"2023-06-04T17:06:18.6035700Z\",\"ScheduledAt\":\"2023-06-04T17:06:17.6035910Z\"}'),
(314, 72, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 17:06:26', '{\"EnqueuedAt\":\"2023-06-04T17:06:26.0084910Z\",\"Queue\":\"default\"}'),
(315, 72, 'Processing', NULL, '2023-06-04 17:06:41', '{\"StartedAt\":\"2023-06-04T17:06:40.9799810Z\",\"ServerId\":\"4ce0d550-53a2-46cd-8d72-fa4f4ff8f5ee\",\"WorkerId\":\"060dc13a-ff4a-4b02-b886-2d24c923e452\"}'),
(316, 72, 'Succeeded', NULL, '2023-06-04 17:06:44', '{\"SucceededAt\":\"2023-06-04T17:06:43.9828880Z\",\"PerformanceDuration\":\"2986\",\"Latency\":\"22996\"}'),
(317, 73, 'Scheduled', NULL, '2023-06-04 17:07:01', '{\"EnqueueAt\":\"2023-06-04T17:07:02.2304110Z\",\"ScheduledAt\":\"2023-06-04T17:07:01.2304150Z\"}'),
(318, 73, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 17:07:13', '{\"EnqueuedAt\":\"2023-06-04T17:07:13.4729500Z\",\"Queue\":\"default\"}'),
(319, 73, 'Processing', NULL, '2023-06-04 17:07:14', '{\"StartedAt\":\"2023-06-04T17:07:14.0143450Z\",\"ServerId\":\"4ce0d550-53a2-46cd-8d72-fa4f4ff8f5ee\",\"WorkerId\":\"060dc13a-ff4a-4b02-b886-2d24c923e452\"}'),
(320, 73, 'Succeeded', NULL, '2023-06-04 17:07:18', '{\"SucceededAt\":\"2023-06-04T17:07:17.9286520Z\",\"PerformanceDuration\":\"3905\",\"Latency\":\"13023\"}'),
(321, 74, 'Scheduled', NULL, '2023-06-04 17:07:30', '{\"EnqueueAt\":\"2023-06-04T17:07:31.0725190Z\",\"ScheduledAt\":\"2023-06-04T17:07:30.0725200Z\"}'),
(322, 74, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 17:08:29', '{\"EnqueuedAt\":\"2023-06-04T17:08:28.5126470Z\",\"Queue\":\"default\"}'),
(323, 74, 'Processing', NULL, '2023-06-04 17:08:33', '{\"StartedAt\":\"2023-06-04T17:08:32.9647040Z\",\"ServerId\":\"4ce0d550-53a2-46cd-8d72-fa4f4ff8f5ee\",\"WorkerId\":\"060dc13a-ff4a-4b02-b886-2d24c923e452\"}'),
(324, 74, 'Succeeded', NULL, '2023-06-04 17:08:38', '{\"SucceededAt\":\"2023-06-04T17:08:37.6913820Z\",\"PerformanceDuration\":\"4717\",\"Latency\":\"62974\"}'),
(325, 75, 'Scheduled', NULL, '2023-06-04 17:08:48', '{\"EnqueueAt\":\"2023-06-04T17:08:48.9055210Z\",\"ScheduledAt\":\"2023-06-04T17:08:47.9055230Z\"}'),
(326, 75, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 17:08:59', '{\"EnqueuedAt\":\"2023-06-04T17:08:58.5308380Z\",\"Queue\":\"default\"}'),
(327, 75, 'Processing', NULL, '2023-06-04 17:09:08', '{\"StartedAt\":\"2023-06-04T17:09:07.7114110Z\",\"ServerId\":\"4ce0d550-53a2-46cd-8d72-fa4f4ff8f5ee\",\"WorkerId\":\"060dc13a-ff4a-4b02-b886-2d24c923e452\"}'),
(328, 75, 'Succeeded', NULL, '2023-06-04 17:09:08', '{\"SucceededAt\":\"2023-06-04T17:09:08.4154800Z\",\"PerformanceDuration\":\"699\",\"Latency\":\"19716\"}'),
(329, 76, 'Scheduled', NULL, '2023-06-04 17:09:18', '{\"EnqueueAt\":\"2023-06-04T17:09:19.4199030Z\",\"ScheduledAt\":\"2023-06-04T17:09:18.4199050Z\"}'),
(330, 76, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 17:09:29', '{\"EnqueuedAt\":\"2023-06-04T17:09:28.5526220Z\",\"Queue\":\"default\"}'),
(331, 76, 'Processing', NULL, '2023-06-04 17:09:38', '{\"StartedAt\":\"2023-06-04T17:09:38.4447160Z\",\"ServerId\":\"4ce0d550-53a2-46cd-8d72-fa4f4ff8f5ee\",\"WorkerId\":\"060dc13a-ff4a-4b02-b886-2d24c923e452\"}'),
(332, 76, 'Succeeded', NULL, '2023-06-04 17:09:39', '{\"SucceededAt\":\"2023-06-04T17:09:38.6137340Z\",\"PerformanceDuration\":\"160\",\"Latency\":\"20453\"}'),
(333, 77, 'Scheduled', NULL, '2023-06-04 17:12:00', '{\"EnqueueAt\":\"2023-06-04T17:12:01.2616920Z\",\"ScheduledAt\":\"2023-06-04T17:12:00.2617180Z\"}'),
(334, 77, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 17:12:41', '{\"EnqueuedAt\":\"2023-06-04T17:12:41.3525120Z\",\"Queue\":\"default\"}'),
(335, 77, 'Processing', NULL, '2023-06-04 17:12:56', '{\"StartedAt\":\"2023-06-04T17:12:56.3604890Z\",\"ServerId\":\"f31ba3e6-8871-400a-a2e3-5853b3f0a399\",\"WorkerId\":\"c36fa24a-5816-46f6-8ce7-9b025a5193d6\"}'),
(336, 77, 'Succeeded', NULL, '2023-06-04 17:12:57', '{\"SucceededAt\":\"2023-06-04T17:12:56.9411820Z\",\"PerformanceDuration\":\"569\",\"Latency\":\"56371\"}'),
(337, 78, 'Scheduled', NULL, '2023-06-04 17:13:41', '{\"EnqueueAt\":\"2023-06-04T17:13:41.5559980Z\",\"ScheduledAt\":\"2023-06-04T17:13:40.5559990Z\"}'),
(338, 78, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 17:14:41', '{\"EnqueuedAt\":\"2023-06-04T17:14:41.4194730Z\",\"Queue\":\"default\"}'),
(339, 78, 'Processing', NULL, '2023-06-04 17:14:42', '{\"StartedAt\":\"2023-06-04T17:14:42.0054790Z\",\"ServerId\":\"f31ba3e6-8871-400a-a2e3-5853b3f0a399\",\"WorkerId\":\"c36fa24a-5816-46f6-8ce7-9b025a5193d6\"}'),
(340, 78, 'Succeeded', NULL, '2023-06-04 17:14:43', '{\"SucceededAt\":\"2023-06-04T17:14:42.5106370Z\",\"PerformanceDuration\":\"497\",\"Latency\":\"61013\"}'),
(341, 79, 'Scheduled', NULL, '2023-06-04 17:14:52', '{\"EnqueueAt\":\"2023-06-04T17:14:53.2668030Z\",\"ScheduledAt\":\"2023-06-04T17:14:52.2668040Z\"}'),
(342, 79, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 17:14:56', '{\"EnqueuedAt\":\"2023-06-04T17:14:56.4397320Z\",\"Queue\":\"default\"}'),
(343, 80, 'Scheduled', NULL, '2023-06-04 17:14:57', '{\"EnqueueAt\":\"2023-06-04T17:14:58.3674000Z\",\"ScheduledAt\":\"2023-06-04T17:14:57.3674020Z\"}'),
(344, 79, 'Processing', NULL, '2023-06-04 17:14:58', '{\"StartedAt\":\"2023-06-04T17:14:57.6384460Z\",\"ServerId\":\"f31ba3e6-8871-400a-a2e3-5853b3f0a399\",\"WorkerId\":\"c36fa24a-5816-46f6-8ce7-9b025a5193d6\"}'),
(345, 79, 'Succeeded', NULL, '2023-06-04 17:14:58', '{\"SucceededAt\":\"2023-06-04T17:14:58.2980110Z\",\"PerformanceDuration\":\"496\",\"Latency\":\"5801\"}'),
(346, 80, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 17:15:11', '{\"EnqueuedAt\":\"2023-06-04T17:15:11.4601060Z\",\"Queue\":\"default\"}'),
(347, 80, 'Processing', NULL, '2023-06-04 17:15:13', '{\"StartedAt\":\"2023-06-04T17:15:13.3158630Z\",\"ServerId\":\"f31ba3e6-8871-400a-a2e3-5853b3f0a399\",\"WorkerId\":\"c36fa24a-5816-46f6-8ce7-9b025a5193d6\"}'),
(348, 80, 'Succeeded', NULL, '2023-06-04 17:15:13', '{\"SucceededAt\":\"2023-06-04T17:15:13.4825080Z\",\"PerformanceDuration\":\"158\",\"Latency\":\"16324\"}'),
(349, 81, 'Scheduled', NULL, '2023-06-04 17:28:48', '{\"EnqueueAt\":\"2023-06-04T17:28:57.9557610Z\",\"ScheduledAt\":\"2023-06-04T17:28:47.9557630Z\"}'),
(350, 81, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 17:29:36', '{\"EnqueuedAt\":\"2023-06-04T17:29:36.4941680Z\",\"Queue\":\"default\"}'),
(351, 81, 'Processing', NULL, '2023-06-04 17:29:38', '{\"StartedAt\":\"2023-06-04T17:29:38.4703340Z\",\"ServerId\":\"f31ba3e6-8871-400a-a2e3-5853b3f0a399\",\"WorkerId\":\"c36fa24a-5816-46f6-8ce7-9b025a5193d6\"}'),
(352, 82, 'Scheduled', NULL, '2023-06-04 17:29:39', '{\"EnqueueAt\":\"2023-06-04T17:29:48.5119270Z\",\"ScheduledAt\":\"2023-06-04T17:29:38.5119280Z\"}'),
(353, 83, 'Scheduled', NULL, '2023-06-04 17:29:39', '{\"EnqueueAt\":\"2023-06-04T17:29:48.5178420Z\",\"ScheduledAt\":\"2023-06-04T17:29:38.5178420Z\"}'),
(354, 84, 'Scheduled', NULL, '2023-06-04 17:29:39', '{\"EnqueueAt\":\"2023-06-04T17:29:48.5250420Z\",\"ScheduledAt\":\"2023-06-04T17:29:38.5250420Z\"}'),
(355, 85, 'Scheduled', NULL, '2023-06-04 17:29:39', '{\"EnqueueAt\":\"2023-06-04T17:29:48.5287430Z\",\"ScheduledAt\":\"2023-06-04T17:29:38.5287440Z\"}'),
(356, 86, 'Scheduled', NULL, '2023-06-04 17:29:39', '{\"EnqueueAt\":\"2023-06-04T17:29:48.5329240Z\",\"ScheduledAt\":\"2023-06-04T17:29:38.5329240Z\"}'),
(357, 81, 'Succeeded', NULL, '2023-06-04 17:29:39', '{\"SucceededAt\":\"2023-06-04T17:29:38.5398640Z\",\"PerformanceDuration\":\"61\",\"Latency\":\"50478\"}'),
(358, 82, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 17:29:52', '{\"EnqueuedAt\":\"2023-06-04T17:29:51.5105600Z\",\"Queue\":\"default\"}'),
(359, 83, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 17:29:52', '{\"EnqueuedAt\":\"2023-06-04T17:29:51.5202160Z\",\"Queue\":\"default\"}'),
(360, 84, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 17:29:52', '{\"EnqueuedAt\":\"2023-06-04T17:29:51.5272190Z\",\"Queue\":\"default\"}'),
(361, 85, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 17:29:52', '{\"EnqueuedAt\":\"2023-06-04T17:29:51.5334430Z\",\"Queue\":\"default\"}'),
(362, 86, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-04 17:29:52', '{\"EnqueuedAt\":\"2023-06-04T17:29:51.5384080Z\",\"Queue\":\"default\"}'),
(363, 82, 'Processing', NULL, '2023-06-04 17:29:54', '{\"StartedAt\":\"2023-06-04T17:29:53.5531180Z\",\"ServerId\":\"f31ba3e6-8871-400a-a2e3-5853b3f0a399\",\"WorkerId\":\"c36fa24a-5816-46f6-8ce7-9b025a5193d6\"}'),
(364, 82, 'Succeeded', NULL, '2023-06-04 17:29:54', '{\"SucceededAt\":\"2023-06-04T17:29:54.0693790Z\",\"PerformanceDuration\":\"509\",\"Latency\":\"14559\"}'),
(365, 83, 'Processing', NULL, '2023-06-04 17:29:54', '{\"StartedAt\":\"2023-06-04T17:29:54.0879810Z\",\"ServerId\":\"f31ba3e6-8871-400a-a2e3-5853b3f0a399\",\"WorkerId\":\"c36fa24a-5816-46f6-8ce7-9b025a5193d6\"}'),
(366, 83, 'Succeeded', NULL, '2023-06-04 17:29:54', '{\"SucceededAt\":\"2023-06-04T17:29:54.2485340Z\",\"PerformanceDuration\":\"154\",\"Latency\":\"15094\"}'),
(367, 84, 'Processing', NULL, '2023-06-04 17:29:54', '{\"StartedAt\":\"2023-06-04T17:29:54.2624310Z\",\"ServerId\":\"f31ba3e6-8871-400a-a2e3-5853b3f0a399\",\"WorkerId\":\"c36fa24a-5816-46f6-8ce7-9b025a5193d6\"}'),
(368, 84, 'Succeeded', NULL, '2023-06-04 17:29:54', '{\"SucceededAt\":\"2023-06-04T17:29:54.4196080Z\",\"PerformanceDuration\":\"152\",\"Latency\":\"15267\"}'),
(369, 85, 'Processing', NULL, '2023-06-04 17:29:54', '{\"StartedAt\":\"2023-06-04T17:29:54.4343270Z\",\"ServerId\":\"f31ba3e6-8871-400a-a2e3-5853b3f0a399\",\"WorkerId\":\"c36fa24a-5816-46f6-8ce7-9b025a5193d6\"}'),
(370, 85, 'Succeeded', NULL, '2023-06-04 17:29:55', '{\"SucceededAt\":\"2023-06-04T17:29:54.5889540Z\",\"PerformanceDuration\":\"149\",\"Latency\":\"15439\"}'),
(371, 86, 'Processing', NULL, '2023-06-04 17:29:55', '{\"StartedAt\":\"2023-06-04T17:29:54.6041940Z\",\"ServerId\":\"f31ba3e6-8871-400a-a2e3-5853b3f0a399\",\"WorkerId\":\"c36fa24a-5816-46f6-8ce7-9b025a5193d6\"}'),
(372, 86, 'Succeeded', NULL, '2023-06-04 17:29:57', '{\"SucceededAt\":\"2023-06-04T17:29:56.6099150Z\",\"PerformanceDuration\":\"2000\",\"Latency\":\"15609\"}'),
(373, 87, 'Scheduled', NULL, '2023-06-06 07:36:55', '{\"EnqueueAt\":\"2023-06-06T07:36:55.5206870Z\",\"ScheduledAt\":\"2023-06-06T07:36:54.5207270Z\"}'),
(374, 87, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-06 07:36:58', '{\"EnqueuedAt\":\"2023-06-06T07:36:57.6963430Z\",\"Queue\":\"default\"}'),
(375, 87, 'Processing', NULL, '2023-06-06 07:37:13', '{\"StartedAt\":\"2023-06-06T07:37:12.6626950Z\",\"ServerId\":\"9b74454b-f0dd-45ff-a1fb-d08973739e8c\",\"WorkerId\":\"9f45cc62-f8c4-429b-8641-dd9b5d4597df\"}'),
(376, 87, 'Succeeded', NULL, '2023-06-06 07:37:13', '{\"SucceededAt\":\"2023-06-06T07:37:13.3244780Z\",\"PerformanceDuration\":\"653\",\"Latency\":\"17670\"}'),
(377, 88, 'Scheduled', NULL, '2023-06-06 07:37:43', '{\"EnqueueAt\":\"2023-06-06T07:37:43.9887300Z\",\"ScheduledAt\":\"2023-06-06T07:37:42.9887330Z\"}'),
(378, 88, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-06 07:38:43', '{\"EnqueuedAt\":\"2023-06-06T07:38:42.9277370Z\",\"Queue\":\"default\"}'),
(379, 88, 'Processing', NULL, '2023-06-06 07:38:43', '{\"StartedAt\":\"2023-06-06T07:38:43.3853680Z\",\"ServerId\":\"9b74454b-f0dd-45ff-a1fb-d08973739e8c\",\"WorkerId\":\"9f45cc62-f8c4-429b-8641-dd9b5d4597df\"}'),
(380, 88, 'Succeeded', NULL, '2023-06-06 07:38:44', '{\"SucceededAt\":\"2023-06-06T07:38:44.0097140Z\",\"PerformanceDuration\":\"615\",\"Latency\":\"60393\"}'),
(381, 89, 'Scheduled', NULL, '2023-06-06 07:39:02', '{\"EnqueueAt\":\"2023-06-06T07:39:03.3711810Z\",\"ScheduledAt\":\"2023-06-06T07:39:02.3711830Z\"}'),
(382, 89, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-06 07:39:13', '{\"EnqueuedAt\":\"2023-06-06T07:39:12.9498000Z\",\"Queue\":\"default\"}'),
(383, 89, 'Processing', NULL, '2023-06-06 07:39:14', '{\"StartedAt\":\"2023-06-06T07:39:14.0357940Z\",\"ServerId\":\"9b74454b-f0dd-45ff-a1fb-d08973739e8c\",\"WorkerId\":\"9f45cc62-f8c4-429b-8641-dd9b5d4597df\"}'),
(384, 89, 'Succeeded', NULL, '2023-06-06 07:39:14', '{\"SucceededAt\":\"2023-06-06T07:39:14.1882210Z\",\"PerformanceDuration\":\"145\",\"Latency\":\"12042\"}'),
(385, 90, 'Scheduled', NULL, '2023-06-06 07:39:15', '{\"EnqueueAt\":\"2023-06-06T07:39:16.3780110Z\",\"ScheduledAt\":\"2023-06-06T07:39:15.3780120Z\"}'),
(386, 91, 'Scheduled', NULL, '2023-06-06 07:39:24', '{\"EnqueueAt\":\"2023-06-06T07:39:25.0717180Z\",\"ScheduledAt\":\"2023-06-06T07:39:24.0717190Z\"}'),
(387, 90, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-06 07:39:28', '{\"EnqueuedAt\":\"2023-06-06T07:39:27.9655060Z\",\"Queue\":\"default\"}'),
(388, 91, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-06 07:39:28', '{\"EnqueuedAt\":\"2023-06-06T07:39:27.9762870Z\",\"Queue\":\"default\"}'),
(389, 90, 'Processing', NULL, '2023-06-06 07:39:29', '{\"StartedAt\":\"2023-06-06T07:39:29.2043340Z\",\"ServerId\":\"9b74454b-f0dd-45ff-a1fb-d08973739e8c\",\"WorkerId\":\"9f45cc62-f8c4-429b-8641-dd9b5d4597df\"}'),
(390, 90, 'Succeeded', NULL, '2023-06-06 07:39:30', '{\"SucceededAt\":\"2023-06-06T07:39:29.6822570Z\",\"PerformanceDuration\":\"472\",\"Latency\":\"14209\"}'),
(391, 91, 'Processing', NULL, '2023-06-06 07:39:30', '{\"StartedAt\":\"2023-06-06T07:39:29.6954540Z\",\"ServerId\":\"9b74454b-f0dd-45ff-a1fb-d08973739e8c\",\"WorkerId\":\"9f45cc62-f8c4-429b-8641-dd9b5d4597df\"}'),
(392, 91, 'Succeeded', NULL, '2023-06-06 07:39:30', '{\"SucceededAt\":\"2023-06-06T07:39:29.8493860Z\",\"PerformanceDuration\":\"146\",\"Latency\":\"5702\"}'),
(393, 92, 'Scheduled', NULL, '2023-06-06 07:42:22', '{\"EnqueueAt\":\"2023-06-06T07:42:22.5835710Z\",\"ScheduledAt\":\"2023-06-06T07:42:21.5835910Z\"}'),
(394, 93, 'Scheduled', NULL, '2023-06-06 07:42:42', '{\"EnqueueAt\":\"2023-06-06T07:42:43.4828370Z\",\"ScheduledAt\":\"2023-06-06T07:42:42.4828390Z\"}'),
(395, 94, 'Scheduled', NULL, '2023-06-06 07:42:44', '{\"EnqueueAt\":\"2023-06-06T07:42:45.3702850Z\",\"ScheduledAt\":\"2023-06-06T07:42:44.3702890Z\"}'),
(396, 95, 'Scheduled', NULL, '2023-06-06 07:42:45', '{\"EnqueueAt\":\"2023-06-06T07:42:46.4205570Z\",\"ScheduledAt\":\"2023-06-06T07:42:45.4205590Z\"}'),
(397, 92, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-06 07:42:59', '{\"EnqueuedAt\":\"2023-06-06T07:42:59.1812130Z\",\"Queue\":\"default\"}'),
(398, 93, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-06 07:42:59', '{\"EnqueuedAt\":\"2023-06-06T07:42:59.2516720Z\",\"Queue\":\"default\"}'),
(399, 94, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-06 07:42:59', '{\"EnqueuedAt\":\"2023-06-06T07:42:59.2593270Z\",\"Queue\":\"default\"}'),
(400, 95, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-06 07:42:59', '{\"EnqueuedAt\":\"2023-06-06T07:42:59.2647000Z\",\"Queue\":\"default\"}'),
(401, 95, 'Processing', NULL, '2023-06-06 07:43:14', '{\"StartedAt\":\"2023-06-06T07:43:14.0112030Z\",\"ServerId\":\"8fc134d8-5265-4047-85c0-3fd6932cce8b\",\"WorkerId\":\"1256c496-2e53-4190-b67c-e79c4e403edd\"}'),
(402, 92, 'Processing', NULL, '2023-06-06 07:43:14', '{\"StartedAt\":\"2023-06-06T07:43:14.0112350Z\",\"ServerId\":\"8fc134d8-5265-4047-85c0-3fd6932cce8b\",\"WorkerId\":\"4bf98a04-e6bb-436a-bbff-02ee31b96df8\"}'),
(403, 94, 'Processing', NULL, '2023-06-06 07:43:14', '{\"StartedAt\":\"2023-06-06T07:43:14.0112300Z\",\"ServerId\":\"8fc134d8-5265-4047-85c0-3fd6932cce8b\",\"WorkerId\":\"00bd88cb-f957-4430-8854-4de0fc303d42\"}'),
(404, 93, 'Processing', NULL, '2023-06-06 07:43:14', '{\"StartedAt\":\"2023-06-06T07:43:14.0111920Z\",\"ServerId\":\"8fc134d8-5265-4047-85c0-3fd6932cce8b\",\"WorkerId\":\"48b6131c-355e-44a6-b91f-63668f59f634\"}'),
(405, 92, 'Succeeded', NULL, '2023-06-06 07:43:15', '{\"SucceededAt\":\"2023-06-06T07:43:14.5705080Z\",\"PerformanceDuration\":\"544\",\"Latency\":\"52025\"}'),
(406, 95, 'Succeeded', NULL, '2023-06-06 07:43:15', '{\"SucceededAt\":\"2023-06-06T07:43:14.5705020Z\",\"PerformanceDuration\":\"544\",\"Latency\":\"29025\"}'),
(407, 94, 'Succeeded', NULL, '2023-06-06 07:43:15', '{\"SucceededAt\":\"2023-06-06T07:43:14.5912060Z\",\"PerformanceDuration\":\"566\",\"Latency\":\"30025\"}'),
(408, 93, 'Succeeded', NULL, '2023-06-06 07:43:15', '{\"SucceededAt\":\"2023-06-06T07:43:14.5956890Z\",\"PerformanceDuration\":\"570\",\"Latency\":\"32025\"}'),
(409, 96, 'Scheduled', NULL, '2023-06-06 08:16:30', '{\"EnqueueAt\":\"2023-06-06T08:16:31.2632500Z\",\"ScheduledAt\":\"2023-06-06T08:16:30.2632530Z\"}'),
(410, 96, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-06 08:17:06', '{\"EnqueuedAt\":\"2023-06-06T08:17:05.8605270Z\",\"Queue\":\"default\"}'),
(411, 96, 'Processing', NULL, '2023-06-06 08:17:06', '{\"StartedAt\":\"2023-06-06T08:17:05.8709930Z\",\"ServerId\":\"8fc134d8-5265-4047-85c0-3fd6932cce8b\",\"WorkerId\":\"48b6131c-355e-44a6-b91f-63668f59f634\"}'),
(412, 96, 'Succeeded', NULL, '2023-06-06 08:17:06', '{\"SucceededAt\":\"2023-06-06T08:17:06.3888430Z\",\"PerformanceDuration\":\"512\",\"Latency\":\"35876\"}'),
(413, 97, 'Scheduled', NULL, '2023-06-06 09:38:45', '{\"EnqueueAt\":\"2023-06-06T09:38:46.2467510Z\",\"ScheduledAt\":\"2023-06-06T09:38:45.2467820Z\"}'),
(414, 98, 'Scheduled', NULL, '2023-06-06 09:38:47', '{\"EnqueueAt\":\"2023-06-06T09:38:48.1693480Z\",\"ScheduledAt\":\"2023-06-06T09:38:47.1693540Z\"}'),
(415, 97, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-06 09:38:48', '{\"EnqueuedAt\":\"2023-06-06T09:38:47.3476930Z\",\"Queue\":\"default\"}'),
(416, 98, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-06 09:38:48', '{\"EnqueuedAt\":\"2023-06-06T09:38:47.6744320Z\",\"Queue\":\"default\"}'),
(417, 99, 'Scheduled', NULL, '2023-06-06 09:38:49', '{\"EnqueueAt\":\"2023-06-06T09:38:49.7171030Z\",\"ScheduledAt\":\"2023-06-06T09:38:48.7171040Z\"}'),
(418, 100, 'Scheduled', NULL, '2023-06-06 09:38:50', '{\"EnqueueAt\":\"2023-06-06T09:38:51.4826670Z\",\"ScheduledAt\":\"2023-06-06T09:38:50.4826690Z\"}'),
(419, 98, 'Processing', NULL, '2023-06-06 09:39:02', '{\"StartedAt\":\"2023-06-06T09:39:02.2571030Z\",\"ServerId\":\"6077b5b4-53c3-49a2-a57f-7b17a836014e\",\"WorkerId\":\"a3e2210a-e209-4f46-94fb-efb269fbf59e\"}'),
(420, 97, 'Processing', NULL, '2023-06-06 09:39:02', '{\"StartedAt\":\"2023-06-06T09:39:02.2571090Z\",\"ServerId\":\"6077b5b4-53c3-49a2-a57f-7b17a836014e\",\"WorkerId\":\"52b73321-8e2a-4756-8d05-eeea120687c5\"}'),
(421, 100, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-06 09:39:03', '{\"EnqueuedAt\":\"2023-06-06T09:39:02.6866750Z\",\"Queue\":\"default\"}'),
(422, 99, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-06 09:39:03', '{\"EnqueuedAt\":\"2023-06-06T09:39:02.6945280Z\",\"Queue\":\"default\"}'),
(423, 98, 'Succeeded', NULL, '2023-06-06 09:39:03', '{\"SucceededAt\":\"2023-06-06T09:39:02.9173360Z\",\"PerformanceDuration\":\"649\",\"Latency\":\"15267\"}'),
(424, 97, 'Succeeded', NULL, '2023-06-06 09:39:03', '{\"SucceededAt\":\"2023-06-06T09:39:02.9267080Z\",\"PerformanceDuration\":\"659\",\"Latency\":\"17267\"}'),
(425, 100, 'Processing', NULL, '2023-06-06 09:39:03', '{\"StartedAt\":\"2023-06-06T09:39:02.9474610Z\",\"ServerId\":\"6077b5b4-53c3-49a2-a57f-7b17a836014e\",\"WorkerId\":\"a3e2210a-e209-4f46-94fb-efb269fbf59e\"}'),
(426, 99, 'Processing', NULL, '2023-06-06 09:39:03', '{\"StartedAt\":\"2023-06-06T09:39:02.9475900Z\",\"ServerId\":\"6077b5b4-53c3-49a2-a57f-7b17a836014e\",\"WorkerId\":\"52b73321-8e2a-4756-8d05-eeea120687c5\"}'),
(427, 100, 'Succeeded', NULL, '2023-06-06 09:39:03', '{\"SucceededAt\":\"2023-06-06T09:39:03.1111060Z\",\"PerformanceDuration\":\"158\",\"Latency\":\"12952\"}'),
(428, 99, 'Succeeded', NULL, '2023-06-06 09:39:03', '{\"SucceededAt\":\"2023-06-06T09:39:03.1138730Z\",\"PerformanceDuration\":\"161\",\"Latency\":\"13952\"}'),
(429, 101, 'Scheduled', NULL, '2023-06-06 10:26:47', '{\"EnqueueAt\":\"2023-06-06T10:26:47.9021200Z\",\"ScheduledAt\":\"2023-06-06T10:26:46.9022430Z\"}'),
(430, 101, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-06 10:27:25', '{\"EnqueuedAt\":\"2023-06-06T10:27:25.0546380Z\",\"Queue\":\"default\"}'),
(431, 101, 'Processing', NULL, '2023-06-06 10:27:40', '{\"StartedAt\":\"2023-06-06T10:27:40.0215810Z\",\"ServerId\":\"f7ecf7c0-5039-46f5-add9-1955bf50bae1\",\"WorkerId\":\"4242bc7a-7186-452c-b871-092abdad4723\"}'),
(432, 101, 'Succeeded', NULL, '2023-06-06 10:27:41', '{\"SucceededAt\":\"2023-06-06T10:27:40.6635950Z\",\"PerformanceDuration\":\"632\",\"Latency\":\"53030\"}'),
(433, 102, 'Scheduled', NULL, '2023-06-06 10:30:03', '{\"EnqueueAt\":\"2023-06-06T10:30:04.1528380Z\",\"ScheduledAt\":\"2023-06-06T10:30:03.1529130Z\"}'),
(434, 102, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-06 10:30:08', '{\"EnqueuedAt\":\"2023-06-06T10:30:08.3625720Z\",\"Queue\":\"default\"}'),
(435, 102, 'Processing', NULL, '2023-06-06 10:30:23', '{\"StartedAt\":\"2023-06-06T10:30:23.3393030Z\",\"ServerId\":\"214d0c63-c756-454d-8196-9e046dbeeed3\",\"WorkerId\":\"a8460698-7359-4ffc-96a8-eb24d6c52234\"}'),
(436, 102, 'Succeeded', NULL, '2023-06-06 10:30:24', '{\"SucceededAt\":\"2023-06-06T10:30:23.8029490Z\",\"PerformanceDuration\":\"450\",\"Latency\":\"20351\"}'),
(437, 103, 'Scheduled', NULL, '2023-06-06 10:59:28', '{\"EnqueueAt\":\"2023-06-06T10:59:28.6010660Z\",\"ScheduledAt\":\"2023-06-06T10:59:27.6011080Z\"}'),
(438, 103, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-06 10:59:34', '{\"EnqueuedAt\":\"2023-06-06T10:59:33.6117210Z\",\"Queue\":\"default\"}'),
(439, 103, 'Processing', NULL, '2023-06-06 10:59:49', '{\"StartedAt\":\"2023-06-06T10:59:48.6113440Z\",\"ServerId\":\"6f0f4d69-48d7-4594-89fe-d56a0d8220af\",\"WorkerId\":\"919ce15d-7520-4d65-95ff-c0c9a6c6460a\"}'),
(440, 103, 'Succeeded', NULL, '2023-06-06 10:59:51', '{\"SucceededAt\":\"2023-06-06T10:59:51.1559820Z\",\"PerformanceDuration\":\"2534\",\"Latency\":\"20620\"}'),
(441, 104, 'Scheduled', NULL, '2023-06-08 11:53:42', '{\"EnqueueAt\":\"2023-06-08T11:53:43.2746900Z\",\"ScheduledAt\":\"2023-06-08T11:53:42.2747480Z\"}'),
(442, 105, 'Scheduled', NULL, '2023-06-08 11:54:39', '{\"EnqueueAt\":\"2023-06-08T11:54:40.4159280Z\",\"ScheduledAt\":\"2023-06-08T11:54:39.4159300Z\"}'),
(443, 106, 'Scheduled', NULL, '2023-06-08 11:54:43', '{\"EnqueueAt\":\"2023-06-08T11:54:43.8208340Z\",\"ScheduledAt\":\"2023-06-08T11:54:42.8208360Z\"}'),
(444, 104, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 11:54:44', '{\"EnqueuedAt\":\"2023-06-08T11:54:44.2070210Z\",\"Queue\":\"default\"}'),
(445, 105, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 11:54:44', '{\"EnqueuedAt\":\"2023-06-08T11:54:44.2806490Z\",\"Queue\":\"default\"}'),
(446, 106, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 11:54:44', '{\"EnqueuedAt\":\"2023-06-08T11:54:44.2877900Z\",\"Queue\":\"default\"}'),
(447, 107, 'Scheduled', NULL, '2023-06-08 11:54:45', '{\"EnqueueAt\":\"2023-06-08T11:54:46.2088360Z\",\"ScheduledAt\":\"2023-06-08T11:54:45.2088370Z\"}'),
(448, 108, 'Scheduled', NULL, '2023-06-08 11:54:49', '{\"EnqueueAt\":\"2023-06-08T11:54:50.3204570Z\",\"ScheduledAt\":\"2023-06-08T11:54:49.3204590Z\"}'),
(449, 105, 'Processing', NULL, '2023-06-08 11:54:59', '{\"StartedAt\":\"2023-06-08T11:54:59.1536350Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"1d0f2a7c-55ad-4650-a7d7-47fe8ea18f08\"}'),
(450, 106, 'Processing', NULL, '2023-06-08 11:54:59', '{\"StartedAt\":\"2023-06-08T11:54:59.1535270Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"c8ee3307-96e2-4692-a40d-9a0ca1954be3\"}'),
(451, 104, 'Processing', NULL, '2023-06-08 11:54:59', '{\"StartedAt\":\"2023-06-08T11:54:59.1539070Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}'),
(452, 105, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 11:54:59', '{\"FailedAt\":\"2023-06-08T11:54:59.2578180Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at System.RuntimeMethodHandle.InvokeMethod(Object target, Void** arguments, Signature sig, Boolean isConstructor)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(453, 106, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 11:54:59', '{\"FailedAt\":\"2023-06-08T11:54:59.2578170Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(454, 104, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 11:54:59', '{\"FailedAt\":\"2023-06-08T11:54:59.2578130Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(455, 105, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-08 11:54:59', '{\"EnqueueAt\":\"2023-06-08T11:55:33.2616150Z\",\"ScheduledAt\":\"2023-06-08T11:54:59.2616160Z\"}'),
(456, 104, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-08 11:54:59', '{\"EnqueueAt\":\"2023-06-08T11:55:14.2616170Z\",\"ScheduledAt\":\"2023-06-08T11:54:59.2616170Z\"}'),
(457, 106, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-08 11:54:59', '{\"EnqueueAt\":\"2023-06-08T11:55:42.2616150Z\",\"ScheduledAt\":\"2023-06-08T11:54:59.2616160Z\"}'),
(458, 107, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 11:54:59', '{\"EnqueuedAt\":\"2023-06-08T11:54:59.3025200Z\",\"Queue\":\"default\"}'),
(459, 104, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 11:54:59', '{\"EnqueuedAt\":\"2023-06-08T11:54:59.3072860Z\",\"Queue\":\"default\"}'),
(460, 107, 'Processing', NULL, '2023-06-08 11:54:59', '{\"StartedAt\":\"2023-06-08T11:54:59.3084480Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}'),
(461, 105, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 11:54:59', '{\"EnqueuedAt\":\"2023-06-08T11:54:59.3134630Z\",\"Queue\":\"default\"}'),
(462, 107, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 11:54:59', '{\"FailedAt\":\"2023-06-08T11:54:59.3216690Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(463, 106, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 11:54:59', '{\"EnqueuedAt\":\"2023-06-08T11:54:59.3241780Z\",\"Queue\":\"default\"}'),
(464, 107, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-08 11:54:59', '{\"EnqueueAt\":\"2023-06-08T11:55:19.3249690Z\",\"ScheduledAt\":\"2023-06-08T11:54:59.3249690Z\"}'),
(465, 107, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 11:54:59', '{\"EnqueuedAt\":\"2023-06-08T11:54:59.3296760Z\",\"Queue\":\"default\"}'),
(466, 104, 'Processing', NULL, '2023-06-08 11:54:59', '{\"StartedAt\":\"2023-06-08T11:54:59.3304770Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}'),
(467, 108, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 11:54:59', '{\"EnqueuedAt\":\"2023-06-08T11:54:59.3341260Z\",\"Queue\":\"default\"}'),
(468, 104, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 11:54:59', '{\"FailedAt\":\"2023-06-08T11:54:59.3408380Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(469, 104, 'Scheduled', 'Retry attempt 2 of 10: Failure sending mail.', '2023-06-08 11:54:59', '{\"EnqueueAt\":\"2023-06-08T11:56:11.3452710Z\",\"ScheduledAt\":\"2023-06-08T11:54:59.3452710Z\"}'),
(470, 105, 'Processing', NULL, '2023-06-08 11:54:59', '{\"StartedAt\":\"2023-06-08T11:54:59.3484620Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}');
INSERT INTO `Hangfire_State` (`Id`, `JobId`, `Name`, `Reason`, `CreatedAt`, `Data`) VALUES
(471, 105, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 11:54:59', '{\"FailedAt\":\"2023-06-08T11:54:59.3568310Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(472, 105, 'Scheduled', 'Retry attempt 2 of 10: Failure sending mail.', '2023-06-08 11:54:59', '{\"EnqueueAt\":\"2023-06-08T11:55:23.3582190Z\",\"ScheduledAt\":\"2023-06-08T11:54:59.3582190Z\"}'),
(473, 106, 'Processing', NULL, '2023-06-08 11:54:59', '{\"StartedAt\":\"2023-06-08T11:54:59.3608600Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}'),
(474, 106, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 11:54:59', '{\"FailedAt\":\"2023-06-08T11:54:59.3693070Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(475, 106, 'Scheduled', 'Retry attempt 2 of 10: Failure sending mail.', '2023-06-08 11:54:59', '{\"EnqueueAt\":\"2023-06-08T11:55:25.3705390Z\",\"ScheduledAt\":\"2023-06-08T11:54:59.3705390Z\"}'),
(476, 107, 'Processing', NULL, '2023-06-08 11:54:59', '{\"StartedAt\":\"2023-06-08T11:54:59.3731450Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}'),
(477, 107, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 11:54:59', '{\"FailedAt\":\"2023-06-08T11:54:59.3809190Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(478, 107, 'Scheduled', 'Retry attempt 2 of 10: Failure sending mail.', '2023-06-08 11:54:59', '{\"EnqueueAt\":\"2023-06-08T11:55:35.3820890Z\",\"ScheduledAt\":\"2023-06-08T11:54:59.3820890Z\"}'),
(479, 108, 'Processing', NULL, '2023-06-08 11:54:59', '{\"StartedAt\":\"2023-06-08T11:54:59.3847200Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}'),
(480, 108, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 11:54:59', '{\"FailedAt\":\"2023-06-08T11:54:59.3930420Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(481, 108, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-08 11:54:59', '{\"EnqueueAt\":\"2023-06-08T11:55:28.3941810Z\",\"ScheduledAt\":\"2023-06-08T11:54:59.3941810Z\"}'),
(482, 105, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 11:55:14', '{\"EnqueuedAt\":\"2023-06-08T11:55:14.3498170Z\",\"Queue\":\"default\"}'),
(483, 106, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 11:55:14', '{\"EnqueuedAt\":\"2023-06-08T11:55:14.3580160Z\",\"Queue\":\"default\"}'),
(484, 107, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 11:55:14', '{\"EnqueuedAt\":\"2023-06-08T11:55:14.3660810Z\",\"Queue\":\"default\"}'),
(485, 108, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 11:55:14', '{\"EnqueuedAt\":\"2023-06-08T11:55:14.3740680Z\",\"Queue\":\"default\"}'),
(486, 105, 'Processing', NULL, '2023-06-08 11:55:14', '{\"StartedAt\":\"2023-06-08T11:55:14.3993080Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}'),
(487, 105, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 11:55:14', '{\"FailedAt\":\"2023-06-08T11:55:14.4507290Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(488, 105, 'Scheduled', 'Retry attempt 3 of 10: Failure sending mail.', '2023-06-08 11:55:14', '{\"EnqueueAt\":\"2023-06-08T11:55:57.4560150Z\",\"ScheduledAt\":\"2023-06-08T11:55:14.4560160Z\"}'),
(489, 106, 'Processing', NULL, '2023-06-08 11:55:14', '{\"StartedAt\":\"2023-06-08T11:55:14.4640530Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}'),
(490, 106, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 11:55:14', '{\"FailedAt\":\"2023-06-08T11:55:14.4814220Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(491, 106, 'Scheduled', 'Retry attempt 3 of 10: Failure sending mail.', '2023-06-08 11:55:14', '{\"EnqueueAt\":\"2023-06-08T11:56:54.4857030Z\",\"ScheduledAt\":\"2023-06-08T11:55:14.4857030Z\"}'),
(492, 107, 'Processing', NULL, '2023-06-08 11:55:14', '{\"StartedAt\":\"2023-06-08T11:55:14.4935810Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}'),
(493, 107, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 11:55:15', '{\"FailedAt\":\"2023-06-08T11:55:14.5099380Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(494, 107, 'Scheduled', 'Retry attempt 3 of 10: Failure sending mail.', '2023-06-08 11:55:15', '{\"EnqueueAt\":\"2023-06-08T11:55:45.5135640Z\",\"ScheduledAt\":\"2023-06-08T11:55:14.5135650Z\"}'),
(495, 108, 'Processing', NULL, '2023-06-08 11:55:15', '{\"StartedAt\":\"2023-06-08T11:55:14.5208810Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}'),
(496, 108, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 11:55:15', '{\"FailedAt\":\"2023-06-08T11:55:14.5364160Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(497, 108, 'Scheduled', 'Retry attempt 2 of 10: Failure sending mail.', '2023-06-08 11:55:15', '{\"EnqueueAt\":\"2023-06-08T11:56:18.5406110Z\",\"ScheduledAt\":\"2023-06-08T11:55:14.5406110Z\"}'),
(498, 104, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 11:56:59', '{\"EnqueuedAt\":\"2023-06-08T11:56:59.4241620Z\",\"Queue\":\"default\"}'),
(499, 105, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 11:56:59', '{\"EnqueuedAt\":\"2023-06-08T11:56:59.4336760Z\",\"Queue\":\"default\"}'),
(500, 106, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 11:56:59', '{\"EnqueuedAt\":\"2023-06-08T11:56:59.4403000Z\",\"Queue\":\"default\"}'),
(501, 107, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 11:56:59', '{\"EnqueuedAt\":\"2023-06-08T11:56:59.4466300Z\",\"Queue\":\"default\"}'),
(502, 108, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 11:56:59', '{\"EnqueuedAt\":\"2023-06-08T11:56:59.4517910Z\",\"Queue\":\"default\"}'),
(503, 104, 'Processing', NULL, '2023-06-08 11:57:00', '{\"StartedAt\":\"2023-06-08T11:56:59.5725480Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}'),
(504, 104, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 11:57:00', '{\"FailedAt\":\"2023-06-08T11:56:59.6090470Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(505, 104, 'Scheduled', 'Retry attempt 3 of 10: Failure sending mail.', '2023-06-08 11:57:00', '{\"EnqueueAt\":\"2023-06-08T11:57:57.6138790Z\",\"ScheduledAt\":\"2023-06-08T11:56:59.6138810Z\"}'),
(506, 105, 'Processing', NULL, '2023-06-08 11:57:00', '{\"StartedAt\":\"2023-06-08T11:56:59.6229030Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}'),
(507, 105, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 11:57:00', '{\"FailedAt\":\"2023-06-08T11:56:59.6414560Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(508, 105, 'Scheduled', 'Retry attempt 4 of 10: Failure sending mail.', '2023-06-08 11:57:00', '{\"EnqueueAt\":\"2023-06-08T12:00:11.6467980Z\",\"ScheduledAt\":\"2023-06-08T11:56:59.6467990Z\"}'),
(509, 106, 'Processing', NULL, '2023-06-08 11:57:00', '{\"StartedAt\":\"2023-06-08T11:56:59.6593910Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}'),
(510, 106, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 11:57:00', '{\"FailedAt\":\"2023-06-08T11:56:59.6781880Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(511, 106, 'Scheduled', 'Retry attempt 4 of 10: Failure sending mail.', '2023-06-08 11:57:00', '{\"EnqueueAt\":\"2023-06-08T11:59:35.6825740Z\",\"ScheduledAt\":\"2023-06-08T11:56:59.6825740Z\"}'),
(512, 107, 'Processing', NULL, '2023-06-08 11:57:00', '{\"StartedAt\":\"2023-06-08T11:56:59.6896740Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}'),
(513, 107, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 11:57:00', '{\"FailedAt\":\"2023-06-08T11:56:59.7045280Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(514, 107, 'Scheduled', 'Retry attempt 4 of 10: Failure sending mail.', '2023-06-08 11:57:00', '{\"EnqueueAt\":\"2023-06-08T11:59:03.7078060Z\",\"ScheduledAt\":\"2023-06-08T11:56:59.7078060Z\"}'),
(515, 108, 'Processing', NULL, '2023-06-08 11:57:00', '{\"StartedAt\":\"2023-06-08T11:56:59.7133760Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}'),
(516, 108, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 11:57:00', '{\"FailedAt\":\"2023-06-08T11:56:59.7287130Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(517, 108, 'Scheduled', 'Retry attempt 3 of 10: Failure sending mail.', '2023-06-08 11:57:00', '{\"EnqueueAt\":\"2023-06-08T11:57:33.7316990Z\",\"ScheduledAt\":\"2023-06-08T11:56:59.7317000Z\"}'),
(518, 108, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 12:08:25', '{\"EnqueuedAt\":\"2023-06-08T12:08:25.0741500Z\",\"Queue\":\"default\"}'),
(519, 104, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 12:08:25', '{\"EnqueuedAt\":\"2023-06-08T12:08:25.0828910Z\",\"Queue\":\"default\"}'),
(520, 107, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 12:08:25', '{\"EnqueuedAt\":\"2023-06-08T12:08:25.0894970Z\",\"Queue\":\"default\"}'),
(521, 106, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 12:08:25', '{\"EnqueuedAt\":\"2023-06-08T12:08:25.0960980Z\",\"Queue\":\"default\"}'),
(522, 105, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 12:08:25', '{\"EnqueuedAt\":\"2023-06-08T12:08:25.1022900Z\",\"Queue\":\"default\"}'),
(523, 108, 'Processing', NULL, '2023-06-08 12:08:25', '{\"StartedAt\":\"2023-06-08T12:08:25.3520070Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}'),
(524, 108, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 12:08:25', '{\"FailedAt\":\"2023-06-08T12:08:25.3848040Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(525, 108, 'Scheduled', 'Retry attempt 4 of 10: Failure sending mail.', '2023-06-08 12:08:25', '{\"EnqueueAt\":\"2023-06-08T12:10:49.3897910Z\",\"ScheduledAt\":\"2023-06-08T12:08:25.3897920Z\"}'),
(526, 104, 'Processing', NULL, '2023-06-08 12:08:25', '{\"StartedAt\":\"2023-06-08T12:08:25.4009070Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}'),
(527, 104, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 12:08:25', '{\"FailedAt\":\"2023-06-08T12:08:25.4206240Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(528, 104, 'Scheduled', 'Retry attempt 4 of 10: Failure sending mail.', '2023-06-08 12:08:25', '{\"EnqueueAt\":\"2023-06-08T12:11:09.4264100Z\",\"ScheduledAt\":\"2023-06-08T12:08:25.4264100Z\"}'),
(529, 107, 'Processing', NULL, '2023-06-08 12:08:25', '{\"StartedAt\":\"2023-06-08T12:08:25.4349630Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}'),
(530, 107, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 12:08:25', '{\"FailedAt\":\"2023-06-08T12:08:25.4519320Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(531, 107, 'Scheduled', 'Retry attempt 5 of 10: Failure sending mail.', '2023-06-08 12:08:25', '{\"EnqueueAt\":\"2023-06-08T12:13:16.4576540Z\",\"ScheduledAt\":\"2023-06-08T12:08:25.4576540Z\"}'),
(532, 106, 'Processing', NULL, '2023-06-08 12:08:25', '{\"StartedAt\":\"2023-06-08T12:08:25.4657150Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}'),
(533, 106, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 12:08:25', '{\"FailedAt\":\"2023-06-08T12:08:25.4836220Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(534, 106, 'Scheduled', 'Retry attempt 5 of 10: Failure sending mail.', '2023-06-08 12:08:25', '{\"EnqueueAt\":\"2023-06-08T12:15:11.4882970Z\",\"ScheduledAt\":\"2023-06-08T12:08:25.4882970Z\"}'),
(535, 105, 'Processing', NULL, '2023-06-08 12:08:26', '{\"StartedAt\":\"2023-06-08T12:08:25.4989390Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}'),
(536, 105, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 12:08:26', '{\"FailedAt\":\"2023-06-08T12:08:25.5188480Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(537, 105, 'Scheduled', 'Retry attempt 5 of 10: Failure sending mail.', '2023-06-08 12:08:26', '{\"EnqueueAt\":\"2023-06-08T12:15:01.5254670Z\",\"ScheduledAt\":\"2023-06-08T12:08:25.5254670Z\"}'),
(538, 104, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 12:21:07', '{\"EnqueuedAt\":\"2023-06-08T12:21:06.8653950Z\",\"Queue\":\"default\"}'),
(539, 108, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 12:21:07', '{\"EnqueuedAt\":\"2023-06-08T12:21:06.8731960Z\",\"Queue\":\"default\"}'),
(540, 107, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 12:21:07', '{\"EnqueuedAt\":\"2023-06-08T12:21:06.8789600Z\",\"Queue\":\"default\"}'),
(541, 105, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 12:21:07', '{\"EnqueuedAt\":\"2023-06-08T12:21:06.8842860Z\",\"Queue\":\"default\"}'),
(542, 106, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 12:21:07', '{\"EnqueuedAt\":\"2023-06-08T12:21:06.8894020Z\",\"Queue\":\"default\"}'),
(543, 104, 'Processing', NULL, '2023-06-08 12:21:07', '{\"StartedAt\":\"2023-06-08T12:21:07.2696980Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}'),
(544, 104, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 12:21:07', '{\"FailedAt\":\"2023-06-08T12:21:07.3059350Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(545, 104, 'Scheduled', 'Retry attempt 5 of 10: Failure sending mail.', '2023-06-08 12:21:07', '{\"EnqueueAt\":\"2023-06-08T12:27:38.3105550Z\",\"ScheduledAt\":\"2023-06-08T12:21:07.3105560Z\"}'),
(546, 108, 'Processing', NULL, '2023-06-08 12:21:07', '{\"StartedAt\":\"2023-06-08T12:21:07.3206620Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}'),
(547, 108, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 12:21:07', '{\"FailedAt\":\"2023-06-08T12:21:07.3455410Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(548, 108, 'Scheduled', 'Retry attempt 5 of 10: Failure sending mail.', '2023-06-08 12:21:07', '{\"EnqueueAt\":\"2023-06-08T12:27:48.3502390Z\",\"ScheduledAt\":\"2023-06-08T12:21:07.3502390Z\"}'),
(549, 107, 'Processing', NULL, '2023-06-08 12:21:07', '{\"StartedAt\":\"2023-06-08T12:21:07.3613750Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}'),
(550, 107, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 12:21:07', '{\"FailedAt\":\"2023-06-08T12:21:07.3807770Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(551, 107, 'Scheduled', 'Retry attempt 6 of 10: Failure sending mail.', '2023-06-08 12:21:07', '{\"EnqueueAt\":\"2023-06-08T12:33:29.3849560Z\",\"ScheduledAt\":\"2023-06-08T12:21:07.3849580Z\"}'),
(552, 105, 'Processing', NULL, '2023-06-08 12:21:07', '{\"StartedAt\":\"2023-06-08T12:21:07.3916380Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}'),
(553, 105, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 12:21:07', '{\"FailedAt\":\"2023-06-08T12:21:07.4077990Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(554, 105, 'Scheduled', 'Retry attempt 6 of 10: Failure sending mail.', '2023-06-08 12:21:07', '{\"EnqueueAt\":\"2023-06-08T12:32:23.4108860Z\",\"ScheduledAt\":\"2023-06-08T12:21:07.4108860Z\"}'),
(555, 106, 'Processing', NULL, '2023-06-08 12:21:07', '{\"StartedAt\":\"2023-06-08T12:21:07.4170480Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}'),
(556, 106, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 12:21:07', '{\"FailedAt\":\"2023-06-08T12:21:07.4307780Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(557, 106, 'Scheduled', 'Retry attempt 6 of 10: Failure sending mail.', '2023-06-08 12:21:07', '{\"EnqueueAt\":\"2023-06-08T12:31:59.4332340Z\",\"ScheduledAt\":\"2023-06-08T12:21:07.4332340Z\"}'),
(558, 104, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 12:53:17', '{\"EnqueuedAt\":\"2023-06-08T12:53:16.5275430Z\",\"Queue\":\"default\"}'),
(559, 108, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 12:53:17', '{\"EnqueuedAt\":\"2023-06-08T12:53:16.5367300Z\",\"Queue\":\"default\"}'),
(560, 106, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 12:53:17', '{\"EnqueuedAt\":\"2023-06-08T12:53:16.5435550Z\",\"Queue\":\"default\"}'),
(561, 105, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 12:53:17', '{\"EnqueuedAt\":\"2023-06-08T12:53:16.5495760Z\",\"Queue\":\"default\"}'),
(562, 107, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 12:53:17', '{\"EnqueuedAt\":\"2023-06-08T12:53:16.5549320Z\",\"Queue\":\"default\"}'),
(563, 104, 'Processing', NULL, '2023-06-08 12:53:17', '{\"StartedAt\":\"2023-06-08T12:53:17.0671710Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}');
INSERT INTO `Hangfire_State` (`Id`, `JobId`, `Name`, `Reason`, `CreatedAt`, `Data`) VALUES
(564, 104, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 12:53:17', '{\"FailedAt\":\"2023-06-08T12:53:17.0925360Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(565, 104, 'Scheduled', 'Retry attempt 6 of 10: Failure sending mail.', '2023-06-08 12:53:17', '{\"EnqueueAt\":\"2023-06-08T13:06:51.0963850Z\",\"ScheduledAt\":\"2023-06-08T12:53:17.0963860Z\"}'),
(566, 108, 'Processing', NULL, '2023-06-08 12:53:17', '{\"StartedAt\":\"2023-06-08T12:53:17.1056040Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}'),
(567, 108, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 12:53:17', '{\"FailedAt\":\"2023-06-08T12:53:17.1255690Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(568, 108, 'Scheduled', 'Retry attempt 6 of 10: Failure sending mail.', '2023-06-08 12:53:17', '{\"EnqueueAt\":\"2023-06-08T13:04:33.1284140Z\",\"ScheduledAt\":\"2023-06-08T12:53:17.1284140Z\"}'),
(569, 106, 'Processing', NULL, '2023-06-08 12:53:17', '{\"StartedAt\":\"2023-06-08T12:53:17.1346940Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}'),
(570, 106, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 12:53:17', '{\"FailedAt\":\"2023-06-08T12:53:17.1504320Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(571, 106, 'Scheduled', 'Retry attempt 7 of 10: Failure sending mail.', '2023-06-08 12:53:17', '{\"EnqueueAt\":\"2023-06-08T13:17:00.1527230Z\",\"ScheduledAt\":\"2023-06-08T12:53:17.1527230Z\"}'),
(572, 105, 'Processing', NULL, '2023-06-08 12:53:17', '{\"StartedAt\":\"2023-06-08T12:53:17.1577390Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}'),
(573, 105, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 12:53:17', '{\"FailedAt\":\"2023-06-08T12:53:17.1687620Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(574, 105, 'Scheduled', 'Retry attempt 7 of 10: Failure sending mail.', '2023-06-08 12:53:17', '{\"EnqueueAt\":\"2023-06-08T13:16:53.1708180Z\",\"ScheduledAt\":\"2023-06-08T12:53:17.1708180Z\"}'),
(575, 107, 'Processing', NULL, '2023-06-08 12:53:17', '{\"StartedAt\":\"2023-06-08T12:53:17.1753230Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}'),
(576, 107, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 12:53:17', '{\"FailedAt\":\"2023-06-08T12:53:17.1861530Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(577, 107, 'Scheduled', 'Retry attempt 7 of 10: Failure sending mail.', '2023-06-08 12:53:17', '{\"EnqueueAt\":\"2023-06-08T13:15:08.1885330Z\",\"ScheduledAt\":\"2023-06-08T12:53:17.1885330Z\"}'),
(578, 108, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 13:20:03', '{\"EnqueuedAt\":\"2023-06-08T13:20:03.0713910Z\",\"Queue\":\"default\"}'),
(579, 104, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 13:20:03', '{\"EnqueuedAt\":\"2023-06-08T13:20:03.0801170Z\",\"Queue\":\"default\"}'),
(580, 107, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 13:20:03', '{\"EnqueuedAt\":\"2023-06-08T13:20:03.0862620Z\",\"Queue\":\"default\"}'),
(581, 105, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 13:20:03', '{\"EnqueuedAt\":\"2023-06-08T13:20:03.0919710Z\",\"Queue\":\"default\"}'),
(582, 106, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 13:20:03', '{\"EnqueuedAt\":\"2023-06-08T13:20:03.0968820Z\",\"Queue\":\"default\"}'),
(583, 108, 'Processing', NULL, '2023-06-08 13:20:04', '{\"StartedAt\":\"2023-06-08T13:20:03.7002620Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}'),
(584, 108, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 13:20:04', '{\"FailedAt\":\"2023-06-08T13:20:03.7338160Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(585, 108, 'Scheduled', 'Retry attempt 7 of 10: Failure sending mail.', '2023-06-08 13:20:04', '{\"EnqueueAt\":\"2023-06-08T13:42:01.7374780Z\",\"ScheduledAt\":\"2023-06-08T13:20:03.7374780Z\"}'),
(586, 104, 'Processing', NULL, '2023-06-08 13:20:04', '{\"StartedAt\":\"2023-06-08T13:20:03.7449850Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}'),
(587, 104, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 13:20:04', '{\"FailedAt\":\"2023-06-08T13:20:03.7679030Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(588, 104, 'Scheduled', 'Retry attempt 7 of 10: Failure sending mail.', '2023-06-08 13:20:04', '{\"EnqueueAt\":\"2023-06-08T13:43:53.7724740Z\",\"ScheduledAt\":\"2023-06-08T13:20:03.7724750Z\"}'),
(589, 107, 'Processing', NULL, '2023-06-08 13:20:04', '{\"StartedAt\":\"2023-06-08T13:20:03.7835370Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}'),
(590, 107, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 13:20:04', '{\"FailedAt\":\"2023-06-08T13:20:03.8044280Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(591, 107, 'Scheduled', 'Retry attempt 8 of 10: Failure sending mail.', '2023-06-08 13:20:04', '{\"EnqueueAt\":\"2023-06-08T14:02:11.8081630Z\",\"ScheduledAt\":\"2023-06-08T13:20:03.8081630Z\"}'),
(592, 105, 'Processing', NULL, '2023-06-08 13:20:04', '{\"StartedAt\":\"2023-06-08T13:20:03.8161260Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}'),
(593, 105, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 13:20:04', '{\"FailedAt\":\"2023-06-08T13:20:03.8347250Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(594, 105, 'Scheduled', 'Retry attempt 8 of 10: Failure sending mail.', '2023-06-08 13:20:04', '{\"EnqueueAt\":\"2023-06-08T14:01:23.8387070Z\",\"ScheduledAt\":\"2023-06-08T13:20:03.8387070Z\"}'),
(595, 106, 'Processing', NULL, '2023-06-08 13:20:04', '{\"StartedAt\":\"2023-06-08T13:20:03.8456980Z\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\",\"WorkerId\":\"9ffe0428-e7c6-497b-b7f1-ea408f9558d1\"}'),
(596, 106, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 13:20:04', '{\"FailedAt\":\"2023-06-08T13:20:03.8615130Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"b3d59b8d-9963-41ba-831b-da7a96df397e\"}'),
(597, 106, 'Scheduled', 'Retry attempt 8 of 10: Failure sending mail.', '2023-06-08 13:20:04', '{\"EnqueueAt\":\"2023-06-08T14:01:55.8639920Z\",\"ScheduledAt\":\"2023-06-08T13:20:03.8639920Z\"}'),
(598, 109, 'Scheduled', NULL, '2023-06-08 13:31:20', '{\"EnqueueAt\":\"2023-06-08T13:31:20.8465190Z\",\"ScheduledAt\":\"2023-06-08T13:31:19.8465390Z\"}'),
(599, 109, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 13:31:32', '{\"EnqueuedAt\":\"2023-06-08T13:31:31.5413350Z\",\"Queue\":\"default\"}'),
(600, 109, 'Processing', NULL, '2023-06-08 13:31:47', '{\"StartedAt\":\"2023-06-08T13:31:46.5218190Z\",\"ServerId\":\"888fd9b8-8c80-4aee-9b34-d8bb8dc7e571\",\"WorkerId\":\"1a025e07-eeb7-4c04-9ffc-9c687b5b6762\"}'),
(601, 109, 'Succeeded', NULL, '2023-06-08 13:31:49', '{\"SucceededAt\":\"2023-06-08T13:31:48.9938190Z\",\"PerformanceDuration\":\"2455\",\"Latency\":\"26538\"}'),
(602, 108, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 13:41:32', '{\"EnqueuedAt\":\"2023-06-08T13:41:31.8451250Z\",\"Queue\":\"default\"}'),
(603, 108, 'Processing', NULL, '2023-06-08 13:41:47', '{\"StartedAt\":\"2023-06-08T13:41:46.8598000Z\",\"ServerId\":\"317e4c67-1b59-457d-a623-8512e0727519\",\"WorkerId\":\"26cd21cb-eff4-485c-8729-7b92e33321ce\"}'),
(604, 108, 'Succeeded', NULL, '2023-06-08 13:41:49', '{\"SucceededAt\":\"2023-06-08T13:41:49.2739010Z\",\"PerformanceDuration\":\"2405\",\"Latency\":\"6417867\"}'),
(605, 104, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 13:43:32', '{\"EnqueuedAt\":\"2023-06-08T13:43:31.9538430Z\",\"Queue\":\"default\"}'),
(606, 104, 'Processing', NULL, '2023-06-08 13:43:34', '{\"StartedAt\":\"2023-06-08T13:43:34.3372240Z\",\"ServerId\":\"317e4c67-1b59-457d-a623-8512e0727519\",\"WorkerId\":\"26cd21cb-eff4-485c-8729-7b92e33321ce\"}'),
(607, 104, 'Succeeded', NULL, '2023-06-08 13:43:43', '{\"SucceededAt\":\"2023-06-08T13:43:42.8331000Z\",\"PerformanceDuration\":\"8485\",\"Latency\":\"6592347\"}'),
(608, 105, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 14:08:55', '{\"EnqueuedAt\":\"2023-06-08T14:08:54.8669540Z\",\"Queue\":\"default\"}'),
(609, 106, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 14:08:55', '{\"EnqueuedAt\":\"2023-06-08T14:08:54.8702900Z\",\"Queue\":\"default\"}'),
(610, 107, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 14:08:55', '{\"EnqueuedAt\":\"2023-06-08T14:08:54.8722520Z\",\"Queue\":\"default\"}'),
(611, 105, 'Processing', NULL, '2023-06-08 14:09:06', '{\"StartedAt\":\"2023-06-08T14:09:05.6153430Z\",\"ServerId\":\"317e4c67-1b59-457d-a623-8512e0727519\",\"WorkerId\":\"26cd21cb-eff4-485c-8729-7b92e33321ce\"}'),
(612, 105, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 14:09:06', '{\"FailedAt\":\"2023-06-08T14:09:05.6723100Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"317e4c67-1b59-457d-a623-8512e0727519\"}'),
(613, 105, 'Scheduled', 'Retry attempt 9 of 10: Failure sending mail.', '2023-06-08 14:09:06', '{\"EnqueueAt\":\"2023-06-08T15:20:45.6807410Z\",\"ScheduledAt\":\"2023-06-08T14:09:05.6807720Z\"}'),
(614, 106, 'Processing', NULL, '2023-06-08 14:09:06', '{\"StartedAt\":\"2023-06-08T14:09:05.6951250Z\",\"ServerId\":\"317e4c67-1b59-457d-a623-8512e0727519\",\"WorkerId\":\"26cd21cb-eff4-485c-8729-7b92e33321ce\"}'),
(615, 106, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 14:09:06', '{\"FailedAt\":\"2023-06-08T14:09:05.7111310Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"317e4c67-1b59-457d-a623-8512e0727519\"}'),
(616, 106, 'Scheduled', 'Retry attempt 9 of 10: Failure sending mail.', '2023-06-08 14:09:06', '{\"EnqueueAt\":\"2023-06-08T15:21:57.7145140Z\",\"ScheduledAt\":\"2023-06-08T14:09:05.7145140Z\"}'),
(617, 107, 'Processing', NULL, '2023-06-08 14:09:06', '{\"StartedAt\":\"2023-06-08T14:09:05.7209520Z\",\"ServerId\":\"317e4c67-1b59-457d-a623-8512e0727519\",\"WorkerId\":\"26cd21cb-eff4-485c-8729-7b92e33321ce\"}'),
(618, 107, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 14:09:06', '{\"FailedAt\":\"2023-06-08T14:09:05.7335200Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Sockets.SocketException (00000005, 0xFFFDFFFF): nodename nor servname provided, or not known\\n   at System.Net.Dns.GetHostEntryOrAddressesCore(String hostName, Boolean justAddresses, AddressFamily addressFamily, Int64 startingTimestamp)\\n   at System.Net.Dns.GetHostAddresses(String hostNameOrAddress, AddressFamily family)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"317e4c67-1b59-457d-a623-8512e0727519\"}'),
(619, 107, 'Scheduled', 'Retry attempt 9 of 10: Failure sending mail.', '2023-06-08 14:09:06', '{\"EnqueueAt\":\"2023-06-08T15:19:42.7360530Z\",\"ScheduledAt\":\"2023-06-08T14:09:05.7360530Z\"}'),
(620, 107, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 15:19:33', '{\"EnqueuedAt\":\"2023-06-08T15:19:33.1985770Z\",\"Queue\":\"default\"}'),
(621, 107, 'Processing', NULL, '2023-06-08 15:19:44', '{\"StartedAt\":\"2023-06-08T15:19:44.0085400Z\",\"ServerId\":\"317e4c67-1b59-457d-a623-8512e0727519\",\"WorkerId\":\"26cd21cb-eff4-485c-8729-7b92e33321ce\"}'),
(622, 107, 'Succeeded', NULL, '2023-06-08 15:19:47', '{\"SucceededAt\":\"2023-06-08T15:19:46.5605220Z\",\"PerformanceDuration\":\"2542\",\"Latency\":\"12299018\"}'),
(623, 105, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 15:23:10', '{\"EnqueuedAt\":\"2023-06-08T15:23:10.3001420Z\",\"Queue\":\"default\"}'),
(624, 106, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 15:23:10', '{\"EnqueuedAt\":\"2023-06-08T15:23:10.3402900Z\",\"Queue\":\"default\"}'),
(625, 105, 'Processing', NULL, '2023-06-08 15:23:25', '{\"StartedAt\":\"2023-06-08T15:23:25.2917360Z\",\"ServerId\":\"ed6316b7-8aeb-4c5c-8600-fd4ea42d9bdd\",\"WorkerId\":\"e535dc31-168e-4753-b524-6c50d5a17cd3\"}'),
(626, 106, 'Processing', NULL, '2023-06-08 15:23:25', '{\"StartedAt\":\"2023-06-08T15:23:25.2914880Z\",\"ServerId\":\"ed6316b7-8aeb-4c5c-8600-fd4ea42d9bdd\",\"WorkerId\":\"a7a4901c-3b39-4a4e-80d3-b9837c203bda\"}'),
(627, 106, 'Succeeded', NULL, '2023-06-08 15:23:27', '{\"SucceededAt\":\"2023-06-08T15:23:27.2295060Z\",\"PerformanceDuration\":\"1929\",\"Latency\":\"12522299\"}'),
(628, 105, 'Succeeded', NULL, '2023-06-08 15:23:28', '{\"SucceededAt\":\"2023-06-08T15:23:27.9444430Z\",\"PerformanceDuration\":\"2645\",\"Latency\":\"12526299\"}'),
(629, 110, 'Scheduled', NULL, '2023-06-08 15:37:49', '{\"EnqueueAt\":\"2023-06-08T15:37:49.8093190Z\",\"ScheduledAt\":\"2023-06-08T15:37:48.8093690Z\"}'),
(630, 110, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 15:38:43', '{\"EnqueuedAt\":\"2023-06-08T15:38:42.8369700Z\",\"Queue\":\"default\"}'),
(631, 110, 'Processing', NULL, '2023-06-08 15:38:58', '{\"StartedAt\":\"2023-06-08T15:38:57.7745460Z\",\"ServerId\":\"de0901a4-5ec8-4d47-b7d0-c6ac461ec3d2\",\"WorkerId\":\"48309fc6-d147-442a-872d-d6d46e69d96a\"}'),
(632, 110, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 15:40:13', '{\"FailedAt\":\"2023-06-08T15:40:13.0451940Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c03::6c]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at System.RuntimeMethodHandle.InvokeMethod(Object target, Void** arguments, Signature sig, Boolean isConstructor)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"de0901a4-5ec8-4d47-b7d0-c6ac461ec3d2\"}'),
(633, 110, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-08 15:40:13', '{\"EnqueueAt\":\"2023-06-08T15:40:32.0552810Z\",\"ScheduledAt\":\"2023-06-08T15:40:13.0552810Z\"}'),
(634, 110, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 15:40:58', '{\"EnqueuedAt\":\"2023-06-08T15:40:57.9471880Z\",\"Queue\":\"default\"}'),
(635, 110, 'Processing', NULL, '2023-06-08 15:40:58', '{\"StartedAt\":\"2023-06-08T15:40:58.0807700Z\",\"ServerId\":\"de0901a4-5ec8-4d47-b7d0-c6ac461ec3d2\",\"WorkerId\":\"48309fc6-d147-442a-872d-d6d46e69d96a\"}'),
(636, 110, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 15:43:12', '{\"FailedAt\":\"2023-06-08T15:43:11.9615420Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c03::6c]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"de0901a4-5ec8-4d47-b7d0-c6ac461ec3d2\"}'),
(637, 110, 'Scheduled', 'Retry attempt 2 of 10: Failure sending mail.', '2023-06-08 15:43:12', '{\"EnqueueAt\":\"2023-06-08T15:44:03.9725160Z\",\"ScheduledAt\":\"2023-06-08T15:43:11.9725180Z\"}'),
(638, 110, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 15:45:12', '{\"EnqueuedAt\":\"2023-06-08T15:45:11.8695810Z\",\"Queue\":\"default\"}'),
(639, 110, 'Processing', NULL, '2023-06-08 15:45:12', '{\"StartedAt\":\"2023-06-08T15:45:12.0177060Z\",\"ServerId\":\"de0901a4-5ec8-4d47-b7d0-c6ac461ec3d2\",\"WorkerId\":\"48309fc6-d147-442a-872d-d6d46e69d96a\"}'),
(640, 111, 'Scheduled', NULL, '2023-06-08 15:46:26', '{\"EnqueueAt\":\"2023-06-08T15:46:27.3182640Z\",\"ScheduledAt\":\"2023-06-08T15:46:26.3182960Z\"}'),
(641, 111, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 15:47:14', '{\"EnqueuedAt\":\"2023-06-08T15:47:14.0359830Z\",\"Queue\":\"default\"}'),
(642, 111, 'Processing', NULL, '2023-06-08 15:47:29', '{\"StartedAt\":\"2023-06-08T15:47:29.0070760Z\",\"ServerId\":\"b861284b-e76b-432b-b46e-70186e09a292\",\"WorkerId\":\"30e45929-6665-4374-a457-0df26ee17dfc\"}'),
(643, 111, 'Succeeded', NULL, '2023-06-08 15:47:30', '{\"SucceededAt\":\"2023-06-08T15:47:29.9789070Z\",\"PerformanceDuration\":\"964\",\"Latency\":\"63014\"}'),
(644, 112, 'Scheduled', NULL, '2023-06-08 15:54:13', '{\"EnqueueAt\":\"2023-06-08T15:54:14.4199700Z\",\"ScheduledAt\":\"2023-06-08T15:54:13.4200070Z\"}'),
(645, 113, 'Scheduled', NULL, '2023-06-08 15:54:16', '{\"EnqueueAt\":\"2023-06-08T15:54:17.4222080Z\",\"ScheduledAt\":\"2023-06-08T15:54:16.4222120Z\"}'),
(646, 112, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 15:54:21', '{\"EnqueuedAt\":\"2023-06-08T15:54:20.7888660Z\",\"Queue\":\"default\"}'),
(647, 113, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 15:54:21', '{\"EnqueuedAt\":\"2023-06-08T15:54:20.8473680Z\",\"Queue\":\"default\"}'),
(648, 114, 'Scheduled', NULL, '2023-06-08 15:54:23', '{\"EnqueueAt\":\"2023-06-08T15:54:23.9618330Z\",\"ScheduledAt\":\"2023-06-08T15:54:22.9618360Z\"}'),
(649, 115, 'Scheduled', NULL, '2023-06-08 15:54:25', '{\"EnqueueAt\":\"2023-06-08T15:54:25.7718640Z\",\"ScheduledAt\":\"2023-06-08T15:54:24.7718810Z\"}'),
(650, 113, 'Processing', NULL, '2023-06-08 15:54:36', '{\"StartedAt\":\"2023-06-08T15:54:35.7971500Z\",\"ServerId\":\"93f8ac59-4a83-4274-838c-81d27096bee7\",\"WorkerId\":\"3f51ccc7-01bd-4c36-a7c9-a6e92ef1a296\"}'),
(651, 112, 'Processing', NULL, '2023-06-08 15:54:36', '{\"StartedAt\":\"2023-06-08T15:54:35.7974000Z\",\"ServerId\":\"93f8ac59-4a83-4274-838c-81d27096bee7\",\"WorkerId\":\"e02ec68c-375e-40ef-97bf-d5cbb5a6ec5d\"}'),
(652, 114, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 15:54:36', '{\"EnqueuedAt\":\"2023-06-08T15:54:35.8593850Z\",\"Queue\":\"default\"}'),
(653, 115, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 15:54:36', '{\"EnqueuedAt\":\"2023-06-08T15:54:35.8636750Z\",\"Queue\":\"default\"}'),
(654, 112, 'Succeeded', NULL, '2023-06-08 15:54:36', '{\"SucceededAt\":\"2023-06-08T15:54:36.3785190Z\",\"PerformanceDuration\":\"574\",\"Latency\":\"22803\"}'),
(655, 113, 'Succeeded', NULL, '2023-06-08 15:54:36', '{\"SucceededAt\":\"2023-06-08T15:54:36.3785230Z\",\"PerformanceDuration\":\"574\",\"Latency\":\"19803\"}'),
(656, 114, 'Processing', NULL, '2023-06-08 15:54:36', '{\"StartedAt\":\"2023-06-08T15:54:36.4069440Z\",\"ServerId\":\"93f8ac59-4a83-4274-838c-81d27096bee7\",\"WorkerId\":\"3f51ccc7-01bd-4c36-a7c9-a6e92ef1a296\"}'),
(657, 115, 'Processing', NULL, '2023-06-08 15:54:36', '{\"StartedAt\":\"2023-06-08T15:54:36.4071240Z\",\"ServerId\":\"93f8ac59-4a83-4274-838c-81d27096bee7\",\"WorkerId\":\"e02ec68c-375e-40ef-97bf-d5cbb5a6ec5d\"}'),
(658, 114, 'Succeeded', NULL, '2023-06-08 15:54:37', '{\"SucceededAt\":\"2023-06-08T15:54:36.5799430Z\",\"PerformanceDuration\":\"167\",\"Latency\":\"13412\"}'),
(659, 115, 'Succeeded', NULL, '2023-06-08 15:54:37', '{\"SucceededAt\":\"2023-06-08T15:54:36.5892700Z\",\"PerformanceDuration\":\"177\",\"Latency\":\"11412\"}'),
(660, 110, 'Processing', NULL, '2023-06-08 16:16:42', '{\"StartedAt\":\"2023-06-08T16:16:42.1182450Z\",\"ServerId\":\"93f8ac59-4a83-4274-838c-81d27096bee7\",\"WorkerId\":\"db4c2536-95ae-4414-8536-521d1cf7df78\"}'),
(661, 110, 'Succeeded', NULL, '2023-06-08 16:16:44', '{\"SucceededAt\":\"2023-06-08T16:16:44.3015600Z\",\"PerformanceDuration\":\"2173\",\"Latency\":\"2333128\"}'),
(662, 116, 'Scheduled', NULL, '2023-06-08 16:42:47', '{\"EnqueueAt\":\"2023-06-08T16:42:47.6023920Z\",\"ScheduledAt\":\"2023-06-08T16:42:46.6024120Z\"}'),
(663, 116, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 16:42:56', '{\"EnqueuedAt\":\"2023-06-08T16:42:56.3351020Z\",\"Queue\":\"default\"}'),
(664, 116, 'Processing', NULL, '2023-06-08 16:43:11', '{\"StartedAt\":\"2023-06-08T16:43:11.3228290Z\",\"ServerId\":\"2aa7d680-a518-4789-807c-f21bb24b995a\",\"WorkerId\":\"ab2288de-8ed7-44f5-92e5-1a00c8ff2592\"}'),
(665, 116, 'Succeeded', NULL, '2023-06-08 16:43:12', '{\"SucceededAt\":\"2023-06-08T16:43:11.9459590Z\",\"PerformanceDuration\":\"610\",\"Latency\":\"24334\"}'),
(666, 117, 'Scheduled', NULL, '2023-06-08 16:44:05', '{\"EnqueueAt\":\"2023-06-08T16:44:05.7758060Z\",\"ScheduledAt\":\"2023-06-08T16:44:04.7758080Z\"}'),
(667, 117, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 16:45:06', '{\"EnqueuedAt\":\"2023-06-08T16:45:05.5840520Z\",\"Queue\":\"default\"}'),
(668, 117, 'Processing', NULL, '2023-06-08 16:45:21', '{\"StartedAt\":\"2023-06-08T16:45:20.5619270Z\",\"ServerId\":\"cd004916-390e-40e6-ba1c-37bcab7dd835\",\"WorkerId\":\"f99fa549-7578-42f2-88e9-c4fcde415360\"}'),
(669, 117, 'Succeeded', NULL, '2023-06-08 16:45:21', '{\"SucceededAt\":\"2023-06-08T16:45:21.0625580Z\",\"PerformanceDuration\":\"491\",\"Latency\":\"75570\"}'),
(670, 118, 'Scheduled', NULL, '2023-06-08 16:59:50', '{\"EnqueueAt\":\"2023-06-08T16:59:51.0470590Z\",\"ScheduledAt\":\"2023-06-08T16:59:50.0471020Z\"}'),
(671, 119, 'Scheduled', NULL, '2023-06-08 16:59:54', '{\"EnqueueAt\":\"2023-06-08T16:59:54.7556090Z\",\"ScheduledAt\":\"2023-06-08T16:59:53.7556130Z\"}'),
(672, 120, 'Scheduled', NULL, '2023-06-08 16:59:56', '{\"EnqueueAt\":\"2023-06-08T16:59:56.7212100Z\",\"ScheduledAt\":\"2023-06-08T16:59:55.7212130Z\"}'),
(673, 121, 'Scheduled', NULL, '2023-06-08 17:00:01', '{\"EnqueueAt\":\"2023-06-08T17:00:01.9701310Z\",\"ScheduledAt\":\"2023-06-08T17:00:00.9701350Z\"}'),
(674, 118, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 17:00:01', '{\"EnqueuedAt\":\"2023-06-08T17:00:01.3715580Z\",\"Queue\":\"default\"}'),
(675, 119, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 17:00:01', '{\"EnqueuedAt\":\"2023-06-08T17:00:01.4431730Z\",\"Queue\":\"default\"}'),
(676, 120, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 17:00:01', '{\"EnqueuedAt\":\"2023-06-08T17:00:01.4657530Z\",\"Queue\":\"default\"}'),
(677, 121, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 17:00:01', '{\"EnqueuedAt\":\"2023-06-08T17:00:01.4692620Z\",\"Queue\":\"default\"}'),
(678, 122, 'Scheduled', NULL, '2023-06-08 17:00:04', '{\"EnqueueAt\":\"2023-06-08T17:00:04.6358140Z\",\"ScheduledAt\":\"2023-06-08T17:00:03.6358150Z\"}'),
(679, 118, 'Processing', NULL, '2023-06-08 17:00:16', '{\"StartedAt\":\"2023-06-08T17:00:16.3509700Z\",\"ServerId\":\"1d5e3ecb-dbc5-4edc-a648-0bcb112363f1\",\"WorkerId\":\"42d5e763-4c44-4053-833f-4e432abd43ce\"}'),
(680, 119, 'Processing', NULL, '2023-06-08 17:00:16', '{\"StartedAt\":\"2023-06-08T17:00:16.3508630Z\",\"ServerId\":\"1d5e3ecb-dbc5-4edc-a648-0bcb112363f1\",\"WorkerId\":\"dac774b6-5076-4a6b-9d36-aad71b66909a\"}'),
(681, 121, 'Processing', NULL, '2023-06-08 17:00:16', '{\"StartedAt\":\"2023-06-08T17:00:16.3507480Z\",\"ServerId\":\"1d5e3ecb-dbc5-4edc-a648-0bcb112363f1\",\"WorkerId\":\"c78a898f-3090-427f-82ac-7e68e848b7ec\"}'),
(682, 120, 'Processing', NULL, '2023-06-08 17:00:16', '{\"StartedAt\":\"2023-06-08T17:00:16.3507200Z\",\"ServerId\":\"1d5e3ecb-dbc5-4edc-a648-0bcb112363f1\",\"WorkerId\":\"0cead882-8b66-4f00-82a0-38a57cba7555\"}'),
(683, 122, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 17:00:16', '{\"EnqueuedAt\":\"2023-06-08T17:00:16.4786760Z\",\"Queue\":\"default\"}'),
(684, 118, 'Succeeded', NULL, '2023-06-08 17:00:19', '{\"SucceededAt\":\"2023-06-08T17:00:19.0630530Z\",\"PerformanceDuration\":\"2696\",\"Latency\":\"26366\"}'),
(685, 122, 'Processing', NULL, '2023-06-08 17:00:19', '{\"StartedAt\":\"2023-06-08T17:00:19.0817250Z\",\"ServerId\":\"1d5e3ecb-dbc5-4edc-a648-0bcb112363f1\",\"WorkerId\":\"42d5e763-4c44-4053-833f-4e432abd43ce\"}'),
(686, 121, 'Succeeded', NULL, '2023-06-08 17:00:19', '{\"SucceededAt\":\"2023-06-08T17:00:19.2537780Z\",\"PerformanceDuration\":\"2886\",\"Latency\":\"15366\"}'),
(687, 122, 'Succeeded', NULL, '2023-06-08 17:00:21', '{\"SucceededAt\":\"2023-06-08T17:00:21.1141550Z\",\"PerformanceDuration\":\"2028\",\"Latency\":\"15085\"}'),
(688, 120, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 17:01:32', '{\"FailedAt\":\"2023-06-08T17:01:31.5485800Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c05::6d]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"1d5e3ecb-dbc5-4edc-a648-0bcb112363f1\"}'),
(689, 119, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 17:01:32', '{\"FailedAt\":\"2023-06-08T17:01:31.5485820Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c05::6d]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"1d5e3ecb-dbc5-4edc-a648-0bcb112363f1\"}'),
(690, 120, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-08 17:01:32', '{\"EnqueueAt\":\"2023-06-08T17:02:04.5528350Z\",\"ScheduledAt\":\"2023-06-08T17:01:31.5528350Z\"}'),
(691, 119, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-08 17:01:32', '{\"EnqueueAt\":\"2023-06-08T17:02:14.5528380Z\",\"ScheduledAt\":\"2023-06-08T17:01:31.5528380Z\"}'),
(692, 119, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 17:01:59', '{\"EnqueuedAt\":\"2023-06-08T17:01:58.9178990Z\",\"Queue\":\"default\"}'),
(693, 120, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 17:01:59', '{\"EnqueuedAt\":\"2023-06-08T17:01:58.9970770Z\",\"Queue\":\"default\"}'),
(694, 120, 'Processing', NULL, '2023-06-08 17:02:14', '{\"StartedAt\":\"2023-06-08T17:02:13.9039430Z\",\"ServerId\":\"fa49eed2-e092-4771-98f5-17dcd32177eb\",\"WorkerId\":\"4a05abfc-3e14-4cc0-8627-1a9dcdfaa741\"}'),
(695, 119, 'Processing', NULL, '2023-06-08 17:02:14', '{\"StartedAt\":\"2023-06-08T17:02:13.9039460Z\",\"ServerId\":\"fa49eed2-e092-4771-98f5-17dcd32177eb\",\"WorkerId\":\"51813eca-adcb-47ed-938d-7b107f80a413\"}'),
(696, 119, 'Succeeded', NULL, '2023-06-08 17:02:16', '{\"SucceededAt\":\"2023-06-08T17:02:16.3161750Z\",\"PerformanceDuration\":\"2398\",\"Latency\":\"139916\"}'),
(697, 120, 'Succeeded', NULL, '2023-06-08 17:02:16', '{\"SucceededAt\":\"2023-06-08T17:02:16.3161850Z\",\"PerformanceDuration\":\"2398\",\"Latency\":\"137916\"}'),
(698, 123, 'Scheduled', NULL, '2023-06-08 17:02:29', '{\"EnqueueAt\":\"2023-06-08T17:02:30.3378580Z\",\"ScheduledAt\":\"2023-06-08T17:02:29.3378850Z\"}'),
(699, 123, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 17:02:44', '{\"EnqueuedAt\":\"2023-06-08T17:02:44.0266570Z\",\"Queue\":\"default\"}'),
(700, 123, 'Processing', NULL, '2023-06-08 17:02:46', '{\"StartedAt\":\"2023-06-08T17:02:46.3635380Z\",\"ServerId\":\"fa49eed2-e092-4771-98f5-17dcd32177eb\",\"WorkerId\":\"4a05abfc-3e14-4cc0-8627-1a9dcdfaa741\"}'),
(701, 123, 'Succeeded', NULL, '2023-06-08 17:02:48', '{\"SucceededAt\":\"2023-06-08T17:02:48.4676430Z\",\"PerformanceDuration\":\"2101\",\"Latency\":\"17366\"}'),
(702, 124, 'Scheduled', NULL, '2023-06-08 17:07:41', '{\"EnqueueAt\":\"2023-06-08T17:07:42.2207350Z\",\"ScheduledAt\":\"2023-06-08T17:07:41.2207360Z\"}'),
(703, 124, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 17:08:29', '{\"EnqueuedAt\":\"2023-06-08T17:08:29.2036690Z\",\"Queue\":\"default\"}');
INSERT INTO `Hangfire_State` (`Id`, `JobId`, `Name`, `Reason`, `CreatedAt`, `Data`) VALUES
(704, 124, 'Processing', NULL, '2023-06-08 17:08:31', '{\"StartedAt\":\"2023-06-08T17:08:31.4634050Z\",\"ServerId\":\"fa49eed2-e092-4771-98f5-17dcd32177eb\",\"WorkerId\":\"51813eca-adcb-47ed-938d-7b107f80a413\"}'),
(705, 124, 'Succeeded', NULL, '2023-06-08 17:08:34', '{\"SucceededAt\":\"2023-06-08T17:08:33.8665870Z\",\"PerformanceDuration\":\"2400\",\"Latency\":\"50466\"}'),
(706, 125, 'Scheduled', NULL, '2023-06-08 17:10:00', '{\"EnqueueAt\":\"2023-06-08T17:10:01.0476250Z\",\"ScheduledAt\":\"2023-06-08T17:10:00.0476270Z\"}'),
(707, 125, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 17:10:39', '{\"EnqueuedAt\":\"2023-06-08T17:10:38.6677970Z\",\"Queue\":\"default\"}'),
(708, 125, 'Processing', NULL, '2023-06-08 17:10:39', '{\"StartedAt\":\"2023-06-08T17:10:38.7771120Z\",\"ServerId\":\"fa49eed2-e092-4771-98f5-17dcd32177eb\",\"WorkerId\":\"01f0552a-7cdd-436b-b6ac-2e14bf83d1a0\"}'),
(709, 125, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 17:11:54', '{\"FailedAt\":\"2023-06-08T17:11:53.8318140Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c05::6d]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"fa49eed2-e092-4771-98f5-17dcd32177eb\"}'),
(710, 125, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-08 17:11:54', '{\"EnqueueAt\":\"2023-06-08T17:12:31.8362290Z\",\"ScheduledAt\":\"2023-06-08T17:11:53.8362290Z\"}'),
(711, 125, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 17:13:01', '{\"EnqueuedAt\":\"2023-06-08T17:13:00.6358780Z\",\"Queue\":\"default\"}'),
(712, 125, 'Processing', NULL, '2023-06-08 17:13:18', '{\"StartedAt\":\"2023-06-08T17:13:14.6134350Z\",\"ServerId\":\"fa49eed2-e092-4771-98f5-17dcd32177eb\",\"WorkerId\":\"c35ca055-b430-4625-9336-f4effad7b8d6\"}'),
(713, 125, 'Succeeded', NULL, '2023-06-08 17:13:36', '{\"SucceededAt\":\"2023-06-08T17:13:36.2589260Z\",\"PerformanceDuration\":\"18029\",\"Latency\":\"198229\"}'),
(714, 126, 'Scheduled', NULL, '2023-06-08 17:15:14', '{\"EnqueueAt\":\"2023-06-08T17:15:14.7052700Z\",\"ScheduledAt\":\"2023-06-08T17:15:13.7052900Z\"}'),
(715, 127, 'Scheduled', NULL, '2023-06-08 17:15:22', '{\"EnqueueAt\":\"2023-06-08T17:15:23.2321630Z\",\"ScheduledAt\":\"2023-06-08T17:15:22.2321670Z\"}'),
(716, 126, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 17:15:31', '{\"EnqueuedAt\":\"2023-06-08T17:15:27.4326850Z\",\"Queue\":\"default\"}'),
(717, 127, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 17:15:31', '{\"EnqueuedAt\":\"2023-06-08T17:15:30.9754080Z\",\"Queue\":\"default\"}'),
(718, 128, 'Scheduled', NULL, '2023-06-08 17:15:34', '{\"EnqueueAt\":\"2023-06-08T17:15:35.0895470Z\",\"ScheduledAt\":\"2023-06-08T17:15:34.0895490Z\"}'),
(719, 126, 'Processing', NULL, '2023-06-08 17:15:42', '{\"StartedAt\":\"2023-06-08T17:15:42.3259910Z\",\"ServerId\":\"6bf8b15d-6ba2-4e58-badc-f24e08ce552d\",\"WorkerId\":\"0a0d2fa8-21f9-4345-8cb2-e19dc81c2995\"}'),
(720, 127, 'Processing', NULL, '2023-06-08 17:15:42', '{\"StartedAt\":\"2023-06-08T17:15:42.3259800Z\",\"ServerId\":\"6bf8b15d-6ba2-4e58-badc-f24e08ce552d\",\"WorkerId\":\"ab6a19f5-52ab-4ddf-bccb-6d0f8ee43400\"}'),
(721, 127, 'Succeeded', NULL, '2023-06-08 17:15:44', '{\"SucceededAt\":\"2023-06-08T17:15:44.4639330Z\",\"PerformanceDuration\":\"2129\",\"Latency\":\"20333\"}'),
(722, 126, 'Succeeded', NULL, '2023-06-08 17:15:45', '{\"SucceededAt\":\"2023-06-08T17:15:44.5808100Z\",\"PerformanceDuration\":\"2247\",\"Latency\":\"28333\"}'),
(723, 129, 'Scheduled', NULL, '2023-06-08 17:15:45', '{\"EnqueueAt\":\"2023-06-08T17:15:46.4724280Z\",\"ScheduledAt\":\"2023-06-08T17:15:45.4724320Z\"}'),
(724, 128, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 17:15:48', '{\"EnqueuedAt\":\"2023-06-08T17:15:48.1827020Z\",\"Queue\":\"default\"}'),
(725, 128, 'Processing', NULL, '2023-06-08 17:15:57', '{\"StartedAt\":\"2023-06-08T17:15:57.3295200Z\",\"ServerId\":\"6bf8b15d-6ba2-4e58-badc-f24e08ce552d\",\"WorkerId\":\"64efdb8f-feba-4f25-a7ee-9f4c84ad7cf4\"}'),
(726, 128, 'Succeeded', NULL, '2023-06-08 17:15:59', '{\"SucceededAt\":\"2023-06-08T17:15:59.3126710Z\",\"PerformanceDuration\":\"1974\",\"Latency\":\"23338\"}'),
(727, 129, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 17:16:48', '{\"EnqueuedAt\":\"2023-06-08T17:16:48.3500320Z\",\"Queue\":\"default\"}'),
(728, 129, 'Processing', NULL, '2023-06-08 17:16:56', '{\"StartedAt\":\"2023-06-08T17:16:56.0854600Z\",\"ServerId\":\"86593280-5f5a-4d59-859a-2e7e802b010f\",\"WorkerId\":\"5a07e753-9217-4682-9911-e5c50b6c791a\"}'),
(729, 129, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 17:18:11', '{\"FailedAt\":\"2023-06-08T17:18:11.2023860Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c05::6d]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at System.RuntimeMethodHandle.InvokeMethod(Object target, Void** arguments, Signature sig, Boolean isConstructor)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"86593280-5f5a-4d59-859a-2e7e802b010f\"}'),
(730, 129, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-08 17:18:11', '{\"EnqueueAt\":\"2023-06-08T17:18:34.2092290Z\",\"ScheduledAt\":\"2023-06-08T17:18:11.2092580Z\"}'),
(731, 129, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 17:18:57', '{\"EnqueuedAt\":\"2023-06-08T17:18:56.9475030Z\",\"Queue\":\"default\"}'),
(732, 129, 'Processing', NULL, '2023-06-08 17:19:12', '{\"StartedAt\":\"2023-06-08T17:19:11.9300140Z\",\"ServerId\":\"6d6bcf2d-ab58-4176-9755-094b70fac4c0\",\"WorkerId\":\"cb207a42-2e98-4e7c-99d9-a80ddb56a5c3\"}'),
(733, 129, 'Succeeded', NULL, '2023-06-08 17:19:14', '{\"SucceededAt\":\"2023-06-08T17:19:14.0873880Z\",\"PerformanceDuration\":\"2142\",\"Latency\":\"206944\"}'),
(734, 130, 'Scheduled', NULL, '2023-06-08 20:16:39', '{\"EnqueueAt\":\"2023-06-08T20:16:40.0887160Z\",\"ScheduledAt\":\"2023-06-08T20:16:39.0887400Z\"}'),
(735, 130, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 20:16:54', '{\"EnqueuedAt\":\"2023-06-08T20:16:54.0261410Z\",\"Queue\":\"default\"}'),
(736, 130, 'Processing', NULL, '2023-06-08 20:21:52', '{\"StartedAt\":\"2023-06-08T20:21:52.0492520Z\",\"ServerId\":\"5bb7780b-853e-46fe-8d53-d548600c259d\",\"WorkerId\":\"a846c5d3-25f6-4968-9d6f-e68fedacbe6f\"}'),
(737, 130, 'Succeeded', NULL, '2023-06-08 20:21:55', '{\"SucceededAt\":\"2023-06-08T20:21:54.7053350Z\",\"PerformanceDuration\":\"2617\",\"Latency\":\"313084\"}'),
(738, 131, 'Scheduled', NULL, '2023-06-08 20:46:57', '{\"EnqueueAt\":\"2023-06-08T20:46:58.0549890Z\",\"ScheduledAt\":\"2023-06-08T20:46:57.0550140Z\"}'),
(739, 132, 'Scheduled', NULL, '2023-06-08 20:47:44', '{\"EnqueueAt\":\"2023-06-08T20:47:45.0822590Z\",\"ScheduledAt\":\"2023-06-08T20:47:44.0822630Z\"}'),
(740, 133, 'Scheduled', NULL, '2023-06-08 20:47:47', '{\"EnqueueAt\":\"2023-06-08T20:47:48.0305050Z\",\"ScheduledAt\":\"2023-06-08T20:47:47.0305090Z\"}'),
(741, 134, 'Scheduled', NULL, '2023-06-08 20:47:50', '{\"EnqueueAt\":\"2023-06-08T20:47:50.6522330Z\",\"ScheduledAt\":\"2023-06-08T20:47:49.6522370Z\"}'),
(742, 135, 'Scheduled', NULL, '2023-06-08 20:47:53', '{\"EnqueueAt\":\"2023-06-08T20:47:54.2900220Z\",\"ScheduledAt\":\"2023-06-08T20:47:53.2900270Z\"}'),
(743, 131, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 20:48:07', '{\"EnqueuedAt\":\"2023-06-08T20:48:06.8944270Z\",\"Queue\":\"default\"}'),
(744, 132, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 20:48:07', '{\"EnqueuedAt\":\"2023-06-08T20:48:06.9531430Z\",\"Queue\":\"default\"}'),
(745, 133, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 20:48:07', '{\"EnqueuedAt\":\"2023-06-08T20:48:06.9605370Z\",\"Queue\":\"default\"}'),
(746, 134, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 20:48:07', '{\"EnqueuedAt\":\"2023-06-08T20:48:06.9656300Z\",\"Queue\":\"default\"}'),
(747, 135, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 20:48:07', '{\"EnqueuedAt\":\"2023-06-08T20:48:06.9698090Z\",\"Queue\":\"default\"}'),
(748, 135, 'Processing', NULL, '2023-06-08 20:48:22', '{\"StartedAt\":\"2023-06-08T20:48:21.9026730Z\",\"ServerId\":\"4f9add05-d969-492a-81bd-4259821e6732\",\"WorkerId\":\"d908a85e-1ecb-43ff-ac90-16fa7fdd348d\"}'),
(749, 132, 'Processing', NULL, '2023-06-08 20:48:22', '{\"StartedAt\":\"2023-06-08T20:48:21.9002360Z\",\"ServerId\":\"4f9add05-d969-492a-81bd-4259821e6732\",\"WorkerId\":\"cc17c95b-22b9-437f-8a36-f8250b789d9d\"}'),
(750, 134, 'Processing', NULL, '2023-06-08 20:48:22', '{\"StartedAt\":\"2023-06-08T20:48:21.9005650Z\",\"ServerId\":\"4f9add05-d969-492a-81bd-4259821e6732\",\"WorkerId\":\"c9cadf9d-ea3f-4df2-9625-4f6284cf5191\"}'),
(751, 131, 'Processing', NULL, '2023-06-08 20:48:22', '{\"StartedAt\":\"2023-06-08T20:48:21.9001460Z\",\"ServerId\":\"4f9add05-d969-492a-81bd-4259821e6732\",\"WorkerId\":\"e86cb7bd-eac0-4adb-b49b-04cbfa929e57\"}'),
(752, 133, 'Processing', NULL, '2023-06-08 20:48:22', '{\"StartedAt\":\"2023-06-08T20:48:21.9000390Z\",\"ServerId\":\"4f9add05-d969-492a-81bd-4259821e6732\",\"WorkerId\":\"309b16f3-7c12-4bcc-ad7a-1ac3556ba7fe\"}'),
(753, 135, 'Succeeded', NULL, '2023-06-08 20:48:24', '{\"SucceededAt\":\"2023-06-08T20:48:24.0861520Z\",\"PerformanceDuration\":\"2167\",\"Latency\":\"28918\"}'),
(754, 132, 'Succeeded', NULL, '2023-06-08 20:48:26', '{\"SucceededAt\":\"2023-06-08T20:48:25.8541420Z\",\"PerformanceDuration\":\"3935\",\"Latency\":\"37918\"}'),
(755, 133, 'Succeeded', NULL, '2023-06-08 20:48:26', '{\"SucceededAt\":\"2023-06-08T20:48:25.9961750Z\",\"PerformanceDuration\":\"4077\",\"Latency\":\"34918\"}'),
(756, 134, 'Succeeded', NULL, '2023-06-08 20:48:26', '{\"SucceededAt\":\"2023-06-08T20:48:26.3636130Z\",\"PerformanceDuration\":\"4445\",\"Latency\":\"31918\"}'),
(757, 136, 'Scheduled', NULL, '2023-06-08 20:49:12', '{\"EnqueueAt\":\"2023-06-08T20:49:13.0342290Z\",\"ScheduledAt\":\"2023-06-08T20:49:12.0342310Z\"}'),
(758, 131, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 20:49:37', '{\"FailedAt\":\"2023-06-08T20:49:37.1026740Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c05::6c]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String message) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 50\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"4f9add05-d969-492a-81bd-4259821e6732\"}'),
(759, 131, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-08 20:49:37', '{\"EnqueueAt\":\"2023-06-08T20:50:01.1107670Z\",\"ScheduledAt\":\"2023-06-08T20:49:37.1107670Z\"}'),
(760, 131, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 20:50:22', '{\"EnqueuedAt\":\"2023-06-08T20:50:22.0699360Z\",\"Queue\":\"default\"}'),
(761, 136, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 20:50:22', '{\"EnqueuedAt\":\"2023-06-08T20:50:22.0807420Z\",\"Queue\":\"default\"}'),
(762, 131, 'Processing', NULL, '2023-06-08 20:50:22', '{\"StartedAt\":\"2023-06-08T20:50:22.1489260Z\",\"ServerId\":\"4f9add05-d969-492a-81bd-4259821e6732\",\"WorkerId\":\"e86cb7bd-eac0-4adb-b49b-04cbfa929e57\"}'),
(763, 136, 'Processing', NULL, '2023-06-08 20:50:24', '{\"StartedAt\":\"2023-06-08T20:50:24.1573820Z\",\"ServerId\":\"4f9add05-d969-492a-81bd-4259821e6732\",\"WorkerId\":\"d908a85e-1ecb-43ff-ac90-16fa7fdd348d\"}'),
(764, 131, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 20:51:37', '{\"FailedAt\":\"2023-06-08T20:51:37.2449880Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c05::6c]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String message) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 50\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"4f9add05-d969-492a-81bd-4259821e6732\"}'),
(765, 131, 'Scheduled', 'Retry attempt 2 of 10: Failure sending mail.', '2023-06-08 20:51:37', '{\"EnqueueAt\":\"2023-06-08T20:52:39.2566390Z\",\"ScheduledAt\":\"2023-06-08T20:51:37.2566400Z\"}'),
(766, 136, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 20:51:39', '{\"FailedAt\":\"2023-06-08T20:51:39.2008750Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c05::6c]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String message) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 50\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"4f9add05-d969-492a-81bd-4259821e6732\"}'),
(767, 136, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-08 20:51:39', '{\"EnqueueAt\":\"2023-06-08T20:52:23.2091060Z\",\"ScheduledAt\":\"2023-06-08T20:51:39.2091070Z\"}'),
(768, 131, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 20:52:22', '{\"EnqueuedAt\":\"2023-06-08T20:52:22.1387150Z\",\"Queue\":\"default\"}'),
(769, 136, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 20:52:22', '{\"EnqueuedAt\":\"2023-06-08T20:52:22.1454850Z\",\"Queue\":\"default\"}'),
(770, 131, 'Processing', NULL, '2023-06-08 20:52:22', '{\"StartedAt\":\"2023-06-08T20:52:22.2817050Z\",\"ServerId\":\"4f9add05-d969-492a-81bd-4259821e6732\",\"WorkerId\":\"e86cb7bd-eac0-4adb-b49b-04cbfa929e57\"}'),
(771, 136, 'Processing', NULL, '2023-06-08 20:52:24', '{\"StartedAt\":\"2023-06-08T20:52:24.2346590Z\",\"ServerId\":\"4f9add05-d969-492a-81bd-4259821e6732\",\"WorkerId\":\"d908a85e-1ecb-43ff-ac90-16fa7fdd348d\"}'),
(772, 137, 'Scheduled', NULL, '2023-06-08 20:53:15', '{\"EnqueueAt\":\"2023-06-08T20:53:15.9364060Z\",\"ScheduledAt\":\"2023-06-08T20:53:14.9364080Z\"}'),
(773, 138, 'Scheduled', NULL, '2023-06-08 20:53:20', '{\"EnqueueAt\":\"2023-06-08T20:53:20.5551480Z\",\"ScheduledAt\":\"2023-06-08T20:53:19.5551500Z\"}'),
(774, 139, 'Scheduled', NULL, '2023-06-08 20:53:22', '{\"EnqueueAt\":\"2023-06-08T20:53:22.9168570Z\",\"ScheduledAt\":\"2023-06-08T20:53:21.9168600Z\"}'),
(775, 137, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 20:53:22', '{\"EnqueuedAt\":\"2023-06-08T20:53:22.1824130Z\",\"Queue\":\"default\"}'),
(776, 140, 'Scheduled', NULL, '2023-06-08 20:53:26', '{\"EnqueueAt\":\"2023-06-08T20:53:26.9266330Z\",\"ScheduledAt\":\"2023-06-08T20:53:25.9266350Z\"}'),
(777, 137, 'Processing', NULL, '2023-06-08 20:53:26', '{\"StartedAt\":\"2023-06-08T20:53:26.2595930Z\",\"ServerId\":\"4f9add05-d969-492a-81bd-4259821e6732\",\"WorkerId\":\"cc17c95b-22b9-437f-8a36-f8250b789d9d\"}'),
(778, 141, 'Scheduled', NULL, '2023-06-08 20:53:27', '{\"EnqueueAt\":\"2023-06-08T20:53:28.4555800Z\",\"ScheduledAt\":\"2023-06-08T20:53:27.4555830Z\"}'),
(779, 137, 'Succeeded', NULL, '2023-06-08 20:53:28', '{\"SucceededAt\":\"2023-06-08T20:53:28.0634550Z\",\"PerformanceDuration\":\"1799\",\"Latency\":\"11264\"}'),
(780, 131, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 20:53:37', '{\"FailedAt\":\"2023-06-08T20:53:37.3328090Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c05::6c]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String message) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 50\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"4f9add05-d969-492a-81bd-4259821e6732\"}'),
(781, 131, 'Scheduled', 'Retry attempt 3 of 10: Failure sending mail.', '2023-06-08 20:53:37', '{\"EnqueueAt\":\"2023-06-08T20:55:20.3396520Z\",\"ScheduledAt\":\"2023-06-08T20:53:37.3396540Z\"}'),
(782, 136, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 20:53:39', '{\"FailedAt\":\"2023-06-08T20:53:39.2671210Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c05::6c]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String message) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 50\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"4f9add05-d969-492a-81bd-4259821e6732\"}'),
(783, 136, 'Scheduled', 'Retry attempt 2 of 10: Failure sending mail.', '2023-06-08 20:53:39', '{\"EnqueueAt\":\"2023-06-08T20:53:59.2740650Z\",\"ScheduledAt\":\"2023-06-08T20:53:39.2740650Z\"}'),
(784, 142, 'Scheduled', NULL, '2023-06-08 20:53:47', '{\"EnqueueAt\":\"2023-06-08T20:53:48.2802080Z\",\"ScheduledAt\":\"2023-06-08T20:53:47.2802110Z\"}'),
(785, 131, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 20:54:37', '{\"EnqueuedAt\":\"2023-06-08T20:54:37.2228030Z\",\"Queue\":\"default\"}'),
(786, 136, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 20:54:37', '{\"EnqueuedAt\":\"2023-06-08T20:54:37.2365400Z\",\"Queue\":\"default\"}'),
(787, 138, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 20:54:37', '{\"EnqueuedAt\":\"2023-06-08T20:54:37.2447000Z\",\"Queue\":\"default\"}'),
(788, 139, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 20:54:37', '{\"EnqueuedAt\":\"2023-06-08T20:54:37.2510230Z\",\"Queue\":\"default\"}'),
(789, 140, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 20:54:37', '{\"EnqueuedAt\":\"2023-06-08T20:54:37.2565160Z\",\"Queue\":\"default\"}'),
(790, 141, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 20:54:37', '{\"EnqueuedAt\":\"2023-06-08T20:54:37.2620140Z\",\"Queue\":\"default\"}'),
(791, 142, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 20:54:37', '{\"EnqueuedAt\":\"2023-06-08T20:54:37.2707180Z\",\"Queue\":\"default\"}'),
(792, 131, 'Processing', NULL, '2023-06-08 20:54:37', '{\"StartedAt\":\"2023-06-08T20:54:37.3689290Z\",\"ServerId\":\"4f9add05-d969-492a-81bd-4259821e6732\",\"WorkerId\":\"e86cb7bd-eac0-4adb-b49b-04cbfa929e57\"}'),
(793, 131, 'Succeeded', NULL, '2023-06-08 20:54:39', '{\"SucceededAt\":\"2023-06-08T20:54:39.1150640Z\",\"PerformanceDuration\":\"1740\",\"Latency\":\"460374\"}'),
(794, 136, 'Processing', NULL, '2023-06-08 20:54:39', '{\"StartedAt\":\"2023-06-08T20:54:39.1279650Z\",\"ServerId\":\"4f9add05-d969-492a-81bd-4259821e6732\",\"WorkerId\":\"e86cb7bd-eac0-4adb-b49b-04cbfa929e57\"}'),
(795, 138, 'Processing', NULL, '2023-06-08 20:54:39', '{\"StartedAt\":\"2023-06-08T20:54:39.3019540Z\",\"ServerId\":\"4f9add05-d969-492a-81bd-4259821e6732\",\"WorkerId\":\"d908a85e-1ecb-43ff-ac90-16fa7fdd348d\"}'),
(796, 136, 'Succeeded', NULL, '2023-06-08 20:54:41', '{\"SucceededAt\":\"2023-06-08T20:54:40.9256430Z\",\"PerformanceDuration\":\"1792\",\"Latency\":\"327132\"}'),
(797, 139, 'Processing', NULL, '2023-06-08 20:54:41', '{\"StartedAt\":\"2023-06-08T20:54:40.9389640Z\",\"ServerId\":\"4f9add05-d969-492a-81bd-4259821e6732\",\"WorkerId\":\"e86cb7bd-eac0-4adb-b49b-04cbfa929e57\"}'),
(798, 138, 'Succeeded', NULL, '2023-06-08 20:54:41', '{\"SucceededAt\":\"2023-06-08T20:54:41.1319910Z\",\"PerformanceDuration\":\"1823\",\"Latency\":\"79308\"}'),
(799, 140, 'Processing', NULL, '2023-06-08 20:54:41', '{\"StartedAt\":\"2023-06-08T20:54:41.1464820Z\",\"ServerId\":\"4f9add05-d969-492a-81bd-4259821e6732\",\"WorkerId\":\"d908a85e-1ecb-43ff-ac90-16fa7fdd348d\"}'),
(800, 141, 'Processing', NULL, '2023-06-08 20:54:41', '{\"StartedAt\":\"2023-06-08T20:54:41.2835210Z\",\"ServerId\":\"4f9add05-d969-492a-81bd-4259821e6732\",\"WorkerId\":\"309b16f3-7c12-4bcc-ad7a-1ac3556ba7fe\"}'),
(801, 142, 'Processing', NULL, '2023-06-08 20:54:42', '{\"StartedAt\":\"2023-06-08T20:54:41.5698620Z\",\"ServerId\":\"4f9add05-d969-492a-81bd-4259821e6732\",\"WorkerId\":\"c9cadf9d-ea3f-4df2-9625-4f6284cf5191\"}'),
(802, 139, 'Succeeded', NULL, '2023-06-08 20:54:43', '{\"SucceededAt\":\"2023-06-08T20:54:42.7859280Z\",\"PerformanceDuration\":\"1841\",\"Latency\":\"78944\"}'),
(803, 140, 'Succeeded', NULL, '2023-06-08 20:54:43', '{\"SucceededAt\":\"2023-06-08T20:54:43.0929080Z\",\"PerformanceDuration\":\"1941\",\"Latency\":\"75151\"}'),
(804, 142, 'Succeeded', NULL, '2023-06-08 20:54:44', '{\"SucceededAt\":\"2023-06-08T20:54:43.7128110Z\",\"PerformanceDuration\":\"2137\",\"Latency\":\"54575\"}'),
(805, 141, 'Succeeded', NULL, '2023-06-08 20:54:44', '{\"SucceededAt\":\"2023-06-08T20:54:44.3261830Z\",\"PerformanceDuration\":\"3034\",\"Latency\":\"74291\"}'),
(806, 143, 'Scheduled', NULL, '2023-06-08 21:07:00', '{\"EnqueueAt\":\"2023-06-08T21:07:00.9018040Z\",\"ScheduledAt\":\"2023-06-08T21:06:59.9018360Z\"}'),
(807, 144, 'Scheduled', NULL, '2023-06-08 21:07:03', '{\"EnqueueAt\":\"2023-06-08T21:07:03.5012740Z\",\"ScheduledAt\":\"2023-06-08T21:07:02.5012770Z\"}'),
(808, 145, 'Scheduled', NULL, '2023-06-08 21:07:05', '{\"EnqueueAt\":\"2023-06-08T21:07:05.9837690Z\",\"ScheduledAt\":\"2023-06-08T21:07:04.9837730Z\"}'),
(809, 146, 'Scheduled', NULL, '2023-06-08 21:07:07', '{\"EnqueueAt\":\"2023-06-08T21:07:07.5050010Z\",\"ScheduledAt\":\"2023-06-08T21:07:06.5050040Z\"}'),
(810, 147, 'Scheduled', NULL, '2023-06-08 21:07:08', '{\"EnqueueAt\":\"2023-06-08T21:07:08.7860470Z\",\"ScheduledAt\":\"2023-06-08T21:07:07.7860500Z\"}'),
(811, 143, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 21:07:20', '{\"EnqueuedAt\":\"2023-06-08T21:07:19.8036400Z\",\"Queue\":\"default\"}'),
(812, 144, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 21:07:20', '{\"EnqueuedAt\":\"2023-06-08T21:07:19.8649830Z\",\"Queue\":\"default\"}'),
(813, 145, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 21:07:20', '{\"EnqueuedAt\":\"2023-06-08T21:07:19.8711760Z\",\"Queue\":\"default\"}'),
(814, 146, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 21:07:20', '{\"EnqueuedAt\":\"2023-06-08T21:07:19.8765060Z\",\"Queue\":\"default\"}'),
(815, 147, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 21:07:20', '{\"EnqueuedAt\":\"2023-06-08T21:07:19.8807070Z\",\"Queue\":\"default\"}'),
(816, 144, 'Processing', NULL, '2023-06-08 21:07:35', '{\"StartedAt\":\"2023-06-08T21:07:34.8166890Z\",\"ServerId\":\"68cd21a9-1b61-41d2-ab0b-8661042b83da\",\"WorkerId\":\"2aa8b7f6-8e70-4e8e-87f1-4a77d9ce948c\"}'),
(817, 146, 'Processing', NULL, '2023-06-08 21:07:35', '{\"StartedAt\":\"2023-06-08T21:07:34.8167120Z\",\"ServerId\":\"68cd21a9-1b61-41d2-ab0b-8661042b83da\",\"WorkerId\":\"d2a74c02-3dd5-45a6-bdc6-125694d15b92\"}'),
(818, 147, 'Processing', NULL, '2023-06-08 21:07:35', '{\"StartedAt\":\"2023-06-08T21:07:34.8167270Z\",\"ServerId\":\"68cd21a9-1b61-41d2-ab0b-8661042b83da\",\"WorkerId\":\"6c66f74d-ba49-406a-97a4-8f1e3b83e421\"}'),
(819, 145, 'Processing', NULL, '2023-06-08 21:07:35', '{\"StartedAt\":\"2023-06-08T21:07:34.8166950Z\",\"ServerId\":\"68cd21a9-1b61-41d2-ab0b-8661042b83da\",\"WorkerId\":\"246f8ee0-7f70-450c-b881-495dfcf1c601\"}'),
(820, 143, 'Processing', NULL, '2023-06-08 21:07:35', '{\"StartedAt\":\"2023-06-08T21:07:34.8167200Z\",\"ServerId\":\"68cd21a9-1b61-41d2-ab0b-8661042b83da\",\"WorkerId\":\"3d462103-b9b1-4270-9d75-65555721397d\"}'),
(821, 145, 'Succeeded', NULL, '2023-06-08 21:07:37', '{\"SucceededAt\":\"2023-06-08T21:07:36.8514870Z\",\"PerformanceDuration\":\"2020\",\"Latency\":\"29830\"}'),
(822, 147, 'Succeeded', NULL, '2023-06-08 21:07:37', '{\"SucceededAt\":\"2023-06-08T21:07:36.9891630Z\",\"PerformanceDuration\":\"2158\",\"Latency\":\"26830\"}'),
(823, 143, 'Succeeded', NULL, '2023-06-08 21:07:37', '{\"SucceededAt\":\"2023-06-08T21:07:37.1874800Z\",\"PerformanceDuration\":\"2356\",\"Latency\":\"34830\"}'),
(824, 144, 'Succeeded', NULL, '2023-06-08 21:07:37', '{\"SucceededAt\":\"2023-06-08T21:07:37.4677610Z\",\"PerformanceDuration\":\"2636\",\"Latency\":\"31830\"}'),
(825, 148, 'Scheduled', NULL, '2023-06-08 21:07:51', '{\"EnqueueAt\":\"2023-06-08T21:07:52.0059910Z\",\"ScheduledAt\":\"2023-06-08T21:07:51.0059930Z\"}'),
(826, 148, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 21:08:07', '{\"EnqueuedAt\":\"2023-06-08T21:08:05.9862880Z\",\"Queue\":\"default\"}'),
(827, 148, 'Processing', NULL, '2023-06-08 21:08:10', '{\"StartedAt\":\"2023-06-08T21:08:10.0409400Z\",\"ServerId\":\"68cd21a9-1b61-41d2-ab0b-8661042b83da\",\"WorkerId\":\"246f8ee0-7f70-450c-b881-495dfcf1c601\"}'),
(828, 146, 'Failed', 'An exception occurred during performance of the job.', '2023-06-08 21:08:56', '{\"FailedAt\":\"2023-06-08T21:08:55.6417980Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c01::6d]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String message) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 50\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"68cd21a9-1b61-41d2-ab0b-8661042b83da\"}'),
(829, 146, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-08 21:08:56', '{\"EnqueueAt\":\"2023-06-08T21:09:11.6530710Z\",\"ScheduledAt\":\"2023-06-08T21:08:55.6530720Z\"}'),
(830, 148, 'Succeeded', NULL, '2023-06-08 21:08:57', '{\"SucceededAt\":\"2023-06-08T21:08:57.0984140Z\",\"PerformanceDuration\":\"47033\",\"Latency\":\"19063\"}'),
(831, 146, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 21:09:25', '{\"EnqueuedAt\":\"2023-06-08T21:09:25.4712230Z\",\"Queue\":\"default\"}'),
(832, 146, 'Processing', NULL, '2023-06-08 21:09:26', '{\"StartedAt\":\"2023-06-08T21:09:25.6875380Z\",\"ServerId\":\"68cd21a9-1b61-41d2-ab0b-8661042b83da\",\"WorkerId\":\"d2a74c02-3dd5-45a6-bdc6-125694d15b92\"}'),
(833, 146, 'Succeeded', NULL, '2023-06-08 21:09:28', '{\"SucceededAt\":\"2023-06-08T21:09:27.9580720Z\",\"PerformanceDuration\":\"2261\",\"Latency\":\"138696\"}'),
(834, 149, 'Scheduled', NULL, '2023-06-08 21:10:56', '{\"EnqueueAt\":\"2023-06-08T21:10:56.7049680Z\",\"ScheduledAt\":\"2023-06-08T21:10:55.7049700Z\"}'),
(835, 150, 'Scheduled', NULL, '2023-06-08 21:10:57', '{\"EnqueueAt\":\"2023-06-08T21:10:57.7328480Z\",\"ScheduledAt\":\"2023-06-08T21:10:56.7328500Z\"}'),
(836, 151, 'Scheduled', NULL, '2023-06-08 21:10:58', '{\"EnqueueAt\":\"2023-06-08T21:10:58.6860660Z\",\"ScheduledAt\":\"2023-06-08T21:10:57.6860690Z\"}'),
(837, 152, 'Scheduled', NULL, '2023-06-08 21:10:59', '{\"EnqueueAt\":\"2023-06-08T21:10:59.6398210Z\",\"ScheduledAt\":\"2023-06-08T21:10:58.6398240Z\"}'),
(838, 153, 'Scheduled', NULL, '2023-06-08 21:11:00', '{\"EnqueueAt\":\"2023-06-08T21:11:01.1111150Z\",\"ScheduledAt\":\"2023-06-08T21:11:00.1111180Z\"}'),
(839, 154, 'Scheduled', NULL, '2023-06-08 21:11:06', '{\"EnqueueAt\":\"2023-06-08T21:11:07.2078000Z\",\"ScheduledAt\":\"2023-06-08T21:11:06.2078020Z\"}'),
(840, 149, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 21:11:41', '{\"EnqueuedAt\":\"2023-06-08T21:11:40.5331360Z\",\"Queue\":\"default\"}'),
(841, 150, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 21:11:41', '{\"EnqueuedAt\":\"2023-06-08T21:11:40.5412400Z\",\"Queue\":\"default\"}'),
(842, 151, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 21:11:41', '{\"EnqueuedAt\":\"2023-06-08T21:11:40.5491100Z\",\"Queue\":\"default\"}'),
(843, 152, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 21:11:41', '{\"EnqueuedAt\":\"2023-06-08T21:11:40.5548270Z\",\"Queue\":\"default\"}'),
(844, 153, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 21:11:41', '{\"EnqueuedAt\":\"2023-06-08T21:11:40.5600250Z\",\"Queue\":\"default\"}'),
(845, 154, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-08 21:11:41', '{\"EnqueuedAt\":\"2023-06-08T21:11:40.5649510Z\",\"Queue\":\"default\"}'),
(846, 149, 'Processing', NULL, '2023-06-08 21:11:42', '{\"StartedAt\":\"2023-06-08T21:11:42.1868700Z\",\"ServerId\":\"68cd21a9-1b61-41d2-ab0b-8661042b83da\",\"WorkerId\":\"246f8ee0-7f70-450c-b881-495dfcf1c601\"}'),
(847, 150, 'Processing', NULL, '2023-06-08 21:11:43', '{\"StartedAt\":\"2023-06-08T21:11:43.0589430Z\",\"ServerId\":\"68cd21a9-1b61-41d2-ab0b-8661042b83da\",\"WorkerId\":\"d2a74c02-3dd5-45a6-bdc6-125694d15b92\"}'),
(848, 149, 'Succeeded', NULL, '2023-06-08 21:11:44', '{\"SucceededAt\":\"2023-06-08T21:11:44.2507370Z\",\"PerformanceDuration\":\"2057\",\"Latency\":\"46193\"}'),
(849, 151, 'Processing', NULL, '2023-06-08 21:11:44', '{\"StartedAt\":\"2023-06-08T21:11:44.2683740Z\",\"ServerId\":\"68cd21a9-1b61-41d2-ab0b-8661042b83da\",\"WorkerId\":\"246f8ee0-7f70-450c-b881-495dfcf1c601\"}'),
(850, 150, 'Succeeded', NULL, '2023-06-08 21:11:45', '{\"SucceededAt\":\"2023-06-08T21:11:45.3373240Z\",\"PerformanceDuration\":\"2272\",\"Latency\":\"46065\"}'),
(851, 152, 'Processing', NULL, '2023-06-08 21:11:45', '{\"StartedAt\":\"2023-06-08T21:11:45.3569970Z\",\"ServerId\":\"68cd21a9-1b61-41d2-ab0b-8661042b83da\",\"WorkerId\":\"d2a74c02-3dd5-45a6-bdc6-125694d15b92\"}'),
(852, 151, 'Succeeded', NULL, '2023-06-08 21:11:46', '{\"SucceededAt\":\"2023-06-08T21:11:45.8545990Z\",\"PerformanceDuration\":\"1580\",\"Latency\":\"46273\"}'),
(853, 153, 'Processing', NULL, '2023-06-08 21:11:46', '{\"StartedAt\":\"2023-06-08T21:11:45.8702450Z\",\"ServerId\":\"68cd21a9-1b61-41d2-ab0b-8661042b83da\",\"WorkerId\":\"246f8ee0-7f70-450c-b881-495dfcf1c601\"}'),
(854, 152, 'Succeeded', NULL, '2023-06-08 21:11:47', '{\"SucceededAt\":\"2023-06-08T21:11:47.2318040Z\",\"PerformanceDuration\":\"1869\",\"Latency\":\"46362\"}'),
(855, 154, 'Processing', NULL, '2023-06-08 21:11:47', '{\"StartedAt\":\"2023-06-08T21:11:47.2484260Z\",\"ServerId\":\"68cd21a9-1b61-41d2-ab0b-8661042b83da\",\"WorkerId\":\"d2a74c02-3dd5-45a6-bdc6-125694d15b92\"}'),
(856, 153, 'Succeeded', NULL, '2023-06-08 21:11:48', '{\"SucceededAt\":\"2023-06-08T21:11:47.7492710Z\",\"PerformanceDuration\":\"1874\",\"Latency\":\"45875\"}'),
(857, 154, 'Succeeded', NULL, '2023-06-08 21:11:49', '{\"SucceededAt\":\"2023-06-08T21:11:49.0656850Z\",\"PerformanceDuration\":\"1811\",\"Latency\":\"41253\"}'),
(858, 155, 'Scheduled', NULL, '2023-06-09 07:13:38', '{\"EnqueueAt\":\"2023-06-09T07:13:38.8537380Z\",\"ScheduledAt\":\"2023-06-09T07:13:37.8537850Z\"}'),
(859, 155, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:13:38', '{\"EnqueuedAt\":\"2023-06-09T07:13:38.3194820Z\",\"Queue\":\"default\"}'),
(860, 156, 'Scheduled', NULL, '2023-06-09 07:13:42', '{\"EnqueueAt\":\"2023-06-09T07:13:43.1236170Z\",\"ScheduledAt\":\"2023-06-09T07:13:42.1236210Z\"}'),
(861, 157, 'Scheduled', NULL, '2023-06-09 07:13:45', '{\"EnqueueAt\":\"2023-06-09T07:13:46.3024740Z\",\"ScheduledAt\":\"2023-06-09T07:13:45.3024780Z\"}'),
(862, 155, 'Processing', NULL, '2023-06-09 07:13:52', '{\"StartedAt\":\"2023-06-09T07:13:52.2008790Z\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\",\"WorkerId\":\"cda8a7d1-144c-41d1-8085-92cc9eebe069\"}'),
(863, 156, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:13:53', '{\"EnqueuedAt\":\"2023-06-09T07:13:53.3925160Z\",\"Queue\":\"default\"}'),
(864, 157, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:13:53', '{\"EnqueuedAt\":\"2023-06-09T07:13:53.4018220Z\",\"Queue\":\"default\"}'),
(865, 155, 'Succeeded', NULL, '2023-06-09 07:13:55', '{\"SucceededAt\":\"2023-06-09T07:13:55.3325190Z\",\"PerformanceDuration\":\"3125\",\"Latency\":\"14206\"}'),
(866, 156, 'Processing', NULL, '2023-06-09 07:13:55', '{\"StartedAt\":\"2023-06-09T07:13:55.3533350Z\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\",\"WorkerId\":\"cda8a7d1-144c-41d1-8085-92cc9eebe069\"}'),
(867, 156, 'Succeeded', NULL, '2023-06-09 07:13:57', '{\"SucceededAt\":\"2023-06-09T07:13:57.1752080Z\",\"PerformanceDuration\":\"1817\",\"Latency\":\"13358\"}'),
(868, 157, 'Processing', NULL, '2023-06-09 07:13:57', '{\"StartedAt\":\"2023-06-09T07:13:57.1911700Z\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\",\"WorkerId\":\"cda8a7d1-144c-41d1-8085-92cc9eebe069\"}'),
(869, 157, 'Succeeded', NULL, '2023-06-09 07:13:59', '{\"SucceededAt\":\"2023-06-09T07:13:59.1244180Z\",\"PerformanceDuration\":\"1929\",\"Latency\":\"12194\"}'),
(870, 158, 'Scheduled', NULL, '2023-06-09 07:18:43', '{\"EnqueueAt\":\"2023-06-09T07:18:43.9744700Z\",\"ScheduledAt\":\"2023-06-09T07:18:42.9744720Z\"}'),
(871, 159, 'Scheduled', NULL, '2023-06-09 07:18:45', '{\"EnqueueAt\":\"2023-06-09T07:18:46.0861390Z\",\"ScheduledAt\":\"2023-06-09T07:18:45.0861410Z\"}'),
(872, 160, 'Scheduled', NULL, '2023-06-09 07:18:47', '{\"EnqueueAt\":\"2023-06-09T07:18:47.6638830Z\",\"ScheduledAt\":\"2023-06-09T07:18:46.6638840Z\"}'),
(873, 161, 'Scheduled', NULL, '2023-06-09 07:18:48', '{\"EnqueueAt\":\"2023-06-09T07:18:48.7946860Z\",\"ScheduledAt\":\"2023-06-09T07:18:47.7946880Z\"}'),
(874, 162, 'Scheduled', NULL, '2023-06-09 07:18:49', '{\"EnqueueAt\":\"2023-06-09T07:18:50.0528310Z\",\"ScheduledAt\":\"2023-06-09T07:18:49.0528320Z\"}'),
(875, 163, 'Scheduled', NULL, '2023-06-09 07:18:50', '{\"EnqueueAt\":\"2023-06-09T07:18:51.1821800Z\",\"ScheduledAt\":\"2023-06-09T07:18:50.1821810Z\"}'),
(876, 164, 'Scheduled', NULL, '2023-06-09 07:18:51', '{\"EnqueueAt\":\"2023-06-09T07:18:52.0244980Z\",\"ScheduledAt\":\"2023-06-09T07:18:51.0245000Z\"}'),
(877, 165, 'Scheduled', NULL, '2023-06-09 07:18:52', '{\"EnqueueAt\":\"2023-06-09T07:18:52.8937660Z\",\"ScheduledAt\":\"2023-06-09T07:18:51.8937670Z\"}'),
(878, 166, 'Scheduled', NULL, '2023-06-09 07:18:53', '{\"EnqueueAt\":\"2023-06-09T07:18:53.8564280Z\",\"ScheduledAt\":\"2023-06-09T07:18:52.8564290Z\"}'),
(879, 167, 'Scheduled', NULL, '2023-06-09 07:18:54', '{\"EnqueueAt\":\"2023-06-09T07:18:54.9155150Z\",\"ScheduledAt\":\"2023-06-09T07:18:53.9155170Z\"}'),
(880, 168, 'Scheduled', NULL, '2023-06-09 07:18:55', '{\"EnqueueAt\":\"2023-06-09T07:18:56.0669740Z\",\"ScheduledAt\":\"2023-06-09T07:18:55.0669750Z\"}'),
(881, 169, 'Scheduled', NULL, '2023-06-09 07:18:56', '{\"EnqueueAt\":\"2023-06-09T07:18:57.1643930Z\",\"ScheduledAt\":\"2023-06-09T07:18:56.1643950Z\"}'),
(882, 158, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:19:43', '{\"EnqueuedAt\":\"2023-06-09T07:19:42.6440850Z\",\"Queue\":\"default\"}'),
(883, 159, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:19:43', '{\"EnqueuedAt\":\"2023-06-09T07:19:42.6525850Z\",\"Queue\":\"default\"}'),
(884, 160, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:19:43', '{\"EnqueuedAt\":\"2023-06-09T07:19:42.6589750Z\",\"Queue\":\"default\"}'),
(885, 161, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:19:43', '{\"EnqueuedAt\":\"2023-06-09T07:19:42.6650660Z\",\"Queue\":\"default\"}'),
(886, 162, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:19:43', '{\"EnqueuedAt\":\"2023-06-09T07:19:42.6701420Z\",\"Queue\":\"default\"}'),
(887, 163, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:19:43', '{\"EnqueuedAt\":\"2023-06-09T07:19:42.6761390Z\",\"Queue\":\"default\"}'),
(888, 164, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:19:43', '{\"EnqueuedAt\":\"2023-06-09T07:19:42.6805320Z\",\"Queue\":\"default\"}'),
(889, 165, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:19:43', '{\"EnqueuedAt\":\"2023-06-09T07:19:42.6851480Z\",\"Queue\":\"default\"}'),
(890, 166, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:19:43', '{\"EnqueuedAt\":\"2023-06-09T07:19:42.6893460Z\",\"Queue\":\"default\"}'),
(891, 167, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:19:43', '{\"EnqueuedAt\":\"2023-06-09T07:19:42.6927480Z\",\"Queue\":\"default\"}'),
(892, 168, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:19:43', '{\"EnqueuedAt\":\"2023-06-09T07:19:42.6962250Z\",\"Queue\":\"default\"}'),
(893, 169, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:19:43', '{\"EnqueuedAt\":\"2023-06-09T07:19:42.6995830Z\",\"Queue\":\"default\"}'),
(894, 158, 'Processing', NULL, '2023-06-09 07:19:48', '{\"StartedAt\":\"2023-06-09T07:19:48.2428120Z\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\",\"WorkerId\":\"cda8a7d1-144c-41d1-8085-92cc9eebe069\"}'),
(895, 158, 'Succeeded', NULL, '2023-06-09 07:19:51', '{\"SucceededAt\":\"2023-06-09T07:19:50.9316450Z\",\"PerformanceDuration\":\"2680\",\"Latency\":\"65250\"}'),
(896, 159, 'Processing', NULL, '2023-06-09 07:19:51', '{\"StartedAt\":\"2023-06-09T07:19:50.9475260Z\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\",\"WorkerId\":\"cda8a7d1-144c-41d1-8085-92cc9eebe069\"}'),
(897, 160, 'Processing', NULL, '2023-06-09 07:19:56', '{\"StartedAt\":\"2023-06-09T07:19:56.3104850Z\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\",\"WorkerId\":\"241c92e7-0ebf-43ab-9920-bc72b4291a94\"}'),
(898, 161, 'Processing', NULL, '2023-06-09 07:19:56', '{\"StartedAt\":\"2023-06-09T07:19:56.3105850Z\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\",\"WorkerId\":\"a333fa78-7e7f-4c35-a671-aacef86e13bd\"}'),
(899, 162, 'Processing', NULL, '2023-06-09 07:19:57', '{\"StartedAt\":\"2023-06-09T07:19:56.8477540Z\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\",\"WorkerId\":\"e7feb690-0086-44a8-ad1b-0228b8b2b3fb\"}'),
(900, 163, 'Processing', NULL, '2023-06-09 07:19:57', '{\"StartedAt\":\"2023-06-09T07:19:56.8477540Z\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\",\"WorkerId\":\"2a5829a0-da02-4ccd-a6bd-0d47a0af17b6\"}'),
(901, 164, 'Processing', NULL, '2023-06-09 07:19:57', '{\"StartedAt\":\"2023-06-09T07:19:56.8563130Z\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\",\"WorkerId\":\"919f7416-2f16-47d3-bf8b-44744c649777\"}'),
(902, 165, 'Processing', NULL, '2023-06-09 07:19:57', '{\"StartedAt\":\"2023-06-09T07:19:56.8633760Z\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\",\"WorkerId\":\"6fac6e2d-0dbd-4b7f-9589-ca88f13950f6\"}'),
(903, 167, 'Processing', NULL, '2023-06-09 07:19:57', '{\"StartedAt\":\"2023-06-09T07:19:56.8711910Z\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\",\"WorkerId\":\"c2ebcbf6-136c-4f07-b72f-be6839f6477f\"}'),
(904, 169, 'Processing', NULL, '2023-06-09 07:19:57', '{\"StartedAt\":\"2023-06-09T07:19:56.8721930Z\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\",\"WorkerId\":\"8195112f-04b1-43b2-bf9d-868a2dd1de34\"}'),
(905, 168, 'Processing', NULL, '2023-06-09 07:19:57', '{\"StartedAt\":\"2023-06-09T07:19:56.8717200Z\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\",\"WorkerId\":\"4fc14fd1-10eb-49d1-8532-4a997966f218\"}'),
(906, 166, 'Processing', NULL, '2023-06-09 07:19:57', '{\"StartedAt\":\"2023-06-09T07:19:56.8664800Z\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\",\"WorkerId\":\"35f5ff26-b53a-43ac-ac58-329f822a5f53\"}'),
(907, 163, 'Succeeded', NULL, '2023-06-09 07:19:59', '{\"SucceededAt\":\"2023-06-09T07:19:58.6006630Z\",\"PerformanceDuration\":\"1747\",\"Latency\":\"66852\"}'),
(908, 169, 'Succeeded', NULL, '2023-06-09 07:19:59', '{\"SucceededAt\":\"2023-06-09T07:19:58.9003150Z\",\"PerformanceDuration\":\"2019\",\"Latency\":\"60880\"}'),
(909, 166, 'Succeeded', NULL, '2023-06-09 07:19:59', '{\"SucceededAt\":\"2023-06-09T07:19:59.1328670Z\",\"PerformanceDuration\":\"2236\",\"Latency\":\"63896\"}'),
(910, 168, 'Succeeded', NULL, '2023-06-09 07:20:00', '{\"SucceededAt\":\"2023-06-09T07:19:59.5423400Z\",\"PerformanceDuration\":\"2661\",\"Latency\":\"61880\"}'),
(911, 162, 'Succeeded', NULL, '2023-06-09 07:20:01', '{\"SucceededAt\":\"2023-06-09T07:20:00.5432880Z\",\"PerformanceDuration\":\"3690\",\"Latency\":\"67852\"}'),
(912, 170, 'Scheduled', NULL, '2023-06-09 07:20:11', '{\"EnqueueAt\":\"2023-06-09T07:20:11.6598980Z\",\"ScheduledAt\":\"2023-06-09T07:20:10.6599000Z\"}'),
(913, 171, 'Scheduled', NULL, '2023-06-09 07:20:12', '{\"EnqueueAt\":\"2023-06-09T07:20:12.5233720Z\",\"ScheduledAt\":\"2023-06-09T07:20:11.5233730Z\"}'),
(914, 172, 'Scheduled', NULL, '2023-06-09 07:20:12', '{\"EnqueueAt\":\"2023-06-09T07:20:13.3065320Z\",\"ScheduledAt\":\"2023-06-09T07:20:12.3065330Z\"}'),
(915, 170, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:20:13', '{\"EnqueuedAt\":\"2023-06-09T07:20:12.8504970Z\",\"Queue\":\"default\"}'),
(916, 171, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:20:13', '{\"EnqueuedAt\":\"2023-06-09T07:20:12.8588940Z\",\"Queue\":\"default\"}'),
(917, 172, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:20:13', '{\"EnqueuedAt\":\"2023-06-09T07:20:12.8658100Z\",\"Queue\":\"default\"}'),
(918, 170, 'Processing', NULL, '2023-06-09 07:20:14', '{\"StartedAt\":\"2023-06-09T07:20:13.6235410Z\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\",\"WorkerId\":\"2a5829a0-da02-4ccd-a6bd-0d47a0af17b6\"}');
INSERT INTO `Hangfire_State` (`Id`, `JobId`, `Name`, `Reason`, `CreatedAt`, `Data`) VALUES
(919, 171, 'Processing', NULL, '2023-06-09 07:20:14', '{\"StartedAt\":\"2023-06-09T07:20:13.9217940Z\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\",\"WorkerId\":\"8195112f-04b1-43b2-bf9d-868a2dd1de34\"}'),
(920, 172, 'Processing', NULL, '2023-06-09 07:20:14', '{\"StartedAt\":\"2023-06-09T07:20:14.1516160Z\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\",\"WorkerId\":\"35f5ff26-b53a-43ac-ac58-329f822a5f53\"}'),
(921, 171, 'Succeeded', NULL, '2023-06-09 07:20:16', '{\"SucceededAt\":\"2023-06-09T07:20:16.2759880Z\",\"PerformanceDuration\":\"2349\",\"Latency\":\"1926\"}'),
(922, 172, 'Succeeded', NULL, '2023-06-09 07:20:16', '{\"SucceededAt\":\"2023-06-09T07:20:16.4383230Z\",\"PerformanceDuration\":\"2281\",\"Latency\":\"2157\"}'),
(923, 170, 'Succeeded', NULL, '2023-06-09 07:20:17', '{\"SucceededAt\":\"2023-06-09T07:20:17.1259010Z\",\"PerformanceDuration\":\"3496\",\"Latency\":\"2629\"}'),
(924, 173, 'Scheduled', NULL, '2023-06-09 07:20:18', '{\"EnqueueAt\":\"2023-06-09T07:20:19.2998520Z\",\"ScheduledAt\":\"2023-06-09T07:20:18.2998530Z\"}'),
(925, 174, 'Scheduled', NULL, '2023-06-09 07:20:24', '{\"EnqueueAt\":\"2023-06-09T07:20:24.5137760Z\",\"ScheduledAt\":\"2023-06-09T07:20:23.5137780Z\"}'),
(926, 175, 'Scheduled', NULL, '2023-06-09 07:20:27', '{\"EnqueueAt\":\"2023-06-09T07:20:28.0748400Z\",\"ScheduledAt\":\"2023-06-09T07:20:27.0748410Z\"}'),
(927, 173, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:20:28', '{\"EnqueuedAt\":\"2023-06-09T07:20:27.8804520Z\",\"Queue\":\"default\"}'),
(928, 174, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:20:28', '{\"EnqueuedAt\":\"2023-06-09T07:20:27.8895900Z\",\"Queue\":\"default\"}'),
(929, 175, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:20:28', '{\"EnqueuedAt\":\"2023-06-09T07:20:27.8980280Z\",\"Queue\":\"default\"}'),
(930, 173, 'Processing', NULL, '2023-06-09 07:20:30', '{\"StartedAt\":\"2023-06-09T07:20:29.5688310Z\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\",\"WorkerId\":\"4fc14fd1-10eb-49d1-8532-4a997966f218\"}'),
(931, 174, 'Processing', NULL, '2023-06-09 07:20:31', '{\"StartedAt\":\"2023-06-09T07:20:30.6324270Z\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\",\"WorkerId\":\"e7feb690-0086-44a8-ad1b-0228b8b2b3fb\"}'),
(932, 175, 'Processing', NULL, '2023-06-09 07:20:31', '{\"StartedAt\":\"2023-06-09T07:20:31.3008150Z\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\",\"WorkerId\":\"8195112f-04b1-43b2-bf9d-868a2dd1de34\"}'),
(933, 159, 'Failed', 'An exception occurred during performance of the job.', '2023-06-09 07:21:06', '{\"FailedAt\":\"2023-06-09T07:21:05.9970130Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c0f::6d]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String message) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 50\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\"}'),
(934, 159, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-09 07:21:06', '{\"EnqueueAt\":\"2023-06-09T07:21:21.0046390Z\",\"ScheduledAt\":\"2023-06-09T07:21:06.0046400Z\"}'),
(935, 160, 'Failed', 'An exception occurred during performance of the job.', '2023-06-09 07:21:11', '{\"FailedAt\":\"2023-06-09T07:21:11.3678030Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c0f::6d]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String message) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 50\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\"}'),
(936, 161, 'Failed', 'An exception occurred during performance of the job.', '2023-06-09 07:21:11', '{\"FailedAt\":\"2023-06-09T07:21:11.3677900Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c0f::6d]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String message) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 50\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\"}'),
(937, 160, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-09 07:21:11', '{\"EnqueueAt\":\"2023-06-09T07:21:41.3718840Z\",\"ScheduledAt\":\"2023-06-09T07:21:11.3718850Z\"}'),
(938, 161, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-09 07:21:11', '{\"EnqueueAt\":\"2023-06-09T07:21:29.3718950Z\",\"ScheduledAt\":\"2023-06-09T07:21:11.3718950Z\"}'),
(939, 165, 'Failed', 'An exception occurred during performance of the job.', '2023-06-09 07:21:12', '{\"FailedAt\":\"2023-06-09T07:21:11.9101500Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c0f::6d]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String message) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 50\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\"}'),
(940, 164, 'Failed', 'An exception occurred during performance of the job.', '2023-06-09 07:21:12', '{\"FailedAt\":\"2023-06-09T07:21:11.9101750Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c0f::6d]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String message) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 50\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\"}'),
(941, 167, 'Failed', 'An exception occurred during performance of the job.', '2023-06-09 07:21:12', '{\"FailedAt\":\"2023-06-09T07:21:11.9107090Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c0f::6d]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String message) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 50\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\"}'),
(942, 165, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-09 07:21:12', '{\"EnqueueAt\":\"2023-06-09T07:21:29.9143160Z\",\"ScheduledAt\":\"2023-06-09T07:21:11.9143160Z\"}'),
(943, 164, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-09 07:21:12', '{\"EnqueueAt\":\"2023-06-09T07:21:39.9142800Z\",\"ScheduledAt\":\"2023-06-09T07:21:11.9142800Z\"}'),
(944, 167, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-09 07:21:12', '{\"EnqueueAt\":\"2023-06-09T07:21:48.9142230Z\",\"ScheduledAt\":\"2023-06-09T07:21:11.9142240Z\"}'),
(945, 159, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:21:48', '{\"EnqueuedAt\":\"2023-06-09T07:21:48.1756560Z\",\"Queue\":\"default\"}'),
(946, 173, 'Failed', 'An exception occurred during performance of the job.', '2023-06-09 07:21:48', '{\"FailedAt\":\"2023-06-09T07:21:48.1759990Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c0f::6d]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String message) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 50\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\"}'),
(947, 175, 'Failed', 'An exception occurred during performance of the job.', '2023-06-09 07:21:48', '{\"FailedAt\":\"2023-06-09T07:21:48.2019580Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c0f::6d]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String message) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 50\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\"}'),
(948, 173, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-09 07:21:48', '{\"EnqueueAt\":\"2023-06-09T07:22:15.2807900Z\",\"ScheduledAt\":\"2023-06-09T07:21:48.2807910Z\"}'),
(949, 175, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-09 07:21:48', '{\"EnqueueAt\":\"2023-06-09T07:22:31.3327070Z\",\"ScheduledAt\":\"2023-06-09T07:21:48.3327080Z\"}'),
(950, 174, 'Failed', 'An exception occurred during performance of the job.', '2023-06-09 07:21:48', '{\"FailedAt\":\"2023-06-09T07:21:48.2019600Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c0f::6d]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String message) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 50\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\"}'),
(951, 174, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-09 07:21:48', '{\"EnqueueAt\":\"2023-06-09T07:22:32.3330140Z\",\"ScheduledAt\":\"2023-06-09T07:21:48.3330140Z\"}'),
(952, 159, 'Processing', NULL, '2023-06-09 07:21:48', '{\"StartedAt\":\"2023-06-09T07:21:48.3869110Z\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\",\"WorkerId\":\"c2ebcbf6-136c-4f07-b72f-be6839f6477f\"}'),
(953, 160, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:21:48', '{\"EnqueuedAt\":\"2023-06-09T07:21:48.3870040Z\",\"Queue\":\"default\"}'),
(954, 160, 'Processing', NULL, '2023-06-09 07:21:49', '{\"StartedAt\":\"2023-06-09T07:21:48.5065060Z\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\",\"WorkerId\":\"4fc14fd1-10eb-49d1-8532-4a997966f218\"}'),
(955, 161, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:21:49', '{\"EnqueuedAt\":\"2023-06-09T07:21:48.5076020Z\",\"Queue\":\"default\"}'),
(956, 164, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:21:49', '{\"EnqueuedAt\":\"2023-06-09T07:21:48.7359880Z\",\"Queue\":\"default\"}'),
(957, 165, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:21:49', '{\"EnqueuedAt\":\"2023-06-09T07:21:49.1100970Z\",\"Queue\":\"default\"}'),
(958, 167, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:21:49', '{\"EnqueuedAt\":\"2023-06-09T07:21:49.3222790Z\",\"Queue\":\"default\"}'),
(959, 173, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:21:49', '{\"EnqueuedAt\":\"2023-06-09T07:21:49.3306190Z\",\"Queue\":\"default\"}'),
(960, 174, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:21:49', '{\"EnqueuedAt\":\"2023-06-09T07:21:49.3362000Z\",\"Queue\":\"default\"}'),
(961, 175, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:21:49', '{\"EnqueuedAt\":\"2023-06-09T07:21:49.3402110Z\",\"Queue\":\"default\"}'),
(962, 160, 'Succeeded', NULL, '2023-06-09 07:21:51', '{\"SucceededAt\":\"2023-06-09T07:21:50.7791310Z\",\"PerformanceDuration\":\"2120\",\"Latency\":\"181658\"}'),
(963, 161, 'Processing', NULL, '2023-06-09 07:21:51', '{\"StartedAt\":\"2023-06-09T07:21:50.7947360Z\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\",\"WorkerId\":\"4fc14fd1-10eb-49d1-8532-4a997966f218\"}'),
(964, 161, 'Succeeded', NULL, '2023-06-09 07:21:53', '{\"SucceededAt\":\"2023-06-09T07:21:52.6440250Z\",\"PerformanceDuration\":\"1844\",\"Latency\":\"182799\"}'),
(965, 164, 'Processing', NULL, '2023-06-09 07:21:53', '{\"StartedAt\":\"2023-06-09T07:21:52.6548700Z\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\",\"WorkerId\":\"4fc14fd1-10eb-49d1-8532-4a997966f218\"}'),
(966, 164, 'Succeeded', NULL, '2023-06-09 07:21:54', '{\"SucceededAt\":\"2023-06-09T07:21:54.4806230Z\",\"PerformanceDuration\":\"1822\",\"Latency\":\"181658\"}'),
(967, 165, 'Processing', NULL, '2023-06-09 07:21:54', '{\"StartedAt\":\"2023-06-09T07:21:54.4940390Z\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\",\"WorkerId\":\"4fc14fd1-10eb-49d1-8532-4a997966f218\"}'),
(968, 167, 'Processing', NULL, '2023-06-09 07:22:03', '{\"StartedAt\":\"2023-06-09T07:22:02.7076030Z\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\",\"WorkerId\":\"35f5ff26-b53a-43ac-ac58-329f822a5f53\"}'),
(969, 173, 'Processing', NULL, '2023-06-09 07:22:03', '{\"StartedAt\":\"2023-06-09T07:22:02.7079390Z\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\",\"WorkerId\":\"73d564a1-915e-4fec-b5a7-9b1da3670fa2\"}'),
(970, 174, 'Processing', NULL, '2023-06-09 07:22:03', '{\"StartedAt\":\"2023-06-09T07:22:03.1811350Z\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\",\"WorkerId\":\"6fac6e2d-0dbd-4b7f-9589-ca88f13950f6\"}'),
(971, 175, 'Processing', NULL, '2023-06-09 07:22:03', '{\"StartedAt\":\"2023-06-09T07:22:03.1818120Z\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\",\"WorkerId\":\"241c92e7-0ebf-43ab-9920-bc72b4291a94\"}'),
(972, 175, 'Succeeded', NULL, '2023-06-09 07:22:05', '{\"SucceededAt\":\"2023-06-09T07:22:05.1033890Z\",\"PerformanceDuration\":\"1913\",\"Latency\":\"96190\"}'),
(973, 174, 'Succeeded', NULL, '2023-06-09 07:22:05', '{\"SucceededAt\":\"2023-06-09T07:22:05.4068480Z\",\"PerformanceDuration\":\"2217\",\"Latency\":\"99189\"}'),
(974, 159, 'Failed', 'An exception occurred during performance of the job.', '2023-06-09 07:23:04', '{\"FailedAt\":\"2023-06-09T07:23:03.6028960Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c0f::6d]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String message) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 50\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\"}'),
(975, 159, 'Scheduled', 'Retry attempt 2 of 10: Failure sending mail.', '2023-06-09 07:23:04', '{\"EnqueueAt\":\"2023-06-09T07:23:25.6123270Z\",\"ScheduledAt\":\"2023-06-09T07:23:03.6123300Z\"}'),
(976, 165, 'Failed', 'An exception occurred during performance of the job.', '2023-06-09 07:23:11', '{\"FailedAt\":\"2023-06-09T07:23:09.8066390Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c0f::6d]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String message) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 50\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"56be43dd-f707-4ed0-859d-516868804116\"}'),
(977, 165, 'Scheduled', 'Retry attempt 2 of 10: Failure sending mail.', '2023-06-09 07:23:11', '{\"EnqueueAt\":\"2023-06-09T07:24:10.3943190Z\",\"ScheduledAt\":\"2023-06-09T07:23:10.3943190Z\"}'),
(978, 176, 'Scheduled', NULL, '2023-06-09 07:24:45', '{\"EnqueueAt\":\"2023-06-09T07:24:45.9832510Z\",\"ScheduledAt\":\"2023-06-09T07:24:44.9832700Z\"}'),
(979, 177, 'Scheduled', NULL, '2023-06-09 07:24:46', '{\"EnqueueAt\":\"2023-06-09T07:24:47.3686030Z\",\"ScheduledAt\":\"2023-06-09T07:24:46.3686050Z\"}'),
(980, 178, 'Scheduled', NULL, '2023-06-09 07:24:48', '{\"EnqueueAt\":\"2023-06-09T07:24:48.5151080Z\",\"ScheduledAt\":\"2023-06-09T07:24:47.5151100Z\"}'),
(981, 179, 'Scheduled', NULL, '2023-06-09 07:24:49', '{\"EnqueueAt\":\"2023-06-09T07:24:49.6864050Z\",\"ScheduledAt\":\"2023-06-09T07:24:48.6864060Z\"}'),
(982, 180, 'Scheduled', NULL, '2023-06-09 07:24:50', '{\"EnqueueAt\":\"2023-06-09T07:24:50.5709040Z\",\"ScheduledAt\":\"2023-06-09T07:24:49.5709050Z\"}'),
(983, 181, 'Scheduled', NULL, '2023-06-09 07:24:51', '{\"EnqueueAt\":\"2023-06-09T07:24:51.7673900Z\",\"ScheduledAt\":\"2023-06-09T07:24:50.7673960Z\"}'),
(984, 182, 'Scheduled', NULL, '2023-06-09 07:24:52', '{\"EnqueueAt\":\"2023-06-09T07:24:52.7724330Z\",\"ScheduledAt\":\"2023-06-09T07:24:51.7724340Z\"}'),
(985, 183, 'Scheduled', NULL, '2023-06-09 07:24:53', '{\"EnqueueAt\":\"2023-06-09T07:24:54.3177680Z\",\"ScheduledAt\":\"2023-06-09T07:24:53.3177690Z\"}'),
(986, 184, 'Scheduled', NULL, '2023-06-09 07:24:54', '{\"EnqueueAt\":\"2023-06-09T07:24:55.4473180Z\",\"ScheduledAt\":\"2023-06-09T07:24:54.4473180Z\"}'),
(987, 159, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:25:14', '{\"EnqueuedAt\":\"2023-06-09T07:25:14.0379230Z\",\"Queue\":\"default\"}'),
(988, 165, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:25:14', '{\"EnqueuedAt\":\"2023-06-09T07:25:14.1036070Z\",\"Queue\":\"default\"}'),
(989, 176, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:25:14', '{\"EnqueuedAt\":\"2023-06-09T07:25:14.1102900Z\",\"Queue\":\"default\"}'),
(990, 177, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:25:14', '{\"EnqueuedAt\":\"2023-06-09T07:25:14.1144140Z\",\"Queue\":\"default\"}'),
(991, 165, 'Processing', NULL, '2023-06-09 07:25:23', '{\"StartedAt\":\"2023-06-09T07:25:22.7269220Z\",\"ServerId\":\"f6e3cd13-acf9-44c3-8b72-58f7a02c6ffa\",\"WorkerId\":\"8cc3e695-624c-475a-829d-60ab481bd75f\"}'),
(992, 177, 'Processing', NULL, '2023-06-09 07:25:23', '{\"StartedAt\":\"2023-06-09T07:25:22.7265110Z\",\"ServerId\":\"f6e3cd13-acf9-44c3-8b72-58f7a02c6ffa\",\"WorkerId\":\"080ec2cd-fab3-4374-991a-e2834238ca6c\"}'),
(993, 176, 'Processing', NULL, '2023-06-09 07:25:23', '{\"StartedAt\":\"2023-06-09T07:25:22.7270380Z\",\"ServerId\":\"f6e3cd13-acf9-44c3-8b72-58f7a02c6ffa\",\"WorkerId\":\"9af6bb46-260d-423d-baad-89e4f460112b\"}'),
(994, 159, 'Processing', NULL, '2023-06-09 07:25:23', '{\"StartedAt\":\"2023-06-09T07:25:22.7264820Z\",\"ServerId\":\"f6e3cd13-acf9-44c3-8b72-58f7a02c6ffa\",\"WorkerId\":\"d3f59a26-3c6d-4e4e-8aa6-fca3c6bbd2e7\"}'),
(995, 177, 'Succeeded', NULL, '2023-06-09 07:25:25', '{\"SucceededAt\":\"2023-06-09T07:25:24.8684320Z\",\"PerformanceDuration\":\"2130\",\"Latency\":\"36737\"}'),
(996, 176, 'Succeeded', NULL, '2023-06-09 07:25:25', '{\"SucceededAt\":\"2023-06-09T07:25:25.2932230Z\",\"PerformanceDuration\":\"2555\",\"Latency\":\"37737\"}'),
(997, 165, 'Succeeded', NULL, '2023-06-09 07:25:25', '{\"SucceededAt\":\"2023-06-09T07:25:25.4372740Z\",\"PerformanceDuration\":\"2699\",\"Latency\":\"390737\"}'),
(998, 159, 'Succeeded', NULL, '2023-06-09 07:25:27', '{\"SucceededAt\":\"2023-06-09T07:25:26.6238440Z\",\"PerformanceDuration\":\"3886\",\"Latency\":\"397737\"}'),
(999, 178, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:25:59', '{\"EnqueuedAt\":\"2023-06-09T07:25:59.1361860Z\",\"Queue\":\"default\"}'),
(1000, 179, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:25:59', '{\"EnqueuedAt\":\"2023-06-09T07:25:59.1465940Z\",\"Queue\":\"default\"}'),
(1001, 180, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:25:59', '{\"EnqueuedAt\":\"2023-06-09T07:25:59.1541390Z\",\"Queue\":\"default\"}'),
(1002, 181, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:25:59', '{\"EnqueuedAt\":\"2023-06-09T07:25:59.1603520Z\",\"Queue\":\"default\"}'),
(1003, 182, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:25:59', '{\"EnqueuedAt\":\"2023-06-09T07:25:59.1653300Z\",\"Queue\":\"default\"}'),
(1004, 183, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:25:59', '{\"EnqueuedAt\":\"2023-06-09T07:25:59.1706670Z\",\"Queue\":\"default\"}'),
(1005, 184, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:25:59', '{\"EnqueuedAt\":\"2023-06-09T07:25:59.1741460Z\",\"Queue\":\"default\"}'),
(1006, 183, 'Processing', NULL, '2023-06-09 07:26:08', '{\"StartedAt\":\"2023-06-09T07:26:07.7524490Z\",\"ServerId\":\"f6e3cd13-acf9-44c3-8b72-58f7a02c6ffa\",\"WorkerId\":\"e3ffe56e-04cb-4d54-91a7-0f4b7c554252\"}'),
(1007, 182, 'Processing', NULL, '2023-06-09 07:26:08', '{\"StartedAt\":\"2023-06-09T07:26:07.7518770Z\",\"ServerId\":\"f6e3cd13-acf9-44c3-8b72-58f7a02c6ffa\",\"WorkerId\":\"00faed55-90ee-4c55-ba96-b1cac68bc8d2\"}'),
(1008, 184, 'Processing', NULL, '2023-06-09 07:26:08', '{\"StartedAt\":\"2023-06-09T07:26:07.7529680Z\",\"ServerId\":\"f6e3cd13-acf9-44c3-8b72-58f7a02c6ffa\",\"WorkerId\":\"38b0057c-eceb-45fe-89e6-e6f372b7d6e6\"}'),
(1009, 181, 'Processing', NULL, '2023-06-09 07:26:08', '{\"StartedAt\":\"2023-06-09T07:26:07.7526270Z\",\"ServerId\":\"f6e3cd13-acf9-44c3-8b72-58f7a02c6ffa\",\"WorkerId\":\"877c2fdd-6431-48ef-98d0-97a75615e87c\"}'),
(1010, 178, 'Processing', NULL, '2023-06-09 07:26:08', '{\"StartedAt\":\"2023-06-09T07:26:07.7461710Z\",\"ServerId\":\"f6e3cd13-acf9-44c3-8b72-58f7a02c6ffa\",\"WorkerId\":\"f9c27f4b-debd-4046-82dc-6443c14bd446\"}'),
(1011, 179, 'Processing', NULL, '2023-06-09 07:26:08', '{\"StartedAt\":\"2023-06-09T07:26:07.7492880Z\",\"ServerId\":\"f6e3cd13-acf9-44c3-8b72-58f7a02c6ffa\",\"WorkerId\":\"fab67968-da79-44df-94d7-c53c26ec6bb6\"}'),
(1012, 180, 'Processing', NULL, '2023-06-09 07:26:08', '{\"StartedAt\":\"2023-06-09T07:26:07.7503070Z\",\"ServerId\":\"f6e3cd13-acf9-44c3-8b72-58f7a02c6ffa\",\"WorkerId\":\"5069cf1b-4389-4f93-ab93-b3ef0229c799\"}'),
(1013, 178, 'Succeeded', NULL, '2023-06-09 07:26:13', '{\"SucceededAt\":\"2023-06-09T07:26:12.7808580Z\",\"PerformanceDuration\":\"5011\",\"Latency\":\"79769\"}'),
(1014, 180, 'Succeeded', NULL, '2023-06-09 07:26:16', '{\"SucceededAt\":\"2023-06-09T07:26:15.8535050Z\",\"PerformanceDuration\":\"8081\",\"Latency\":\"77771\"}'),
(1015, 179, 'Succeeded', NULL, '2023-06-09 07:26:17', '{\"SucceededAt\":\"2023-06-09T07:26:16.4982830Z\",\"PerformanceDuration\":\"8727\",\"Latency\":\"78770\"}'),
(1016, 184, 'Failed', 'An exception occurred during performance of the job.', '2023-06-09 07:27:23', '{\"FailedAt\":\"2023-06-09T07:27:22.8051600Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c0f::6d]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String message) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 50\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"f6e3cd13-acf9-44c3-8b72-58f7a02c6ffa\"}'),
(1017, 181, 'Failed', 'An exception occurred during performance of the job.', '2023-06-09 07:27:23', '{\"FailedAt\":\"2023-06-09T07:27:22.8051690Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c0f::6d]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String message) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 50\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"f6e3cd13-acf9-44c3-8b72-58f7a02c6ffa\"}'),
(1018, 183, 'Failed', 'An exception occurred during performance of the job.', '2023-06-09 07:27:23', '{\"FailedAt\":\"2023-06-09T07:27:22.8051630Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c0f::6d]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"f6e3cd13-acf9-44c3-8b72-58f7a02c6ffa\"}'),
(1019, 182, 'Failed', 'An exception occurred during performance of the job.', '2023-06-09 07:27:23', '{\"FailedAt\":\"2023-06-09T07:27:22.8051530Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c0f::6d]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String message) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 50\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"f6e3cd13-acf9-44c3-8b72-58f7a02c6ffa\"}'),
(1020, 182, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-09 07:27:23', '{\"EnqueueAt\":\"2023-06-09T07:27:54.8098680Z\",\"ScheduledAt\":\"2023-06-09T07:27:22.8098690Z\"}'),
(1021, 183, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-09 07:27:23', '{\"EnqueueAt\":\"2023-06-09T07:27:52.8098990Z\",\"ScheduledAt\":\"2023-06-09T07:27:22.8099000Z\"}'),
(1022, 184, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-09 07:27:23', '{\"EnqueueAt\":\"2023-06-09T07:28:01.8098920Z\",\"ScheduledAt\":\"2023-06-09T07:27:22.8098920Z\"}'),
(1023, 181, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-09 07:27:23', '{\"EnqueueAt\":\"2023-06-09T07:27:42.8098770Z\",\"ScheduledAt\":\"2023-06-09T07:27:22.8098780Z\"}'),
(1024, 181, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:28:14', '{\"EnqueuedAt\":\"2023-06-09T07:28:14.2368700Z\",\"Queue\":\"default\"}'),
(1025, 182, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:28:14', '{\"EnqueuedAt\":\"2023-06-09T07:28:14.2445880Z\",\"Queue\":\"default\"}'),
(1026, 183, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:28:14', '{\"EnqueuedAt\":\"2023-06-09T07:28:14.2493400Z\",\"Queue\":\"default\"}'),
(1027, 184, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:28:14', '{\"EnqueuedAt\":\"2023-06-09T07:28:14.2533590Z\",\"Queue\":\"default\"}'),
(1028, 181, 'Processing', NULL, '2023-06-09 07:28:16', '{\"StartedAt\":\"2023-06-09T07:28:15.9070630Z\",\"ServerId\":\"f6e3cd13-acf9-44c3-8b72-58f7a02c6ffa\",\"WorkerId\":\"5069cf1b-4389-4f93-ab93-b3ef0229c799\"}'),
(1029, 182, 'Processing', NULL, '2023-06-09 07:28:17', '{\"StartedAt\":\"2023-06-09T07:28:16.5546540Z\",\"ServerId\":\"f6e3cd13-acf9-44c3-8b72-58f7a02c6ffa\",\"WorkerId\":\"fab67968-da79-44df-94d7-c53c26ec6bb6\"}'),
(1030, 181, 'Succeeded', NULL, '2023-06-09 07:28:19', '{\"SucceededAt\":\"2023-06-09T07:28:18.7596260Z\",\"PerformanceDuration\":\"2846\",\"Latency\":\"204913\"}'),
(1031, 183, 'Processing', NULL, '2023-06-09 07:28:19', '{\"StartedAt\":\"2023-06-09T07:28:18.7708740Z\",\"ServerId\":\"f6e3cd13-acf9-44c3-8b72-58f7a02c6ffa\",\"WorkerId\":\"5069cf1b-4389-4f93-ab93-b3ef0229c799\"}'),
(1032, 182, 'Succeeded', NULL, '2023-06-09 07:28:20', '{\"SucceededAt\":\"2023-06-09T07:28:20.4011940Z\",\"PerformanceDuration\":\"3838\",\"Latency\":\"204562\"}'),
(1033, 184, 'Processing', NULL, '2023-06-09 07:28:20', '{\"StartedAt\":\"2023-06-09T07:28:20.4135830Z\",\"ServerId\":\"f6e3cd13-acf9-44c3-8b72-58f7a02c6ffa\",\"WorkerId\":\"fab67968-da79-44df-94d7-c53c26ec6bb6\"}'),
(1034, 183, 'Failed', 'An exception occurred during performance of the job.', '2023-06-09 07:29:34', '{\"FailedAt\":\"2023-06-09T07:29:33.7913440Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c1c::6d]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"f6e3cd13-acf9-44c3-8b72-58f7a02c6ffa\"}'),
(1035, 183, 'Scheduled', 'Retry attempt 2 of 10: Failure sending mail.', '2023-06-09 07:29:34', '{\"EnqueueAt\":\"2023-06-09T07:30:03.7966890Z\",\"ScheduledAt\":\"2023-06-09T07:29:33.7966890Z\"}'),
(1036, 184, 'Failed', 'An exception occurred during performance of the job.', '2023-06-09 07:29:35', '{\"FailedAt\":\"2023-06-09T07:29:35.4820260Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c1c::6d]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String message) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 50\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"f6e3cd13-acf9-44c3-8b72-58f7a02c6ffa\"}'),
(1037, 184, 'Scheduled', 'Retry attempt 2 of 10: Failure sending mail.', '2023-06-09 07:29:35', '{\"EnqueueAt\":\"2023-06-09T07:30:01.4858130Z\",\"ScheduledAt\":\"2023-06-09T07:29:35.4858130Z\"}'),
(1038, 183, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:30:14', '{\"EnqueuedAt\":\"2023-06-09T07:30:14.3062980Z\",\"Queue\":\"default\"}'),
(1039, 184, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:30:14', '{\"EnqueuedAt\":\"2023-06-09T07:30:14.3140160Z\",\"Queue\":\"default\"}'),
(1040, 183, 'Processing', NULL, '2023-06-09 07:30:19', '{\"StartedAt\":\"2023-06-09T07:30:18.8131880Z\",\"ServerId\":\"f6e3cd13-acf9-44c3-8b72-58f7a02c6ffa\",\"WorkerId\":\"5069cf1b-4389-4f93-ab93-b3ef0229c799\"}'),
(1041, 184, 'Processing', NULL, '2023-06-09 07:30:21', '{\"StartedAt\":\"2023-06-09T07:30:20.5015440Z\",\"ServerId\":\"f6e3cd13-acf9-44c3-8b72-58f7a02c6ffa\",\"WorkerId\":\"fab67968-da79-44df-94d7-c53c26ec6bb6\"}'),
(1042, 183, 'Succeeded', NULL, '2023-06-09 07:30:21', '{\"SucceededAt\":\"2023-06-09T07:30:21.4085670Z\",\"PerformanceDuration\":\"2593\",\"Latency\":\"325815\"}');
INSERT INTO `Hangfire_State` (`Id`, `JobId`, `Name`, `Reason`, `CreatedAt`, `Data`) VALUES
(1043, 184, 'Failed', 'An exception occurred during performance of the job.', '2023-06-09 07:31:36', '{\"FailedAt\":\"2023-06-09T07:31:35.5268000Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c1c::6d]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String message) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 50\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"f6e3cd13-acf9-44c3-8b72-58f7a02c6ffa\"}'),
(1044, 184, 'Scheduled', 'Retry attempt 3 of 10: Failure sending mail.', '2023-06-09 07:31:36', '{\"EnqueueAt\":\"2023-06-09T07:32:54.5338630Z\",\"ScheduledAt\":\"2023-06-09T07:31:35.5338640Z\"}'),
(1045, 184, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 07:32:29', '{\"EnqueuedAt\":\"2023-06-09T07:32:29.3758880Z\",\"Queue\":\"default\"}'),
(1046, 184, 'Processing', NULL, '2023-06-09 07:32:36', '{\"StartedAt\":\"2023-06-09T07:32:35.5589520Z\",\"ServerId\":\"f6e3cd13-acf9-44c3-8b72-58f7a02c6ffa\",\"WorkerId\":\"fab67968-da79-44df-94d7-c53c26ec6bb6\"}'),
(1047, 184, 'Succeeded', NULL, '2023-06-09 07:32:38', '{\"SucceededAt\":\"2023-06-09T07:32:37.6603420Z\",\"PerformanceDuration\":\"2096\",\"Latency\":\"461563\"}'),
(1048, 173, 'Processing', NULL, '2023-06-09 08:01:15', '{\"StartedAt\":\"2023-06-09T08:01:15.4703860Z\",\"ServerId\":\"0997cad5-f43b-4478-9c9a-e811f202685a\",\"WorkerId\":\"bc916aca-e933-4943-968f-c693de2b6aff\"}'),
(1049, 167, 'Processing', NULL, '2023-06-09 08:01:15', '{\"StartedAt\":\"2023-06-09T08:01:15.4614370Z\",\"ServerId\":\"0997cad5-f43b-4478-9c9a-e811f202685a\",\"WorkerId\":\"ee1e28b5-6637-4794-aefb-7c2e4d20e57c\"}'),
(1050, 173, 'Succeeded', NULL, '2023-06-09 08:01:18', '{\"SucceededAt\":\"2023-06-09T08:01:17.8506070Z\",\"PerformanceDuration\":\"2347\",\"Latency\":\"2457502\"}'),
(1051, 167, 'Failed', 'An exception occurred during performance of the job.', '2023-06-09 08:02:31', '{\"FailedAt\":\"2023-06-09T08:02:30.6796380Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c1c::6d]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String message) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 50\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"0997cad5-f43b-4478-9c9a-e811f202685a\"}'),
(1052, 167, 'Scheduled', 'Retry attempt 2 of 10: Failure sending mail.', '2023-06-09 08:02:31', '{\"EnqueueAt\":\"2023-06-09T08:03:44.6920470Z\",\"ScheduledAt\":\"2023-06-09T08:02:30.6921020Z\"}'),
(1053, 185, 'Scheduled', NULL, '2023-06-09 08:02:55', '{\"EnqueueAt\":\"2023-06-09T08:02:55.9932060Z\",\"ScheduledAt\":\"2023-06-09T08:02:54.9932130Z\"}'),
(1054, 186, 'Scheduled', NULL, '2023-06-09 08:02:56', '{\"EnqueueAt\":\"2023-06-09T08:02:57.2527780Z\",\"ScheduledAt\":\"2023-06-09T08:02:56.2527820Z\"}'),
(1055, 187, 'Scheduled', NULL, '2023-06-09 08:02:57', '{\"EnqueueAt\":\"2023-06-09T08:02:58.3603340Z\",\"ScheduledAt\":\"2023-06-09T08:02:57.3603380Z\"}'),
(1056, 185, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:03:01', '{\"EnqueuedAt\":\"2023-06-09T08:03:00.5368700Z\",\"Queue\":\"default\"}'),
(1057, 186, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:03:01', '{\"EnqueuedAt\":\"2023-06-09T08:03:00.5589190Z\",\"Queue\":\"default\"}'),
(1058, 187, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:03:01', '{\"EnqueuedAt\":\"2023-06-09T08:03:00.5680710Z\",\"Queue\":\"default\"}'),
(1059, 185, 'Processing', NULL, '2023-06-09 08:03:01', '{\"StartedAt\":\"2023-06-09T08:03:00.7150140Z\",\"ServerId\":\"0997cad5-f43b-4478-9c9a-e811f202685a\",\"WorkerId\":\"ee1e28b5-6637-4794-aefb-7c2e4d20e57c\"}'),
(1060, 186, 'Processing', NULL, '2023-06-09 08:03:03', '{\"StartedAt\":\"2023-06-09T08:03:02.9237040Z\",\"ServerId\":\"0997cad5-f43b-4478-9c9a-e811f202685a\",\"WorkerId\":\"bc916aca-e933-4943-968f-c693de2b6aff\"}'),
(1061, 185, 'Succeeded', NULL, '2023-06-09 08:03:03', '{\"SucceededAt\":\"2023-06-09T08:03:02.9986580Z\",\"PerformanceDuration\":\"2275\",\"Latency\":\"5722\"}'),
(1062, 187, 'Processing', NULL, '2023-06-09 08:03:03', '{\"StartedAt\":\"2023-06-09T08:03:03.0144440Z\",\"ServerId\":\"0997cad5-f43b-4478-9c9a-e811f202685a\",\"WorkerId\":\"ee1e28b5-6637-4794-aefb-7c2e4d20e57c\"}'),
(1063, 186, 'Succeeded', NULL, '2023-06-09 08:03:05', '{\"SucceededAt\":\"2023-06-09T08:03:04.9612230Z\",\"PerformanceDuration\":\"2026\",\"Latency\":\"6934\"}'),
(1064, 187, 'Succeeded', NULL, '2023-06-09 08:03:05', '{\"SucceededAt\":\"2023-06-09T08:03:05.3796250Z\",\"PerformanceDuration\":\"2358\",\"Latency\":\"6021\"}'),
(1065, 167, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:04:31', '{\"EnqueuedAt\":\"2023-06-09T08:04:30.6125810Z\",\"Queue\":\"default\"}'),
(1066, 167, 'Processing', NULL, '2023-06-09 08:04:35', '{\"StartedAt\":\"2023-06-09T08:04:35.0075740Z\",\"ServerId\":\"0997cad5-f43b-4478-9c9a-e811f202685a\",\"WorkerId\":\"bc916aca-e933-4943-968f-c693de2b6aff\"}'),
(1067, 188, 'Scheduled', NULL, '2023-06-09 08:21:14', '{\"EnqueueAt\":\"2023-06-09T08:21:15.3650360Z\",\"ScheduledAt\":\"2023-06-09T08:21:14.3650760Z\"}'),
(1068, 189, 'Scheduled', NULL, '2023-06-09 08:21:15', '{\"EnqueueAt\":\"2023-06-09T08:21:16.3981020Z\",\"ScheduledAt\":\"2023-06-09T08:21:15.3981040Z\"}'),
(1069, 190, 'Scheduled', NULL, '2023-06-09 08:21:17', '{\"EnqueueAt\":\"2023-06-09T08:21:17.7223100Z\",\"ScheduledAt\":\"2023-06-09T08:21:16.7223140Z\"}'),
(1070, 188, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:21:22', '{\"EnqueuedAt\":\"2023-06-09T08:21:22.1495890Z\",\"Queue\":\"default\"}'),
(1071, 189, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:21:22', '{\"EnqueuedAt\":\"2023-06-09T08:21:22.2261270Z\",\"Queue\":\"default\"}'),
(1072, 190, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:21:22', '{\"EnqueuedAt\":\"2023-06-09T08:21:22.2312030Z\",\"Queue\":\"default\"}'),
(1073, 191, 'Scheduled', NULL, '2023-06-09 08:21:27', '{\"EnqueueAt\":\"2023-06-09T08:21:28.0067370Z\",\"ScheduledAt\":\"2023-06-09T08:21:27.0067390Z\"}'),
(1074, 192, 'Scheduled', NULL, '2023-06-09 08:21:29', '{\"EnqueueAt\":\"2023-06-09T08:21:29.8350050Z\",\"ScheduledAt\":\"2023-06-09T08:21:28.8350070Z\"}'),
(1075, 193, 'Scheduled', NULL, '2023-06-09 08:21:30', '{\"EnqueueAt\":\"2023-06-09T08:21:31.3159960Z\",\"ScheduledAt\":\"2023-06-09T08:21:30.3159980Z\"}'),
(1076, 190, 'Processing', NULL, '2023-06-09 08:21:37', '{\"StartedAt\":\"2023-06-09T08:21:37.1282210Z\",\"ServerId\":\"57ee6cf9-c6dd-4439-a50f-6bb1725b0bcb\",\"WorkerId\":\"ab9abdf4-d3f7-4e4e-80b5-f4010a234c2e\"}'),
(1077, 189, 'Processing', NULL, '2023-06-09 08:21:37', '{\"StartedAt\":\"2023-06-09T08:21:37.1282060Z\",\"ServerId\":\"57ee6cf9-c6dd-4439-a50f-6bb1725b0bcb\",\"WorkerId\":\"d281bdc6-0d8e-4a3b-9469-4ebc02918c9d\"}'),
(1078, 188, 'Processing', NULL, '2023-06-09 08:21:37', '{\"StartedAt\":\"2023-06-09T08:21:37.1282090Z\",\"ServerId\":\"57ee6cf9-c6dd-4439-a50f-6bb1725b0bcb\",\"WorkerId\":\"e1336761-ca17-467a-b6db-96f26ef72a73\"}'),
(1079, 191, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:21:37', '{\"EnqueuedAt\":\"2023-06-09T08:21:37.2439620Z\",\"Queue\":\"default\"}'),
(1080, 192, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:21:37', '{\"EnqueuedAt\":\"2023-06-09T08:21:37.2521260Z\",\"Queue\":\"default\"}'),
(1081, 193, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:21:37', '{\"EnqueuedAt\":\"2023-06-09T08:21:37.2573770Z\",\"Queue\":\"default\"}'),
(1082, 190, 'Succeeded', NULL, '2023-06-09 08:21:39', '{\"SucceededAt\":\"2023-06-09T08:21:39.1912680Z\",\"PerformanceDuration\":\"2054\",\"Latency\":\"20136\"}'),
(1083, 191, 'Processing', NULL, '2023-06-09 08:21:39', '{\"StartedAt\":\"2023-06-09T08:21:39.2274400Z\",\"ServerId\":\"57ee6cf9-c6dd-4439-a50f-6bb1725b0bcb\",\"WorkerId\":\"ab9abdf4-d3f7-4e4e-80b5-f4010a234c2e\"}'),
(1084, 188, 'Succeeded', NULL, '2023-06-09 08:21:40', '{\"SucceededAt\":\"2023-06-09T08:21:39.5065430Z\",\"PerformanceDuration\":\"2370\",\"Latency\":\"23136\"}'),
(1085, 192, 'Processing', NULL, '2023-06-09 08:21:40', '{\"StartedAt\":\"2023-06-09T08:21:39.5193980Z\",\"ServerId\":\"57ee6cf9-c6dd-4439-a50f-6bb1725b0bcb\",\"WorkerId\":\"e1336761-ca17-467a-b6db-96f26ef72a73\"}'),
(1086, 191, 'Succeeded', NULL, '2023-06-09 08:21:41', '{\"SucceededAt\":\"2023-06-09T08:21:41.1302390Z\",\"PerformanceDuration\":\"1895\",\"Latency\":\"12234\"}'),
(1087, 193, 'Processing', NULL, '2023-06-09 08:21:41', '{\"StartedAt\":\"2023-06-09T08:21:41.1514920Z\",\"ServerId\":\"57ee6cf9-c6dd-4439-a50f-6bb1725b0bcb\",\"WorkerId\":\"ab9abdf4-d3f7-4e4e-80b5-f4010a234c2e\"}'),
(1088, 192, 'Succeeded', NULL, '2023-06-09 08:21:42', '{\"SucceededAt\":\"2023-06-09T08:21:42.0402960Z\",\"PerformanceDuration\":\"2515\",\"Latency\":\"10525\"}'),
(1089, 189, 'Failed', 'An exception occurred during performance of the job.', '2023-06-09 08:22:52', '{\"FailedAt\":\"2023-06-09T08:22:52.2251750Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c1c::6c]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String message) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 50\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"57ee6cf9-c6dd-4439-a50f-6bb1725b0bcb\"}'),
(1090, 189, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-09 08:22:52', '{\"EnqueueAt\":\"2023-06-09T08:23:17.2315820Z\",\"ScheduledAt\":\"2023-06-09T08:22:52.2315820Z\"}'),
(1091, 193, 'Failed', 'An exception occurred during performance of the job.', '2023-06-09 08:22:56', '{\"FailedAt\":\"2023-06-09T08:22:56.1827100Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c1c::6c]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String message) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 50\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"57ee6cf9-c6dd-4439-a50f-6bb1725b0bcb\"}'),
(1092, 193, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-09 08:22:56', '{\"EnqueueAt\":\"2023-06-09T08:23:35.1882680Z\",\"ScheduledAt\":\"2023-06-09T08:22:56.1882690Z\"}'),
(1093, 189, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:23:37', '{\"EnqueuedAt\":\"2023-06-09T08:23:37.3121290Z\",\"Queue\":\"default\"}'),
(1094, 193, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:23:37', '{\"EnqueuedAt\":\"2023-06-09T08:23:37.3192730Z\",\"Queue\":\"default\"}'),
(1095, 189, 'Processing', NULL, '2023-06-09 08:23:41', '{\"StartedAt\":\"2023-06-09T08:23:41.2085640Z\",\"ServerId\":\"57ee6cf9-c6dd-4439-a50f-6bb1725b0bcb\",\"WorkerId\":\"ab9abdf4-d3f7-4e4e-80b5-f4010a234c2e\"}'),
(1096, 193, 'Processing', NULL, '2023-06-09 08:23:42', '{\"StartedAt\":\"2023-06-09T08:23:42.0937370Z\",\"ServerId\":\"57ee6cf9-c6dd-4439-a50f-6bb1725b0bcb\",\"WorkerId\":\"e1336761-ca17-467a-b6db-96f26ef72a73\"}'),
(1097, 193, 'Succeeded', NULL, '2023-06-09 08:23:51', '{\"SucceededAt\":\"2023-06-09T08:23:50.5143240Z\",\"PerformanceDuration\":\"8414\",\"Latency\":\"132100\"}'),
(1098, 189, 'Succeeded', NULL, '2023-06-09 08:23:51', '{\"SucceededAt\":\"2023-06-09T08:23:50.8654720Z\",\"PerformanceDuration\":\"9651\",\"Latency\":\"146213\"}'),
(1099, 194, 'Scheduled', NULL, '2023-06-09 08:31:05', '{\"EnqueueAt\":\"2023-06-09T08:31:05.5274450Z\",\"ScheduledAt\":\"2023-06-09T08:31:04.5274660Z\"}'),
(1100, 195, 'Scheduled', NULL, '2023-06-09 08:31:08', '{\"EnqueueAt\":\"2023-06-09T08:31:08.5426150Z\",\"ScheduledAt\":\"2023-06-09T08:31:07.5426190Z\"}'),
(1101, 196, 'Scheduled', NULL, '2023-06-09 08:31:09', '{\"EnqueueAt\":\"2023-06-09T08:31:10.2301580Z\",\"ScheduledAt\":\"2023-06-09T08:31:09.2301610Z\"}'),
(1102, 197, 'Scheduled', NULL, '2023-06-09 08:31:10', '{\"EnqueueAt\":\"2023-06-09T08:31:11.1785870Z\",\"ScheduledAt\":\"2023-06-09T08:31:10.1785880Z\"}'),
(1103, 198, 'Scheduled', NULL, '2023-06-09 08:31:13', '{\"EnqueueAt\":\"2023-06-09T08:31:13.9961070Z\",\"ScheduledAt\":\"2023-06-09T08:31:12.9961090Z\"}'),
(1104, 199, 'Scheduled', NULL, '2023-06-09 08:31:14', '{\"EnqueueAt\":\"2023-06-09T08:31:15.0643270Z\",\"ScheduledAt\":\"2023-06-09T08:31:14.0643300Z\"}'),
(1105, 200, 'Scheduled', NULL, '2023-06-09 08:31:15', '{\"EnqueueAt\":\"2023-06-09T08:31:15.9939780Z\",\"ScheduledAt\":\"2023-06-09T08:31:14.9939800Z\"}'),
(1106, 201, 'Scheduled', NULL, '2023-06-09 08:31:16', '{\"EnqueueAt\":\"2023-06-09T08:31:16.9373390Z\",\"ScheduledAt\":\"2023-06-09T08:31:15.9373420Z\"}'),
(1107, 202, 'Scheduled', NULL, '2023-06-09 08:31:17', '{\"EnqueueAt\":\"2023-06-09T08:31:17.9184300Z\",\"ScheduledAt\":\"2023-06-09T08:31:16.9184340Z\"}'),
(1108, 203, 'Scheduled', NULL, '2023-06-09 08:31:54', '{\"EnqueueAt\":\"2023-06-09T08:31:54.8320170Z\",\"ScheduledAt\":\"2023-06-09T08:31:53.8320480Z\"}'),
(1109, 204, 'Scheduled', NULL, '2023-06-09 08:31:55', '{\"EnqueueAt\":\"2023-06-09T08:31:55.5057380Z\",\"ScheduledAt\":\"2023-06-09T08:31:54.5057410Z\"}'),
(1110, 205, 'Scheduled', NULL, '2023-06-09 08:31:55', '{\"EnqueueAt\":\"2023-06-09T08:31:56.0311460Z\",\"ScheduledAt\":\"2023-06-09T08:31:55.0311470Z\"}'),
(1111, 194, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:32:06', '{\"EnqueuedAt\":\"2023-06-09T08:32:05.7376640Z\",\"Queue\":\"default\"}'),
(1112, 195, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:32:06', '{\"EnqueuedAt\":\"2023-06-09T08:32:05.8119660Z\",\"Queue\":\"default\"}'),
(1113, 196, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:32:06', '{\"EnqueuedAt\":\"2023-06-09T08:32:05.8193390Z\",\"Queue\":\"default\"}'),
(1114, 197, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:32:06', '{\"EnqueuedAt\":\"2023-06-09T08:32:05.8251630Z\",\"Queue\":\"default\"}'),
(1115, 198, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:32:06', '{\"EnqueuedAt\":\"2023-06-09T08:32:05.8296600Z\",\"Queue\":\"default\"}'),
(1116, 199, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:32:06', '{\"EnqueuedAt\":\"2023-06-09T08:32:05.8343290Z\",\"Queue\":\"default\"}'),
(1117, 200, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:32:06', '{\"EnqueuedAt\":\"2023-06-09T08:32:05.8378190Z\",\"Queue\":\"default\"}'),
(1118, 201, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:32:06', '{\"EnqueuedAt\":\"2023-06-09T08:32:05.8412960Z\",\"Queue\":\"default\"}'),
(1119, 202, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:32:06', '{\"EnqueuedAt\":\"2023-06-09T08:32:05.8454620Z\",\"Queue\":\"default\"}'),
(1120, 203, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:32:06', '{\"EnqueuedAt\":\"2023-06-09T08:32:05.8490660Z\",\"Queue\":\"default\"}'),
(1121, 204, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:32:06', '{\"EnqueuedAt\":\"2023-06-09T08:32:05.8527510Z\",\"Queue\":\"default\"}'),
(1122, 205, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:32:06', '{\"EnqueuedAt\":\"2023-06-09T08:32:05.8562840Z\",\"Queue\":\"default\"}'),
(1123, 206, 'Scheduled', NULL, '2023-06-09 08:32:09', '{\"EnqueueAt\":\"2023-06-09T08:32:10.0119210Z\",\"ScheduledAt\":\"2023-06-09T08:32:09.0119230Z\"}'),
(1124, 207, 'Scheduled', NULL, '2023-06-09 08:32:10', '{\"EnqueueAt\":\"2023-06-09T08:32:11.4261130Z\",\"ScheduledAt\":\"2023-06-09T08:32:10.4261130Z\"}'),
(1125, 208, 'Scheduled', NULL, '2023-06-09 08:32:12', '{\"EnqueueAt\":\"2023-06-09T08:32:12.5723300Z\",\"ScheduledAt\":\"2023-06-09T08:32:11.5723310Z\"}'),
(1126, 209, 'Scheduled', NULL, '2023-06-09 08:32:13', '{\"EnqueueAt\":\"2023-06-09T08:32:13.7620870Z\",\"ScheduledAt\":\"2023-06-09T08:32:12.7620880Z\"}'),
(1127, 198, 'Processing', NULL, '2023-06-09 08:32:21', '{\"StartedAt\":\"2023-06-09T08:32:20.7047440Z\",\"ServerId\":\"118fda29-bc88-4585-8a51-c4e1180d926f\",\"WorkerId\":\"9f632f2b-bb8f-4435-ac2e-285b88be3f59\"}'),
(1128, 195, 'Processing', NULL, '2023-06-09 08:32:21', '{\"StartedAt\":\"2023-06-09T08:32:20.7047370Z\",\"ServerId\":\"118fda29-bc88-4585-8a51-c4e1180d926f\",\"WorkerId\":\"9331719d-7d78-4b92-9466-7806413ab5db\"}'),
(1129, 197, 'Processing', NULL, '2023-06-09 08:32:21', '{\"StartedAt\":\"2023-06-09T08:32:20.7048050Z\",\"ServerId\":\"118fda29-bc88-4585-8a51-c4e1180d926f\",\"WorkerId\":\"5c2ba18c-c872-4c79-b8fa-65bb88f01441\"}'),
(1130, 196, 'Processing', NULL, '2023-06-09 08:32:21', '{\"StartedAt\":\"2023-06-09T08:32:20.7047740Z\",\"ServerId\":\"118fda29-bc88-4585-8a51-c4e1180d926f\",\"WorkerId\":\"c065ba65-a8bb-4438-8d98-f79ca60ab4bc\"}'),
(1131, 199, 'Processing', NULL, '2023-06-09 08:32:21', '{\"StartedAt\":\"2023-06-09T08:32:20.7047970Z\",\"ServerId\":\"118fda29-bc88-4585-8a51-c4e1180d926f\",\"WorkerId\":\"173f0e77-3029-4f60-9efb-1cd209f785b4\"}'),
(1132, 201, 'Processing', NULL, '2023-06-09 08:32:21', '{\"StartedAt\":\"2023-06-09T08:32:20.7088450Z\",\"ServerId\":\"118fda29-bc88-4585-8a51-c4e1180d926f\",\"WorkerId\":\"38a43cbf-da78-463a-bda3-9c959bf5cf89\"}'),
(1133, 200, 'Processing', NULL, '2023-06-09 08:32:21', '{\"StartedAt\":\"2023-06-09T08:32:20.7083480Z\",\"ServerId\":\"118fda29-bc88-4585-8a51-c4e1180d926f\",\"WorkerId\":\"e0692d89-64a5-44dc-85f9-f9088b4ed58f\"}'),
(1134, 194, 'Processing', NULL, '2023-06-09 08:32:21', '{\"StartedAt\":\"2023-06-09T08:32:20.7047890Z\",\"ServerId\":\"118fda29-bc88-4585-8a51-c4e1180d926f\",\"WorkerId\":\"8e2930da-71bf-4bae-84f8-a2f6f0d71b86\"}'),
(1135, 204, 'Processing', NULL, '2023-06-09 08:32:21', '{\"StartedAt\":\"2023-06-09T08:32:20.7112810Z\",\"ServerId\":\"118fda29-bc88-4585-8a51-c4e1180d926f\",\"WorkerId\":\"fb66823a-7dfb-4bc7-815d-318fbb82ae9d\"}'),
(1136, 205, 'Processing', NULL, '2023-06-09 08:32:21', '{\"StartedAt\":\"2023-06-09T08:32:20.7245280Z\",\"ServerId\":\"118fda29-bc88-4585-8a51-c4e1180d926f\",\"WorkerId\":\"e7b97a03-12a0-4ba0-8af1-59980947996c\"}'),
(1137, 202, 'Processing', NULL, '2023-06-09 08:32:21', '{\"StartedAt\":\"2023-06-09T08:32:20.7109360Z\",\"ServerId\":\"118fda29-bc88-4585-8a51-c4e1180d926f\",\"WorkerId\":\"bc562feb-8564-4302-9cdc-fb80e2cfba81\"}'),
(1138, 203, 'Processing', NULL, '2023-06-09 08:32:21', '{\"StartedAt\":\"2023-06-09T08:32:20.7111230Z\",\"ServerId\":\"118fda29-bc88-4585-8a51-c4e1180d926f\",\"WorkerId\":\"fd2330a7-0f58-46b1-ac2f-81e52878419b\"}'),
(1139, 206, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:32:21', '{\"EnqueuedAt\":\"2023-06-09T08:32:20.8667850Z\",\"Queue\":\"default\"}'),
(1140, 207, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:32:21', '{\"EnqueuedAt\":\"2023-06-09T08:32:20.8759440Z\",\"Queue\":\"default\"}'),
(1141, 208, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:32:21', '{\"EnqueuedAt\":\"2023-06-09T08:32:20.8828670Z\",\"Queue\":\"default\"}'),
(1142, 209, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:32:21', '{\"EnqueuedAt\":\"2023-06-09T08:32:20.8885520Z\",\"Queue\":\"default\"}'),
(1143, 195, 'Succeeded', NULL, '2023-06-09 08:32:23', '{\"SucceededAt\":\"2023-06-09T08:32:22.8939120Z\",\"PerformanceDuration\":\"2164\",\"Latency\":\"72728\"}'),
(1144, 199, 'Succeeded', NULL, '2023-06-09 08:32:23', '{\"SucceededAt\":\"2023-06-09T08:32:23.1322570Z\",\"PerformanceDuration\":\"2406\",\"Latency\":\"66725\"}'),
(1145, 201, 'Succeeded', NULL, '2023-06-09 08:32:23', '{\"SucceededAt\":\"2023-06-09T08:32:23.3895350Z\",\"PerformanceDuration\":\"2662\",\"Latency\":\"64726\"}'),
(1146, 206, 'Processing', NULL, '2023-06-09 08:32:23', '{\"StartedAt\":\"2023-06-09T08:32:23.4296430Z\",\"ServerId\":\"118fda29-bc88-4585-8a51-c4e1180d926f\",\"WorkerId\":\"9331719d-7d78-4b92-9466-7806413ab5db\"}'),
(1147, 207, 'Processing', NULL, '2023-06-09 08:32:23', '{\"StartedAt\":\"2023-06-09T08:32:23.4314030Z\",\"ServerId\":\"118fda29-bc88-4585-8a51-c4e1180d926f\",\"WorkerId\":\"173f0e77-3029-4f60-9efb-1cd209f785b4\"}'),
(1148, 208, 'Processing', NULL, '2023-06-09 08:32:23', '{\"StartedAt\":\"2023-06-09T08:32:23.4411640Z\",\"ServerId\":\"118fda29-bc88-4585-8a51-c4e1180d926f\",\"WorkerId\":\"38a43cbf-da78-463a-bda3-9c959bf5cf89\"}'),
(1149, 198, 'Succeeded', NULL, '2023-06-09 08:32:24', '{\"SucceededAt\":\"2023-06-09T08:32:23.5309320Z\",\"PerformanceDuration\":\"2811\",\"Latency\":\"67719\"}'),
(1150, 209, 'Processing', NULL, '2023-06-09 08:32:24', '{\"StartedAt\":\"2023-06-09T08:32:23.5409770Z\",\"ServerId\":\"118fda29-bc88-4585-8a51-c4e1180d926f\",\"WorkerId\":\"9f632f2b-bb8f-4435-ac2e-285b88be3f59\"}'),
(1151, 196, 'Succeeded', NULL, '2023-06-09 08:32:25', '{\"SucceededAt\":\"2023-06-09T08:32:24.7257710Z\",\"PerformanceDuration\":\"4006\",\"Latency\":\"71719\"}'),
(1152, 197, 'Succeeded', NULL, '2023-06-09 08:32:25', '{\"SucceededAt\":\"2023-06-09T08:32:24.9916130Z\",\"PerformanceDuration\":\"4272\",\"Latency\":\"70719\"}'),
(1153, 204, 'Succeeded', NULL, '2023-06-09 08:32:26', '{\"SucceededAt\":\"2023-06-09T08:32:25.5043980Z\",\"PerformanceDuration\":\"4776\",\"Latency\":\"25727\"}'),
(1154, 194, 'Succeeded', NULL, '2023-06-09 08:32:26', '{\"SucceededAt\":\"2023-06-09T08:32:26.3593180Z\",\"PerformanceDuration\":\"5636\",\"Latency\":\"75723\"}'),
(1155, 205, 'Succeeded', NULL, '2023-06-09 08:32:26', '{\"SucceededAt\":\"2023-06-09T08:32:26.3593180Z\",\"PerformanceDuration\":\"5626\",\"Latency\":\"25732\"}'),
(1156, 200, 'Succeeded', NULL, '2023-06-09 08:32:27', '{\"SucceededAt\":\"2023-06-09T08:32:26.6546740Z\",\"PerformanceDuration\":\"5934\",\"Latency\":\"65720\"}'),
(1157, 202, 'Succeeded', NULL, '2023-06-09 08:32:28', '{\"SucceededAt\":\"2023-06-09T08:32:27.9751960Z\",\"PerformanceDuration\":\"7223\",\"Latency\":\"63751\"}'),
(1158, 203, 'Succeeded', NULL, '2023-06-09 08:32:28', '{\"SucceededAt\":\"2023-06-09T08:32:28.2581620Z\",\"PerformanceDuration\":\"7504\",\"Latency\":\"26753\"}'),
(1159, 210, 'Scheduled', NULL, '2023-06-09 08:32:44', '{\"EnqueueAt\":\"2023-06-09T08:32:45.3601490Z\",\"ScheduledAt\":\"2023-06-09T08:32:44.3601500Z\"}'),
(1160, 211, 'Scheduled', NULL, '2023-06-09 08:32:45', '{\"EnqueueAt\":\"2023-06-09T08:32:46.4705890Z\",\"ScheduledAt\":\"2023-06-09T08:32:45.4705890Z\"}'),
(1161, 212, 'Scheduled', NULL, '2023-06-09 08:32:46', '{\"EnqueueAt\":\"2023-06-09T08:32:47.3033450Z\",\"ScheduledAt\":\"2023-06-09T08:32:46.3033460Z\"}'),
(1162, 213, 'Scheduled', NULL, '2023-06-09 08:32:47', '{\"EnqueueAt\":\"2023-06-09T08:32:48.3316270Z\",\"ScheduledAt\":\"2023-06-09T08:32:47.3316280Z\"}'),
(1163, 214, 'Scheduled', NULL, '2023-06-09 08:32:50', '{\"EnqueueAt\":\"2023-06-09T08:32:51.2088120Z\",\"ScheduledAt\":\"2023-06-09T08:32:50.2088120Z\"}'),
(1164, 210, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:32:51', '{\"EnqueuedAt\":\"2023-06-09T08:32:50.9051530Z\",\"Queue\":\"default\"}'),
(1165, 211, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:32:51', '{\"EnqueuedAt\":\"2023-06-09T08:32:50.9123260Z\",\"Queue\":\"default\"}'),
(1166, 212, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:32:51', '{\"EnqueuedAt\":\"2023-06-09T08:32:50.9177310Z\",\"Queue\":\"default\"}'),
(1167, 213, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:32:51', '{\"EnqueuedAt\":\"2023-06-09T08:32:50.9220390Z\",\"Queue\":\"default\"}'),
(1168, 214, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:32:51', '{\"EnqueuedAt\":\"2023-06-09T08:32:50.9264720Z\",\"Queue\":\"default\"}'),
(1169, 215, 'Scheduled', NULL, '2023-06-09 08:32:51', '{\"EnqueueAt\":\"2023-06-09T08:32:52.2119030Z\",\"ScheduledAt\":\"2023-06-09T08:32:51.2119040Z\"}'),
(1170, 216, 'Scheduled', NULL, '2023-06-09 08:32:52', '{\"EnqueueAt\":\"2023-06-09T08:32:53.0184770Z\",\"ScheduledAt\":\"2023-06-09T08:32:52.0184770Z\"}'),
(1171, 217, 'Scheduled', NULL, '2023-06-09 08:32:53', '{\"EnqueueAt\":\"2023-06-09T08:32:54.1782630Z\",\"ScheduledAt\":\"2023-06-09T08:32:53.1782640Z\"}'),
(1172, 210, 'Processing', NULL, '2023-06-09 08:32:55', '{\"StartedAt\":\"2023-06-09T08:32:54.7524600Z\",\"ServerId\":\"118fda29-bc88-4585-8a51-c4e1180d926f\",\"WorkerId\":\"c065ba65-a8bb-4438-8d98-f79ca60ab4bc\"}'),
(1173, 211, 'Processing', NULL, '2023-06-09 08:32:55', '{\"StartedAt\":\"2023-06-09T08:32:55.0147300Z\",\"ServerId\":\"118fda29-bc88-4585-8a51-c4e1180d926f\",\"WorkerId\":\"5c2ba18c-c872-4c79-b8fa-65bb88f01441\"}'),
(1174, 212, 'Processing', NULL, '2023-06-09 08:32:56', '{\"StartedAt\":\"2023-06-09T08:32:55.5288070Z\",\"ServerId\":\"118fda29-bc88-4585-8a51-c4e1180d926f\",\"WorkerId\":\"fb66823a-7dfb-4bc7-815d-318fbb82ae9d\"}'),
(1175, 214, 'Processing', NULL, '2023-06-09 08:32:56', '{\"StartedAt\":\"2023-06-09T08:32:56.3839640Z\",\"ServerId\":\"118fda29-bc88-4585-8a51-c4e1180d926f\",\"WorkerId\":\"8e2930da-71bf-4bae-84f8-a2f6f0d71b86\"}'),
(1176, 213, 'Processing', NULL, '2023-06-09 08:32:56', '{\"StartedAt\":\"2023-06-09T08:32:56.3834540Z\",\"ServerId\":\"118fda29-bc88-4585-8a51-c4e1180d926f\",\"WorkerId\":\"e7b97a03-12a0-4ba0-8af1-59980947996c\"}'),
(1177, 210, 'Succeeded', NULL, '2023-06-09 08:32:57', '{\"SucceededAt\":\"2023-06-09T08:32:56.9952080Z\",\"PerformanceDuration\":\"2235\",\"Latency\":\"10759\"}'),
(1178, 211, 'Succeeded', NULL, '2023-06-09 08:32:57', '{\"SucceededAt\":\"2023-06-09T08:32:57.1291660Z\",\"PerformanceDuration\":\"2107\",\"Latency\":\"10021\"}'),
(1179, 215, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:33:06', '{\"EnqueuedAt\":\"2023-06-09T08:33:05.9362390Z\",\"Queue\":\"default\"}'),
(1180, 216, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:33:06', '{\"EnqueuedAt\":\"2023-06-09T08:33:05.9418110Z\",\"Queue\":\"default\"}'),
(1181, 217, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:33:06', '{\"EnqueuedAt\":\"2023-06-09T08:33:05.9481460Z\",\"Queue\":\"default\"}'),
(1182, 215, 'Processing', NULL, '2023-06-09 08:33:12', '{\"StartedAt\":\"2023-06-09T08:33:11.6831330Z\",\"ServerId\":\"118fda29-bc88-4585-8a51-c4e1180d926f\",\"WorkerId\":\"e0692d89-64a5-44dc-85f9-f9088b4ed58f\"}'),
(1183, 216, 'Processing', NULL, '2023-06-09 08:33:12', '{\"StartedAt\":\"2023-06-09T08:33:12.0174500Z\",\"ServerId\":\"118fda29-bc88-4585-8a51-c4e1180d926f\",\"WorkerId\":\"c065ba65-a8bb-4438-8d98-f79ca60ab4bc\"}'),
(1184, 217, 'Processing', NULL, '2023-06-09 08:33:12', '{\"StartedAt\":\"2023-06-09T08:33:12.1492900Z\",\"ServerId\":\"118fda29-bc88-4585-8a51-c4e1180d926f\",\"WorkerId\":\"5c2ba18c-c872-4c79-b8fa-65bb88f01441\"}'),
(1185, 207, 'Failed', 'An exception occurred during performance of the job.', '2023-06-09 08:33:39', '{\"FailedAt\":\"2023-06-09T08:33:38.5075070Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c1e::6c]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String message) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 50\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"118fda29-bc88-4585-8a51-c4e1180d926f\"}'),
(1186, 208, 'Failed', 'An exception occurred during performance of the job.', '2023-06-09 08:33:39', '{\"FailedAt\":\"2023-06-09T08:33:38.5074990Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c1e::6c]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"118fda29-bc88-4585-8a51-c4e1180d926f\"}'),
(1187, 206, 'Failed', 'An exception occurred during performance of the job.', '2023-06-09 08:33:39', '{\"FailedAt\":\"2023-06-09T08:33:38.5075100Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c1e::6c]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String message) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 50\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"118fda29-bc88-4585-8a51-c4e1180d926f\"}'),
(1188, 206, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-09 08:33:39', '{\"EnqueueAt\":\"2023-06-09T08:34:21.5131700Z\",\"ScheduledAt\":\"2023-06-09T08:33:38.5131700Z\"}'),
(1189, 207, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-09 08:33:39', '{\"EnqueueAt\":\"2023-06-09T08:34:07.5131580Z\",\"ScheduledAt\":\"2023-06-09T08:33:38.5131580Z\"}'),
(1190, 208, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-09 08:33:39', '{\"EnqueueAt\":\"2023-06-09T08:34:15.5131640Z\",\"ScheduledAt\":\"2023-06-09T08:33:38.5131640Z\"}'),
(1191, 209, 'Failed', 'An exception occurred during performance of the job.', '2023-06-09 08:33:39', '{\"FailedAt\":\"2023-06-09T08:33:38.5556630Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c1e::6c]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String message) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 50\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"118fda29-bc88-4585-8a51-c4e1180d926f\"}'),
(1192, 209, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-09 08:33:39', '{\"EnqueueAt\":\"2023-06-09T08:33:55.5576940Z\",\"ScheduledAt\":\"2023-06-09T08:33:38.5576940Z\"}'),
(1193, 214, 'Failed', 'An exception occurred during performance of the job.', '2023-06-09 08:34:12', '{\"FailedAt\":\"2023-06-09T08:34:12.2814260Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c1e::6c]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String message) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 50\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"118fda29-bc88-4585-8a51-c4e1180d926f\"}'),
(1194, 213, 'Failed', 'An exception occurred during performance of the job.', '2023-06-09 08:34:12', '{\"FailedAt\":\"2023-06-09T08:34:12.2815370Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c1e::6c]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String message) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 50\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"118fda29-bc88-4585-8a51-c4e1180d926f\"}'),
(1195, 212, 'Failed', 'An exception occurred during performance of the job.', '2023-06-09 08:34:12', '{\"FailedAt\":\"2023-06-09T08:34:12.2815030Z\",\"ExceptionType\":\"System.Net.Mail.SmtpException\",\"ExceptionMessage\":\"Failure sending mail.\",\"ExceptionDetails\":\"System.Net.Mail.SmtpException: Failure sending mail.\\n ---> System.Net.Internals.SocketExceptionFactory+ExtendedSocketException (65): No route to host [2a00:1450:4010:c1e::6c]:587\\n   at System.Net.Sockets.Socket.DoConnect(EndPoint endPointSnapshot, SocketAddress socketAddress)\\n   at System.Net.Sockets.Socket.Connect(EndPoint remoteEP)\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n--- End of stack trace from previous location ---\\n   at System.Net.Sockets.Socket.Connect(IPAddress[] addresses, Int32 port)\\n   at System.Net.Sockets.Socket.Connect(String host, Int32 port)\\n   at System.Net.Sockets.TcpClient.Connect(String hostname, Int32 port)\\n   at System.Net.Mail.SmtpConnection.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpTransport.GetConnection(String host, Int32 port)\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   --- End of inner exception stack trace ---\\n   at System.Net.Mail.SmtpClient.Send(MailMessage message)\\n   at AlfaKuryer.Infrastucture.ExtornerlServices.MailService.Send(String to, String link, String name) in /Users/ehedtagiyev/Desktop/AlfaKuryer-main/Src/Infrastucture/AlfaKuryer.Infrastucture/ExtornerlServices/MailService.cs:line 33\\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\\n   at System.Reflection.MethodInvoker.Invoke(Object obj, IntPtr* args, BindingFlags invokeAttr)\",\"ServerId\":\"118fda29-bc88-4585-8a51-c4e1180d926f\"}'),
(1196, 213, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-09 08:34:12', '{\"EnqueueAt\":\"2023-06-09T08:34:46.2854280Z\",\"ScheduledAt\":\"2023-06-09T08:34:12.2854280Z\"}'),
(1197, 212, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-09 08:34:12', '{\"EnqueueAt\":\"2023-06-09T08:34:41.2853590Z\",\"ScheduledAt\":\"2023-06-09T08:34:12.2853590Z\"}'),
(1198, 214, 'Scheduled', 'Retry attempt 1 of 10: Failure sending mail.', '2023-06-09 08:34:12', '{\"EnqueueAt\":\"2023-06-09T08:34:43.2853590Z\",\"ScheduledAt\":\"2023-06-09T08:34:12.2853590Z\"}'),
(1199, 206, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:35:52', '{\"EnqueuedAt\":\"2023-06-09T08:35:52.2450950Z\",\"Queue\":\"default\"}'),
(1200, 167, 'Processing', NULL, '2023-06-09 08:35:52', '{\"StartedAt\":\"2023-06-09T08:35:52.1958130Z\",\"ServerId\":\"195bbb10-9c7e-40e3-80d5-a2e57ed8ff75\",\"WorkerId\":\"adf769bc-9e1b-46dd-b17d-564d2a2a43f7\"}'),
(1201, 207, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:35:52', '{\"EnqueuedAt\":\"2023-06-09T08:35:52.2632710Z\",\"Queue\":\"default\"}'),
(1202, 208, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:35:52', '{\"EnqueuedAt\":\"2023-06-09T08:35:52.2960940Z\",\"Queue\":\"default\"}'),
(1203, 209, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:35:52', '{\"EnqueuedAt\":\"2023-06-09T08:35:52.3018640Z\",\"Queue\":\"default\"}'),
(1204, 212, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:35:52', '{\"EnqueuedAt\":\"2023-06-09T08:35:52.3053090Z\",\"Queue\":\"default\"}'),
(1205, 213, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:35:52', '{\"EnqueuedAt\":\"2023-06-09T08:35:52.3113890Z\",\"Queue\":\"default\"}'),
(1206, 214, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 08:35:52', '{\"EnqueuedAt\":\"2023-06-09T08:35:52.3150750Z\",\"Queue\":\"default\"}'),
(1207, 167, 'Succeeded', NULL, '2023-06-09 08:35:55', '{\"SucceededAt\":\"2023-06-09T08:35:54.8376810Z\",\"PerformanceDuration\":\"2574\",\"Latency\":\"4618262\"}'),
(1208, 206, 'Processing', NULL, '2023-06-09 08:35:55', '{\"StartedAt\":\"2023-06-09T08:35:54.8730230Z\",\"ServerId\":\"195bbb10-9c7e-40e3-80d5-a2e57ed8ff75\",\"WorkerId\":\"adf769bc-9e1b-46dd-b17d-564d2a2a43f7\"}'),
(1209, 206, 'Succeeded', NULL, '2023-06-09 08:35:57', '{\"SucceededAt\":\"2023-06-09T08:35:56.8828510Z\",\"PerformanceDuration\":\"2002\",\"Latency\":\"225880\"}'),
(1210, 207, 'Processing', NULL, '2023-06-09 08:35:57', '{\"StartedAt\":\"2023-06-09T08:35:56.9027550Z\",\"ServerId\":\"195bbb10-9c7e-40e3-80d5-a2e57ed8ff75\",\"WorkerId\":\"adf769bc-9e1b-46dd-b17d-564d2a2a43f7\"}'),
(1211, 207, 'Succeeded', NULL, '2023-06-09 08:35:58', '{\"SucceededAt\":\"2023-06-09T08:35:58.4125300Z\",\"PerformanceDuration\":\"1502\",\"Latency\":\"226909\"}'),
(1212, 208, 'Processing', NULL, '2023-06-09 08:35:58', '{\"StartedAt\":\"2023-06-09T08:35:58.4220070Z\",\"ServerId\":\"195bbb10-9c7e-40e3-80d5-a2e57ed8ff75\",\"WorkerId\":\"adf769bc-9e1b-46dd-b17d-564d2a2a43f7\"}'),
(1213, 208, 'Succeeded', NULL, '2023-06-09 08:36:00', '{\"SucceededAt\":\"2023-06-09T08:36:00.2605640Z\",\"PerformanceDuration\":\"1835\",\"Latency\":\"226425\"}'),
(1214, 209, 'Processing', NULL, '2023-06-09 08:36:00', '{\"StartedAt\":\"2023-06-09T08:36:00.2784140Z\",\"ServerId\":\"195bbb10-9c7e-40e3-80d5-a2e57ed8ff75\",\"WorkerId\":\"adf769bc-9e1b-46dd-b17d-564d2a2a43f7\"}'),
(1215, 209, 'Succeeded', NULL, '2023-06-09 08:36:02', '{\"SucceededAt\":\"2023-06-09T08:36:02.0208510Z\",\"PerformanceDuration\":\"1738\",\"Latency\":\"227282\"}'),
(1216, 212, 'Processing', NULL, '2023-06-09 08:36:02', '{\"StartedAt\":\"2023-06-09T08:36:02.0918300Z\",\"ServerId\":\"195bbb10-9c7e-40e3-80d5-a2e57ed8ff75\",\"WorkerId\":\"adf769bc-9e1b-46dd-b17d-564d2a2a43f7\"}'),
(1217, 212, 'Succeeded', NULL, '2023-06-09 08:36:04', '{\"SucceededAt\":\"2023-06-09T08:36:04.1490970Z\",\"PerformanceDuration\":\"2052\",\"Latency\":\"196096\"}'),
(1218, 213, 'Processing', NULL, '2023-06-09 08:36:04', '{\"StartedAt\":\"2023-06-09T08:36:04.1678590Z\",\"ServerId\":\"195bbb10-9c7e-40e3-80d5-a2e57ed8ff75\",\"WorkerId\":\"adf769bc-9e1b-46dd-b17d-564d2a2a43f7\"}'),
(1219, 213, 'Succeeded', NULL, '2023-06-09 08:36:06', '{\"SucceededAt\":\"2023-06-09T08:36:06.1020530Z\",\"PerformanceDuration\":\"1928\",\"Latency\":\"197173\"}'),
(1220, 214, 'Processing', NULL, '2023-06-09 08:36:06', '{\"StartedAt\":\"2023-06-09T08:36:06.1155410Z\",\"ServerId\":\"195bbb10-9c7e-40e3-80d5-a2e57ed8ff75\",\"WorkerId\":\"adf769bc-9e1b-46dd-b17d-564d2a2a43f7\"}'),
(1221, 215, 'Processing', NULL, '2023-06-09 09:03:13', '{\"StartedAt\":\"2023-06-09T09:03:13.0322620Z\",\"ServerId\":\"a7083019-7ad1-458b-8711-09f1e8ec8196\",\"WorkerId\":\"4615234d-ec7f-4dd2-9163-86daf58c2fa0\"}'),
(1222, 216, 'Processing', NULL, '2023-06-09 09:03:13', '{\"StartedAt\":\"2023-06-09T09:03:13.0322360Z\",\"ServerId\":\"a7083019-7ad1-458b-8711-09f1e8ec8196\",\"WorkerId\":\"3c6f82f0-4b19-4f7f-9aac-b640ad896816\"}'),
(1223, 217, 'Processing', NULL, '2023-06-09 09:03:13', '{\"StartedAt\":\"2023-06-09T09:03:13.0322510Z\",\"ServerId\":\"a7083019-7ad1-458b-8711-09f1e8ec8196\",\"WorkerId\":\"f5e22dd9-8483-4a39-9c40-f0830e6a8225\"}'),
(1224, 214, 'Processing', NULL, '2023-06-09 09:06:18', '{\"StartedAt\":\"2023-06-09T09:06:18.0633250Z\",\"ServerId\":\"900debdc-fa50-4b26-8baa-a3afa256ff82\",\"WorkerId\":\"4221bd39-5db8-4fc5-84dd-561d1eb86afa\"}'),
(1225, 214, 'Succeeded', NULL, '2023-06-09 09:06:21', '{\"SucceededAt\":\"2023-06-09T09:06:20.6013760Z\",\"PerformanceDuration\":\"2482\",\"Latency\":\"2008118\"}'),
(1226, 215, 'Processing', NULL, '2023-06-09 09:33:20', '{\"StartedAt\":\"2023-06-09T09:33:20.2538280Z\",\"ServerId\":\"06236f3a-a50a-44c0-8fb4-9a1e9c4ddfa3\",\"WorkerId\":\"5fa7a23e-4d1d-4428-8dc0-b16a496a773d\"}');
INSERT INTO `Hangfire_State` (`Id`, `JobId`, `Name`, `Reason`, `CreatedAt`, `Data`) VALUES
(1227, 217, 'Processing', NULL, '2023-06-09 09:33:20', '{\"StartedAt\":\"2023-06-09T09:33:20.2538210Z\",\"ServerId\":\"06236f3a-a50a-44c0-8fb4-9a1e9c4ddfa3\",\"WorkerId\":\"45565e3d-6c40-4ad9-9d1d-c321a459dd1a\"}'),
(1228, 216, 'Processing', NULL, '2023-06-09 09:33:20', '{\"StartedAt\":\"2023-06-09T09:33:20.2538340Z\",\"ServerId\":\"06236f3a-a50a-44c0-8fb4-9a1e9c4ddfa3\",\"WorkerId\":\"80b76bb3-f635-46e9-986f-04ce444c4c72\"}'),
(1229, 216, 'Succeeded', NULL, '2023-06-09 09:33:23', '{\"SucceededAt\":\"2023-06-09T09:33:22.8830140Z\",\"PerformanceDuration\":\"2561\",\"Latency\":\"3628320\"}'),
(1230, 217, 'Succeeded', NULL, '2023-06-09 09:33:23', '{\"SucceededAt\":\"2023-06-09T09:33:23.0873350Z\",\"PerformanceDuration\":\"2766\",\"Latency\":\"3627320\"}'),
(1231, 215, 'Succeeded', NULL, '2023-06-09 09:33:24', '{\"SucceededAt\":\"2023-06-09T09:33:23.5969380Z\",\"PerformanceDuration\":\"3276\",\"Latency\":\"3629320\"}'),
(1232, 218, 'Scheduled', NULL, '2023-06-09 11:20:39', '{\"EnqueueAt\":\"2023-06-09T11:20:39.8513720Z\",\"ScheduledAt\":\"2023-06-09T11:20:38.8513970Z\"}'),
(1233, 218, 'Enqueued', 'Triggered by DelayedJobScheduler', '2023-06-09 11:20:45', '{\"EnqueuedAt\":\"2023-06-09T11:20:45.1867660Z\",\"Queue\":\"default\"}'),
(1234, 218, 'Processing', NULL, '2023-06-09 11:21:00', '{\"StartedAt\":\"2023-06-09T11:21:00.1723720Z\",\"ServerId\":\"cc7ebc66-5b89-4c6e-be6d-6afd580a925c\",\"WorkerId\":\"d19bec9d-52fe-4ff7-a9a2-b5d4a3c01f7a\"}'),
(1235, 218, 'Succeeded', NULL, '2023-06-09 11:21:03', '{\"SucceededAt\":\"2023-06-09T11:21:02.7099520Z\",\"PerformanceDuration\":\"2520\",\"Latency\":\"21188\"}');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `HelpLanguages`
--

CREATE TABLE `HelpLanguages` (
  `Id` int NOT NULL,
  `Title` longtext NOT NULL,
  `Description` longtext NOT NULL,
  `Code` longtext NOT NULL,
  `HelpId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `HelpLanguages`
--

INSERT INTO `HelpLanguages` (`Id`, `Title`, `Description`, `Code`, `HelpId`) VALUES
(1, 'İT xidmətləri necə sifariş edə bilərəm? ', 'İT xidmətləri sifariş etmək üçün, müvafiq şirkətin veb saytına daxil olun və \"Sifariş ver\" və ya \"Əlaqə\" bölmələrindən birini seçin. Şirkətə elektron poçt göndərərək və ya telefonla əlaqə quraraq sifarişinizi yerinə yetirmələri üçün tələblərinizi izah edin.', 'az-AZ', 1),
(2, 'How to Order IT Services?', 'To order IT services, visit the relevant company\'s website and choose either the \"Order Now\" or \"Contact\" section. Explain your requirements to the company by sending an email or contacting them by phone to have your order fulfilled.', 'en-US', 1),
(3, 'Как заказать ИТ-услуги?', 'Чтобы заказать ИТ-услуги, посетите веб-сайт соответствующей компании и выберите раздел «Заказать сейчас» или «Контакты». Объясните свои требования компании, отправив электронное письмо или связавшись с ними по телефону, чтобы выполнить ваш заказ.', 'ru-RU', 1),
(4, ' Azərbaycan dili ilə örnəkləyək:', ' İT xidmətlərini sifariş etmək üçün, şirkətin əlaqə məlumatlarını tapın və əlaqə saxlayın. Şirkət nümayəndəsi sizinlə əlaqə quracaq və sifarişiniz haqqında ətraflı məlumat vermək üçün sizinlə razılaşacaqdır.', 'az-AZ', 2),
(5, 'How to Order IT Services? -  ', 'How to Order IT Services? -  ', 'en-US', 2),
(6, 'ак заказать ИТ-услуги?', 'Как заказать ИТ-услуги? - Найдите контактную информацию компании и свяжитесь с ними. Представитель компании свяжется с вами и организует обсуждение, чтобы предоставить подробную информацию о вашем заказе.', 'ru-RU', 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Helps`
--

CREATE TABLE `Helps` (
  `Id` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `Helps`
--

INSERT INTO `Helps` (`Id`, `IsDeleted`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 0, '2023-06-01 20:26:54.558413', '2023-06-09 18:12:43.312303'),
(2, 0, '2023-06-09 18:14:20.976554', '2023-06-09 18:24:27.043761');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Messages`
--

CREATE TABLE `Messages` (
  `Id` int NOT NULL,
  `FullName` longtext NOT NULL,
  `Email` longtext NOT NULL,
  `PhoneNumber` longtext NOT NULL,
  `Subject` longtext NOT NULL,
  `Content` longtext NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `Messages`
--

INSERT INTO `Messages` (`Id`, `FullName`, `Email`, `PhoneNumber`, `Subject`, `Content`, `IsDeleted`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 'Ahad Taghiyev', 'ahadvt@code.edu.az', '0515619425', 'Taghiyev', 'asjgcdfjsaydg asyj d', 0, '2023-06-01 20:29:40.159292', '0001-01-01 00:00:00.000000'),
(2, 'Ahad Taghiyev', 'ahadvt@code.edu.az', '0515619425', 'reterg', 'dfsgsd', 0, '2023-06-01 21:13:00.272615', '0001-01-01 00:00:00.000000');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `News`
--

CREATE TABLE `News` (
  `Id` int NOT NULL,
  `Image` longtext NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `News`
--

INSERT INTO `News` (`Id`, `Image`, `IsDeleted`, `CreatedAt`, `UpdatedAt`) VALUES
(1, '778cd519-cfb2-485b-a846-6190421c3b8calfa kuryer logo.png', 0, '2023-06-01 20:45:45.116304', '0001-01-01 00:00:00.000000');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `NewsLanguages`
--

CREATE TABLE `NewsLanguages` (
  `Id` int NOT NULL,
  `Title` longtext NOT NULL,
  `Description` longtext NOT NULL,
  `Code` longtext NOT NULL,
  `NewsId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `NewsLanguages`
--

INSERT INTO `NewsLanguages` (`Id`, `Title`, `Description`, `Code`, `NewsId`) VALUES
(1, 'AZBASLiq', 'İT xidmətləri təşkilatlara məlumat və biznes proseslərinin yaradılması, idarə edilməsi və optimallaşdırılması və ya onlara çıxış imkanı vermək üçün biznes və texniki təcrübənin tətbiqinə aiddir.', 'az-AZ', 1),
(2, 'ENBASLIQ', 'IT services refers to the application of business and technical expertise to enable organizations in the creation, management and optimization of or access to information and business processes.', 'en-US', 1),
(3, 'RUBASLIQ', 'TəsvirRuTəsvirRuTəsvirRuTəsvirRuTəsvirRuTəsvirRuTəsvirRuTəsvirRuTəsvirRu', 'ru-RU', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Orders`
--

CREATE TABLE `Orders` (
  `Id` int NOT NULL,
  `CustomerId` varchar(255) DEFAULT NULL,
  `CourierId` varchar(255) DEFAULT NULL,
  `ForeignCourierId` varchar(255) DEFAULT NULL,
  `ToPhoneNumber` longtext NOT NULL,
  `ToAdress` longtext NOT NULL,
  `FromAdress` longtext NOT NULL,
  `ToFullname` longtext NOT NULL,
  `OrderFromCityId` int DEFAULT NULL,
  `OrderFromDistrictId` int DEFAULT NULL,
  `OrderToCityId` int NOT NULL,
  `OrderToDistrictId` int DEFAULT NULL,
  `Price` double NOT NULL,
  `Kq` double NOT NULL,
  `PackageCount` int NOT NULL,
  `IsInCity` tinyint(1) NOT NULL DEFAULT '0',
  `IsAccepted` tinyint(1) NOT NULL DEFAULT '0',
  `IsCourierOnRoad` tinyint(1) NOT NULL DEFAULT '0',
  `IsCourierArriveForTake` tinyint(1) NOT NULL DEFAULT '0',
  `IsCourierTaked` tinyint(1) NOT NULL DEFAULT '0',
  `IsInStorage` tinyint(1) NOT NULL DEFAULT '0',
  `IsOutStorage` tinyint(1) NOT NULL DEFAULT '0',
  `IsOnroadToForeignCity` tinyint(1) NOT NULL DEFAULT '0',
  `IsForeignCourierAccepted` tinyint(1) NOT NULL DEFAULT '0',
  `IsInForeignCity` tinyint(1) NOT NULL DEFAULT '0',
  `IsOnRoad` tinyint(1) NOT NULL DEFAULT '0',
  `IsCourierArrive` tinyint(1) NOT NULL DEFAULT '0',
  `IsDelivered` tinyint(1) NOT NULL DEFAULT '0',
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) NOT NULL,
  `ApplicationUserId` varchar(255) DEFAULT NULL,
  `IsCash` tinyint(1) NOT NULL DEFAULT '0',
  `IsFast` tinyint(1) NOT NULL DEFAULT '0',
  `IsPaid` tinyint(1) NOT NULL DEFAULT '0',
  `FromFullName` longtext,
  `FromPhoneNumber` longtext,
  `OrderFromCassir` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `Orders`
--

INSERT INTO `Orders` (`Id`, `CustomerId`, `CourierId`, `ForeignCourierId`, `ToPhoneNumber`, `ToAdress`, `FromAdress`, `ToFullname`, `OrderFromCityId`, `OrderFromDistrictId`, `OrderToCityId`, `OrderToDistrictId`, `Price`, `Kq`, `PackageCount`, `IsInCity`, `IsAccepted`, `IsCourierOnRoad`, `IsCourierArriveForTake`, `IsCourierTaked`, `IsInStorage`, `IsOutStorage`, `IsOnroadToForeignCity`, `IsForeignCourierAccepted`, `IsInForeignCity`, `IsOnRoad`, `IsCourierArrive`, `IsDelivered`, `IsDeleted`, `CreatedAt`, `UpdatedAt`, `ApplicationUserId`, `IsCash`, `IsFast`, `IsPaid`, `FromFullName`, `FromPhoneNumber`, `OrderFromCassir`) VALUES
(57, 'feb82fd5-8745-4e0a-bc81-d84ac388fbde', 'e0e54582-d696-442f-9514-6356dc585ea9', '194ae339-73df-4d9c-b7d4-5877bbc900f3', '0515619425', 'tes tes test', 'baku', 'Ahad Taghiyev', 1, 2, 2, 5, 12, 9, 3, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, '2023-06-09 12:19:56.942578', '2023-06-09 12:32:47.195021', NULL, 1, 0, 0, NULL, NULL, 0),
(58, 'feb82fd5-8745-4e0a-bc81-d84ac388fbde', 'e0e54582-d696-442f-9514-6356dc585ea9', '194ae339-73df-4d9c-b7d4-5877bbc900f3', '0515619425', 'tes tes test', 'baku', 'Ahad Taghiyev', 1, 2, 2, 5, 12, 9, 3, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, '2023-06-09 12:20:15.061004', '2023-06-09 12:32:52.909548', NULL, 1, 0, 0, NULL, NULL, 0),
(59, 'feb82fd5-8745-4e0a-bc81-d84ac388fbde', 'e0e54582-d696-442f-9514-6356dc585ea9', 'e0e54582-d696-442f-9514-6356dc585ea9', '0515619425', 'tes tes test', 'baku', 'Ahad Taghiyev', 1, 2, 1, 2, 6, 9, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, '2023-06-09 12:20:45.135259', '2023-06-09 12:32:12.603907', NULL, 1, 0, 0, NULL, NULL, 0),
(60, 'def65824-c0a1-4077-a3a1-0e7e2a97f69d', NULL, NULL, '0515619425', 'fdfgtrretdfsf', '222', 'Ahad Taghiyev', 1, 2, 2, 5, 4, 3, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-06-09 15:34:00.085987', '0001-01-01 00:00:00.000000', NULL, 1, 0, 0, NULL, NULL, 0),
(61, NULL, NULL, NULL, '0515619425', 'fdfgtrretdfsf', 'Anbar', 'Ahad Taghiyev', NULL, NULL, 1, 5, 6, 9, 3, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2023-06-09 17:03:32.092140', '0001-01-01 00:00:00.000000', NULL, 0, 0, 1, 'Ahad Taghiyev', '994515619425', 0),
(62, NULL, NULL, NULL, '0515619425', 'fdfgtrretdfsf', 'Anbar', 'Ahad Taghiyev', NULL, NULL, 2, 5, 6, 9, 3, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2023-06-09 17:03:54.391134', '0001-01-01 00:00:00.000000', NULL, 1, 0, 1, 'Ahad Taghiyev', '0515619425', 0),
(63, NULL, NULL, NULL, '0515619425', 'fdfgtrretdfsf', 'Anbar', 'Ahad Taghiyev', NULL, NULL, 2, 5, 6, 9, 3, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2023-06-09 17:16:10.131933', '0001-01-01 00:00:00.000000', NULL, 0, 0, 1, 'Ahad Taghiyev', '0515619425', 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `PriceForOrders`
--

CREATE TABLE `PriceForOrders` (
  `Id` int NOT NULL,
  `Kq` double NOT NULL,
  `Price` double NOT NULL,
  `UntilKq` double NOT NULL,
  `MinPrice` double NOT NULL,
  `Location` tinyint(1) NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) NOT NULL,
  `IsFast` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `PriceForOrders`
--

INSERT INTO `PriceForOrders` (`Id`, `Kq`, `Price`, `UntilKq`, `MinPrice`, `Location`, `IsDeleted`, `CreatedAt`, `UpdatedAt`, `IsFast`) VALUES
(3, 1, 1, 5, 2, 1, 0, '2023-06-08 00:52:05.000000', '2023-06-08 17:27:18.344526', 0),
(4, 1, 3, 5, 5, 1, 0, '2023-06-08 00:52:12.000000', '2023-06-08 23:14:22.158260', 1),
(5, 1, 2, 5, 4, 0, 0, '2023-06-08 00:52:18.000000', '2023-06-08 17:27:27.789998', 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Rates`
--

CREATE TABLE `Rates` (
  `Id` int NOT NULL,
  `From` longtext NOT NULL,
  `To` longtext NOT NULL,
  `Price` double NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) NOT NULL,
  `DeliveryMethod` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `Rates`
--

INSERT INTO `Rates` (`Id`, `From`, `To`, `Price`, `IsDeleted`, `CreatedAt`, `UpdatedAt`, `DeliveryMethod`) VALUES
(5, 'Şəhər Daxilindən', 'Şəhər Daxilinə', 5, 0, '2023-06-09 17:25:52.682215', '2023-06-09 17:35:31.461759', 'Sürətli çatdırılmada'),
(6, 'Şəhər Daxilindən', 'Şəhər Xaricinə', 5, 0, '2023-06-09 17:36:07.145725', '0001-01-01 00:00:00.000000', '24 saat ərzində');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Settings`
--

CREATE TABLE `Settings` (
  `Id` int NOT NULL,
  `Logo` longtext NOT NULL,
  `PhoneNumber1` longtext NOT NULL,
  `PhoneNumber2` longtext NOT NULL,
  `Email` longtext NOT NULL,
  `InstgaramLink` longtext NOT NULL,
  `FaceBookLink` longtext NOT NULL,
  `YoutubeLink` longtext NOT NULL,
  `Adress` longtext NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `Settings`
--

INSERT INTO `Settings` (`Id`, `Logo`, `PhoneNumber1`, `PhoneNumber2`, `Email`, `InstgaramLink`, `FaceBookLink`, `YoutubeLink`, `Adress`, `IsDeleted`, `CreatedAt`, `UpdatedAt`) VALUES
(1, '57ab0b23-4b6d-4ec5-975b-83e6cf56a946alfa kuryer logo.png', '+994708222290', '+994708222291', 'info@alfakuryer.az', 'info@alfakuryer.az', 'info@alfakuryer.az', 'info@alfakuryer.az', 'Baku', 0, '2023-06-01 15:48:32.742426', '2023-06-01 20:25:24.981262');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Slides`
--

CREATE TABLE `Slides` (
  `Id` int NOT NULL,
  `Logo` longtext NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `Slides`
--

INSERT INTO `Slides` (`Id`, `Logo`, `IsDeleted`, `CreatedAt`, `UpdatedAt`) VALUES
(1, '936837d9-c1da-42d8-92a4-c6b6112d8a41alfa kuryer logo.png', 0, '2023-06-01 20:28:20.415227', '0001-01-01 00:00:00.000000');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `UserPayments`
--

CREATE TABLE `UserPayments` (
  `Id` int NOT NULL,
  `CustomerId` longtext NOT NULL,
  `OrderNumber` int NOT NULL,
  `StatusId` longtext NOT NULL,
  `TotalPrice` double NOT NULL,
  `DateTime` datetime(6) NOT NULL,
  `IsPay` tinyint(1) NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `UserPayments`
--

INSERT INTO `UserPayments` (`Id`, `CustomerId`, `OrderNumber`, `StatusId`, `TotalPrice`, `DateTime`, `IsPay`, `IsDeleted`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 'A47518986', 548290, 'A46AE1B9180FE38C70A791AEB2A3EF78', 7, '2023-06-07 20:22:57.213917', 0, 0, '2023-06-08 00:22:57.220705', '0001-01-01 00:00:00.000000'),
(2, 'A47518986', 548291, 'FFE01A87330765BF36F1DAEB80B47C41', 3, '2023-06-07 20:24:57.058242', 0, 0, '2023-06-08 00:24:57.066260', '0001-01-01 00:00:00.000000'),
(3, 'A47518986', 548556, 'B8326EBDFD8126A3EFF04F0AE9315418', 7, '2023-06-08 16:58:32.660814', 0, 0, '2023-06-08 20:58:32.668943', '0001-01-01 00:00:00.000000');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `__EFMigrationsHistory`
--

CREATE TABLE `__EFMigrationsHistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `__EFMigrationsHistory`
--

INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`) VALUES
('20230601114600_inital', '7.0.5'),
('20230601124225_inital2', '7.0.5'),
('20230601124348_inital3', '7.0.5'),
('20230601124433_inital4', '7.0.5'),
('20230601125823_inital5', '7.0.5'),
('20230601130056_inital6', '7.0.5'),
('20230601130322_inital7', '7.0.5'),
('20230602123506_updateduser9', '7.0.5'),
('20230602133151_updateduser10', '7.0.5'),
('20230602133305_updateduser11', '7.0.5'),
('20230603114223_updateduser12', '7.0.5'),
('20230603114938_addeduseradress', '7.0.5'),
('20230603115616_updateduser112', '7.0.5'),
('20230603120410_updateduser13', '7.0.5'),
('20230603145548_updateduser14', '7.0.5'),
('20230604095010_updateduser15', '7.0.5'),
('20230606103514_addedtousertabletoiscashandisfasttable', '7.0.5'),
('20230607183952_addedtousertabletoiscashandIspaid', '7.0.5'),
('20230607200445_addedpayment', '7.0.5'),
('20230607204840_addedcouriersalary', '7.0.5'),
('20230608152231_aadedorderfromstorage', '7.0.5'),
('20230608153230_addedtousertabletoiscashandIspaid2', '7.0.5'),
('20230609081837_addeduserbalt', '7.0.5'),
('20230609083031_addeduserbalt2', '7.0.5'),
('20230609125624_addecassir', '7.0.5');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `Adresses`
--
ALTER TABLE `Adresses`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Adresses_ApplicationUserId` (`ApplicationUserId`);

--
-- Tablo için indeksler `ApplicationUserDistricts`
--
ALTER TABLE `ApplicationUserDistricts`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_ApplicationUserDistricts_ApplicationUserId` (`ApplicationUserId`),
  ADD KEY `IX_ApplicationUserDistricts_CityId` (`CityId`),
  ADD KEY `IX_ApplicationUserDistricts_DistrictId` (`DistrictId`);

--
-- Tablo için indeksler `AspNetRoleClaims`
--
ALTER TABLE `AspNetRoleClaims`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`);

--
-- Tablo için indeksler `AspNetRoles`
--
ALTER TABLE `AspNetRoles`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `RoleNameIndex` (`NormalizedName`);

--
-- Tablo için indeksler `AspNetUserClaims`
--
ALTER TABLE `AspNetUserClaims`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_AspNetUserClaims_UserId` (`UserId`);

--
-- Tablo için indeksler `AspNetUserLogins`
--
ALTER TABLE `AspNetUserLogins`
  ADD PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  ADD KEY `IX_AspNetUserLogins_UserId` (`UserId`);

--
-- Tablo için indeksler `AspNetUserRoles`
--
ALTER TABLE `AspNetUserRoles`
  ADD PRIMARY KEY (`UserId`,`RoleId`),
  ADD KEY `IX_AspNetUserRoles_RoleId` (`RoleId`);

--
-- Tablo için indeksler `AspNetUsers`
--
ALTER TABLE `AspNetUsers`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  ADD KEY `EmailIndex` (`NormalizedEmail`),
  ADD KEY `IX_AspNetUsers_CityId` (`CityId`);

--
-- Tablo için indeksler `AspNetUserTokens`
--
ALTER TABLE `AspNetUserTokens`
  ADD PRIMARY KEY (`UserId`,`LoginProvider`,`Name`);

--
-- Tablo için indeksler `CassirBalances`
--
ALTER TABLE `CassirBalances`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_CassirBalances_ApplicationUserId` (`ApplicationUserId`);

--
-- Tablo için indeksler `Cities`
--
ALTER TABLE `Cities`
  ADD PRIMARY KEY (`Id`);

--
-- Tablo için indeksler `CourierBalances`
--
ALTER TABLE `CourierBalances`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_CourierBalances_ApplicationUserId` (`ApplicationUserId`),
  ADD KEY `IX_CourierBalances_OrderId` (`OrderId`);

--
-- Tablo için indeksler `Districts`
--
ALTER TABLE `Districts`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Districts_CityId` (`CityId`);

--
-- Tablo için indeksler `Hangfire_AggregatedCounter`
--
ALTER TABLE `Hangfire_AggregatedCounter`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `IX_CounterAggregated_Key` (`Key`);

--
-- Tablo için indeksler `Hangfire_Counter`
--
ALTER TABLE `Hangfire_Counter`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Counter_Key` (`Key`);

--
-- Tablo için indeksler `Hangfire_Hash`
--
ALTER TABLE `Hangfire_Hash`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `IX_Hash_Key_Field` (`Key`,`Field`);

--
-- Tablo için indeksler `Hangfire_Job`
--
ALTER TABLE `Hangfire_Job`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Job_StateName` (`StateName`);

--
-- Tablo için indeksler `Hangfire_JobParameter`
--
ALTER TABLE `Hangfire_JobParameter`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `IX_JobParameter_JobId_Name` (`JobId`,`Name`),
  ADD KEY `FK_JobParameter_Job` (`JobId`);

--
-- Tablo için indeksler `Hangfire_JobQueue`
--
ALTER TABLE `Hangfire_JobQueue`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_JobQueue_QueueAndFetchedAt` (`Queue`,`FetchedAt`);

--
-- Tablo için indeksler `Hangfire_JobState`
--
ALTER TABLE `Hangfire_JobState`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_JobState_Job` (`JobId`);

--
-- Tablo için indeksler `Hangfire_List`
--
ALTER TABLE `Hangfire_List`
  ADD PRIMARY KEY (`Id`);

--
-- Tablo için indeksler `Hangfire_Server`
--
ALTER TABLE `Hangfire_Server`
  ADD PRIMARY KEY (`Id`);

--
-- Tablo için indeksler `Hangfire_Set`
--
ALTER TABLE `Hangfire_Set`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `IX_Set_Key_Value` (`Key`,`Value`);

--
-- Tablo için indeksler `Hangfire_State`
--
ALTER TABLE `Hangfire_State`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_HangFire_State_Job` (`JobId`);

--
-- Tablo için indeksler `HelpLanguages`
--
ALTER TABLE `HelpLanguages`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_HelpLanguages_HelpId` (`HelpId`);

--
-- Tablo için indeksler `Helps`
--
ALTER TABLE `Helps`
  ADD PRIMARY KEY (`Id`);

--
-- Tablo için indeksler `Messages`
--
ALTER TABLE `Messages`
  ADD PRIMARY KEY (`Id`);

--
-- Tablo için indeksler `News`
--
ALTER TABLE `News`
  ADD PRIMARY KEY (`Id`);

--
-- Tablo için indeksler `NewsLanguages`
--
ALTER TABLE `NewsLanguages`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_NewsLanguages_NewsId` (`NewsId`);

--
-- Tablo için indeksler `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Orders_CourierId` (`CourierId`),
  ADD KEY `IX_Orders_CustomerId` (`CustomerId`),
  ADD KEY `IX_Orders_ForeignCourierId` (`ForeignCourierId`),
  ADD KEY `IX_Orders_OrderFromCityId` (`OrderFromCityId`),
  ADD KEY `IX_Orders_OrderFromDistrictId` (`OrderFromDistrictId`),
  ADD KEY `IX_Orders_OrderToCityId` (`OrderToCityId`),
  ADD KEY `IX_Orders_OrderToDistrictId` (`OrderToDistrictId`),
  ADD KEY `IX_Orders_ApplicationUserId` (`ApplicationUserId`);

--
-- Tablo için indeksler `PriceForOrders`
--
ALTER TABLE `PriceForOrders`
  ADD PRIMARY KEY (`Id`);

--
-- Tablo için indeksler `Rates`
--
ALTER TABLE `Rates`
  ADD PRIMARY KEY (`Id`);

--
-- Tablo için indeksler `Settings`
--
ALTER TABLE `Settings`
  ADD PRIMARY KEY (`Id`);

--
-- Tablo için indeksler `Slides`
--
ALTER TABLE `Slides`
  ADD PRIMARY KEY (`Id`);

--
-- Tablo için indeksler `UserPayments`
--
ALTER TABLE `UserPayments`
  ADD PRIMARY KEY (`Id`);

--
-- Tablo için indeksler `__EFMigrationsHistory`
--
ALTER TABLE `__EFMigrationsHistory`
  ADD PRIMARY KEY (`MigrationId`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `Adresses`
--
ALTER TABLE `Adresses`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Tablo için AUTO_INCREMENT değeri `ApplicationUserDistricts`
--
ALTER TABLE `ApplicationUserDistricts`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Tablo için AUTO_INCREMENT değeri `AspNetRoleClaims`
--
ALTER TABLE `AspNetRoleClaims`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `AspNetUserClaims`
--
ALTER TABLE `AspNetUserClaims`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `CassirBalances`
--
ALTER TABLE `CassirBalances`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `Cities`
--
ALTER TABLE `Cities`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `CourierBalances`
--
ALTER TABLE `CourierBalances`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `Districts`
--
ALTER TABLE `Districts`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `Hangfire_AggregatedCounter`
--
ALTER TABLE `Hangfire_AggregatedCounter`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- Tablo için AUTO_INCREMENT değeri `Hangfire_Counter`
--
ALTER TABLE `Hangfire_Counter`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=667;

--
-- Tablo için AUTO_INCREMENT değeri `Hangfire_Hash`
--
ALTER TABLE `Hangfire_Hash`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `Hangfire_Job`
--
ALTER TABLE `Hangfire_Job`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=219;

--
-- Tablo için AUTO_INCREMENT değeri `Hangfire_JobParameter`
--
ALTER TABLE `Hangfire_JobParameter`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=522;

--
-- Tablo için AUTO_INCREMENT değeri `Hangfire_JobQueue`
--
ALTER TABLE `Hangfire_JobQueue`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=308;

--
-- Tablo için AUTO_INCREMENT değeri `Hangfire_JobState`
--
ALTER TABLE `Hangfire_JobState`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `Hangfire_List`
--
ALTER TABLE `Hangfire_List`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `Hangfire_Set`
--
ALTER TABLE `Hangfire_Set`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=389;

--
-- Tablo için AUTO_INCREMENT değeri `Hangfire_State`
--
ALTER TABLE `Hangfire_State`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1236;

--
-- Tablo için AUTO_INCREMENT değeri `HelpLanguages`
--
ALTER TABLE `HelpLanguages`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `Helps`
--
ALTER TABLE `Helps`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `Messages`
--
ALTER TABLE `Messages`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `News`
--
ALTER TABLE `News`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `NewsLanguages`
--
ALTER TABLE `NewsLanguages`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `Orders`
--
ALTER TABLE `Orders`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- Tablo için AUTO_INCREMENT değeri `PriceForOrders`
--
ALTER TABLE `PriceForOrders`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `Rates`
--
ALTER TABLE `Rates`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `Settings`
--
ALTER TABLE `Settings`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `Slides`
--
ALTER TABLE `Slides`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `UserPayments`
--
ALTER TABLE `UserPayments`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `Adresses`
--
ALTER TABLE `Adresses`
  ADD CONSTRAINT `FK_Adresses_AspNetUsers_ApplicationUserId` FOREIGN KEY (`ApplicationUserId`) REFERENCES `AspNetUsers` (`Id`);

--
-- Tablo kısıtlamaları `ApplicationUserDistricts`
--
ALTER TABLE `ApplicationUserDistricts`
  ADD CONSTRAINT `FK_ApplicationUserDistricts_AspNetUsers_ApplicationUserId` FOREIGN KEY (`ApplicationUserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_ApplicationUserDistricts_Cities_CityId` FOREIGN KEY (`CityId`) REFERENCES `Cities` (`Id`),
  ADD CONSTRAINT `FK_ApplicationUserDistricts_Districts_DistrictId` FOREIGN KEY (`DistrictId`) REFERENCES `Districts` (`Id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `AspNetRoleClaims`
--
ALTER TABLE `AspNetRoleClaims`
  ADD CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `AspNetRoles` (`Id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `AspNetUserClaims`
--
ALTER TABLE `AspNetUserClaims`
  ADD CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `AspNetUserLogins`
--
ALTER TABLE `AspNetUserLogins`
  ADD CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `AspNetUserRoles`
--
ALTER TABLE `AspNetUserRoles`
  ADD CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `AspNetRoles` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `AspNetUsers`
--
ALTER TABLE `AspNetUsers`
  ADD CONSTRAINT `FK_AspNetUsers_Cities_CityId` FOREIGN KEY (`CityId`) REFERENCES `Cities` (`Id`);

--
-- Tablo kısıtlamaları `AspNetUserTokens`
--
ALTER TABLE `AspNetUserTokens`
  ADD CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `CassirBalances`
--
ALTER TABLE `CassirBalances`
  ADD CONSTRAINT `FK_CassirBalances_AspNetUsers_ApplicationUserId` FOREIGN KEY (`ApplicationUserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `CourierBalances`
--
ALTER TABLE `CourierBalances`
  ADD CONSTRAINT `FK_CourierBalances_AspNetUsers_ApplicationUserId` FOREIGN KEY (`ApplicationUserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CourierBalances_Orders_OrderId` FOREIGN KEY (`OrderId`) REFERENCES `Orders` (`Id`);

--
-- Tablo kısıtlamaları `Districts`
--
ALTER TABLE `Districts`
  ADD CONSTRAINT `FK_Districts_Cities_CityId` FOREIGN KEY (`CityId`) REFERENCES `Cities` (`Id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `HelpLanguages`
--
ALTER TABLE `HelpLanguages`
  ADD CONSTRAINT `FK_HelpLanguages_Helps_HelpId` FOREIGN KEY (`HelpId`) REFERENCES `Helps` (`Id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `NewsLanguages`
--
ALTER TABLE `NewsLanguages`
  ADD CONSTRAINT `FK_NewsLanguages_News_NewsId` FOREIGN KEY (`NewsId`) REFERENCES `News` (`Id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `FK_Orders_AspNetUsers_ApplicationUserId` FOREIGN KEY (`ApplicationUserId`) REFERENCES `AspNetUsers` (`Id`),
  ADD CONSTRAINT `FK_Orders_AspNetUsers_CourierId` FOREIGN KEY (`CourierId`) REFERENCES `AspNetUsers` (`Id`),
  ADD CONSTRAINT `FK_Orders_AspNetUsers_CustomerId` FOREIGN KEY (`CustomerId`) REFERENCES `AspNetUsers` (`Id`),
  ADD CONSTRAINT `FK_Orders_AspNetUsers_ForeignCourierId` FOREIGN KEY (`ForeignCourierId`) REFERENCES `AspNetUsers` (`Id`),
  ADD CONSTRAINT `FK_Orders_Cities_OrderFromCityId` FOREIGN KEY (`OrderFromCityId`) REFERENCES `Cities` (`Id`),
  ADD CONSTRAINT `FK_Orders_Cities_OrderToCityId` FOREIGN KEY (`OrderToCityId`) REFERENCES `Cities` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Orders_Districts_OrderFromDistrictId` FOREIGN KEY (`OrderFromDistrictId`) REFERENCES `Districts` (`Id`),
  ADD CONSTRAINT `FK_Orders_Districts_OrderToDistrictId` FOREIGN KEY (`OrderToDistrictId`) REFERENCES `Districts` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
