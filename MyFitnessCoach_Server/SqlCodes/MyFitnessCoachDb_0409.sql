USE [MyFitnessCoachDb]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ManagerId] [int] NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[ManagerId] [int] NULL,
	[WorkDelegateId] [int] NULL,
	[HiredDate] [date] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Account] [nvarchar](50) NULL,
	[HashedPassword] [nvarchar](256) NULL,
	[UserName] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[Mobile] [varchar](10) NULL,
	[IsConfirmed] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[NewMemberConfirmCode] [varchar](100) NULL,
	[NewMemberConfirmCodeExpiry] [datetime2](0) NULL,
	[ResetPasswordConfirmCode] [varchar](100) NULL,
	[ResetPasswordConfirmCodeExpiry] [datetime2](0) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](30) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_EmployeeDeptInfo]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[vw_EmployeeDeptInfo] AS
  SELECT
      u.UserName,
      r.RoleName     AS Role,
      d.Name         AS DepartmentName,
      mgr_u.UserName AS ManagerName,
      del_u.UserName AS WorkDelegateName
  FROM      Employees   e
  JOIN      Users       u     ON  u.Id      = e.UserId
  JOIN      Departments d     ON  d.Id      = e.DepartmentId
  LEFT JOIN UserRoles   ur    ON  ur.UserId = u.Id
  LEFT JOIN Roles       r     ON  r.Id      = ur.RoleId
  LEFT JOIN Employees   mgr_e ON  mgr_e.Id  = e.ManagerId
  LEFT JOIN Users       mgr_u ON  mgr_u.Id  = mgr_e.UserId
  LEFT JOIN Employees   del_e ON  del_e.Id  = e.WorkDelegateId
  LEFT JOIN Users       del_u ON  del_u.Id  = del_e.UserId;
GO
/****** Object:  Table [dbo].[Functions]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Functions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FunctionName] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Api_path] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleFunctions]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleFunctions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[FunctionId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_UserRoleFunctions]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ============================================================
-- 2. 建立視圖 (Views)
-- ============================================================

CREATE VIEW [dbo].[vw_UserRoleFunctions] AS
SELECT u.UserName, u.Account, r.RoleName, f.FunctionName
FROM [dbo].[Users] u
JOIN [dbo].[UserRoles] ur ON u.Id = ur.UserId
JOIN [dbo].[Roles] r ON ur.RoleId = r.Id
JOIN [dbo].[RoleFunctions] rf ON r.Id = rf.RoleId
JOIN [dbo].[Functions] f ON rf.FunctionId = f.Id;
GO
/****** Object:  View [dbo].[vw_RoleFunctions]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_RoleFunctions] AS
SELECT r.RoleName, f.FunctionName
FROM [dbo].[Roles] r
JOIN [dbo].[RoleFunctions] rf ON r.Id = rf.RoleId
JOIN [dbo].[Functions] f ON rf.FunctionId = f.Id;
GO
/****** Object:  View [dbo].[vw_UserRoleFunction]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_UserRoleFunction] AS
SELECT u.Id AS UserId, u.UserName, u.Email, r.Id AS RoleId, r.RoleName, f.Id AS FunctionId, f.FunctionName
FROM Users u
JOIN UserRoles ur ON ur.UserId = u.Id
JOIN Roles r ON r.Id = ur.RoleId
JOIN RoleFunctions rf ON rf.RoleId = r.Id
JOIN [Functions] f ON f.Id = rf.FunctionId;
GO
/****** Object:  Table [dbo].[Members]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Gender] [tinyint] NULL,
	[DateOfBirth] [datetime2](0) NULL,
	[Weight] [float] NULL,
	[Height] [float] NULL,
	[ActivityLevel] [nvarchar](50) NULL,
	[Target] [nvarchar](50) NULL,
	[BMR] [float] NULL,
	[TDEE] [float] NULL,
	[ImageUrl] [nvarchar](300) NULL,
	[CancelCount] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodCategories]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Foods]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Foods](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[FoodName] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nutrients]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nutrients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FoodId] [int] NOT NULL,
	[BaseAmount] [int] NOT NULL,
	[Measure] [nvarchar](20) NOT NULL,
	[Kcal] [float] NULL,
	[ProteinGram] [float] NULL,
	[CarbGram] [float] NULL,
	[FatGram] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodRecords]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodRecords](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[EatDT] [datetime2](0) NOT NULL,
	[MealType] [nvarchar](20) NOT NULL,
	[FoodId] [int] NOT NULL,
	[Amount] [float] NOT NULL,
	[Measure] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_UserMemberFoodRecord]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_UserMemberFoodRecord] AS
SELECT u.Id AS UserId, u.UserName, u.Email, m.Id AS MemberId, m.Gender, m.Weight, m.Height, m.BMR, m.TDEE,
       fr.Id AS FoodRecordId, fr.EatDT, fr.MealType, fr.Amount, fr.Measure AS RecordMeasure,
       fo.Id AS FoodId, fo.FoodName, fc.CategoryName, n.BaseAmount, n.Measure AS NutrientMeasure,
       ROUND(n.Kcal * fr.Amount / n.BaseAmount, 2) AS TotalKcal,
       ROUND(n.ProteinGram * fr.Amount / n.BaseAmount, 2) AS TotalProtein,
       ROUND(n.CarbGram * fr.Amount / n.BaseAmount, 2) AS TotalCarb,
       ROUND(n.FatGram * fr.Amount / n.BaseAmount, 2) AS TotalFat
FROM Users u
JOIN Members m ON m.UserId = u.Id
JOIN FoodRecords fr ON fr.MemberId = m.Id
JOIN Foods fo ON fo.Id = fr.FoodId
JOIN FoodCategories fc ON fc.Id = fo.CategoryId
LEFT JOIN Nutrients n ON n.FoodId = fo.Id;
GO
/****** Object:  Table [dbo].[BodyRecords]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BodyRecords](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[Weight] [float] NOT NULL,
	[BodyFat] [decimal](4, 1) NULL,
	[SkeletalMuscle] [decimal](4, 1) NULL,
	[WaistCircumference] [decimal](5, 1) NULL,
	[CreateAt] [datetime2](0) NOT NULL,
	[Note] [nvarchar](200) NULL,
	[ImageUrl] [nvarchar](300) NULL,
 CONSTRAINT [PK_BodyRecords] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Holidays]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Holidays](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HolidayDate] [date] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Year] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructors]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ImageUrl] [nvarchar](300) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[HourWage] [int] NOT NULL,
	[CancelCount] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InstructorWalletDetails]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstructorWalletDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InstructorWalletId] [int] NOT NULL,
	[SalaryDate] [nvarchar](10) NOT NULL,
	[TotalAmount] [decimal](10, 2) NOT NULL,
	[CreatedAt] [datetime2](0) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InstructorWallets]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstructorWallets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InstructorId] [int] NOT NULL,
	[CurrentBalance] [decimal](10, 2) NOT NULL,
	[LastUpdated] [datetime2](0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KeyWords]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KeyWords](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Word] [nvarchar](50) NOT NULL,
	[Category] [int] NOT NULL,
	[Weight] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaveApprovalDelegations]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveApprovalDelegations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ManagerEmployeeId] [int] NOT NULL,
	[DelegateEmployeeId] [int] NOT NULL,
	[LeaveRequestId] [int] NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaveAttachments]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveAttachments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RequestId] [int] NOT NULL,
	[FileName] [nvarchar](200) NOT NULL,
	[FileUrl] [nvarchar](500) NOT NULL,
	[UploadedAt] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_LeaveAttachments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaveBalanceHistories]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveBalanceHistories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LeaveBalanceId] [int] NOT NULL,
	[ChangeType] [nvarchar](20) NOT NULL,
	[ChangeDays] [decimal](18, 2) NOT NULL,
	[OldTotalDays] [decimal](18, 2) NOT NULL,
	[NewTotalDays] [decimal](18, 2) NOT NULL,
	[OldUsedDays] [decimal](18, 2) NOT NULL,
	[NewUsedDays] [decimal](18, 2) NOT NULL,
	[Reason] [nvarchar](300) NULL,
	[OperatorId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaveBalances]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveBalances](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[LeaveTypeId] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[TotalDays] [decimal](18, 2) NULL,
	[UsedDays] [decimal](18, 2) NULL,
	[RemainingDays]  AS ([TotalDays]-[UsedDays]) PERSISTED,
 CONSTRAINT [PK_LeaveBalances] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaveRequests]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveRequests](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[LeaveTypeId] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[DaysUsed] [decimal](18, 2) NULL,
	[Reason] [nvarchar](500) NULL,
	[Status] [nvarchar](20) NOT NULL,
	[LeaveDelegateId] [int] NULL,
	[ApprovedBy] [int] NULL,
	[ApprovedAt] [datetime2](0) NULL,
	[RejectReason] [nvarchar](300) NULL,
	[CreatedAt] [datetime2](0) NOT NULL,
	[HoursUsed] [decimal](18, 1) NULL,
	[OriginalStatus] [nvarchar](20) NULL,
	[CancelRequestedAt] [datetime2](7) NULL,
	[CancelReason] [nvarchar](300) NULL,
 CONSTRAINT [PK_LeaveRequests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaveTypes]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[DaysPerYear] [int] NOT NULL,
	[CarryOver] [bit] NOT NULL,
	[RequiresDoc] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[QuotaType] [nvarchar](20) NOT NULL,
	[WarnThresholdDays] [int] NULL,
 CONSTRAINT [PK_LeaveTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberViolations]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberViolations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[WarningCount] [int] NOT NULL,
	[IsSuspended] [bit] NOT NULL,
	[LastWarningAt] [datetime2](0) NULL,
	[SuspendedAt] [datetime2](0) NULL,
	[Reason] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[SenderId] [int] NULL,
	[NotifyType] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[IsRead] [bit] NOT NULL,
	[ReferenceId] [int] NULL,
	[CreatedAt] [datetime2](0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PointOrders]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PointOrders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[TopUpPlanId] [int] NOT NULL,
	[CreateAt] [datetime2](7) NOT NULL,
	[PointQty] [int] NOT NULL,
	[OriginalPrice] [decimal](18, 0) NOT NULL,
	[DiscountedPrice] [decimal](18, 0) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK__PointOrd__3214EC0746269E1A] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PointsRecordDetails]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PointsRecordDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PointOrderId] [int] NOT NULL,
	[UserWalletId] [int] NOT NULL,
	[CreateAt] [datetime2](0) NOT NULL,
	[PointAmount] [int] NOT NULL,
	[MerchandiseCategory] [nvarchar](50) NOT NULL,
	[ReserveOrderId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductOrderDetails]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductOrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductOrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[UnitPrice] [decimal](18, 0) NOT NULL,
	[Qty] [int] NOT NULL,
	[SubTotal] [decimal](18, 0) NOT NULL,
	[DiscountedPrice] [decimal](18, 0) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[ImageURL] [nvarchar](300) NULL,
	[Memo] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductOrders]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductOrders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[CreateAt] [datetime2](7) NOT NULL,
	[OriginalAmount] [decimal](18, 0) NOT NULL,
	[DiscountAmount] [decimal](18, 0) NOT NULL,
	[FinalAmount] AS ([OriginalAmount] - [DiscountAmount]),
	[Receiver] [nvarchar](30) NOT NULL,
	[Address] [nvarchar](500) NOT NULL,
	[Mobile] [varchar](20) NOT NULL,
	[TaxNumber] [int] NULL,
	[Status] [int] NOT NULL,
	[Memo] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[OriginalPrice] [decimal](18, 0) NOT NULL,
	[UnitPrice] [decimal](18, 0) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[SortOrder] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK__Products__3214EC0794CE8449] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReserveOrders]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReserveOrders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[ShiftId] [int] NOT NULL,
	[CreateAt] [datetime2](0) NOT NULL,
	[Status] [nvarchar](10) NOT NULL,
	[PaymentMethod] [nvarchar](10) NOT NULL,
	[Target] [nvarchar](300) NULL,
	[PointCost] [int] NULL,
	[Price] [decimal](10, 2) NULL,
	[Memorandum] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReserveOrderId] [int] NOT NULL,
	[InstructorId] [int] NOT NULL,
	[MemberId] [int] NOT NULL,
	[Rating] [int] NOT NULL,
	[Comment] [nvarchar](500) NULL,
	[CreatedAt] [datetime2](0) NOT NULL,
	[IsBanned] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shifts]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shifts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InstructorId] [int] NOT NULL,
	[ScheduleDate] [date] NOT NULL,
	[TimeSlot] [nvarchar](20) NOT NULL,
	[IsBooked] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TopUpPlans]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TopUpPlans](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PlanName] [nvarchar](50) NOT NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[Points] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK__TopUpPla__3214EC07E1DBA0D1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserExternalLogins]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserExternalLogins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[LoginProvider] [nvarchar](50) NOT NULL,
	[ProviderKey] [nvarchar](255) NOT NULL,
	[ProviderDisplayName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserWallets]    Script Date: 2026/4/9 下午 04:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserWallets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[CurrentBalance] [decimal](10, 2) NOT NULL,
	[LastUpdated] [datetime2](0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BodyRecords] ON 
GO
INSERT [dbo].[BodyRecords] ([Id], [MemberId], [Weight], [BodyFat], [SkeletalMuscle], [WaistCircumference], [CreateAt], [Note], [ImageUrl]) VALUES (1, 1, 58, CAST(25.5 AS Decimal(4, 1)), CAST(24.8 AS Decimal(4, 1)), CAST(72.0 AS Decimal(5, 1)), CAST(N'2025-10-05T09:00:00.0000000' AS DateTime2), N'初次量測', NULL)
GO
INSERT [dbo].[BodyRecords] ([Id], [MemberId], [Weight], [BodyFat], [SkeletalMuscle], [WaistCircumference], [CreateAt], [Note], [ImageUrl]) VALUES (2, 1, 57.8, CAST(25.2 AS Decimal(4, 1)), CAST(25.0 AS Decimal(4, 1)), CAST(71.5 AS Decimal(5, 1)), CAST(N'2025-11-05T09:00:00.0000000' AS DateTime2), N'體重略降，持續維持中', NULL)
GO
INSERT [dbo].[BodyRecords] ([Id], [MemberId], [Weight], [BodyFat], [SkeletalMuscle], [WaistCircumference], [CreateAt], [Note], [ImageUrl]) VALUES (3, 1, 58.1, CAST(25.0 AS Decimal(4, 1)), CAST(25.2 AS Decimal(4, 1)), CAST(71.0 AS Decimal(5, 1)), CAST(N'2025-12-05T09:00:00.0000000' AS DateTime2), N'體重回穩，肌肉量微增', NULL)
GO
INSERT [dbo].[BodyRecords] ([Id], [MemberId], [Weight], [BodyFat], [SkeletalMuscle], [WaistCircumference], [CreateAt], [Note], [ImageUrl]) VALUES (4, 2, 75, CAST(18.5 AS Decimal(4, 1)), CAST(38.2 AS Decimal(4, 1)), CAST(82.0 AS Decimal(5, 1)), CAST(N'2025-10-03T10:00:00.0000000' AS DateTime2), N'訓練初期基準量測', NULL)
GO
INSERT [dbo].[BodyRecords] ([Id], [MemberId], [Weight], [BodyFat], [SkeletalMuscle], [WaistCircumference], [CreateAt], [Note], [ImageUrl]) VALUES (5, 2, 76.5, CAST(17.8 AS Decimal(4, 1)), CAST(39.5 AS Decimal(4, 1)), CAST(81.5 AS Decimal(5, 1)), CAST(N'2025-11-03T10:00:00.0000000' AS DateTime2), N'增肌效果顯著，體脂續降', NULL)
GO
INSERT [dbo].[BodyRecords] ([Id], [MemberId], [Weight], [BodyFat], [SkeletalMuscle], [WaistCircumference], [CreateAt], [Note], [ImageUrl]) VALUES (6, 2, 77.8, CAST(17.0 AS Decimal(4, 1)), CAST(41.0 AS Decimal(4, 1)), CAST(81.0 AS Decimal(5, 1)), CAST(N'2025-12-03T10:00:00.0000000' AS DateTime2), N'肌肉量達成階段目標', NULL)
GO
INSERT [dbo].[BodyRecords] ([Id], [MemberId], [Weight], [BodyFat], [SkeletalMuscle], [WaistCircumference], [CreateAt], [Note], [ImageUrl]) VALUES (7, 3, 52, CAST(28.0 AS Decimal(4, 1)), CAST(22.5 AS Decimal(4, 1)), CAST(70.0 AS Decimal(5, 1)), CAST(N'2025-10-01T08:30:00.0000000' AS DateTime2), N'減重計畫開始', NULL)
GO
INSERT [dbo].[BodyRecords] ([Id], [MemberId], [Weight], [BodyFat], [SkeletalMuscle], [WaistCircumference], [CreateAt], [Note], [ImageUrl]) VALUES (8, 3, 50.5, CAST(27.2 AS Decimal(4, 1)), CAST(22.8 AS Decimal(4, 1)), CAST(68.5 AS Decimal(5, 1)), CAST(N'2025-11-01T08:30:00.0000000' AS DateTime2), N'體重下降1.5kg，狀況良好', NULL)
GO
INSERT [dbo].[BodyRecords] ([Id], [MemberId], [Weight], [BodyFat], [SkeletalMuscle], [WaistCircumference], [CreateAt], [Note], [ImageUrl]) VALUES (9, 3, 49, CAST(26.5 AS Decimal(4, 1)), CAST(23.0 AS Decimal(4, 1)), CAST(67.0 AS Decimal(5, 1)), CAST(N'2025-12-01T08:30:00.0000000' AS DateTime2), N'腰圍明顯縮小，繼續加油', NULL)
GO
INSERT [dbo].[BodyRecords] ([Id], [MemberId], [Weight], [BodyFat], [SkeletalMuscle], [WaistCircumference], [CreateAt], [Note], [ImageUrl]) VALUES (10, 4, 70, CAST(20.0 AS Decimal(4, 1)), CAST(35.0 AS Decimal(4, 1)), CAST(80.0 AS Decimal(5, 1)), CAST(N'2025-10-07T11:00:00.0000000' AS DateTime2), N'增肌訓練基準點', NULL)
GO
INSERT [dbo].[BodyRecords] ([Id], [MemberId], [Weight], [BodyFat], [SkeletalMuscle], [WaistCircumference], [CreateAt], [Note], [ImageUrl]) VALUES (11, 4, 71.5, CAST(19.2 AS Decimal(4, 1)), CAST(36.5 AS Decimal(4, 1)), CAST(79.5 AS Decimal(5, 1)), CAST(N'2025-11-07T11:00:00.0000000' AS DateTime2), N'肌肉量增加，體脂微降', NULL)
GO
INSERT [dbo].[BodyRecords] ([Id], [MemberId], [Weight], [BodyFat], [SkeletalMuscle], [WaistCircumference], [CreateAt], [Note], [ImageUrl]) VALUES (12, 4, 73, CAST(18.5 AS Decimal(4, 1)), CAST(38.0 AS Decimal(4, 1)), CAST(79.0 AS Decimal(5, 1)), CAST(N'2025-12-07T11:00:00.0000000' AS DateTime2), N'訓練成效明顯，肌肉量持續增加', NULL)
GO
INSERT [dbo].[BodyRecords] ([Id], [MemberId], [Weight], [BodyFat], [SkeletalMuscle], [WaistCircumference], [CreateAt], [Note], [ImageUrl]) VALUES (13, 5, 54, CAST(24.0 AS Decimal(4, 1)), CAST(23.0 AS Decimal(4, 1)), CAST(68.0 AS Decimal(5, 1)), CAST(N'2025-10-10T09:30:00.0000000' AS DateTime2), N'體態維持中', NULL)
GO
INSERT [dbo].[BodyRecords] ([Id], [MemberId], [Weight], [BodyFat], [SkeletalMuscle], [WaistCircumference], [CreateAt], [Note], [ImageUrl]) VALUES (14, 5, 53.8, CAST(23.8 AS Decimal(4, 1)), CAST(23.2 AS Decimal(4, 1)), CAST(67.5 AS Decimal(5, 1)), CAST(N'2025-11-10T09:30:00.0000000' AS DateTime2), N'略有進步', NULL)
GO
INSERT [dbo].[BodyRecords] ([Id], [MemberId], [Weight], [BodyFat], [SkeletalMuscle], [WaistCircumference], [CreateAt], [Note], [ImageUrl]) VALUES (15, 5, 54.2, CAST(24.2 AS Decimal(4, 1)), CAST(23.0 AS Decimal(4, 1)), CAST(68.0 AS Decimal(5, 1)), CAST(N'2025-12-10T09:30:00.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[BodyRecords] ([Id], [MemberId], [Weight], [BodyFat], [SkeletalMuscle], [WaistCircumference], [CreateAt], [Note], [ImageUrl]) VALUES (16, 7, 68, CAST(26.0 AS Decimal(4, 1)), CAST(28.5 AS Decimal(4, 1)), CAST(74.0 AS Decimal(5, 1)), CAST(N'2025-11-15T10:00:00.0000000' AS DateTime2), N'初次量測', NULL)
GO
INSERT [dbo].[BodyRecords] ([Id], [MemberId], [Weight], [BodyFat], [SkeletalMuscle], [WaistCircumference], [CreateAt], [Note], [ImageUrl]) VALUES (17, 7, 67.5, CAST(25.5 AS Decimal(4, 1)), CAST(29.0 AS Decimal(4, 1)), CAST(73.5 AS Decimal(5, 1)), CAST(N'2025-12-15T10:00:00.0000000' AS DateTime2), N'體重略降，繼續維持', NULL)
GO
INSERT [dbo].[BodyRecords] ([Id], [MemberId], [Weight], [BodyFat], [SkeletalMuscle], [WaistCircumference], [CreateAt], [Note], [ImageUrl]) VALUES (18, 8, 62, CAST(19.5 AS Decimal(4, 1)), CAST(30.2 AS Decimal(4, 1)), CAST(77.0 AS Decimal(5, 1)), CAST(N'2025-11-20T14:00:00.0000000' AS DateTime2), N'定期健康追蹤', NULL)
GO
INSERT [dbo].[BodyRecords] ([Id], [MemberId], [Weight], [BodyFat], [SkeletalMuscle], [WaistCircumference], [CreateAt], [Note], [ImageUrl]) VALUES (19, 8, 62.5, CAST(19.0 AS Decimal(4, 1)), CAST(30.8 AS Decimal(4, 1)), CAST(76.5 AS Decimal(5, 1)), CAST(N'2025-12-20T14:00:00.0000000' AS DateTime2), N'肌肉量微增，體脂略降', NULL)
GO
INSERT [dbo].[BodyRecords] ([Id], [MemberId], [Weight], [BodyFat], [SkeletalMuscle], [WaistCircumference], [CreateAt], [Note], [ImageUrl]) VALUES (20, 3, 49.5, CAST(26.6 AS Decimal(4, 1)), CAST(23.1 AS Decimal(4, 1)), CAST(67.5 AS Decimal(5, 1)), CAST(N'2025-12-11T08:30:00.0000000' AS DateTime2), N'週末聚餐較多，稍微水腫回彈，不氣餒', NULL)
GO
INSERT [dbo].[BodyRecords] ([Id], [MemberId], [Weight], [BodyFat], [SkeletalMuscle], [WaistCircumference], [CreateAt], [Note], [ImageUrl]) VALUES (21, 3, 48.8, CAST(26.2 AS Decimal(4, 1)), CAST(23.1 AS Decimal(4, 1)), CAST(66.8 AS Decimal(5, 1)), CAST(N'2025-12-21T08:30:00.0000000' AS DateTime2), N'恢復正常飲食與運動，體重回到下降趨勢', NULL)
GO
INSERT [dbo].[BodyRecords] ([Id], [MemberId], [Weight], [BodyFat], [SkeletalMuscle], [WaistCircumference], [CreateAt], [Note], [ImageUrl]) VALUES (22, 3, 48.8, CAST(26.0 AS Decimal(4, 1)), CAST(23.3 AS Decimal(4, 1)), CAST(66.5 AS Decimal(5, 1)), CAST(N'2025-12-31T08:30:00.0000000' AS DateTime2), N'遇到停滯期，但肌肉量微幅增加，體態感覺變緊實', NULL)
GO
INSERT [dbo].[BodyRecords] ([Id], [MemberId], [Weight], [BodyFat], [SkeletalMuscle], [WaistCircumference], [CreateAt], [Note], [ImageUrl]) VALUES (23, 3, 48.2, CAST(25.6 AS Decimal(4, 1)), CAST(23.2 AS Decimal(4, 1)), CAST(66.0 AS Decimal(5, 1)), CAST(N'2026-01-10T08:30:00.0000000' AS DateTime2), N'突破停滯期！持續保持運動習慣看見成效', NULL)
GO
INSERT [dbo].[BodyRecords] ([Id], [MemberId], [Weight], [BodyFat], [SkeletalMuscle], [WaistCircumference], [CreateAt], [Note], [ImageUrl]) VALUES (24, 3, 48.6, CAST(25.8 AS Decimal(4, 1)), CAST(23.2 AS Decimal(4, 1)), CAST(66.5 AS Decimal(5, 1)), CAST(N'2026-01-20T08:30:00.0000000' AS DateTime2), N'最近工作壓力大且睡眠不足，身體有些反撲和水腫', NULL)
GO
INSERT [dbo].[BodyRecords] ([Id], [MemberId], [Weight], [BodyFat], [SkeletalMuscle], [WaistCircumference], [CreateAt], [Note], [ImageUrl]) VALUES (25, 3, 47.5, CAST(25.1 AS Decimal(4, 1)), CAST(23.4 AS Decimal(4, 1)), CAST(65.0 AS Decimal(5, 1)), CAST(N'2026-01-30T08:30:00.0000000' AS DateTime2), N'好好休息後水腫消退，體脂降幅明顯，達成近期新低點！', NULL)
GO
SET IDENTITY_INSERT [dbo].[BodyRecords] OFF
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 
GO
INSERT [dbo].[Departments] ([Id], [Name], [ManagerId]) VALUES (1, N'採購部', 1)
GO
INSERT [dbo].[Departments] ([Id], [Name], [ManagerId]) VALUES (2, N'行銷部', 3)
GO
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 
GO
INSERT [dbo].[Employees] ([Id], [UserId], [DepartmentId], [ManagerId], [WorkDelegateId], [HiredDate], [IsActive]) VALUES (1, 2152, 1, NULL, 5, CAST(N'2016-04-01' AS Date), 1)
GO
INSERT [dbo].[Employees] ([Id], [UserId], [DepartmentId], [ManagerId], [WorkDelegateId], [HiredDate], [IsActive]) VALUES (2, 2153, 1, NULL, 10, CAST(N'2017-09-15' AS Date), 1)
GO
INSERT [dbo].[Employees] ([Id], [UserId], [DepartmentId], [ManagerId], [WorkDelegateId], [HiredDate], [IsActive]) VALUES (3, 2154, 2, NULL, 15, CAST(N'2015-11-20' AS Date), 1)
GO
INSERT [dbo].[Employees] ([Id], [UserId], [DepartmentId], [ManagerId], [WorkDelegateId], [HiredDate], [IsActive]) VALUES (4, 2155, 2, NULL, 20, CAST(N'2018-03-10' AS Date), 1)
GO
INSERT [dbo].[Employees] ([Id], [UserId], [DepartmentId], [ManagerId], [WorkDelegateId], [HiredDate], [IsActive]) VALUES (5, 2027, 1, 1, 6, CAST(N'2019-03-13' AS Date), 1)
GO
INSERT [dbo].[Employees] ([Id], [UserId], [DepartmentId], [ManagerId], [WorkDelegateId], [HiredDate], [IsActive]) VALUES (6, 2028, 1, 1, 9, CAST(N'2021-01-20' AS Date), 1)
GO
INSERT [dbo].[Employees] ([Id], [UserId], [DepartmentId], [ManagerId], [WorkDelegateId], [HiredDate], [IsActive]) VALUES (7, 2029, 1, 1, 10, CAST(N'2022-11-30' AS Date), 1)
GO
INSERT [dbo].[Employees] ([Id], [UserId], [DepartmentId], [ManagerId], [WorkDelegateId], [HiredDate], [IsActive]) VALUES (8, 2030, 1, 1, 11, CAST(N'2020-10-09' AS Date), 1)
GO
INSERT [dbo].[Employees] ([Id], [UserId], [DepartmentId], [ManagerId], [WorkDelegateId], [HiredDate], [IsActive]) VALUES (9, 2031, 1, 1, 12, CAST(N'2022-08-19' AS Date), 1)
GO
INSERT [dbo].[Employees] ([Id], [UserId], [DepartmentId], [ManagerId], [WorkDelegateId], [HiredDate], [IsActive]) VALUES (10, 2032, 1, 2, 13, CAST(N'2020-06-28' AS Date), 1)
GO
INSERT [dbo].[Employees] ([Id], [UserId], [DepartmentId], [ManagerId], [WorkDelegateId], [HiredDate], [IsActive]) VALUES (11, 2033, 1, 2, 14, CAST(N'2022-05-08' AS Date), 1)
GO
INSERT [dbo].[Employees] ([Id], [UserId], [DepartmentId], [ManagerId], [WorkDelegateId], [HiredDate], [IsActive]) VALUES (12, 2034, 1, 2, 5, CAST(N'2020-03-17' AS Date), 1)
GO
INSERT [dbo].[Employees] ([Id], [UserId], [DepartmentId], [ManagerId], [WorkDelegateId], [HiredDate], [IsActive]) VALUES (13, 2035, 1, 2, 6, CAST(N'2022-01-25' AS Date), 1)
GO
INSERT [dbo].[Employees] ([Id], [UserId], [DepartmentId], [ManagerId], [WorkDelegateId], [HiredDate], [IsActive]) VALUES (14, 2036, 1, 2, 7, CAST(N'2019-12-05' AS Date), 1)
GO
INSERT [dbo].[Employees] ([Id], [UserId], [DepartmentId], [ManagerId], [WorkDelegateId], [HiredDate], [IsActive]) VALUES (15, 2037, 2, 3, 18, CAST(N'2022-03-14' AS Date), 1)
GO
INSERT [dbo].[Employees] ([Id], [UserId], [DepartmentId], [ManagerId], [WorkDelegateId], [HiredDate], [IsActive]) VALUES (16, 2038, 2, 3, 19, CAST(N'2020-01-22' AS Date), 1)
GO
INSERT [dbo].[Employees] ([Id], [UserId], [DepartmentId], [ManagerId], [WorkDelegateId], [HiredDate], [IsActive]) VALUES (17, 2039, 2, 3, 20, CAST(N'2021-12-01' AS Date), 1)
GO
INSERT [dbo].[Employees] ([Id], [UserId], [DepartmentId], [ManagerId], [WorkDelegateId], [HiredDate], [IsActive]) VALUES (18, 2040, 2, 3, 21, CAST(N'2019-10-11' AS Date), 1)
GO
INSERT [dbo].[Employees] ([Id], [UserId], [DepartmentId], [ManagerId], [WorkDelegateId], [HiredDate], [IsActive]) VALUES (19, 2041, 2, 3, 22, CAST(N'2021-08-20' AS Date), 1)
GO
INSERT [dbo].[Employees] ([Id], [UserId], [DepartmentId], [ManagerId], [WorkDelegateId], [HiredDate], [IsActive]) VALUES (20, 2042, 2, 4, 23, CAST(N'2019-06-30' AS Date), 1)
GO
INSERT [dbo].[Employees] ([Id], [UserId], [DepartmentId], [ManagerId], [WorkDelegateId], [HiredDate], [IsActive]) VALUES (21, 2043, 2, 4, 24, CAST(N'2021-05-09' AS Date), 1)
GO
INSERT [dbo].[Employees] ([Id], [UserId], [DepartmentId], [ManagerId], [WorkDelegateId], [HiredDate], [IsActive]) VALUES (22, 2044, 2, 4, 15, CAST(N'2023-03-19' AS Date), 1)
GO
INSERT [dbo].[Employees] ([Id], [UserId], [DepartmentId], [ManagerId], [WorkDelegateId], [HiredDate], [IsActive]) VALUES (23, 2045, 2, 4, 16, CAST(N'2021-01-26' AS Date), 1)
GO
INSERT [dbo].[Employees] ([Id], [UserId], [DepartmentId], [ManagerId], [WorkDelegateId], [HiredDate], [IsActive]) VALUES (24, 2046, 2, 4, 17, CAST(N'2022-12-06' AS Date), 1)
GO
INSERT [dbo].[Employees] ([Id], [UserId], [DepartmentId], [ManagerId], [WorkDelegateId], [HiredDate], [IsActive]) VALUES (25, 2013, 1, 1, NULL, CAST(N'2026-03-19' AS Date), 0)
GO
INSERT [dbo].[Employees] ([Id], [UserId], [DepartmentId], [ManagerId], [WorkDelegateId], [HiredDate], [IsActive]) VALUES (26, 2047, 1, NULL, NULL, CAST(N'2026-03-19' AS Date), 1)
GO
INSERT [dbo].[Employees] ([Id], [UserId], [DepartmentId], [ManagerId], [WorkDelegateId], [HiredDate], [IsActive]) VALUES (27, 1014, 1, NULL, NULL, CAST(N'2026-03-19' AS Date), 1)
GO
INSERT [dbo].[Employees] ([Id], [UserId], [DepartmentId], [ManagerId], [WorkDelegateId], [HiredDate], [IsActive]) VALUES (28, 2048, 1, NULL, NULL, CAST(N'2026-03-19' AS Date), 1)
GO
INSERT [dbo].[Employees] ([Id], [UserId], [DepartmentId], [ManagerId], [WorkDelegateId], [HiredDate], [IsActive]) VALUES (29, 2049, 1, NULL, NULL, CAST(N'2026-03-19' AS Date), 1)
GO
INSERT [dbo].[Employees] ([Id], [UserId], [DepartmentId], [ManagerId], [WorkDelegateId], [HiredDate], [IsActive]) VALUES (30, 2050, 1, NULL, NULL, CAST(N'2026-03-19' AS Date), 1)
GO
INSERT [dbo].[Employees] ([Id], [UserId], [DepartmentId], [ManagerId], [WorkDelegateId], [HiredDate], [IsActive]) VALUES (31, 2051, 1, NULL, NULL, CAST(N'2026-03-19' AS Date), 1)
GO
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Functions] ON 
GO
INSERT [dbo].[Functions] ([Id], [FunctionName], [IsActive], [Description], [Api_path]) VALUES (18, N'edit_Password', 1, N'修改個人自己的登入密碼', N'/Account/ResetPassword')
GO
INSERT [dbo].[Functions] ([Id], [FunctionName], [IsActive], [Description], [Api_path]) VALUES (19, N'edit_IntructorDetails', 1, N'修改教練自己的個人簡介', N'/Account/InstructorDetails')
GO
INSERT [dbo].[Functions] ([Id], [FunctionName], [IsActive], [Description], [Api_path]) VALUES (20, N'edit_InstructorShifts', 1, N'安排或修改教練自己的排班', N'/Shift/Index')
GO
INSERT [dbo].[Functions] ([Id], [FunctionName], [IsActive], [Description], [Api_path]) VALUES (21, N'view_InstructorShifts', 1, N'查看所有教練的排班情況', N'/Shift/AllShifts')
GO
INSERT [dbo].[Functions] ([Id], [FunctionName], [IsActive], [Description], [Api_path]) VALUES (22, N'edit_UserAccounts', 1, N'管理、設定、修改、停用、恢復所有使用者的帳號', N'/Staff/Index')
GO
INSERT [dbo].[Functions] ([Id], [FunctionName], [IsActive], [Description], [Api_path]) VALUES (23, N'edit_RoleFunctions', 1, N'設定每個角色可以使用哪些系統功能(設定每個角色的權限設定)', N'/Staff/RoleFunctions')
GO
INSERT [dbo].[Functions] ([Id], [FunctionName], [IsActive], [Description], [Api_path]) VALUES (24, N'edit_UserRoles', 1, N'新增或修改使用者的所屬角色', N'/Staff/UserRoles')
GO
INSERT [dbo].[Functions] ([Id], [FunctionName], [IsActive], [Description], [Api_path]) VALUES (25, N'edit_ProductCategories', 1, N'管理商品的商品分類', N'/ProductCategories/Index')
GO
INSERT [dbo].[Functions] ([Id], [FunctionName], [IsActive], [Description], [Api_path]) VALUES (26, N'edit_ProductItems', 1, N'管理商品的商品', N'/Products/Index')
GO
INSERT [dbo].[Functions] ([Id], [FunctionName], [IsActive], [Description], [Api_path]) VALUES (27, N'edit_ProductOrders', 1, N'處理商品的訂單', N'/ProductOrders/index')
GO
INSERT [dbo].[Functions] ([Id], [FunctionName], [IsActive], [Description], [Api_path]) VALUES (28, N'edit_Plans', 1, N'制定或修改促銷方案', N'/TopUpPlans/Index')
GO
INSERT [dbo].[Functions] ([Id], [FunctionName], [IsActive], [Description], [Api_path]) VALUES (29, N'edit_PlanOrders', 1, N'處理促銷方案或課程購買生成的訂單', N'/PointOrders/Index')
GO
INSERT [dbo].[Functions] ([Id], [FunctionName], [IsActive], [Description], [Api_path]) VALUES (30, N'view_PointRecords', 1, N'查看會員的點數取得及使用紀錄', N'/Member/PointsRecord')
GO
INSERT [dbo].[Functions] ([Id], [FunctionName], [IsActive], [Description], [Api_path]) VALUES (31, N'view_ClientFoodRecords', 1, N'查看會員每日的飲食紀錄', N'/Member/ViewFoodRecords')
GO
INSERT [dbo].[Functions] ([Id], [FunctionName], [IsActive], [Description], [Api_path]) VALUES (32, N'view_ClientBodyData', 1, N'查看會員生理數據變化', N'/Member/ViewFoodRecords')
GO
INSERT [dbo].[Functions] ([Id], [FunctionName], [IsActive], [Description], [Api_path]) VALUES (33, N'edit_Comments_admin', 1, N'系統管理員回覆評論或刪除', N'/Review/AdminIndex')
GO
INSERT [dbo].[Functions] ([Id], [FunctionName], [IsActive], [Description], [Api_path]) VALUES (34, N'edit_Comments_instructor', 1, N'專業教練回覆評論', N'/Review/InstructorIndex')
GO
INSERT [dbo].[Functions] ([Id], [FunctionName], [IsActive], [Description], [Api_path]) VALUES (35, N'view_LeaveRequests', 1, N'查看自己的請假申請列表', N'/ApplyLeave/List')
GO
INSERT [dbo].[Functions] ([Id], [FunctionName], [IsActive], [Description], [Api_path]) VALUES (36, N'edit_LeaveRequests', 1, N'新增、取消自己的請假申請', N'/ApplyLeave/Add')
GO
INSERT [dbo].[Functions] ([Id], [FunctionName], [IsActive], [Description], [Api_path]) VALUES (37, N'edit_WorkDelegate', 1, N'設定或變更自己的職務代理人', N'/ApplyLeave/WorkDelegate')
GO
INSERT [dbo].[Functions] ([Id], [FunctionName], [IsActive], [Description], [Api_path]) VALUES (38, N'review_LeaveRequests', 1, N'審核下屬的請假申請(核准/駁回)', N'/ReviewLeave/Pending')
GO
INSERT [dbo].[Functions] ([Id], [FunctionName], [IsActive], [Description], [Api_path]) VALUES (39, N'view_DeptLeave', 1, N'查看部門請假總覽', N'/ReviewLeave/List')
GO
INSERT [dbo].[Functions] ([Id], [FunctionName], [IsActive], [Description], [Api_path]) VALUES (40, N'admin_LeaveRequests', 1, N'管理所有請假申請(全公司)', N'/AdminLeave/List')
GO
INSERT [dbo].[Functions] ([Id], [FunctionName], [IsActive], [Description], [Api_path]) VALUES (41, N'admin_Employees', 1, N'管理員工資料(全公司)', N'/AdminLeave/EmployeeList')
GO
INSERT [dbo].[Functions] ([Id], [FunctionName], [IsActive], [Description], [Api_path]) VALUES (42, N'view_KeyWords', 1, N'查看關鍵字', N'/KeyWords/Index')
GO
INSERT [dbo].[Functions] ([Id], [FunctionName], [IsActive], [Description], [Api_path]) VALUES (43, N'edit_KeyWords', 1, N'編輯關鍵字', N'/KeyWords/Create')
GO
INSERT [dbo].[Functions] ([Id], [FunctionName], [IsActive], [Description], [Api_path]) VALUES (44, N'view_Salary', 1, N'查看營養師薪資表', N'/Salary/Index')
GO
INSERT [dbo].[Functions] ([Id], [FunctionName], [IsActive], [Description], [Api_path]) VALUES (45, N'view_Salary2', 1, N'查看薪資明細', N'/Salary/_SalaryDetailPartial')
GO
INSERT [dbo].[Functions] ([Id], [FunctionName], [IsActive], [Description], [Api_path]) VALUES (46, N'view_MemberViolations', 1, N'查看會員違規紀錄', N'/MemberViolation/Index')
GO
INSERT [dbo].[Functions] ([Id], [FunctionName], [IsActive], [Description], [Api_path]) VALUES (47, N'edit_MemberViolations', 1, N'修改會員違規紀錄', N'/MemberViolation/Edit')
GO
INSERT [dbo].[Functions] ([Id], [FunctionName], [IsActive], [Description], [Api_path]) VALUES (48, N'create_MemberViolations', 1, N'新增會員違規紀錄', N'/MemberViolation/Create')
GO
INSERT [dbo].[Functions] ([Id], [FunctionName], [IsActive], [Description], [Api_path]) VALUES (49, N'view_MyWallet', 1, N'查看營養師自己的錢包', N'/Salary/MyWallet')
GO
INSERT [dbo].[Functions] ([Id], [FunctionName], [IsActive], [Description], [Api_path]) VALUES (50, N'admin_Holidays', 1, N'管理國定假日', N'/AdminLeave/HolidayList')
GO
INSERT [dbo].[Functions] ([Id], [FunctionName], [IsActive], [Description], [Api_path]) VALUES (51, N'admin_LeaveBalances', 1, NULL, N'/AdminLeave/BalanceList')
GO
INSERT [dbo].[Functions] ([Id], [FunctionName], [IsActive], [Description], [Api_path]) VALUES (52, N'view_KeyWordAnalytics', 1, N'查看關鍵字詞', N'/Dashboard/KeyWordAnalytics')
GO
SET IDENTITY_INSERT [dbo].[Functions] OFF
GO
SET IDENTITY_INSERT [dbo].[Holidays] ON 
GO
INSERT [dbo].[Holidays] ([Id], [HolidayDate], [Name], [Year], [IsActive]) VALUES (1, CAST(N'2026-01-01' AS Date), N'元旦', 2026, 1)
GO
INSERT [dbo].[Holidays] ([Id], [HolidayDate], [Name], [Year], [IsActive]) VALUES (2, CAST(N'2026-01-26' AS Date), N'除夕', 2026, 1)
GO
INSERT [dbo].[Holidays] ([Id], [HolidayDate], [Name], [Year], [IsActive]) VALUES (3, CAST(N'2026-01-27' AS Date), N'春節', 2026, 1)
GO
INSERT [dbo].[Holidays] ([Id], [HolidayDate], [Name], [Year], [IsActive]) VALUES (4, CAST(N'2026-01-28' AS Date), N'春節', 2026, 1)
GO
INSERT [dbo].[Holidays] ([Id], [HolidayDate], [Name], [Year], [IsActive]) VALUES (5, CAST(N'2026-01-29' AS Date), N'春節', 2026, 1)
GO
INSERT [dbo].[Holidays] ([Id], [HolidayDate], [Name], [Year], [IsActive]) VALUES (6, CAST(N'2026-02-28' AS Date), N'和平紀念日', 2026, 1)
GO
INSERT [dbo].[Holidays] ([Id], [HolidayDate], [Name], [Year], [IsActive]) VALUES (7, CAST(N'2026-04-05' AS Date), N'清明節', 2026, 1)
GO
INSERT [dbo].[Holidays] ([Id], [HolidayDate], [Name], [Year], [IsActive]) VALUES (8, CAST(N'2026-05-31' AS Date), N'端午節', 2026, 1)
GO
INSERT [dbo].[Holidays] ([Id], [HolidayDate], [Name], [Year], [IsActive]) VALUES (9, CAST(N'2026-10-04' AS Date), N'中秋節', 2026, 1)
GO
INSERT [dbo].[Holidays] ([Id], [HolidayDate], [Name], [Year], [IsActive]) VALUES (10, CAST(N'2026-10-10' AS Date), N'國慶日', 2026, 1)
GO
SET IDENTITY_INSERT [dbo].[Holidays] OFF
GO
SET IDENTITY_INSERT [dbo].[Instructors] ON 
GO
INSERT [dbo].[Instructors] ([Id], [UserId], [ImageUrl], [Description], [HourWage], [CancelCount], [IsActive]) VALUES (1, 2014, N'/img/instructors/2fdd6221-313a-41d0-a2a5-cabb850147b2.png', N'專精減脂', 1000, 3, 1)
GO
INSERT [dbo].[Instructors] ([Id], [UserId], [ImageUrl], [Description], [HourWage], [CancelCount], [IsActive]) VALUES (2, 2013, N'/img/instructors/78841054-16e7-440b-8494-9cb6f4f2df54.png', N'糖尿病飲食', 1200, 0, 1)
GO
INSERT [dbo].[Instructors] ([Id], [UserId], [ImageUrl], [Description], [HourWage], [CancelCount], [IsActive]) VALUES (3, 2015, N'/img/instructors/0e8d9a55-2963-43fb-9e3f-cfb265c1bc0b.png', N'專業營養諮詢服務 ', 1200, 3, 1)
GO
INSERT [dbo].[Instructors] ([Id], [UserId], [ImageUrl], [Description], [HourWage], [CancelCount], [IsActive]) VALUES (4, 2016, N'/img/instructors/9ddf0472-0642-45ba-a592-e836cb85d3cf.png', N'專業營養諮詢服務', 1200, 3, 1)
GO
INSERT [dbo].[Instructors] ([Id], [UserId], [ImageUrl], [Description], [HourWage], [CancelCount], [IsActive]) VALUES (5, 2017, N'/img/instructors/ffa16343-7f56-40f0-9282-b27b47108b65.png', N'專業營養諮詢服務
', 1200, 3, 1)
GO
INSERT [dbo].[Instructors] ([Id], [UserId], [ImageUrl], [Description], [HourWage], [CancelCount], [IsActive]) VALUES (6, 2018, N'/img/instructors/7c1be7ee-b927-4a5b-a168-86b5510e1bca.png', N'專業營養諮詢服務', 1200, 3, 1)
GO
INSERT [dbo].[Instructors] ([Id], [UserId], [ImageUrl], [Description], [HourWage], [CancelCount], [IsActive]) VALUES (7, 2019, N'/img/instructors/ebfc7e8f-6ea2-4179-9750-16191da13d6f.png', N'專業營養諮詢服務 ', 1200, 3, 1)
GO
INSERT [dbo].[Instructors] ([Id], [UserId], [ImageUrl], [Description], [HourWage], [CancelCount], [IsActive]) VALUES (8, 2020, N'/img/instructors/d3fe64a5-6417-4f46-ba0f-333226917561.png', N'專業營養諮詢服務 ', 1200, 3, 1)
GO
INSERT [dbo].[Instructors] ([Id], [UserId], [ImageUrl], [Description], [HourWage], [CancelCount], [IsActive]) VALUES (9, 2021, N'/img/instructors/cff505df-0738-42b1-a543-cc62e32a2106.png', N'專業營養諮詢服務
', 1200, 3, 1)
GO
INSERT [dbo].[Instructors] ([Id], [UserId], [ImageUrl], [Description], [HourWage], [CancelCount], [IsActive]) VALUES (10, 2022, N'/img/instructors/efe17d3a-d611-42cb-89e9-feab0e77b90f.png', N'專業營養諮詢服務', 1200, 3, 1)
GO
INSERT [dbo].[Instructors] ([Id], [UserId], [ImageUrl], [Description], [HourWage], [CancelCount], [IsActive]) VALUES (11, 2023, N'/img/instructors/6e1ed46d-466e-4c68-8e33-ffe5efc8cb28.png', N'專業營養諮詢服務', 1200, 3, 1)
GO
INSERT [dbo].[Instructors] ([Id], [UserId], [ImageUrl], [Description], [HourWage], [CancelCount], [IsActive]) VALUES (12, 2024, N'/img/instructors/f8ebf282-a4f7-49cf-9675-48ff13f34651.png', N'專業營養諮詢服務', 1200, 3, 1)
GO
INSERT [dbo].[Instructors] ([Id], [UserId], [ImageUrl], [Description], [HourWage], [CancelCount], [IsActive]) VALUES (13, 2025, N'/img/instructors/86c45e51-9245-45f0-90c2-1d4cbec662f6.png', N'專業營養諮詢服務 ', 1200, 3, 1)
GO
INSERT [dbo].[Instructors] ([Id], [UserId], [ImageUrl], [Description], [HourWage], [CancelCount], [IsActive]) VALUES (14, 2026, N'/img/instructors/3f5a8d07-3d26-451f-96ee-2e37b651be8c.png', N'專業營養諮詢服務', 1200, 3, 1)
GO
INSERT [dbo].[Instructors] ([Id], [UserId], [ImageUrl], [Description], [HourWage], [CancelCount], [IsActive]) VALUES (15, 1, N'/img/instructors/e4935b96-2598-47b8-9b0d-68139a5f4aaf.png', N'腎臟與重症內科營養照護', 1200, 3, 1)
GO
SET IDENTITY_INSERT [dbo].[Instructors] OFF
GO
SET IDENTITY_INSERT [dbo].[InstructorWalletDetails] ON 
GO
INSERT [dbo].[InstructorWalletDetails] ([Id], [InstructorWalletId], [SalaryDate], [TotalAmount], [CreatedAt], [Category]) VALUES (1, 2, N'2026-03-01', CAST(28353.00 AS Decimal(10, 2)), CAST(N'2026-03-01T13:22:18.0000000' AS DateTime2), N'月薪與加給')
GO
SET IDENTITY_INSERT [dbo].[InstructorWalletDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[InstructorWallets] ON 
GO
INSERT [dbo].[InstructorWallets] ([Id], [InstructorId], [CurrentBalance], [LastUpdated]) VALUES (1, 1, CAST(0.00 AS Decimal(10, 2)), CAST(N'2026-04-01T18:11:19.0000000' AS DateTime2))
GO
INSERT [dbo].[InstructorWallets] ([Id], [InstructorId], [CurrentBalance], [LastUpdated]) VALUES (2, 2, CAST(28353.00 AS Decimal(10, 2)), CAST(N'2026-03-01T13:22:18.0000000' AS DateTime2))
GO
INSERT [dbo].[InstructorWallets] ([Id], [InstructorId], [CurrentBalance], [LastUpdated]) VALUES (3, 3, CAST(0.00 AS Decimal(10, 2)), CAST(N'2026-03-17T10:18:52.0000000' AS DateTime2))
GO
INSERT [dbo].[InstructorWallets] ([Id], [InstructorId], [CurrentBalance], [LastUpdated]) VALUES (4, 4, CAST(0.00 AS Decimal(10, 2)), CAST(N'2026-03-17T10:18:52.0000000' AS DateTime2))
GO
INSERT [dbo].[InstructorWallets] ([Id], [InstructorId], [CurrentBalance], [LastUpdated]) VALUES (5, 5, CAST(0.00 AS Decimal(10, 2)), CAST(N'2026-03-17T10:18:52.0000000' AS DateTime2))
GO
INSERT [dbo].[InstructorWallets] ([Id], [InstructorId], [CurrentBalance], [LastUpdated]) VALUES (6, 6, CAST(0.00 AS Decimal(10, 2)), CAST(N'2026-03-17T10:18:52.0000000' AS DateTime2))
GO
INSERT [dbo].[InstructorWallets] ([Id], [InstructorId], [CurrentBalance], [LastUpdated]) VALUES (7, 7, CAST(0.00 AS Decimal(10, 2)), CAST(N'2026-03-17T10:18:52.0000000' AS DateTime2))
GO
INSERT [dbo].[InstructorWallets] ([Id], [InstructorId], [CurrentBalance], [LastUpdated]) VALUES (8, 8, CAST(0.00 AS Decimal(10, 2)), CAST(N'2026-03-17T10:18:52.0000000' AS DateTime2))
GO
INSERT [dbo].[InstructorWallets] ([Id], [InstructorId], [CurrentBalance], [LastUpdated]) VALUES (9, 9, CAST(0.00 AS Decimal(10, 2)), CAST(N'2026-03-17T10:18:52.0000000' AS DateTime2))
GO
INSERT [dbo].[InstructorWallets] ([Id], [InstructorId], [CurrentBalance], [LastUpdated]) VALUES (10, 10, CAST(0.00 AS Decimal(10, 2)), CAST(N'2026-03-17T10:18:52.0000000' AS DateTime2))
GO
INSERT [dbo].[InstructorWallets] ([Id], [InstructorId], [CurrentBalance], [LastUpdated]) VALUES (11, 11, CAST(0.00 AS Decimal(10, 2)), CAST(N'2026-03-17T10:18:52.0000000' AS DateTime2))
GO
INSERT [dbo].[InstructorWallets] ([Id], [InstructorId], [CurrentBalance], [LastUpdated]) VALUES (12, 12, CAST(0.00 AS Decimal(10, 2)), CAST(N'2026-03-17T10:18:52.0000000' AS DateTime2))
GO
INSERT [dbo].[InstructorWallets] ([Id], [InstructorId], [CurrentBalance], [LastUpdated]) VALUES (13, 13, CAST(0.00 AS Decimal(10, 2)), CAST(N'2026-03-17T10:18:52.0000000' AS DateTime2))
GO
INSERT [dbo].[InstructorWallets] ([Id], [InstructorId], [CurrentBalance], [LastUpdated]) VALUES (14, 14, CAST(0.00 AS Decimal(10, 2)), CAST(N'2026-03-17T10:18:52.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[InstructorWallets] OFF
GO
SET IDENTITY_INSERT [dbo].[KeyWords] ON 
GO
INSERT [dbo].[KeyWords] ([Id], [Word], [Category], [Weight]) VALUES (2, N'靠北', -1, 3)
GO
INSERT [dbo].[KeyWords] ([Id], [Word], [Category], [Weight]) VALUES (3, N'醜八怪', -1, 4)
GO
INSERT [dbo].[KeyWords] ([Id], [Word], [Category], [Weight]) VALUES (5, N'專業', 1, 1)
GO
INSERT [dbo].[KeyWords] ([Id], [Word], [Category], [Weight]) VALUES (6, N'白癡', -1, 5)
GO
INSERT [dbo].[KeyWords] ([Id], [Word], [Category], [Weight]) VALUES (8, N'感謝教練', 1, 2)
GO
INSERT [dbo].[KeyWords] ([Id], [Word], [Category], [Weight]) VALUES (12, N'推薦', 1, 2)
GO
INSERT [dbo].[KeyWords] ([Id], [Word], [Category], [Weight]) VALUES (14, N'大推薦', 1, 3)
GO
INSERT [dbo].[KeyWords] ([Id], [Word], [Category], [Weight]) VALUES (15, N'超推', 1, 2)
GO
INSERT [dbo].[KeyWords] ([Id], [Word], [Category], [Weight]) VALUES (18, N'推薦給大家', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[KeyWords] OFF
GO
SET IDENTITY_INSERT [dbo].[LeaveApprovalDelegations] ON 
GO
INSERT [dbo].[LeaveApprovalDelegations] ([Id], [ManagerEmployeeId], [DelegateEmployeeId], [LeaveRequestId], [StartDate], [EndDate], [IsActive], [CreatedAt]) VALUES (1, 1, 5, 121, CAST(N'2026-03-19T09:00:00.0000000' AS DateTime2), CAST(N'2026-03-19T18:00:00.0000000' AS DateTime2), 1, CAST(N'2026-03-19T15:13:36.9594775' AS DateTime2))
GO
INSERT [dbo].[LeaveApprovalDelegations] ([Id], [ManagerEmployeeId], [DelegateEmployeeId], [LeaveRequestId], [StartDate], [EndDate], [IsActive], [CreatedAt]) VALUES (2, 1, 6, 1122, CAST(N'2026-03-20T09:00:00.0000000' AS DateTime2), CAST(N'2026-03-20T18:00:00.0000000' AS DateTime2), 1, CAST(N'2026-03-20T11:31:11.0363487' AS DateTime2))
GO
INSERT [dbo].[LeaveApprovalDelegations] ([Id], [ManagerEmployeeId], [DelegateEmployeeId], [LeaveRequestId], [StartDate], [EndDate], [IsActive], [CreatedAt]) VALUES (3, 1, 5, 1125, CAST(N'2026-03-20T09:00:00.0000000' AS DateTime2), CAST(N'2026-03-20T18:00:00.0000000' AS DateTime2), 0, CAST(N'2026-03-20T11:51:24.6146706' AS DateTime2))
GO
INSERT [dbo].[LeaveApprovalDelegations] ([Id], [ManagerEmployeeId], [DelegateEmployeeId], [LeaveRequestId], [StartDate], [EndDate], [IsActive], [CreatedAt]) VALUES (4, 1, 5, 1126, CAST(N'2026-06-24T09:00:00.0000000' AS DateTime2), CAST(N'2026-06-24T18:00:00.0000000' AS DateTime2), 1, CAST(N'2026-03-20T11:53:58.5601818' AS DateTime2))
GO
INSERT [dbo].[LeaveApprovalDelegations] ([Id], [ManagerEmployeeId], [DelegateEmployeeId], [LeaveRequestId], [StartDate], [EndDate], [IsActive], [CreatedAt]) VALUES (5, 1, 5, 1127, CAST(N'2026-03-20T09:00:00.0000000' AS DateTime2), CAST(N'2026-03-20T18:00:00.0000000' AS DateTime2), 0, CAST(N'2026-03-20T12:01:17.1444513' AS DateTime2))
GO
INSERT [dbo].[LeaveApprovalDelegations] ([Id], [ManagerEmployeeId], [DelegateEmployeeId], [LeaveRequestId], [StartDate], [EndDate], [IsActive], [CreatedAt]) VALUES (6, 1, 5, 1129, CAST(N'2026-03-20T09:00:00.0000000' AS DateTime2), CAST(N'2026-03-20T18:00:00.0000000' AS DateTime2), 0, CAST(N'2026-03-20T13:02:47.9564466' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[LeaveApprovalDelegations] OFF
GO
SET IDENTITY_INSERT [dbo].[LeaveAttachments] ON 
GO
INSERT [dbo].[LeaveAttachments] ([Id], [RequestId], [FileName], [FileUrl], [UploadedAt]) VALUES (1, 2, N'診斷證明_陳志明.pdf', N'/uploads/leave-docs/2.pdf', CAST(N'2026-01-31T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[LeaveAttachments] ([Id], [RequestId], [FileName], [FileUrl], [UploadedAt]) VALUES (2, 117, N'診斷證明_林辰書.pdf', N'/uploads/leave-docs/117.pdf', CAST(N'2026-02-08T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[LeaveAttachments] ([Id], [RequestId], [FileName], [FileUrl], [UploadedAt]) VALUES (3, 112, N'診斷證明_劉書沐.pdf', N'/uploads/leave-docs/112.pdf', CAST(N'2026-02-07T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[LeaveAttachments] ([Id], [RequestId], [FileName], [FileUrl], [UploadedAt]) VALUES (4, 107, N'診斷證明_孫安薇.pdf', N'/uploads/leave-docs/107.pdf', CAST(N'2026-02-06T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[LeaveAttachments] ([Id], [RequestId], [FileName], [FileUrl], [UploadedAt]) VALUES (5, 102, N'診斷證明_趙薇沐.pdf', N'/uploads/leave-docs/102.pdf', CAST(N'2026-02-05T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[LeaveAttachments] ([Id], [RequestId], [FileName], [FileUrl], [UploadedAt]) VALUES (6, 97, N'診斷證明_張朗薇.pdf', N'/uploads/leave-docs/97.pdf', CAST(N'2026-02-04T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[LeaveAttachments] ([Id], [RequestId], [FileName], [FileUrl], [UploadedAt]) VALUES (7, 92, N'診斷證明_孫楠清.pdf', N'/uploads/leave-docs/92.pdf', CAST(N'2026-02-03T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[LeaveAttachments] ([Id], [RequestId], [FileName], [FileUrl], [UploadedAt]) VALUES (8, 87, N'診斷證明_黃涵雅.pdf', N'/uploads/leave-docs/87.pdf', CAST(N'2026-02-02T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[LeaveAttachments] ([Id], [RequestId], [FileName], [FileUrl], [UploadedAt]) VALUES (9, 82, N'診斷證明_楊揚遠.pdf', N'/uploads/leave-docs/82.pdf', CAST(N'2026-02-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[LeaveAttachments] ([Id], [RequestId], [FileName], [FileUrl], [UploadedAt]) VALUES (10, 77, N'診斷證明_陳柔辰.pdf', N'/uploads/leave-docs/77.pdf', CAST(N'2026-01-31T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[LeaveAttachments] ([Id], [RequestId], [FileName], [FileUrl], [UploadedAt]) VALUES (11, 72, N'診斷證明_趙宇清.pdf', N'/uploads/leave-docs/72.pdf', CAST(N'2026-01-30T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[LeaveAttachments] ([Id], [RequestId], [FileName], [FileUrl], [UploadedAt]) VALUES (12, 67, N'診斷證明_黃揚航.pdf', N'/uploads/leave-docs/67.pdf', CAST(N'2026-02-13T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[LeaveAttachments] ([Id], [RequestId], [FileName], [FileUrl], [UploadedAt]) VALUES (13, 62, N'診斷證明_劉晨柔.pdf', N'/uploads/leave-docs/62.pdf', CAST(N'2026-02-12T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[LeaveAttachments] ([Id], [RequestId], [FileName], [FileUrl], [UploadedAt]) VALUES (14, 57, N'診斷證明_何雅澤.pdf', N'/uploads/leave-docs/57.pdf', CAST(N'2026-02-11T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[LeaveAttachments] ([Id], [RequestId], [FileName], [FileUrl], [UploadedAt]) VALUES (15, 52, N'診斷證明_吳青揚.pdf', N'/uploads/leave-docs/52.pdf', CAST(N'2026-02-10T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[LeaveAttachments] ([Id], [RequestId], [FileName], [FileUrl], [UploadedAt]) VALUES (16, 47, N'診斷證明_張霖瑾.pdf', N'/uploads/leave-docs/47.pdf', CAST(N'2026-02-09T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[LeaveAttachments] ([Id], [RequestId], [FileName], [FileUrl], [UploadedAt]) VALUES (17, 42, N'診斷證明_馬若瑤.pdf', N'/uploads/leave-docs/42.pdf', CAST(N'2026-02-08T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[LeaveAttachments] ([Id], [RequestId], [FileName], [FileUrl], [UploadedAt]) VALUES (18, 37, N'診斷證明_高詩寧.pdf', N'/uploads/leave-docs/37.pdf', CAST(N'2026-02-07T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[LeaveAttachments] ([Id], [RequestId], [FileName], [FileUrl], [UploadedAt]) VALUES (19, 32, N'診斷證明_趙晨庭.pdf', N'/uploads/leave-docs/32.pdf', CAST(N'2026-02-06T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[LeaveAttachments] ([Id], [RequestId], [FileName], [FileUrl], [UploadedAt]) VALUES (20, 27, N'診斷證明_王音寧.pdf', N'/uploads/leave-docs/27.pdf', CAST(N'2026-02-05T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[LeaveAttachments] ([Id], [RequestId], [FileName], [FileUrl], [UploadedAt]) VALUES (21, 22, N'診斷證明_高清星.pdf', N'/uploads/leave-docs/22.pdf', CAST(N'2026-02-04T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[LeaveAttachments] ([Id], [RequestId], [FileName], [FileUrl], [UploadedAt]) VALUES (22, 17, N'診斷證明_王淑芬.pdf', N'/uploads/leave-docs/17.pdf', CAST(N'2026-02-03T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[LeaveAttachments] ([Id], [RequestId], [FileName], [FileUrl], [UploadedAt]) VALUES (23, 12, N'診斷證明_張建國.pdf', N'/uploads/leave-docs/12.pdf', CAST(N'2026-02-02T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[LeaveAttachments] ([Id], [RequestId], [FileName], [FileUrl], [UploadedAt]) VALUES (24, 7, N'診斷證明_林美玲.pdf', N'/uploads/leave-docs/7.pdf', CAST(N'2026-02-01T00:00:00.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[LeaveAttachments] OFF
GO
SET IDENTITY_INSERT [dbo].[LeaveBalanceHistories] ON 
GO
INSERT [dbo].[LeaveBalanceHistories] ([Id], [LeaveBalanceId], [ChangeType], [ChangeDays], [OldTotalDays], [NewTotalDays], [OldUsedDays], [NewUsedDays], [Reason], [OperatorId], [CreatedAt]) VALUES (1, 1, N'Apply', CAST(-1.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), N'請假申請：特休 2026/03/19 09:00~2026/03/19 18:00', 1, CAST(N'2026-03-19T15:13:36.9822756' AS DateTime2))
GO
INSERT [dbo].[LeaveBalanceHistories] ([Id], [LeaveBalanceId], [ChangeType], [ChangeDays], [OldTotalDays], [NewTotalDays], [OldUsedDays], [NewUsedDays], [Reason], [OperatorId], [CreatedAt]) VALUES (2, 25, N'CancelApproved', CAST(1.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'取消請假核准退還：特休', 5, CAST(N'2026-03-19T15:57:11.6507920' AS DateTime2))
GO
INSERT [dbo].[LeaveBalanceHistories] ([Id], [LeaveBalanceId], [ChangeType], [ChangeDays], [OldTotalDays], [NewTotalDays], [OldUsedDays], [NewUsedDays], [Reason], [OperatorId], [CreatedAt]) VALUES (3, 26, N'Apply', CAST(-1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), N'請假申請：病假 2026/03/19 09:00~2026/03/19 18:00', 5, CAST(N'2026-03-19T15:58:09.8783891' AS DateTime2))
GO
INSERT [dbo].[LeaveBalanceHistories] ([Id], [LeaveBalanceId], [ChangeType], [ChangeDays], [OldTotalDays], [NewTotalDays], [OldUsedDays], [NewUsedDays], [Reason], [OperatorId], [CreatedAt]) VALUES (4, 26, N'CancelApproved', CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'取消請假核准退還：病假', 5, CAST(N'2026-03-19T15:59:09.4120877' AS DateTime2))
GO
INSERT [dbo].[LeaveBalanceHistories] ([Id], [LeaveBalanceId], [ChangeType], [ChangeDays], [OldTotalDays], [NewTotalDays], [OldUsedDays], [NewUsedDays], [Reason], [OperatorId], [CreatedAt]) VALUES (1002, 1, N'Apply', CAST(-1.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), N'請假申請：特休 2026/03/20 09:00~2026/03/20 18:00', 1, CAST(N'2026-03-20T11:31:11.0611556' AS DateTime2))
GO
INSERT [dbo].[LeaveBalanceHistories] ([Id], [LeaveBalanceId], [ChangeType], [ChangeDays], [OldTotalDays], [NewTotalDays], [OldUsedDays], [NewUsedDays], [Reason], [OperatorId], [CreatedAt]) VALUES (1003, 25, N'Apply', CAST(-1.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'請假申請：特休 2026/03/20 09:00~2026/03/20 18:00', 5, CAST(N'2026-03-20T11:37:15.0139804' AS DateTime2))
GO
INSERT [dbo].[LeaveBalanceHistories] ([Id], [LeaveBalanceId], [ChangeType], [ChangeDays], [OldTotalDays], [NewTotalDays], [OldUsedDays], [NewUsedDays], [Reason], [OperatorId], [CreatedAt]) VALUES (1004, 25, N'Reject', CAST(1.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'假單駁回退還：特休', 1, CAST(N'2026-03-20T11:38:12.5618497' AS DateTime2))
GO
INSERT [dbo].[LeaveBalanceHistories] ([Id], [LeaveBalanceId], [ChangeType], [ChangeDays], [OldTotalDays], [NewTotalDays], [OldUsedDays], [NewUsedDays], [Reason], [OperatorId], [CreatedAt]) VALUES (1005, 25, N'Apply', CAST(-1.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'請假申請：特休 2026/06/24 09:00~2026/06/24 18:00', 5, CAST(N'2026-03-20T11:49:37.3460224' AS DateTime2))
GO
INSERT [dbo].[LeaveBalanceHistories] ([Id], [LeaveBalanceId], [ChangeType], [ChangeDays], [OldTotalDays], [NewTotalDays], [OldUsedDays], [NewUsedDays], [Reason], [OperatorId], [CreatedAt]) VALUES (1006, 6, N'Apply', CAST(-1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'請假申請：公假 2026/03/20 09:00~2026/03/20 18:00', 1, CAST(N'2026-03-20T11:51:24.6339817' AS DateTime2))
GO
INSERT [dbo].[LeaveBalanceHistories] ([Id], [LeaveBalanceId], [ChangeType], [ChangeDays], [OldTotalDays], [NewTotalDays], [OldUsedDays], [NewUsedDays], [Reason], [OperatorId], [CreatedAt]) VALUES (1007, 6, N'CancelApproved', CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'主管自行取消假單退還：公假', 1, CAST(N'2026-03-20T11:52:37.3066255' AS DateTime2))
GO
INSERT [dbo].[LeaveBalanceHistories] ([Id], [LeaveBalanceId], [ChangeType], [ChangeDays], [OldTotalDays], [NewTotalDays], [OldUsedDays], [NewUsedDays], [Reason], [OperatorId], [CreatedAt]) VALUES (1008, 1, N'Apply', CAST(-1.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), N'請假申請：特休 2026/06/24 09:00~2026/06/24 18:00', 1, CAST(N'2026-03-20T11:53:58.5622054' AS DateTime2))
GO
INSERT [dbo].[LeaveBalanceHistories] ([Id], [LeaveBalanceId], [ChangeType], [ChangeDays], [OldTotalDays], [NewTotalDays], [OldUsedDays], [NewUsedDays], [Reason], [OperatorId], [CreatedAt]) VALUES (1009, 6, N'Apply', CAST(-1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'請假申請：公假 2026/03/20 09:00~2026/03/20 18:00', 1, CAST(N'2026-03-20T12:01:17.1471255' AS DateTime2))
GO
INSERT [dbo].[LeaveBalanceHistories] ([Id], [LeaveBalanceId], [ChangeType], [ChangeDays], [OldTotalDays], [NewTotalDays], [OldUsedDays], [NewUsedDays], [Reason], [OperatorId], [CreatedAt]) VALUES (1010, 6, N'CancelApproved', CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'主管自行取消假單退還：公假', 1, CAST(N'2026-03-20T12:02:07.8913284' AS DateTime2))
GO
INSERT [dbo].[LeaveBalanceHistories] ([Id], [LeaveBalanceId], [ChangeType], [ChangeDays], [OldTotalDays], [NewTotalDays], [OldUsedDays], [NewUsedDays], [Reason], [OperatorId], [CreatedAt]) VALUES (1011, 4, N'AdminGrant', CAST(8.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'已提交結婚證書', 26, CAST(N'2026-03-20T12:04:02.0732256' AS DateTime2))
GO
INSERT [dbo].[LeaveBalanceHistories] ([Id], [LeaveBalanceId], [ChangeType], [ChangeDays], [OldTotalDays], [NewTotalDays], [OldUsedDays], [NewUsedDays], [Reason], [OperatorId], [CreatedAt]) VALUES (1012, 25, N'Apply', CAST(-1.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), N'請假申請：特休 2026/03/25 09:00~2026/03/25 18:00', 5, CAST(N'2026-03-20T12:59:13.5239597' AS DateTime2))
GO
INSERT [dbo].[LeaveBalanceHistories] ([Id], [LeaveBalanceId], [ChangeType], [ChangeDays], [OldTotalDays], [NewTotalDays], [OldUsedDays], [NewUsedDays], [Reason], [OperatorId], [CreatedAt]) VALUES (1013, 6, N'Apply', CAST(-1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'請假申請：公假 2026/03/20 09:00~2026/03/20 18:00', 1, CAST(N'2026-03-20T13:02:47.9752141' AS DateTime2))
GO
INSERT [dbo].[LeaveBalanceHistories] ([Id], [LeaveBalanceId], [ChangeType], [ChangeDays], [OldTotalDays], [NewTotalDays], [OldUsedDays], [NewUsedDays], [Reason], [OperatorId], [CreatedAt]) VALUES (1014, 6, N'CancelApproved', CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'主管自行取消假單退還：公假', 1, CAST(N'2026-03-20T13:03:41.3030298' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[LeaveBalanceHistories] OFF
GO
SET IDENTITY_INSERT [dbo].[LeaveBalances] ON 
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (1, 1, 1, 2026, CAST(15.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (2, 1, 2, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (3, 1, 3, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (4, 1, 4, 2026, CAST(8.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (5, 1, 5, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (6, 1, 6, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (7, 2, 1, 2026, CAST(15.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (8, 2, 2, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (9, 2, 3, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (10, 2, 4, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (11, 2, 5, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (12, 2, 6, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (13, 3, 1, 2026, CAST(15.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (14, 3, 2, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (15, 3, 3, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (16, 3, 4, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (17, 3, 5, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (18, 3, 6, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (19, 4, 1, 2026, CAST(15.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (20, 4, 2, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (21, 4, 3, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (22, 4, 4, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (23, 4, 5, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (24, 4, 6, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (25, 5, 1, 2026, CAST(15.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (26, 5, 2, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (27, 5, 3, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (28, 5, 4, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (29, 5, 5, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (30, 5, 6, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (31, 6, 1, 2026, CAST(14.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (32, 6, 2, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (33, 6, 3, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (34, 6, 4, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (35, 6, 5, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (36, 6, 6, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (37, 7, 1, 2026, CAST(14.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (38, 7, 2, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (39, 7, 3, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (40, 7, 4, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (41, 7, 5, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (42, 7, 6, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (43, 8, 1, 2026, CAST(15.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (44, 8, 2, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (45, 8, 3, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (46, 8, 4, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (47, 8, 5, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (48, 8, 6, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (49, 9, 1, 2026, CAST(14.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (50, 9, 2, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (51, 9, 3, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (52, 9, 4, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (53, 9, 5, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (54, 9, 6, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (55, 10, 1, 2026, CAST(15.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (56, 10, 2, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (57, 10, 3, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (58, 10, 4, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (59, 10, 5, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (60, 10, 6, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (61, 11, 1, 2026, CAST(14.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (62, 11, 2, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (63, 11, 3, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (64, 11, 4, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (65, 11, 5, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (66, 11, 6, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (67, 12, 1, 2026, CAST(15.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (68, 12, 2, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (69, 12, 3, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (70, 12, 4, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (71, 12, 5, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (72, 12, 6, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (73, 13, 1, 2026, CAST(14.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (74, 13, 2, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (75, 13, 3, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (76, 13, 4, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (77, 13, 5, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (78, 13, 6, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (79, 14, 1, 2026, CAST(15.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (80, 14, 2, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (81, 14, 3, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (82, 14, 4, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (83, 14, 5, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (84, 14, 6, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (85, 15, 1, 2026, CAST(14.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (86, 15, 2, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (87, 15, 3, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (88, 15, 4, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (89, 15, 5, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (90, 15, 6, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (91, 16, 1, 2026, CAST(15.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (92, 16, 2, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (93, 16, 3, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (94, 16, 4, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (95, 16, 5, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (96, 16, 6, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (97, 17, 1, 2026, CAST(14.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (98, 17, 2, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (99, 17, 3, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (100, 17, 4, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (101, 17, 5, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (102, 17, 6, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (103, 18, 1, 2026, CAST(15.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (104, 18, 2, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (105, 18, 3, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (106, 18, 4, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (107, 18, 5, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (108, 18, 6, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (109, 19, 1, 2026, CAST(14.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (110, 19, 2, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (111, 19, 3, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (112, 19, 4, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (113, 19, 5, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (114, 19, 6, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (115, 20, 1, 2026, CAST(15.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (116, 20, 2, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (117, 20, 3, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (118, 20, 4, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (119, 20, 5, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (120, 20, 6, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (121, 21, 1, 2026, CAST(14.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (122, 21, 2, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (123, 21, 3, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (124, 21, 4, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (125, 21, 5, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (126, 21, 6, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (127, 22, 1, 2026, CAST(10.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (128, 22, 2, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (129, 22, 3, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (130, 22, 4, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (131, 22, 5, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (132, 22, 6, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (133, 23, 1, 2026, CAST(14.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (134, 23, 2, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (135, 23, 3, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (136, 23, 4, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (137, 23, 5, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (138, 23, 6, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (139, 24, 1, 2026, CAST(14.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (140, 24, 2, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (141, 24, 3, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (142, 24, 4, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (143, 24, 5, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[LeaveBalances] ([Id], [EmployeeId], [LeaveTypeId], [Year], [TotalDays], [UsedDays]) VALUES (144, 24, 6, 2026, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[LeaveBalances] OFF
GO
SET IDENTITY_INSERT [dbo].[LeaveRequests] ON 
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (1, 1, 1, CAST(N'2026-01-07T09:00:00.000' AS DateTime), CAST(N'2026-01-08T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'個人休假', N'Approved', 2, 2, CAST(N'2026-01-06T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-01-04T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (2, 1, 2, CAST(N'2026-02-03T09:00:00.000' AS DateTime), CAST(N'2026-02-04T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'身體不適需就醫', N'Approved', 2, 2, CAST(N'2026-02-02T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-01-31T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (3, 1, 3, CAST(N'2026-02-17T09:00:00.000' AS DateTime), CAST(N'2026-02-18T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'處理私人事務', N'Approved', 2, 2, CAST(N'2026-02-02T00:00:00.0000000' AS DateTime2), N'該日部門人力不足，建議改期', CAST(N'2026-02-14T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (4, 1, 1, CAST(N'2026-04-08T09:00:00.000' AS DateTime), CAST(N'2026-04-09T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'家庭旅遊計畫', N'Approved', 2, 2, CAST(N'2026-02-02T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-04-05T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), N'Pending', CAST(N'2026-03-20T11:32:17.6316356' AS DateTime2), N'不玩了')
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (5, 1, 3, CAST(N'2026-03-03T09:00:00.000' AS DateTime), CAST(N'2026-03-03T18:00:00.000' AS DateTime), CAST(0.50 AS Decimal(18, 2)), N'辦理個人事務（半天）', N'Cancelled', 2, NULL, NULL, NULL, CAST(N'2026-02-28T00:00:00.0000000' AS DateTime2), CAST(4.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (6, 2, 1, CAST(N'2026-01-08T09:00:00.000' AS DateTime), CAST(N'2026-01-09T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'個人休假', N'Approved', 1, 1, CAST(N'2026-01-07T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-01-05T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (7, 2, 2, CAST(N'2026-02-04T09:00:00.000' AS DateTime), CAST(N'2026-02-05T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'身體不適需就醫', N'Approved', 1, 1, CAST(N'2026-02-03T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-02-01T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (8, 2, 3, CAST(N'2026-02-18T09:00:00.000' AS DateTime), CAST(N'2026-02-19T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'處理私人事務', N'Rejected', 1, 1, CAST(N'2026-02-17T00:00:00.0000000' AS DateTime2), N'該日部門人力不足，建議改期', CAST(N'2026-02-15T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (9, 2, 1, CAST(N'2026-04-09T09:00:00.000' AS DateTime), CAST(N'2026-04-10T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'家庭旅遊計畫', N'Pending', 1, NULL, NULL, NULL, CAST(N'2026-04-06T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (10, 2, 3, CAST(N'2026-03-04T09:00:00.000' AS DateTime), CAST(N'2026-03-04T18:00:00.000' AS DateTime), CAST(0.50 AS Decimal(18, 2)), N'辦理個人事務（半天）', N'Cancelled', 1, NULL, NULL, NULL, CAST(N'2026-03-01T00:00:00.0000000' AS DateTime2), CAST(4.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (11, 3, 1, CAST(N'2026-01-09T09:00:00.000' AS DateTime), CAST(N'2026-01-10T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'個人休假', N'Approved', 4, 4, CAST(N'2026-01-08T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-01-06T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (12, 3, 2, CAST(N'2026-02-05T09:00:00.000' AS DateTime), CAST(N'2026-02-06T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'身體不適需就醫', N'Approved', 4, 4, CAST(N'2026-02-04T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-02-02T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (13, 3, 3, CAST(N'2026-02-19T09:00:00.000' AS DateTime), CAST(N'2026-02-20T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'處理私人事務', N'Rejected', 4, 4, CAST(N'2026-02-18T00:00:00.0000000' AS DateTime2), N'該日部門人力不足，建議改期', CAST(N'2026-02-16T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (14, 3, 1, CAST(N'2026-04-10T09:00:00.000' AS DateTime), CAST(N'2026-04-11T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'家庭旅遊計畫', N'Pending', 4, NULL, NULL, NULL, CAST(N'2026-04-07T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (15, 3, 3, CAST(N'2026-03-05T09:00:00.000' AS DateTime), CAST(N'2026-03-05T18:00:00.000' AS DateTime), CAST(0.50 AS Decimal(18, 2)), N'辦理個人事務（半天）', N'Cancelled', 4, NULL, NULL, NULL, CAST(N'2026-03-02T00:00:00.0000000' AS DateTime2), CAST(4.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (16, 4, 1, CAST(N'2026-01-10T09:00:00.000' AS DateTime), CAST(N'2026-01-11T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'個人休假', N'Approved', 3, 3, CAST(N'2026-01-09T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-01-07T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (17, 4, 2, CAST(N'2026-02-06T09:00:00.000' AS DateTime), CAST(N'2026-02-07T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'身體不適需就醫', N'Approved', 3, 3, CAST(N'2026-02-05T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-02-03T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (18, 4, 3, CAST(N'2026-02-20T09:00:00.000' AS DateTime), CAST(N'2026-02-21T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'處理私人事務', N'Rejected', 3, 3, CAST(N'2026-02-19T00:00:00.0000000' AS DateTime2), N'該日部門人力不足，建議改期', CAST(N'2026-02-17T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (19, 4, 1, CAST(N'2026-04-11T09:00:00.000' AS DateTime), CAST(N'2026-04-12T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'家庭旅遊計畫', N'Pending', 3, NULL, NULL, NULL, CAST(N'2026-04-08T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (20, 4, 3, CAST(N'2026-03-06T09:00:00.000' AS DateTime), CAST(N'2026-03-06T18:00:00.000' AS DateTime), CAST(0.50 AS Decimal(18, 2)), N'辦理個人事務（半天）', N'Cancelled', 3, NULL, NULL, NULL, CAST(N'2026-03-03T00:00:00.0000000' AS DateTime2), CAST(4.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (21, 5, 1, CAST(N'2026-01-11T09:00:00.000' AS DateTime), CAST(N'2026-01-12T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'個人休假', N'Approved', 8, 1, CAST(N'2026-01-10T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-01-08T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (22, 5, 2, CAST(N'2026-02-07T09:00:00.000' AS DateTime), CAST(N'2026-02-08T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'身體不適需就醫', N'Approved', 8, 1, CAST(N'2026-02-06T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-02-04T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (23, 5, 3, CAST(N'2026-02-21T09:00:00.000' AS DateTime), CAST(N'2026-02-22T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'處理私人事務', N'Rejected', 8, 1, CAST(N'2026-02-20T00:00:00.0000000' AS DateTime2), N'該日部門人力不足，建議改期', CAST(N'2026-02-18T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (24, 5, 1, CAST(N'2026-04-12T09:00:00.000' AS DateTime), CAST(N'2026-04-13T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'家庭旅遊計畫', N'Cancelled', 8, 5, CAST(N'2026-03-19T15:57:12.0000000' AS DateTime2), NULL, CAST(N'2026-04-09T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), N'Pending', CAST(N'2026-03-19T15:47:20.8409273' AS DateTime2), N'testing cancel')
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (25, 5, 3, CAST(N'2026-03-07T09:00:00.000' AS DateTime), CAST(N'2026-03-07T18:00:00.000' AS DateTime), CAST(0.50 AS Decimal(18, 2)), N'辦理個人事務（半天）', N'Cancelled', 8, NULL, NULL, NULL, CAST(N'2026-03-04T00:00:00.0000000' AS DateTime2), CAST(4.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (26, 6, 1, CAST(N'2026-01-12T09:00:00.000' AS DateTime), CAST(N'2026-01-13T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'個人休假', N'Approved', 9, 1, CAST(N'2026-01-11T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-01-09T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (27, 6, 2, CAST(N'2026-02-08T09:00:00.000' AS DateTime), CAST(N'2026-02-09T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'身體不適需就醫', N'Approved', 9, 1, CAST(N'2026-02-07T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-02-05T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (28, 6, 3, CAST(N'2026-02-22T09:00:00.000' AS DateTime), CAST(N'2026-02-23T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'處理私人事務', N'Rejected', 9, 1, CAST(N'2026-02-21T00:00:00.0000000' AS DateTime2), N'該日部門人力不足，建議改期', CAST(N'2026-02-19T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (29, 6, 1, CAST(N'2026-04-13T09:00:00.000' AS DateTime), CAST(N'2026-04-14T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'家庭旅遊計畫', N'Pending', 9, NULL, NULL, NULL, CAST(N'2026-04-10T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (30, 6, 3, CAST(N'2026-03-08T09:00:00.000' AS DateTime), CAST(N'2026-03-08T18:00:00.000' AS DateTime), CAST(0.50 AS Decimal(18, 2)), N'辦理個人事務（半天）', N'Cancelled', 9, NULL, NULL, NULL, CAST(N'2026-03-05T00:00:00.0000000' AS DateTime2), CAST(4.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (31, 7, 1, CAST(N'2026-01-13T09:00:00.000' AS DateTime), CAST(N'2026-01-14T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'個人休假', N'Approved', 10, 1, CAST(N'2026-01-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-01-10T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (32, 7, 2, CAST(N'2026-02-09T09:00:00.000' AS DateTime), CAST(N'2026-02-10T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'身體不適需就醫', N'Approved', 10, 1, CAST(N'2026-02-08T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-02-06T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (33, 7, 3, CAST(N'2026-02-23T09:00:00.000' AS DateTime), CAST(N'2026-02-24T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'處理私人事務', N'Rejected', 10, 1, CAST(N'2026-02-22T00:00:00.0000000' AS DateTime2), N'該日部門人力不足，建議改期', CAST(N'2026-02-20T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (34, 7, 1, CAST(N'2026-04-14T09:00:00.000' AS DateTime), CAST(N'2026-04-15T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'家庭旅遊計畫', N'Pending', 10, NULL, NULL, NULL, CAST(N'2026-04-11T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (35, 7, 3, CAST(N'2026-03-09T09:00:00.000' AS DateTime), CAST(N'2026-03-09T18:00:00.000' AS DateTime), CAST(0.50 AS Decimal(18, 2)), N'辦理個人事務（半天）', N'Cancelled', 10, NULL, NULL, NULL, CAST(N'2026-03-06T00:00:00.0000000' AS DateTime2), CAST(4.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (36, 8, 1, CAST(N'2026-01-14T09:00:00.000' AS DateTime), CAST(N'2026-01-15T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'個人休假', N'Approved', 11, 1, CAST(N'2026-01-13T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-01-11T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (37, 8, 2, CAST(N'2026-02-10T09:00:00.000' AS DateTime), CAST(N'2026-02-11T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'身體不適需就醫', N'Approved', 11, 1, CAST(N'2026-02-09T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-02-07T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (38, 8, 3, CAST(N'2026-02-24T09:00:00.000' AS DateTime), CAST(N'2026-02-25T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'處理私人事務', N'Rejected', 11, 1, CAST(N'2026-02-23T00:00:00.0000000' AS DateTime2), N'該日部門人力不足，建議改期', CAST(N'2026-02-21T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (39, 8, 1, CAST(N'2026-04-15T09:00:00.000' AS DateTime), CAST(N'2026-04-16T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'家庭旅遊計畫', N'Pending', 11, NULL, NULL, NULL, CAST(N'2026-04-12T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (40, 8, 3, CAST(N'2026-03-10T09:00:00.000' AS DateTime), CAST(N'2026-03-10T18:00:00.000' AS DateTime), CAST(0.50 AS Decimal(18, 2)), N'辦理個人事務（半天）', N'Cancelled', 11, NULL, NULL, NULL, CAST(N'2026-03-07T00:00:00.0000000' AS DateTime2), CAST(4.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (41, 9, 1, CAST(N'2026-01-15T09:00:00.000' AS DateTime), CAST(N'2026-01-16T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'個人休假', N'Approved', 12, 1, CAST(N'2026-01-14T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-01-12T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (42, 9, 2, CAST(N'2026-02-11T09:00:00.000' AS DateTime), CAST(N'2026-02-12T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'身體不適需就醫', N'Approved', 12, 1, CAST(N'2026-02-10T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-02-08T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (43, 9, 3, CAST(N'2026-02-25T09:00:00.000' AS DateTime), CAST(N'2026-02-26T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'處理私人事務', N'Rejected', 12, 1, CAST(N'2026-02-24T00:00:00.0000000' AS DateTime2), N'該日部門人力不足，建議改期', CAST(N'2026-02-22T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (44, 9, 1, CAST(N'2026-04-16T09:00:00.000' AS DateTime), CAST(N'2026-04-17T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'家庭旅遊計畫', N'Pending', 12, NULL, NULL, NULL, CAST(N'2026-04-13T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (45, 9, 3, CAST(N'2026-03-11T09:00:00.000' AS DateTime), CAST(N'2026-03-11T18:00:00.000' AS DateTime), CAST(0.50 AS Decimal(18, 2)), N'辦理個人事務（半天）', N'Cancelled', 12, NULL, NULL, NULL, CAST(N'2026-03-08T00:00:00.0000000' AS DateTime2), CAST(4.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (46, 10, 1, CAST(N'2026-01-16T09:00:00.000' AS DateTime), CAST(N'2026-01-17T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'個人休假', N'Approved', 13, 2, CAST(N'2026-01-15T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-01-13T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (47, 10, 2, CAST(N'2026-02-12T09:00:00.000' AS DateTime), CAST(N'2026-02-13T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'身體不適需就醫', N'Approved', 13, 2, CAST(N'2026-02-11T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-02-09T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (48, 10, 3, CAST(N'2026-02-16T09:00:00.000' AS DateTime), CAST(N'2026-02-17T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'處理私人事務', N'Rejected', 13, 2, CAST(N'2026-02-15T00:00:00.0000000' AS DateTime2), N'該日部門人力不足，建議改期', CAST(N'2026-02-13T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (49, 10, 1, CAST(N'2026-04-17T09:00:00.000' AS DateTime), CAST(N'2026-04-18T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'家庭旅遊計畫', N'Pending', 13, NULL, NULL, NULL, CAST(N'2026-04-14T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (50, 10, 3, CAST(N'2026-03-12T09:00:00.000' AS DateTime), CAST(N'2026-03-12T18:00:00.000' AS DateTime), CAST(0.50 AS Decimal(18, 2)), N'辦理個人事務（半天）', N'Cancelled', 13, NULL, NULL, NULL, CAST(N'2026-03-09T00:00:00.0000000' AS DateTime2), CAST(4.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (51, 11, 1, CAST(N'2026-01-17T09:00:00.000' AS DateTime), CAST(N'2026-01-18T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'個人休假', N'Approved', 14, 2, CAST(N'2026-01-16T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-01-14T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (52, 11, 2, CAST(N'2026-02-13T09:00:00.000' AS DateTime), CAST(N'2026-02-14T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'身體不適需就醫', N'Approved', 14, 2, CAST(N'2026-02-12T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-02-10T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (53, 11, 3, CAST(N'2026-02-17T09:00:00.000' AS DateTime), CAST(N'2026-02-18T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'處理私人事務', N'Rejected', 14, 2, CAST(N'2026-02-16T00:00:00.0000000' AS DateTime2), N'該日部門人力不足，建議改期', CAST(N'2026-02-14T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (54, 11, 1, CAST(N'2026-04-18T09:00:00.000' AS DateTime), CAST(N'2026-04-19T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'家庭旅遊計畫', N'Pending', 14, NULL, NULL, NULL, CAST(N'2026-04-15T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (55, 11, 3, CAST(N'2026-03-13T09:00:00.000' AS DateTime), CAST(N'2026-03-13T18:00:00.000' AS DateTime), CAST(0.50 AS Decimal(18, 2)), N'辦理個人事務（半天）', N'Cancelled', 14, NULL, NULL, NULL, CAST(N'2026-03-10T00:00:00.0000000' AS DateTime2), CAST(4.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (56, 12, 1, CAST(N'2026-01-18T09:00:00.000' AS DateTime), CAST(N'2026-01-19T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'個人休假', N'Approved', 5, 2, CAST(N'2026-01-17T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-01-15T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (57, 12, 2, CAST(N'2026-02-14T09:00:00.000' AS DateTime), CAST(N'2026-02-15T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'身體不適需就醫', N'Approved', 5, 2, CAST(N'2026-02-13T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-02-11T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (58, 12, 3, CAST(N'2026-02-18T09:00:00.000' AS DateTime), CAST(N'2026-02-19T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'處理私人事務', N'Rejected', 5, 2, CAST(N'2026-02-17T00:00:00.0000000' AS DateTime2), N'該日部門人力不足，建議改期', CAST(N'2026-02-15T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (59, 12, 1, CAST(N'2026-04-19T09:00:00.000' AS DateTime), CAST(N'2026-04-20T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'家庭旅遊計畫', N'Pending', 5, NULL, NULL, NULL, CAST(N'2026-04-16T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (60, 12, 3, CAST(N'2026-03-14T09:00:00.000' AS DateTime), CAST(N'2026-03-14T18:00:00.000' AS DateTime), CAST(0.50 AS Decimal(18, 2)), N'辦理個人事務（半天）', N'Cancelled', 5, NULL, NULL, NULL, CAST(N'2026-03-11T00:00:00.0000000' AS DateTime2), CAST(4.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (61, 13, 1, CAST(N'2026-01-19T09:00:00.000' AS DateTime), CAST(N'2026-01-20T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'個人休假', N'Approved', 6, 2, CAST(N'2026-01-18T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-01-16T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (62, 13, 2, CAST(N'2026-02-15T09:00:00.000' AS DateTime), CAST(N'2026-02-16T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'身體不適需就醫', N'Approved', 6, 2, CAST(N'2026-02-14T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-02-12T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (63, 13, 3, CAST(N'2026-02-19T09:00:00.000' AS DateTime), CAST(N'2026-02-20T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'處理私人事務', N'Rejected', 6, 2, CAST(N'2026-02-18T00:00:00.0000000' AS DateTime2), N'該日部門人力不足，建議改期', CAST(N'2026-02-16T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (64, 13, 1, CAST(N'2026-04-20T09:00:00.000' AS DateTime), CAST(N'2026-04-21T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'家庭旅遊計畫', N'Pending', 6, NULL, NULL, NULL, CAST(N'2026-04-17T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (65, 13, 3, CAST(N'2026-03-15T09:00:00.000' AS DateTime), CAST(N'2026-03-15T18:00:00.000' AS DateTime), CAST(0.50 AS Decimal(18, 2)), N'辦理個人事務（半天）', N'Cancelled', 6, NULL, NULL, NULL, CAST(N'2026-03-12T00:00:00.0000000' AS DateTime2), CAST(4.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (66, 14, 1, CAST(N'2026-01-20T09:00:00.000' AS DateTime), CAST(N'2026-01-21T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'個人休假', N'Approved', 7, 2, CAST(N'2026-01-19T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-01-17T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (67, 14, 2, CAST(N'2026-02-16T09:00:00.000' AS DateTime), CAST(N'2026-02-17T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'身體不適需就醫', N'Approved', 7, 2, CAST(N'2026-02-15T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-02-13T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (68, 14, 3, CAST(N'2026-02-20T09:00:00.000' AS DateTime), CAST(N'2026-02-21T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'處理私人事務', N'Rejected', 7, 2, CAST(N'2026-02-19T00:00:00.0000000' AS DateTime2), N'該日部門人力不足，建議改期', CAST(N'2026-02-17T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (69, 14, 1, CAST(N'2026-04-21T09:00:00.000' AS DateTime), CAST(N'2026-04-22T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'家庭旅遊計畫', N'Pending', 7, NULL, NULL, NULL, CAST(N'2026-04-18T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (70, 14, 3, CAST(N'2026-03-16T09:00:00.000' AS DateTime), CAST(N'2026-03-16T18:00:00.000' AS DateTime), CAST(0.50 AS Decimal(18, 2)), N'辦理個人事務（半天）', N'Cancelled', 7, NULL, NULL, NULL, CAST(N'2026-03-13T00:00:00.0000000' AS DateTime2), CAST(4.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (71, 15, 1, CAST(N'2026-01-21T09:00:00.000' AS DateTime), CAST(N'2026-01-22T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'個人休假', N'Approved', 18, 3, CAST(N'2026-01-20T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-01-18T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (72, 15, 2, CAST(N'2026-02-02T09:00:00.000' AS DateTime), CAST(N'2026-02-03T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'身體不適需就醫', N'Approved', 18, 3, CAST(N'2026-02-01T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-01-30T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (73, 15, 3, CAST(N'2026-02-21T09:00:00.000' AS DateTime), CAST(N'2026-02-22T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'處理私人事務', N'Rejected', 18, 3, CAST(N'2026-02-20T00:00:00.0000000' AS DateTime2), N'該日部門人力不足，建議改期', CAST(N'2026-02-18T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (74, 15, 1, CAST(N'2026-04-22T09:00:00.000' AS DateTime), CAST(N'2026-04-23T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'家庭旅遊計畫', N'Pending', 18, NULL, NULL, NULL, CAST(N'2026-04-19T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (75, 15, 3, CAST(N'2026-03-02T09:00:00.000' AS DateTime), CAST(N'2026-03-02T18:00:00.000' AS DateTime), CAST(0.50 AS Decimal(18, 2)), N'辦理個人事務（半天）', N'Cancelled', 18, NULL, NULL, NULL, CAST(N'2026-02-27T00:00:00.0000000' AS DateTime2), CAST(4.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (76, 16, 1, CAST(N'2026-01-22T09:00:00.000' AS DateTime), CAST(N'2026-01-23T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'個人休假', N'Approved', 19, 3, CAST(N'2026-01-21T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-01-19T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (77, 16, 2, CAST(N'2026-02-03T09:00:00.000' AS DateTime), CAST(N'2026-02-04T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'身體不適需就醫', N'Approved', 19, 3, CAST(N'2026-02-02T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-01-31T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (78, 16, 3, CAST(N'2026-02-22T09:00:00.000' AS DateTime), CAST(N'2026-02-23T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'處理私人事務', N'Rejected', 19, 3, CAST(N'2026-02-21T00:00:00.0000000' AS DateTime2), N'該日部門人力不足，建議改期', CAST(N'2026-02-19T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (79, 16, 1, CAST(N'2026-04-23T09:00:00.000' AS DateTime), CAST(N'2026-04-24T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'家庭旅遊計畫', N'Pending', 19, NULL, NULL, NULL, CAST(N'2026-04-20T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (80, 16, 3, CAST(N'2026-03-03T09:00:00.000' AS DateTime), CAST(N'2026-03-03T18:00:00.000' AS DateTime), CAST(0.50 AS Decimal(18, 2)), N'辦理個人事務（半天）', N'Cancelled', 19, NULL, NULL, NULL, CAST(N'2026-02-28T00:00:00.0000000' AS DateTime2), CAST(4.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (81, 17, 1, CAST(N'2026-01-23T09:00:00.000' AS DateTime), CAST(N'2026-01-24T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'個人休假', N'Approved', 20, 3, CAST(N'2026-01-22T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-01-20T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (82, 17, 2, CAST(N'2026-02-04T09:00:00.000' AS DateTime), CAST(N'2026-02-05T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'身體不適需就醫', N'Approved', 20, 3, CAST(N'2026-02-03T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-02-01T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (83, 17, 3, CAST(N'2026-02-23T09:00:00.000' AS DateTime), CAST(N'2026-02-24T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'處理私人事務', N'Rejected', 20, 3, CAST(N'2026-02-22T00:00:00.0000000' AS DateTime2), N'該日部門人力不足，建議改期', CAST(N'2026-02-20T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (84, 17, 1, CAST(N'2026-04-24T09:00:00.000' AS DateTime), CAST(N'2026-04-25T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'家庭旅遊計畫', N'Pending', 20, NULL, NULL, NULL, CAST(N'2026-04-21T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (85, 17, 3, CAST(N'2026-03-04T09:00:00.000' AS DateTime), CAST(N'2026-03-04T18:00:00.000' AS DateTime), CAST(0.50 AS Decimal(18, 2)), N'辦理個人事務（半天）', N'Cancelled', 20, NULL, NULL, NULL, CAST(N'2026-03-01T00:00:00.0000000' AS DateTime2), CAST(4.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (86, 18, 1, CAST(N'2026-01-24T09:00:00.000' AS DateTime), CAST(N'2026-01-25T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'個人休假', N'Approved', 21, 3, CAST(N'2026-01-23T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-01-21T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (87, 18, 2, CAST(N'2026-02-05T09:00:00.000' AS DateTime), CAST(N'2026-02-06T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'身體不適需就醫', N'Approved', 21, 3, CAST(N'2026-02-04T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-02-02T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (88, 18, 3, CAST(N'2026-02-24T09:00:00.000' AS DateTime), CAST(N'2026-02-25T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'處理私人事務', N'Rejected', 21, 3, CAST(N'2026-02-23T00:00:00.0000000' AS DateTime2), N'該日部門人力不足，建議改期', CAST(N'2026-02-21T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (89, 18, 1, CAST(N'2026-04-25T09:00:00.000' AS DateTime), CAST(N'2026-04-26T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'家庭旅遊計畫', N'Pending', 21, NULL, NULL, NULL, CAST(N'2026-04-22T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (90, 18, 3, CAST(N'2026-03-05T09:00:00.000' AS DateTime), CAST(N'2026-03-05T18:00:00.000' AS DateTime), CAST(0.50 AS Decimal(18, 2)), N'辦理個人事務（半天）', N'Cancelled', 21, NULL, NULL, NULL, CAST(N'2026-03-02T00:00:00.0000000' AS DateTime2), CAST(4.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (91, 19, 1, CAST(N'2026-01-25T09:00:00.000' AS DateTime), CAST(N'2026-01-26T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'個人休假', N'Approved', 22, 3, CAST(N'2026-01-24T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-01-22T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (92, 19, 2, CAST(N'2026-02-06T09:00:00.000' AS DateTime), CAST(N'2026-02-07T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'身體不適需就醫', N'Approved', 22, 3, CAST(N'2026-02-05T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-02-03T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (93, 19, 3, CAST(N'2026-02-25T09:00:00.000' AS DateTime), CAST(N'2026-02-26T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'處理私人事務', N'Rejected', 22, 3, CAST(N'2026-02-24T00:00:00.0000000' AS DateTime2), N'該日部門人力不足，建議改期', CAST(N'2026-02-22T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (94, 19, 1, CAST(N'2026-04-26T09:00:00.000' AS DateTime), CAST(N'2026-04-27T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'家庭旅遊計畫', N'Pending', 22, NULL, NULL, NULL, CAST(N'2026-04-23T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (95, 19, 3, CAST(N'2026-03-06T09:00:00.000' AS DateTime), CAST(N'2026-03-06T18:00:00.000' AS DateTime), CAST(0.50 AS Decimal(18, 2)), N'辦理個人事務（半天）', N'Cancelled', 22, NULL, NULL, NULL, CAST(N'2026-03-03T00:00:00.0000000' AS DateTime2), CAST(4.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (96, 20, 1, CAST(N'2026-01-06T09:00:00.000' AS DateTime), CAST(N'2026-01-07T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'個人休假', N'Approved', 23, 4, CAST(N'2026-01-05T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-01-03T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (97, 20, 2, CAST(N'2026-02-07T09:00:00.000' AS DateTime), CAST(N'2026-02-08T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'身體不適需就醫', N'Approved', 23, 4, CAST(N'2026-02-06T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-02-04T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (98, 20, 3, CAST(N'2026-02-16T09:00:00.000' AS DateTime), CAST(N'2026-02-17T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'處理私人事務', N'Rejected', 23, 4, CAST(N'2026-02-15T00:00:00.0000000' AS DateTime2), N'該日部門人力不足，建議改期', CAST(N'2026-02-13T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (99, 20, 1, CAST(N'2026-04-07T09:00:00.000' AS DateTime), CAST(N'2026-04-08T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'家庭旅遊計畫', N'Pending', 23, NULL, NULL, NULL, CAST(N'2026-04-04T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (100, 20, 3, CAST(N'2026-03-07T09:00:00.000' AS DateTime), CAST(N'2026-03-07T18:00:00.000' AS DateTime), CAST(0.50 AS Decimal(18, 2)), N'辦理個人事務（半天）', N'Cancelled', 23, NULL, NULL, NULL, CAST(N'2026-03-04T00:00:00.0000000' AS DateTime2), CAST(4.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (101, 21, 1, CAST(N'2026-01-07T09:00:00.000' AS DateTime), CAST(N'2026-01-08T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'個人休假', N'Approved', 24, 4, CAST(N'2026-01-06T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-01-04T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (102, 21, 2, CAST(N'2026-02-08T09:00:00.000' AS DateTime), CAST(N'2026-02-09T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'身體不適需就醫', N'Approved', 24, 4, CAST(N'2026-02-07T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-02-05T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (103, 21, 3, CAST(N'2026-02-17T09:00:00.000' AS DateTime), CAST(N'2026-02-18T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'處理私人事務', N'Rejected', 24, 4, CAST(N'2026-02-16T00:00:00.0000000' AS DateTime2), N'該日部門人力不足，建議改期', CAST(N'2026-02-14T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (104, 21, 1, CAST(N'2026-04-08T09:00:00.000' AS DateTime), CAST(N'2026-04-09T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'家庭旅遊計畫', N'Pending', 24, NULL, NULL, NULL, CAST(N'2026-04-05T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (105, 21, 3, CAST(N'2026-03-08T09:00:00.000' AS DateTime), CAST(N'2026-03-08T18:00:00.000' AS DateTime), CAST(0.50 AS Decimal(18, 2)), N'辦理個人事務（半天）', N'Cancelled', 24, NULL, NULL, NULL, CAST(N'2026-03-05T00:00:00.0000000' AS DateTime2), CAST(4.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (106, 22, 1, CAST(N'2026-01-08T09:00:00.000' AS DateTime), CAST(N'2026-01-09T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'個人休假', N'Approved', 15, 4, CAST(N'2026-01-07T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-01-05T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (107, 22, 2, CAST(N'2026-02-09T09:00:00.000' AS DateTime), CAST(N'2026-02-10T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'身體不適需就醫', N'Approved', 15, 4, CAST(N'2026-02-08T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-02-06T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (108, 22, 3, CAST(N'2026-02-18T09:00:00.000' AS DateTime), CAST(N'2026-02-19T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'處理私人事務', N'Rejected', 15, 4, CAST(N'2026-02-17T00:00:00.0000000' AS DateTime2), N'該日部門人力不足，建議改期', CAST(N'2026-02-15T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (109, 22, 1, CAST(N'2026-04-09T09:00:00.000' AS DateTime), CAST(N'2026-04-10T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'家庭旅遊計畫', N'Pending', 15, NULL, NULL, NULL, CAST(N'2026-04-06T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (110, 22, 3, CAST(N'2026-03-09T09:00:00.000' AS DateTime), CAST(N'2026-03-09T18:00:00.000' AS DateTime), CAST(0.50 AS Decimal(18, 2)), N'辦理個人事務（半天）', N'Cancelled', 15, NULL, NULL, NULL, CAST(N'2026-03-06T00:00:00.0000000' AS DateTime2), CAST(4.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (111, 23, 1, CAST(N'2026-01-09T09:00:00.000' AS DateTime), CAST(N'2026-01-10T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'個人休假', N'Approved', 16, 4, CAST(N'2026-01-08T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-01-06T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (112, 23, 2, CAST(N'2026-02-10T09:00:00.000' AS DateTime), CAST(N'2026-02-11T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'身體不適需就醫', N'Approved', 16, 4, CAST(N'2026-02-09T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-02-07T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (113, 23, 3, CAST(N'2026-02-19T09:00:00.000' AS DateTime), CAST(N'2026-02-20T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'處理私人事務', N'Rejected', 16, 4, CAST(N'2026-02-18T00:00:00.0000000' AS DateTime2), N'該日部門人力不足，建議改期', CAST(N'2026-02-16T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (114, 23, 1, CAST(N'2026-04-10T09:00:00.000' AS DateTime), CAST(N'2026-04-11T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'家庭旅遊計畫', N'Pending', 16, NULL, NULL, NULL, CAST(N'2026-04-07T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (115, 23, 3, CAST(N'2026-03-10T09:00:00.000' AS DateTime), CAST(N'2026-03-10T18:00:00.000' AS DateTime), CAST(0.50 AS Decimal(18, 2)), N'辦理個人事務（半天）', N'Cancelled', 16, NULL, NULL, NULL, CAST(N'2026-03-07T00:00:00.0000000' AS DateTime2), CAST(4.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (116, 24, 1, CAST(N'2026-01-10T09:00:00.000' AS DateTime), CAST(N'2026-01-11T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'個人休假', N'Approved', 17, 4, CAST(N'2026-01-09T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-01-07T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (117, 24, 2, CAST(N'2026-02-11T09:00:00.000' AS DateTime), CAST(N'2026-02-12T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'身體不適需就醫', N'Approved', 17, 4, CAST(N'2026-02-10T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2026-02-08T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (118, 24, 3, CAST(N'2026-02-20T09:00:00.000' AS DateTime), CAST(N'2026-02-21T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'處理私人事務', N'Rejected', 17, 4, CAST(N'2026-02-19T00:00:00.0000000' AS DateTime2), N'該日部門人力不足，建議改期', CAST(N'2026-02-17T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (119, 24, 1, CAST(N'2026-04-11T09:00:00.000' AS DateTime), CAST(N'2026-04-12T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'家庭旅遊計畫', N'Pending', 17, NULL, NULL, NULL, CAST(N'2026-04-08T00:00:00.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (120, 24, 3, CAST(N'2026-03-11T09:00:00.000' AS DateTime), CAST(N'2026-03-11T18:00:00.000' AS DateTime), CAST(0.50 AS Decimal(18, 2)), N'辦理個人事務（半天）', N'Cancelled', 17, NULL, NULL, NULL, CAST(N'2026-03-08T00:00:00.0000000' AS DateTime2), CAST(4.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (121, 1, 1, CAST(N'2026-03-19T09:00:00.000' AS DateTime), CAST(N'2026-03-19T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'test', N'Approved', 5, 1, CAST(N'2026-03-19T15:13:37.0000000' AS DateTime2), NULL, CAST(N'2026-03-19T15:13:37.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (122, 5, 2, CAST(N'2026-03-19T09:00:00.000' AS DateTime), CAST(N'2026-03-19T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'不舒服', N'Cancelled', 6, 5, CAST(N'2026-03-19T15:59:09.0000000' AS DateTime2), NULL, CAST(N'2026-03-19T15:58:10.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), N'Pending', CAST(N'2026-03-19T15:58:52.3125130' AS DateTime2), N'經休息以後狀況好轉 回到公司')
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (1122, 1, 1, CAST(N'2026-03-20T09:00:00.000' AS DateTime), CAST(N'2026-03-20T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'出去玩', N'Approved', 5, 1, CAST(N'2026-03-20T11:31:11.0000000' AS DateTime2), NULL, CAST(N'2026-03-20T11:31:11.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (1123, 5, 1, CAST(N'2026-03-20T09:00:00.000' AS DateTime), CAST(N'2026-03-20T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'出去玩', N'Rejected', 6, 1, CAST(N'2026-03-20T11:38:13.0000000' AS DateTime2), N'不可', CAST(N'2026-03-20T11:37:15.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (1124, 5, 1, CAST(N'2026-06-24T09:00:00.000' AS DateTime), CAST(N'2026-06-24T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'出去玩', N'Approved', 6, 1, CAST(N'2026-03-20T11:50:17.0000000' AS DateTime2), NULL, CAST(N'2026-03-20T11:49:37.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (1125, 1, 6, CAST(N'2026-03-20T09:00:00.000' AS DateTime), CAST(N'2026-03-20T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'要出差', N'Cancelled', 5, 1, CAST(N'2026-03-20T11:51:25.0000000' AS DateTime2), NULL, CAST(N'2026-03-20T11:51:25.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, CAST(N'2026-03-20T11:52:37.2975346' AS DateTime2), N'回來了')
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (1126, 1, 1, CAST(N'2026-06-24T09:00:00.000' AS DateTime), CAST(N'2026-06-24T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'出去玩', N'Approved', 5, 1, CAST(N'2026-03-20T11:53:59.0000000' AS DateTime2), NULL, CAST(N'2026-03-20T11:53:59.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (1127, 1, 6, CAST(N'2026-03-20T09:00:00.000' AS DateTime), CAST(N'2026-03-20T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'出差', N'Cancelled', 5, 1, CAST(N'2026-03-20T12:01:17.0000000' AS DateTime2), NULL, CAST(N'2026-03-20T12:01:17.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, CAST(N'2026-03-20T12:02:07.8857463' AS DateTime2), N'出差提前回來')
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (1128, 5, 1, CAST(N'2026-03-25T09:00:00.000' AS DateTime), CAST(N'2026-03-25T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'出去玩', N'Approved', 6, 1, CAST(N'2026-03-20T13:00:06.0000000' AS DateTime2), NULL, CAST(N'2026-03-20T12:59:13.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[LeaveRequests] ([Id], [EmployeeId], [LeaveTypeId], [StartDate], [EndDate], [DaysUsed], [Reason], [Status], [LeaveDelegateId], [ApprovedBy], [ApprovedAt], [RejectReason], [CreatedAt], [HoursUsed], [OriginalStatus], [CancelRequestedAt], [CancelReason]) VALUES (1129, 1, 6, CAST(N'2026-03-20T09:00:00.000' AS DateTime), CAST(N'2026-03-20T18:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), N'臨時出差', N'Cancelled', 5, 1, CAST(N'2026-03-20T13:02:48.0000000' AS DateTime2), NULL, CAST(N'2026-03-20T13:02:48.0000000' AS DateTime2), CAST(8.0 AS Decimal(18, 1)), NULL, CAST(N'2026-03-20T13:03:41.2955394' AS DateTime2), N'提前回公司')
GO
SET IDENTITY_INSERT [dbo].[LeaveRequests] OFF
GO
SET IDENTITY_INSERT [dbo].[LeaveTypes] ON 
GO
INSERT [dbo].[LeaveTypes] ([Id], [Name], [DaysPerYear], [CarryOver], [RequiresDoc], [IsActive], [QuotaType], [WarnThresholdDays]) VALUES (1, N'特休', 15, 1, 0, 1, N'PreAllocated', NULL)
GO
INSERT [dbo].[LeaveTypes] ([Id], [Name], [DaysPerYear], [CarryOver], [RequiresDoc], [IsActive], [QuotaType], [WarnThresholdDays]) VALUES (2, N'病假', 0, 0, 1, 1, N'Unlimited', 30)
GO
INSERT [dbo].[LeaveTypes] ([Id], [Name], [DaysPerYear], [CarryOver], [RequiresDoc], [IsActive], [QuotaType], [WarnThresholdDays]) VALUES (3, N'事假', 0, 0, 0, 1, N'Unlimited', 14)
GO
INSERT [dbo].[LeaveTypes] ([Id], [Name], [DaysPerYear], [CarryOver], [RequiresDoc], [IsActive], [QuotaType], [WarnThresholdDays]) VALUES (4, N'婚假', 0, 0, 1, 1, N'ApprovalRequired', NULL)
GO
INSERT [dbo].[LeaveTypes] ([Id], [Name], [DaysPerYear], [CarryOver], [RequiresDoc], [IsActive], [QuotaType], [WarnThresholdDays]) VALUES (5, N'喪假', 0, 0, 1, 1, N'ApprovalRequired', NULL)
GO
INSERT [dbo].[LeaveTypes] ([Id], [Name], [DaysPerYear], [CarryOver], [RequiresDoc], [IsActive], [QuotaType], [WarnThresholdDays]) VALUES (6, N'公假', 0, 0, 1, 1, N'Unlimited', NULL)
GO
SET IDENTITY_INSERT [dbo].[LeaveTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Members] ON 
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (1, 1, 2, CAST(N'1995-03-15T00:00:00.0000000' AS DateTime2), 58, 163, N'1.375', N'健康飲食', NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (2, 2, 1, CAST(N'1990-07-22T00:00:00.0000000' AS DateTime2), 75, 178, N'1.55', N'增肌', NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (3, 3, 2, CAST(N'1998-11-05T00:00:00.0000000' AS DateTime2), 52, 158, N'1.2', N'減脂', NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (4, 11, 1, CAST(N'1993-04-10T00:00:00.0000000' AS DateTime2), 70, 175, N'1.55', N'增肌', NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (5, 12, 2, CAST(N'1997-09-25T00:00:00.0000000' AS DateTime2), 54, 161, N'1.375', N'健康飲食', NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (6, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (7, 2052, 2, CAST(N'1999-06-27T21:04:12.0000000' AS DateTime2), 68, 180, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (8, 2053, 1, CAST(N'1982-09-25T21:04:12.0000000' AS DateTime2), 62, 169, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (9, 2054, 1, CAST(N'1985-02-14T21:04:12.0000000' AS DateTime2), 83, 179, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (10, 2055, 2, CAST(N'1988-08-02T21:04:12.0000000' AS DateTime2), 85, 170, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (11, 2056, 1, CAST(N'2000-10-22T21:04:12.0000000' AS DateTime2), 81, 182, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (12, 2057, 1, CAST(N'1983-12-31T21:04:12.0000000' AS DateTime2), 87, 173, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (13, 2058, 1, CAST(N'2005-11-26T21:04:12.0000000' AS DateTime2), 64, 184, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (14, 2059, 1, CAST(N'2002-09-18T21:04:12.0000000' AS DateTime2), 76, 181, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (15, 2060, 2, CAST(N'1994-04-19T21:04:12.0000000' AS DateTime2), 67, 184, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (16, 2061, 2, CAST(N'1985-06-12T21:04:12.0000000' AS DateTime2), 66, 179, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (17, 2062, 2, CAST(N'1985-10-11T21:04:12.0000000' AS DateTime2), 60, 174, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (18, 2063, 1, CAST(N'2003-03-20T21:04:12.0000000' AS DateTime2), 69, 176, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (19, 2064, 2, CAST(N'2000-03-18T21:04:12.0000000' AS DateTime2), 64, 182, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (20, 2065, 2, CAST(N'1999-02-20T21:04:12.0000000' AS DateTime2), 66, 182, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (21, 2066, 1, CAST(N'1981-11-19T21:04:12.0000000' AS DateTime2), 88, 176, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (22, 2067, 1, CAST(N'1994-08-04T21:04:12.0000000' AS DateTime2), 86, 170, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (23, 2068, 1, CAST(N'1999-11-19T21:04:12.0000000' AS DateTime2), 78, 169, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (24, 2069, 1, CAST(N'1993-01-12T21:04:12.0000000' AS DateTime2), 72, 178, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (25, 2070, 2, CAST(N'1991-06-14T21:04:12.0000000' AS DateTime2), 68, 172, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (26, 2071, 2, CAST(N'1981-12-30T21:04:12.0000000' AS DateTime2), 85, 177, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (27, 2072, 2, CAST(N'1990-08-09T21:04:12.0000000' AS DateTime2), 83, 170, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (28, 2073, 2, CAST(N'1982-09-13T21:04:12.0000000' AS DateTime2), 87, 178, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (29, 2074, 2, CAST(N'1981-06-18T21:04:12.0000000' AS DateTime2), 81, 170, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (30, 2075, 1, CAST(N'2001-11-26T21:04:12.0000000' AS DateTime2), 76, 167, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (31, 2076, 2, CAST(N'2003-06-23T21:04:12.0000000' AS DateTime2), 65, 160, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (32, 2077, 1, CAST(N'2006-09-24T21:04:12.0000000' AS DateTime2), 63, 160, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (33, 2078, 1, CAST(N'1990-12-20T21:04:12.0000000' AS DateTime2), 65, 164, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (34, 2079, 2, CAST(N'1989-04-22T21:04:12.0000000' AS DateTime2), 88, 162, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (35, 2080, 1, CAST(N'1988-09-25T21:04:12.0000000' AS DateTime2), 75, 181, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (36, 2081, 2, CAST(N'1998-10-10T21:04:12.0000000' AS DateTime2), 73, 182, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (37, 2082, 1, CAST(N'1990-06-18T21:04:12.0000000' AS DateTime2), 73, 177, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (38, 2083, 1, CAST(N'1987-11-02T21:04:12.0000000' AS DateTime2), 78, 170, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (39, 2084, 2, CAST(N'2000-06-08T21:04:12.0000000' AS DateTime2), 65, 168, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (40, 2085, 1, CAST(N'1982-07-25T21:04:12.0000000' AS DateTime2), 79, 182, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (41, 2086, 1, CAST(N'2006-08-04T21:04:12.0000000' AS DateTime2), 66, 179, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (42, 2087, 2, CAST(N'1996-07-30T21:04:12.0000000' AS DateTime2), 85, 169, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (43, 2088, 2, CAST(N'2006-11-18T21:04:12.0000000' AS DateTime2), 65, 160, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (44, 2089, 2, CAST(N'1997-05-15T21:04:12.0000000' AS DateTime2), 77, 164, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (45, 2090, 1, CAST(N'2005-12-29T21:04:12.0000000' AS DateTime2), 75, 165, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (46, 2091, 1, CAST(N'1999-09-24T21:04:12.0000000' AS DateTime2), 75, 160, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (47, 2092, 1, CAST(N'1992-11-13T21:04:12.0000000' AS DateTime2), 87, 164, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (48, 2093, 1, CAST(N'1980-07-20T21:04:12.0000000' AS DateTime2), 85, 168, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (49, 2094, 2, CAST(N'1991-05-21T21:04:12.0000000' AS DateTime2), 79, 175, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (50, 2095, 2, CAST(N'1989-07-16T21:04:12.0000000' AS DateTime2), 86, 176, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (51, 2096, 2, CAST(N'1997-10-27T21:04:12.0000000' AS DateTime2), 71, 172, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (52, 2097, 2, CAST(N'1985-10-09T21:04:12.0000000' AS DateTime2), 76, 171, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (53, 2098, 1, CAST(N'2006-03-13T21:04:12.0000000' AS DateTime2), 78, 179, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (54, 2099, 2, CAST(N'1990-07-04T21:04:12.0000000' AS DateTime2), 73, 169, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (55, 2100, 2, CAST(N'2006-09-07T21:04:12.0000000' AS DateTime2), 72, 175, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (56, 2101, 2, CAST(N'2001-11-01T21:04:12.0000000' AS DateTime2), 86, 163, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (57, 2102, 1, CAST(N'1985-10-24T21:04:12.0000000' AS DateTime2), 89, 180, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (58, 2103, 2, CAST(N'1996-12-16T21:04:12.0000000' AS DateTime2), 82, 168, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (59, 2104, 2, CAST(N'2002-08-01T21:04:12.0000000' AS DateTime2), 81, 172, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (60, 2105, 2, CAST(N'1997-04-21T21:04:12.0000000' AS DateTime2), 72, 163, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (61, 2106, 2, CAST(N'1980-02-17T21:04:12.0000000' AS DateTime2), 87, 164, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (62, 2107, 2, CAST(N'1992-05-01T21:04:12.0000000' AS DateTime2), 65, 177, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (63, 2108, 1, CAST(N'1981-09-19T21:04:12.0000000' AS DateTime2), 71, 175, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (64, 2109, 2, CAST(N'1995-11-12T21:04:12.0000000' AS DateTime2), 84, 164, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (65, 2110, 1, CAST(N'1998-08-18T21:04:12.0000000' AS DateTime2), 69, 164, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (66, 2111, 2, CAST(N'1984-09-26T21:04:12.0000000' AS DateTime2), 77, 184, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (67, 2112, 2, CAST(N'2006-03-27T21:04:12.0000000' AS DateTime2), 78, 168, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (68, 2113, 2, CAST(N'1997-09-24T21:04:12.0000000' AS DateTime2), 61, 162, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (69, 2114, 2, CAST(N'1979-12-15T21:04:12.0000000' AS DateTime2), 75, 167, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (70, 2115, 2, CAST(N'1994-10-30T21:04:12.0000000' AS DateTime2), 75, 165, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (71, 2116, 2, CAST(N'2004-11-08T21:04:12.0000000' AS DateTime2), 67, 170, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (72, 2117, 1, CAST(N'1998-07-15T21:04:12.0000000' AS DateTime2), 85, 180, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (73, 2118, 1, CAST(N'1989-05-22T21:04:12.0000000' AS DateTime2), 63, 172, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (74, 2119, 1, CAST(N'1982-03-09T21:04:12.0000000' AS DateTime2), 83, 171, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (75, 2120, 1, CAST(N'1996-01-03T21:04:12.0000000' AS DateTime2), 66, 169, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (76, 2121, 1, CAST(N'1983-07-30T21:04:13.0000000' AS DateTime2), 72, 173, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (77, 2122, 2, CAST(N'1986-02-26T21:04:13.0000000' AS DateTime2), 68, 165, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (78, 2123, 2, CAST(N'1991-12-04T21:04:13.0000000' AS DateTime2), 76, 179, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (79, 2124, 1, CAST(N'1997-02-18T21:04:13.0000000' AS DateTime2), 66, 160, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (80, 2125, 2, CAST(N'2004-12-27T21:04:13.0000000' AS DateTime2), 65, 184, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (81, 2126, 2, CAST(N'1995-03-23T21:04:13.0000000' AS DateTime2), 69, 169, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (82, 2127, 1, CAST(N'2003-06-11T21:04:13.0000000' AS DateTime2), 60, 163, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (83, 2128, 2, CAST(N'2005-07-27T21:04:13.0000000' AS DateTime2), 71, 174, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (84, 2129, 2, CAST(N'1996-11-01T21:04:13.0000000' AS DateTime2), 77, 180, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (85, 2130, 1, CAST(N'1996-01-30T21:04:13.0000000' AS DateTime2), 78, 173, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (86, 2131, 2, CAST(N'1983-04-01T21:04:13.0000000' AS DateTime2), 60, 175, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (87, 2132, 2, CAST(N'2002-07-29T21:04:13.0000000' AS DateTime2), 63, 161, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (88, 2133, 1, CAST(N'1981-01-04T21:04:13.0000000' AS DateTime2), 62, 161, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (89, 2134, 2, CAST(N'1997-01-04T21:04:13.0000000' AS DateTime2), 86, 183, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (90, 2135, 2, CAST(N'2001-03-13T21:04:13.0000000' AS DateTime2), 86, 163, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (91, 2136, 1, CAST(N'1982-09-20T21:04:13.0000000' AS DateTime2), 65, 184, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (92, 2137, 1, CAST(N'1991-10-06T21:04:13.0000000' AS DateTime2), 79, 161, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (93, 2138, 1, CAST(N'1996-04-15T21:04:13.0000000' AS DateTime2), 83, 174, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (94, 2139, 2, CAST(N'2004-04-09T21:04:13.0000000' AS DateTime2), 77, 168, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (95, 2140, 1, CAST(N'1991-02-02T21:04:13.0000000' AS DateTime2), 63, 171, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (96, 2141, 2, CAST(N'2006-07-23T21:04:13.0000000' AS DateTime2), 76, 181, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (97, 2142, 2, CAST(N'2005-06-05T21:04:13.0000000' AS DateTime2), 71, 183, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (98, 2143, 1, CAST(N'2002-12-20T21:04:13.0000000' AS DateTime2), 85, 180, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (99, 2144, 2, CAST(N'2004-09-24T21:04:13.0000000' AS DateTime2), 66, 172, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (100, 2145, 2, CAST(N'1986-01-19T21:04:13.0000000' AS DateTime2), 81, 168, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (101, 2146, 2, CAST(N'2005-06-14T21:04:13.0000000' AS DateTime2), 85, 179, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (102, 2147, 2, CAST(N'1990-03-07T21:04:13.0000000' AS DateTime2), 62, 167, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (103, 2148, 1, CAST(N'1985-10-15T21:04:13.0000000' AS DateTime2), 75, 177, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (104, 2149, 1, CAST(N'1983-07-28T21:04:13.0000000' AS DateTime2), 68, 175, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (105, 2150, 2, CAST(N'1991-08-07T21:04:13.0000000' AS DateTime2), 67, 173, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
INSERT [dbo].[Members] ([Id], [UserId], [Gender], [DateOfBirth], [Weight], [Height], [ActivityLevel], [Target], [BMR], [TDEE], [ImageUrl], [CancelCount]) VALUES (106, 2151, 2, CAST(N'2000-05-18T21:04:13.0000000' AS DateTime2), 70, 170, N'1.55', N'健康飲食', 1500, 2200, N'/images/members/default.jpg', 0)
GO
SET IDENTITY_INSERT [dbo].[Members] OFF
GO
SET IDENTITY_INSERT [dbo].[MemberViolations] ON 
GO
INSERT [dbo].[MemberViolations] ([Id], [MemberId], [WarningCount], [IsSuspended], [LastWarningAt], [SuspendedAt], [Reason]) VALUES (1, 1, 0, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[MemberViolations] ([Id], [MemberId], [WarningCount], [IsSuspended], [LastWarningAt], [SuspendedAt], [Reason]) VALUES (2, 2, 3, 1, CAST(N'2026-03-20T13:12:45.0000000' AS DateTime2), CAST(N'2026-03-20T13:13:03.0000000' AS DateTime2), N'456')
GO
INSERT [dbo].[MemberViolations] ([Id], [MemberId], [WarningCount], [IsSuspended], [LastWarningAt], [SuspendedAt], [Reason]) VALUES (3, 3, 5, 1, CAST(N'2026-03-20T13:14:28.0000000' AS DateTime2), CAST(N'2026-03-20T13:14:52.0000000' AS DateTime2), N'123')
GO
SET IDENTITY_INSERT [dbo].[MemberViolations] OFF
GO
SET IDENTITY_INSERT [dbo].[Notifications] ON 
GO
INSERT [dbo].[Notifications] ([Id], [UserId], [SenderId], [NotifyType], [Title], [Content], [IsRead], [ReferenceId], [CreatedAt]) VALUES (1, 1014, 2014, N'Report', N'【系統警示】評價檢舉通知', N'營養師 ins1 檢舉了一則不當評價，請盡速前往後台評價管理區審核。', 1, 3, CAST(N'2026-03-11T16:32:30.0000000' AS DateTime2))
GO
INSERT [dbo].[Notifications] ([Id], [UserId], [SenderId], [NotifyType], [Title], [Content], [IsRead], [ReferenceId], [CreatedAt]) VALUES (2, 1, NULL, N'Booking', N'預約成功通知', N'親愛的 Alice Wang 您好，您已成功預約 2026-03-01 18-19 (晚) 的營養諮詢！', 0, 5, CAST(N'2026-03-11T16:32:30.0000000' AS DateTime2))
GO
INSERT [dbo].[Notifications] ([Id], [UserId], [SenderId], [NotifyType], [Title], [Content], [IsRead], [ReferenceId], [CreatedAt]) VALUES (3, 1014, 2013, N'Report1', N'評論檢舉通知', N'不好看 [Url:/Review/AdminIndex?id=3]', 1, NULL, CAST(N'2026-03-11T17:20:37.0000000' AS DateTime2))
GO
INSERT [dbo].[Notifications] ([Id], [UserId], [SenderId], [NotifyType], [Title], [Content], [IsRead], [ReferenceId], [CreatedAt]) VALUES (4, 2013, 2013, N'Report1', N'評論檢舉通知', N'不好看 [Url:/Review/AdminIndex?id=3]', 1, NULL, CAST(N'2026-03-11T17:20:37.0000000' AS DateTime2))
GO
INSERT [dbo].[Notifications] ([Id], [UserId], [SenderId], [NotifyType], [Title], [Content], [IsRead], [ReferenceId], [CreatedAt]) VALUES (5, 1014, 2013, N'Report1', N'評論檢舉通知', N'1 [Url:/Review/AdminIndex?id=3]', 1, NULL, CAST(N'2026-03-12T15:26:37.0000000' AS DateTime2))
GO
INSERT [dbo].[Notifications] ([Id], [UserId], [SenderId], [NotifyType], [Title], [Content], [IsRead], [ReferenceId], [CreatedAt]) VALUES (6, 2013, 2013, N'Report1', N'評論檢舉通知', N'1 [Url:/Review/AdminIndex?id=3]', 1, NULL, CAST(N'2026-03-12T15:26:37.0000000' AS DateTime2))
GO
INSERT [dbo].[Notifications] ([Id], [UserId], [SenderId], [NotifyType], [Title], [Content], [IsRead], [ReferenceId], [CreatedAt]) VALUES (7, 1014, 2013, N'Report1', N'評論檢舉通知', N'123 [Url:/Review/AdminIndex?id=153]', 0, NULL, CAST(N'2026-03-19T17:21:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Notifications] ([Id], [UserId], [SenderId], [NotifyType], [Title], [Content], [IsRead], [ReferenceId], [CreatedAt]) VALUES (8, 2047, 2013, N'Report1', N'評論檢舉通知', N'123 [Url:/Review/AdminIndex?id=153]', 1, NULL, CAST(N'2026-03-19T17:21:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Notifications] ([Id], [UserId], [SenderId], [NotifyType], [Title], [Content], [IsRead], [ReferenceId], [CreatedAt]) VALUES (9, 2048, 2013, N'Report1', N'評論檢舉通知', N'123 [Url:/Review/AdminIndex?id=153]', 0, NULL, CAST(N'2026-03-19T17:21:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Notifications] ([Id], [UserId], [SenderId], [NotifyType], [Title], [Content], [IsRead], [ReferenceId], [CreatedAt]) VALUES (10, 2049, 2013, N'Report1', N'評論檢舉通知', N'123 [Url:/Review/AdminIndex?id=153]', 0, NULL, CAST(N'2026-03-19T17:21:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Notifications] ([Id], [UserId], [SenderId], [NotifyType], [Title], [Content], [IsRead], [ReferenceId], [CreatedAt]) VALUES (11, 2050, 2013, N'Report1', N'評論檢舉通知', N'123 [Url:/Review/AdminIndex?id=153]', 0, NULL, CAST(N'2026-03-19T17:21:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Notifications] ([Id], [UserId], [SenderId], [NotifyType], [Title], [Content], [IsRead], [ReferenceId], [CreatedAt]) VALUES (12, 2051, 2013, N'Report1', N'評論檢舉通知', N'123 [Url:/Review/AdminIndex?id=153]', 0, NULL, CAST(N'2026-03-19T17:21:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Notifications] ([Id], [UserId], [SenderId], [NotifyType], [Title], [Content], [IsRead], [ReferenceId], [CreatedAt]) VALUES (13, 1014, 2013, N'Report1', N'評論檢舉通知', N'123 [Url:/Review/AdminIndex?id=23]', 0, NULL, CAST(N'2026-03-19T19:52:31.0000000' AS DateTime2))
GO
INSERT [dbo].[Notifications] ([Id], [UserId], [SenderId], [NotifyType], [Title], [Content], [IsRead], [ReferenceId], [CreatedAt]) VALUES (14, 2047, 2013, N'Report1', N'評論檢舉通知', N'123 [Url:/Review/AdminIndex?id=23]', 1, NULL, CAST(N'2026-03-19T19:52:31.0000000' AS DateTime2))
GO
INSERT [dbo].[Notifications] ([Id], [UserId], [SenderId], [NotifyType], [Title], [Content], [IsRead], [ReferenceId], [CreatedAt]) VALUES (15, 2048, 2013, N'Report1', N'評論檢舉通知', N'123 [Url:/Review/AdminIndex?id=23]', 0, NULL, CAST(N'2026-03-19T19:52:31.0000000' AS DateTime2))
GO
INSERT [dbo].[Notifications] ([Id], [UserId], [SenderId], [NotifyType], [Title], [Content], [IsRead], [ReferenceId], [CreatedAt]) VALUES (16, 2049, 2013, N'Report1', N'評論檢舉通知', N'123 [Url:/Review/AdminIndex?id=23]', 0, NULL, CAST(N'2026-03-19T19:52:31.0000000' AS DateTime2))
GO
INSERT [dbo].[Notifications] ([Id], [UserId], [SenderId], [NotifyType], [Title], [Content], [IsRead], [ReferenceId], [CreatedAt]) VALUES (17, 2050, 2013, N'Report1', N'評論檢舉通知', N'123 [Url:/Review/AdminIndex?id=23]', 0, NULL, CAST(N'2026-03-19T19:52:31.0000000' AS DateTime2))
GO
INSERT [dbo].[Notifications] ([Id], [UserId], [SenderId], [NotifyType], [Title], [Content], [IsRead], [ReferenceId], [CreatedAt]) VALUES (18, 2051, 2013, N'Report1', N'評論檢舉通知', N'123 [Url:/Review/AdminIndex?id=23]', 0, NULL, CAST(N'2026-03-19T19:52:31.0000000' AS DateTime2))
GO
INSERT [dbo].[Notifications] ([Id], [UserId], [SenderId], [NotifyType], [Title], [Content], [IsRead], [ReferenceId], [CreatedAt]) VALUES (1007, 2013, NULL, N'Salary', N'薪資入帳通知', N'2026/2 薪資已核發！ 金額：NT$ 28,353 (約 886.03 USD)，請至我的錢包查看。 [Url:/Salary/MyWallet]', 1, NULL, CAST(N'2026-03-01T13:22:19.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Notifications] OFF
GO
SET IDENTITY_INSERT [dbo].[PointOrders] ON 
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (1, 1, 3, CAST(N'2026-03-11T14:51:48.5266667' AS DateTime2), 5, CAST(5000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (2, 2, 2, CAST(N'2026-03-11T14:51:48.5266667' AS DateTime2), 2, CAST(2000 AS Decimal(18, 0)), CAST(1800 AS Decimal(18, 0)), 3)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (3, 7, 4, CAST(N'2026-02-20T11:03:50.3100000' AS DateTime2), 10, CAST(7000 AS Decimal(18, 0)), CAST(7000 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (4, 8, 1, CAST(N'2026-03-14T23:06:46.3100000' AS DateTime2), 1, CAST(1000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (5, 17, 3, CAST(N'2026-03-05T03:54:07.3100000' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (6, 17, 1, CAST(N'2026-03-03T23:05:03.3100000' AS DateTime2), 1, CAST(1000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (7, 1, 5, CAST(N'2026-02-19T20:32:07.3100000' AS DateTime2), 20, CAST(12000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (8, 14, 5, CAST(N'2026-03-01T11:51:04.3100000' AS DateTime2), 20, CAST(12000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (9, 2, 3, CAST(N'2026-03-04T04:47:03.3100000' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (10, 17, 3, CAST(N'2026-03-06T06:33:02.3100000' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (11, 9, 1, CAST(N'2026-03-17T00:25:53.3100000' AS DateTime2), 1, CAST(1000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (12, 20, 4, CAST(N'2026-03-04T20:48:02.3100000' AS DateTime2), 10, CAST(7000 AS Decimal(18, 0)), CAST(7000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (13, 9, 5, CAST(N'2026-02-24T15:40:01.3100000' AS DateTime2), 20, CAST(12000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (14, 18, 4, CAST(N'2026-02-22T12:51:51.3100000' AS DateTime2), 10, CAST(7000 AS Decimal(18, 0)), CAST(7000 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (15, 16, 1, CAST(N'2026-03-11T03:04:29.3100000' AS DateTime2), 1, CAST(1000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (16, 8, 3, CAST(N'2026-02-23T06:15:03.3100000' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (17, 12, 5, CAST(N'2026-02-26T10:46:27.3100000' AS DateTime2), 20, CAST(12000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (18, 5, 2, CAST(N'2026-02-21T14:05:30.3100000' AS DateTime2), 2, CAST(1800 AS Decimal(18, 0)), CAST(1800 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (19, 14, 4, CAST(N'2026-02-18T18:07:40.3100000' AS DateTime2), 10, CAST(7000 AS Decimal(18, 0)), CAST(7000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (20, 17, 3, CAST(N'2026-03-13T12:21:01.3100000' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (21, 15, 3, CAST(N'2026-03-16T02:42:25.3100000' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (22, 16, 2, CAST(N'2026-02-21T07:38:15.3100000' AS DateTime2), 2, CAST(1800 AS Decimal(18, 0)), CAST(1800 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (23, 13, 4, CAST(N'2026-03-14T06:31:17.3100000' AS DateTime2), 10, CAST(7000 AS Decimal(18, 0)), CAST(7000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (24, 1, 5, CAST(N'2026-03-06T15:41:08.3133333' AS DateTime2), 20, CAST(12000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (25, 20, 3, CAST(N'2026-03-04T16:31:05.3133333' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (26, 12, 5, CAST(N'2026-02-24T17:50:31.3133333' AS DateTime2), 20, CAST(12000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (27, 6, 3, CAST(N'2026-02-22T16:32:47.3133333' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (28, 20, 1, CAST(N'2026-02-21T19:35:49.3133333' AS DateTime2), 1, CAST(1000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (29, 13, 2, CAST(N'2026-03-09T23:46:27.3133333' AS DateTime2), 2, CAST(1800 AS Decimal(18, 0)), CAST(1800 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (30, 17, 3, CAST(N'2026-03-08T19:20:12.3133333' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (31, 20, 2, CAST(N'2026-02-26T01:17:49.3133333' AS DateTime2), 2, CAST(1800 AS Decimal(18, 0)), CAST(1800 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (32, 12, 2, CAST(N'2026-03-11T05:25:02.3133333' AS DateTime2), 2, CAST(1800 AS Decimal(18, 0)), CAST(1800 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (33, 11, 4, CAST(N'2026-03-13T12:28:37.3133333' AS DateTime2), 10, CAST(7000 AS Decimal(18, 0)), CAST(7000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (34, 20, 4, CAST(N'2026-03-06T08:50:06.3133333' AS DateTime2), 10, CAST(7000 AS Decimal(18, 0)), CAST(7000 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (35, 12, 3, CAST(N'2026-02-24T06:29:48.3133333' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (36, 9, 4, CAST(N'2026-03-01T08:24:56.3133333' AS DateTime2), 10, CAST(7000 AS Decimal(18, 0)), CAST(7000 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (37, 17, 2, CAST(N'2026-02-21T05:26:39.3133333' AS DateTime2), 2, CAST(1800 AS Decimal(18, 0)), CAST(1800 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (38, 12, 5, CAST(N'2026-02-26T07:04:33.3133333' AS DateTime2), 20, CAST(12000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (39, 16, 2, CAST(N'2026-02-22T01:23:26.3133333' AS DateTime2), 2, CAST(1800 AS Decimal(18, 0)), CAST(1800 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (40, 2, 5, CAST(N'2026-03-02T18:31:27.3133333' AS DateTime2), 20, CAST(12000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (41, 11, 3, CAST(N'2026-02-24T13:55:11.3133333' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (42, 19, 4, CAST(N'2026-02-19T18:02:36.3133333' AS DateTime2), 10, CAST(7000 AS Decimal(18, 0)), CAST(7000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (43, 18, 3, CAST(N'2026-02-18T22:21:04.3133333' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (44, 20, 3, CAST(N'2026-02-22T08:04:30.3133333' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (45, 14, 1, CAST(N'2026-03-06T13:46:26.3133333' AS DateTime2), 1, CAST(1000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (46, 4, 2, CAST(N'2026-03-17T22:59:22.3133333' AS DateTime2), 2, CAST(1800 AS Decimal(18, 0)), CAST(1800 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (47, 16, 1, CAST(N'2026-02-21T02:50:10.3133333' AS DateTime2), 1, CAST(1000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (48, 7, 1, CAST(N'2026-02-19T22:33:31.3133333' AS DateTime2), 1, CAST(1000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (49, 14, 2, CAST(N'2026-03-13T07:21:44.3133333' AS DateTime2), 2, CAST(1800 AS Decimal(18, 0)), CAST(1800 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (50, 13, 1, CAST(N'2026-03-15T14:15:25.3133333' AS DateTime2), 1, CAST(1000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (51, 19, 3, CAST(N'2026-02-23T21:41:17.3133333' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (52, 11, 2, CAST(N'2026-03-01T02:50:53.3133333' AS DateTime2), 2, CAST(1800 AS Decimal(18, 0)), CAST(1800 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (53, 4, 4, CAST(N'2026-02-28T05:11:40.3133333' AS DateTime2), 10, CAST(7000 AS Decimal(18, 0)), CAST(7000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (54, 8, 2, CAST(N'2026-03-09T00:56:59.3133333' AS DateTime2), 2, CAST(1800 AS Decimal(18, 0)), CAST(1800 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (55, 19, 1, CAST(N'2026-03-04T20:19:55.3133333' AS DateTime2), 1, CAST(1000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (56, 1, 5, CAST(N'2026-03-17T12:50:32.3133333' AS DateTime2), 20, CAST(12000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (57, 1, 2, CAST(N'2026-03-04T15:02:14.3133333' AS DateTime2), 2, CAST(1800 AS Decimal(18, 0)), CAST(1800 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (58, 4, 1, CAST(N'2026-02-26T17:37:00.3133333' AS DateTime2), 1, CAST(1000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (59, 11, 1, CAST(N'2026-02-27T21:20:04.3133333' AS DateTime2), 1, CAST(1000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (60, 19, 2, CAST(N'2026-03-13T17:07:34.3133333' AS DateTime2), 2, CAST(1800 AS Decimal(18, 0)), CAST(1800 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (61, 9, 4, CAST(N'2026-03-07T12:50:00.3133333' AS DateTime2), 10, CAST(7000 AS Decimal(18, 0)), CAST(7000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (62, 4, 5, CAST(N'2026-03-08T17:44:18.3166667' AS DateTime2), 20, CAST(12000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (63, 8, 3, CAST(N'2026-02-20T14:05:55.3166667' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (64, 2, 3, CAST(N'2026-03-17T22:14:01.3166667' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (65, 19, 3, CAST(N'2026-02-28T06:15:44.3166667' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (66, 17, 1, CAST(N'2026-03-11T14:38:17.3166667' AS DateTime2), 1, CAST(1000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (67, 19, 4, CAST(N'2026-03-09T04:31:35.3166667' AS DateTime2), 10, CAST(7000 AS Decimal(18, 0)), CAST(7000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (68, 4, 1, CAST(N'2026-03-04T13:59:22.3166667' AS DateTime2), 1, CAST(1000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (69, 15, 3, CAST(N'2026-03-15T17:28:35.3166667' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (70, 12, 2, CAST(N'2026-03-04T00:46:17.3166667' AS DateTime2), 2, CAST(1800 AS Decimal(18, 0)), CAST(1800 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (71, 7, 1, CAST(N'2026-03-07T15:26:00.3166667' AS DateTime2), 1, CAST(1000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (72, 18, 1, CAST(N'2026-03-17T06:09:18.3166667' AS DateTime2), 1, CAST(1000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (73, 6, 3, CAST(N'2026-02-18T23:25:58.3166667' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (74, 11, 1, CAST(N'2026-02-21T10:09:23.3166667' AS DateTime2), 1, CAST(1000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (75, 19, 4, CAST(N'2026-02-19T22:07:03.3166667' AS DateTime2), 10, CAST(7000 AS Decimal(18, 0)), CAST(7000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (76, 7, 3, CAST(N'2026-02-21T12:36:04.3166667' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (77, 2, 1, CAST(N'2026-03-02T22:12:23.3166667' AS DateTime2), 1, CAST(1000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (78, 7, 2, CAST(N'2026-02-21T05:49:53.3166667' AS DateTime2), 2, CAST(1800 AS Decimal(18, 0)), CAST(1800 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (79, 13, 3, CAST(N'2026-03-16T16:47:53.3166667' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (80, 16, 5, CAST(N'2026-03-17T08:13:30.3166667' AS DateTime2), 20, CAST(12000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (81, 17, 5, CAST(N'2026-03-02T04:46:18.3166667' AS DateTime2), 20, CAST(12000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (82, 15, 3, CAST(N'2026-03-19T04:45:29.3166667' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (83, 17, 4, CAST(N'2026-03-07T05:49:51.3166667' AS DateTime2), 10, CAST(7000 AS Decimal(18, 0)), CAST(7000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (84, 14, 2, CAST(N'2026-03-11T16:32:44.3166667' AS DateTime2), 2, CAST(1800 AS Decimal(18, 0)), CAST(1800 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (85, 10, 4, CAST(N'2026-03-07T23:52:13.3166667' AS DateTime2), 10, CAST(7000 AS Decimal(18, 0)), CAST(7000 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (86, 4, 4, CAST(N'2026-03-06T14:29:10.3166667' AS DateTime2), 10, CAST(7000 AS Decimal(18, 0)), CAST(7000 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (87, 16, 1, CAST(N'2026-03-16T11:24:33.3166667' AS DateTime2), 1, CAST(1000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (88, 16, 5, CAST(N'2026-03-03T13:51:29.3166667' AS DateTime2), 20, CAST(12000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (89, 1, 4, CAST(N'2026-02-28T14:45:45.3166667' AS DateTime2), 10, CAST(7000 AS Decimal(18, 0)), CAST(7000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (90, 16, 2, CAST(N'2026-02-28T07:08:31.3166667' AS DateTime2), 2, CAST(1800 AS Decimal(18, 0)), CAST(1800 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (91, 16, 2, CAST(N'2026-03-09T03:29:54.3166667' AS DateTime2), 2, CAST(1800 AS Decimal(18, 0)), CAST(1800 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (92, 14, 5, CAST(N'2026-03-09T12:25:44.3166667' AS DateTime2), 20, CAST(12000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (93, 5, 3, CAST(N'2026-03-02T10:11:08.3166667' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (94, 17, 4, CAST(N'2026-02-19T05:12:26.3166667' AS DateTime2), 10, CAST(7000 AS Decimal(18, 0)), CAST(7000 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (95, 17, 2, CAST(N'2026-02-28T14:39:44.3166667' AS DateTime2), 2, CAST(1800 AS Decimal(18, 0)), CAST(1800 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (96, 19, 5, CAST(N'2026-03-02T08:18:51.3166667' AS DateTime2), 20, CAST(12000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (97, 8, 3, CAST(N'2026-02-24T00:34:22.3166667' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (98, 19, 5, CAST(N'2026-03-09T04:58:58.3166667' AS DateTime2), 20, CAST(12000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (99, 6, 3, CAST(N'2026-03-17T22:28:57.3166667' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (100, 12, 2, CAST(N'2026-03-16T13:23:16.3166667' AS DateTime2), 2, CAST(1800 AS Decimal(18, 0)), CAST(1800 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (101, 18, 1, CAST(N'2026-03-17T09:32:49.3166667' AS DateTime2), 1, CAST(1000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (102, 15, 3, CAST(N'2026-03-04T05:54:55.3166667' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (103, 9, 4, CAST(N'2026-03-03T19:27:09.8033333' AS DateTime2), 10, CAST(7000 AS Decimal(18, 0)), CAST(7000 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (104, 5, 5, CAST(N'2026-03-14T03:00:25.8066667' AS DateTime2), 20, CAST(12000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (105, 18, 4, CAST(N'2026-03-13T03:58:26.8066667' AS DateTime2), 10, CAST(7000 AS Decimal(18, 0)), CAST(7000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (106, 11, 1, CAST(N'2026-02-21T08:04:58.8066667' AS DateTime2), 1, CAST(1000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (107, 12, 5, CAST(N'2026-03-04T01:24:27.8066667' AS DateTime2), 20, CAST(12000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (108, 17, 3, CAST(N'2026-02-27T21:14:26.8066667' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (109, 16, 3, CAST(N'2026-02-24T21:22:12.8066667' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (110, 9, 2, CAST(N'2026-02-19T10:49:36.8066667' AS DateTime2), 2, CAST(1800 AS Decimal(18, 0)), CAST(1800 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (111, 3, 2, CAST(N'2026-03-03T19:26:01.8066667' AS DateTime2), 2, CAST(1800 AS Decimal(18, 0)), CAST(1800 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (112, 1, 4, CAST(N'2026-03-15T02:23:52.8066667' AS DateTime2), 10, CAST(7000 AS Decimal(18, 0)), CAST(7000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (113, 18, 5, CAST(N'2026-03-09T14:50:22.8066667' AS DateTime2), 20, CAST(12000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (114, 19, 3, CAST(N'2026-03-14T00:40:40.8066667' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (115, 13, 1, CAST(N'2026-02-28T11:00:14.8066667' AS DateTime2), 1, CAST(1000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (116, 14, 3, CAST(N'2026-03-16T19:04:16.8066667' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (117, 12, 3, CAST(N'2026-02-19T00:23:20.8066667' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (118, 7, 4, CAST(N'2026-03-01T17:13:52.8066667' AS DateTime2), 10, CAST(7000 AS Decimal(18, 0)), CAST(7000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (119, 4, 1, CAST(N'2026-03-14T05:43:22.8066667' AS DateTime2), 1, CAST(1000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (120, 14, 3, CAST(N'2026-02-18T00:54:41.8100000' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (121, 19, 5, CAST(N'2026-03-08T17:31:55.8100000' AS DateTime2), 20, CAST(12000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (122, 9, 2, CAST(N'2026-03-09T07:23:44.8100000' AS DateTime2), 2, CAST(1800 AS Decimal(18, 0)), CAST(1800 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (123, 18, 5, CAST(N'2026-02-24T01:37:59.8100000' AS DateTime2), 20, CAST(12000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (124, 9, 4, CAST(N'2026-02-27T01:45:52.8100000' AS DateTime2), 10, CAST(7000 AS Decimal(18, 0)), CAST(7000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (125, 3, 5, CAST(N'2026-03-09T21:41:11.8100000' AS DateTime2), 20, CAST(12000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (126, 7, 1, CAST(N'2026-03-10T21:24:25.8100000' AS DateTime2), 1, CAST(1000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (127, 11, 4, CAST(N'2026-03-11T12:49:11.8100000' AS DateTime2), 10, CAST(7000 AS Decimal(18, 0)), CAST(7000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (128, 8, 3, CAST(N'2026-03-07T15:27:30.8100000' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (129, 9, 3, CAST(N'2026-03-07T05:09:22.8100000' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (130, 5, 4, CAST(N'2026-03-08T11:56:38.8100000' AS DateTime2), 10, CAST(7000 AS Decimal(18, 0)), CAST(7000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (131, 18, 5, CAST(N'2026-02-19T16:03:10.8100000' AS DateTime2), 20, CAST(12000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (132, 13, 2, CAST(N'2026-02-27T18:34:57.8100000' AS DateTime2), 2, CAST(1800 AS Decimal(18, 0)), CAST(1800 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (133, 13, 3, CAST(N'2026-03-13T01:47:52.8100000' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (134, 2, 3, CAST(N'2026-02-21T15:42:32.8100000' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (135, 8, 5, CAST(N'2026-03-14T17:13:16.8100000' AS DateTime2), 20, CAST(12000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (136, 19, 2, CAST(N'2026-02-21T00:48:40.8100000' AS DateTime2), 2, CAST(1800 AS Decimal(18, 0)), CAST(1800 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (137, 17, 3, CAST(N'2026-02-25T10:07:52.8100000' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (138, 4, 1, CAST(N'2026-03-06T18:07:11.8100000' AS DateTime2), 1, CAST(1000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (139, 8, 2, CAST(N'2026-02-21T21:33:16.8100000' AS DateTime2), 2, CAST(1800 AS Decimal(18, 0)), CAST(1800 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (140, 3, 1, CAST(N'2026-02-22T20:45:25.8100000' AS DateTime2), 1, CAST(1000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (141, 10, 3, CAST(N'2026-03-17T10:59:40.8100000' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (142, 13, 5, CAST(N'2026-02-25T23:54:38.8100000' AS DateTime2), 20, CAST(12000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (143, 8, 4, CAST(N'2026-03-16T09:32:09.8133333' AS DateTime2), 10, CAST(7000 AS Decimal(18, 0)), CAST(7000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (144, 10, 5, CAST(N'2026-03-09T23:07:17.8133333' AS DateTime2), 20, CAST(12000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (145, 2, 5, CAST(N'2026-02-20T04:34:09.8133333' AS DateTime2), 20, CAST(12000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (146, 2, 1, CAST(N'2026-03-14T04:33:27.8133333' AS DateTime2), 1, CAST(1000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (147, 10, 4, CAST(N'2026-03-17T09:27:45.8133333' AS DateTime2), 10, CAST(7000 AS Decimal(18, 0)), CAST(7000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (148, 8, 2, CAST(N'2026-03-12T11:41:07.8133333' AS DateTime2), 2, CAST(1800 AS Decimal(18, 0)), CAST(1800 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (149, 5, 3, CAST(N'2026-02-27T22:01:55.8133333' AS DateTime2), 5, CAST(4000 AS Decimal(18, 0)), CAST(4000 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (150, 6, 1, CAST(N'2026-02-19T13:52:57.8133333' AS DateTime2), 1, CAST(1000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (151, 3, 5, CAST(N'2026-03-19T14:05:46.8133333' AS DateTime2), 20, CAST(12000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), 3)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (152, 17, 1, CAST(N'2026-02-27T00:18:38.8133333' AS DateTime2), 1, CAST(1000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), 0)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (153, 3, 1, CAST(N'2026-03-19T15:04:28.9398637' AS DateTime2), 20, CAST(12000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), 3)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (154, 3, 1, CAST(N'2026-03-19T15:30:51.7522720' AS DateTime2), 10, CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 3)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (155, 3, 1, CAST(N'2026-03-19T15:35:01.6992977' AS DateTime2), 10, CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 3)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (156, 10, 1, CAST(N'2026-03-19T15:36:49.3917189' AS DateTime2), 10, CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 3)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (157, 18, 1, CAST(N'2026-03-20T10:02:24.8917822' AS DateTime2), 20, CAST(12000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (158, 15, 5, CAST(N'2026-03-20T10:05:39.9869598' AS DateTime2), 20, CAST(12000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (159, 15, 1, CAST(N'2026-03-20T12:10:05.9170235' AS DateTime2), 1, CAST(1000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (160, 12, 1, CAST(N'2026-03-01T13:31:06.8303609' AS DateTime2), 1, CAST(1000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[PointOrders] ([Id], [MemberId], [TopUpPlanId], [CreateAt], [PointQty], [OriginalPrice], [DiscountedPrice], [Status]) VALUES (161, 15, 1, CAST(N'2026-03-01T13:31:26.9545780' AS DateTime2), 1, CAST(1000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), 1)
GO
SET IDENTITY_INSERT [dbo].[PointOrders] OFF
GO
SET IDENTITY_INSERT [dbo].[PointsRecordDetails] ON 
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (1, 7, 1, CAST(N'2026-02-19T20:32:07.0000000' AS DateTime2), 20, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (2, 9, 2, CAST(N'2026-03-04T04:47:03.0000000' AS DateTime2), 5, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (3, 11, 5, CAST(N'2026-03-17T00:25:53.0000000' AS DateTime2), 1, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (4, 15, 12, CAST(N'2026-03-11T03:04:29.0000000' AS DateTime2), 1, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (5, 19, 10, CAST(N'2026-02-18T18:07:40.0000000' AS DateTime2), 10, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (6, 21, 11, CAST(N'2026-03-16T02:42:25.0000000' AS DateTime2), 5, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (7, 25, 16, CAST(N'2026-03-04T16:31:05.0000000' AS DateTime2), 5, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (8, 31, 16, CAST(N'2026-02-26T01:17:49.0000000' AS DateTime2), 2, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (9, 33, 7, CAST(N'2026-03-13T12:28:37.0000000' AS DateTime2), 10, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (10, 35, 8, CAST(N'2026-02-24T06:29:48.0000000' AS DateTime2), 5, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (11, 38, 8, CAST(N'2026-02-26T07:04:33.0000000' AS DateTime2), 20, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (12, 39, 12, CAST(N'2026-02-22T01:23:26.0000000' AS DateTime2), 2, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (13, 47, 12, CAST(N'2026-02-21T02:50:10.0000000' AS DateTime2), 1, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (14, 48, 3, CAST(N'2026-02-19T22:33:31.0000000' AS DateTime2), 1, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (15, 50, 9, CAST(N'2026-03-15T14:15:25.0000000' AS DateTime2), 1, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (16, 51, 15, CAST(N'2026-02-23T21:41:17.0000000' AS DateTime2), 5, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (17, 52, 7, CAST(N'2026-03-01T02:50:53.0000000' AS DateTime2), 2, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (18, 54, 4, CAST(N'2026-03-09T00:56:59.0000000' AS DateTime2), 2, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (19, 55, 15, CAST(N'2026-03-04T20:19:55.0000000' AS DateTime2), 1, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (20, 60, 15, CAST(N'2026-03-13T17:07:34.0000000' AS DateTime2), 2, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (21, 67, 15, CAST(N'2026-03-09T04:31:35.0000000' AS DateTime2), 10, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (22, 69, 11, CAST(N'2026-03-15T17:28:35.0000000' AS DateTime2), 5, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (23, 71, 3, CAST(N'2026-03-07T15:26:00.0000000' AS DateTime2), 1, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (24, 75, 15, CAST(N'2026-02-19T22:07:03.0000000' AS DateTime2), 10, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (25, 78, 3, CAST(N'2026-02-21T05:49:53.0000000' AS DateTime2), 2, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (26, 79, 9, CAST(N'2026-03-16T16:47:53.0000000' AS DateTime2), 5, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (27, 81, 13, CAST(N'2026-03-02T04:46:18.0000000' AS DateTime2), 20, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (28, 84, 10, CAST(N'2026-03-11T16:32:44.0000000' AS DateTime2), 2, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (29, 89, 1, CAST(N'2026-02-28T14:45:45.0000000' AS DateTime2), 10, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (30, 95, 13, CAST(N'2026-02-28T14:39:44.0000000' AS DateTime2), 2, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (31, 96, 15, CAST(N'2026-03-02T08:18:51.0000000' AS DateTime2), 20, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (32, 97, 4, CAST(N'2026-02-24T00:34:22.0000000' AS DateTime2), 5, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (33, 98, 15, CAST(N'2026-03-09T04:58:58.0000000' AS DateTime2), 20, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (34, 103, 5, CAST(N'2026-03-03T19:27:10.0000000' AS DateTime2), 10, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (35, 104, 5, CAST(N'2026-03-14T03:00:26.0000000' AS DateTime2), 20, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (36, 105, 14, CAST(N'2026-03-13T03:58:27.0000000' AS DateTime2), 10, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (37, 106, 7, CAST(N'2026-02-21T08:04:59.0000000' AS DateTime2), 1, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (38, 107, 8, CAST(N'2026-03-04T01:24:28.0000000' AS DateTime2), 20, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (39, 108, 13, CAST(N'2026-02-27T21:14:27.0000000' AS DateTime2), 5, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (40, 109, 12, CAST(N'2026-02-24T21:22:13.0000000' AS DateTime2), 5, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (41, 110, 5, CAST(N'2026-02-19T10:49:37.0000000' AS DateTime2), 2, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (42, 111, 5, CAST(N'2026-03-03T19:26:02.0000000' AS DateTime2), 2, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (43, 112, 1, CAST(N'2026-03-15T02:23:53.0000000' AS DateTime2), 10, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (44, 113, 14, CAST(N'2026-03-09T14:50:23.0000000' AS DateTime2), 20, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (45, 114, 15, CAST(N'2026-03-14T00:40:41.0000000' AS DateTime2), 5, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (46, 115, 9, CAST(N'2026-02-28T11:00:15.0000000' AS DateTime2), 1, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (47, 116, 10, CAST(N'2026-03-16T19:04:17.0000000' AS DateTime2), 5, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (48, 117, 8, CAST(N'2026-02-19T00:23:21.0000000' AS DateTime2), 5, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (49, 118, 3, CAST(N'2026-03-01T17:13:53.0000000' AS DateTime2), 10, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (50, 119, 3, CAST(N'2026-03-14T05:43:23.0000000' AS DateTime2), 1, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (51, 120, 10, CAST(N'2026-02-18T00:54:42.0000000' AS DateTime2), 5, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (52, 121, 15, CAST(N'2026-03-08T17:31:56.0000000' AS DateTime2), 20, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (53, 122, 5, CAST(N'2026-03-09T07:23:45.0000000' AS DateTime2), 2, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (54, 123, 14, CAST(N'2026-02-24T01:38:00.0000000' AS DateTime2), 20, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (55, 124, 5, CAST(N'2026-02-27T01:45:53.0000000' AS DateTime2), 10, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (56, 125, 5, CAST(N'2026-03-09T21:41:12.0000000' AS DateTime2), 20, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (57, 126, 3, CAST(N'2026-03-10T21:24:26.0000000' AS DateTime2), 1, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (58, 127, 7, CAST(N'2026-03-11T12:49:12.0000000' AS DateTime2), 10, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (59, 128, 4, CAST(N'2026-03-07T15:27:31.0000000' AS DateTime2), 5, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (60, 129, 5, CAST(N'2026-03-07T05:09:23.0000000' AS DateTime2), 5, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (61, 130, 5, CAST(N'2026-03-08T11:56:39.0000000' AS DateTime2), 10, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (62, 131, 14, CAST(N'2026-02-19T16:03:11.0000000' AS DateTime2), 20, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (63, 132, 9, CAST(N'2026-02-27T18:34:58.0000000' AS DateTime2), 2, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (64, 133, 9, CAST(N'2026-03-13T01:47:53.0000000' AS DateTime2), 5, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (65, 134, 2, CAST(N'2026-02-21T15:42:33.0000000' AS DateTime2), 5, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (66, 135, 4, CAST(N'2026-03-14T17:13:17.0000000' AS DateTime2), 20, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (67, 136, 15, CAST(N'2026-02-21T00:48:41.0000000' AS DateTime2), 2, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (68, 137, 13, CAST(N'2026-02-25T10:07:53.0000000' AS DateTime2), 5, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (69, 138, 13, CAST(N'2026-03-06T18:07:12.0000000' AS DateTime2), 1, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (70, 139, 4, CAST(N'2026-02-21T21:33:17.0000000' AS DateTime2), 2, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (71, 140, 4, CAST(N'2026-02-22T20:45:26.0000000' AS DateTime2), 1, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (72, 141, 6, CAST(N'2026-03-17T10:59:41.0000000' AS DateTime2), 5, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (73, 142, 9, CAST(N'2026-02-25T23:54:39.0000000' AS DateTime2), 20, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (74, 143, 4, CAST(N'2026-03-16T09:32:10.0000000' AS DateTime2), 10, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (75, 144, 6, CAST(N'2026-03-09T23:07:18.0000000' AS DateTime2), 20, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (76, 145, 2, CAST(N'2026-02-20T04:34:10.0000000' AS DateTime2), 20, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (77, 146, 2, CAST(N'2026-03-14T04:33:28.0000000' AS DateTime2), 1, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (78, 147, 6, CAST(N'2026-03-17T09:27:46.0000000' AS DateTime2), 10, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (79, 148, 4, CAST(N'2026-03-12T11:41:08.0000000' AS DateTime2), 2, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (80, 149, 4, CAST(N'2026-02-27T22:01:56.0000000' AS DateTime2), 5, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (81, 150, 4, CAST(N'2026-02-19T13:52:58.0000000' AS DateTime2), 1, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (82, 151, 4, CAST(N'2026-03-19T14:05:47.0000000' AS DateTime2), 20, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (83, 152, 13, CAST(N'2026-02-27T00:18:39.0000000' AS DateTime2), 1, N'PointOrder', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (88, 156, 6, CAST(N'2026-03-19T15:36:49.0000000' AS DateTime2), 10, N'系統贈送', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (89, 156, 6, CAST(N'2026-03-19T15:44:09.0000000' AS DateTime2), -10, N'已取消', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (92, 157, 14, CAST(N'2026-03-20T10:02:25.0000000' AS DateTime2), 20, N'Recharge', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (93, 158, 11, CAST(N'2026-03-20T10:05:40.0000000' AS DateTime2), 20, N'Recharge', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (94, 159, 11, CAST(N'2026-03-20T12:10:06.0000000' AS DateTime2), 1, N'Recharge', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (95, 160, 8, CAST(N'2026-03-01T13:31:07.0000000' AS DateTime2), 1, N'Recharge', NULL)
GO
INSERT [dbo].[PointsRecordDetails] ([Id], [PointOrderId], [UserWalletId], [CreateAt], [PointAmount], [MerchandiseCategory], [ReserveOrderId]) VALUES (96, 161, 11, CAST(N'2026-03-01T13:31:27.0000000' AS DateTime2), 1, N'Recharge', NULL)
GO
SET IDENTITY_INSERT [dbo].[PointsRecordDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategories] ON 
GO
INSERT [dbo].[ProductCategories] ([Id], [CategoryName], [SortOrder], [IsActive]) VALUES (1, N'雞胸肉', 1, 1)
GO
INSERT [dbo].[ProductCategories] ([Id], [CategoryName], [SortOrder], [IsActive]) VALUES (2, N'蛋白粉', 2, 1)
GO
INSERT [dbo].[ProductCategories] ([Id], [CategoryName], [SortOrder], [IsActive]) VALUES (3, N'各種維生素', 3, 1)
GO
INSERT [dbo].[ProductCategories] ([Id], [CategoryName], [SortOrder], [IsActive]) VALUES (4, N'便當盒', 4, 1)
GO
INSERT [dbo].[ProductCategories] ([Id], [CategoryName], [SortOrder], [IsActive]) VALUES (7, N'健康便當', 5, 1)
GO
INSERT [dbo].[ProductCategories] ([Id], [CategoryName], [SortOrder], [IsActive]) VALUES (1005, N'健身器材', 6, 1)
GO
SET IDENTITY_INSERT [dbo].[ProductCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductOrderDetails] ON 
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (1, 1, 1, CAST(99 AS Decimal(18, 0)), 2, CAST(198 AS Decimal(18, 0)), CAST(200 AS Decimal(18, 0)), N'經典原味舒肥雞胸肉', N'/images/products/chicken_01.jpg', N'請幫我用紙箱包裝')
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (2, 1, 9, CAST(1200 AS Decimal(18, 0)), 1, CAST(1200 AS Decimal(18, 0)), CAST(500 AS Decimal(18, 0)), N'濃縮乳清蛋白 - 醇厚巧克力', N'/images/products/protein_01.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (3, 2, 17, CAST(450 AS Decimal(18, 0)), 1, CAST(450 AS Decimal(18, 0)), CAST(200 AS Decimal(18, 0)), N'高單位活力B群', N'/images/products/vitamin_01.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (4, 2, 24, CAST(350 AS Decimal(18, 0)), 2, CAST(700 AS Decimal(18, 0)), CAST(100 AS Decimal(18, 0)), N'304不鏽鋼分隔便當盒', N'/images/products/box_01.jpg', N'送禮用，請確認無刮痕')
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (5, 1, 6, CAST(109 AS Decimal(18, 0)), 3, CAST(327 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'川味麻辣雞胸肉', N'/images/products/chicken_06.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (8, 73, 4, CAST(109 AS Decimal(18, 0)), 2, CAST(218 AS Decimal(18, 0)), CAST(218 AS Decimal(18, 0)), N'泰式檸檬雞胸肉', N'/images/products/chicken_04.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (11, 80, 5, CAST(109 AS Decimal(18, 0)), 2, CAST(218 AS Decimal(18, 0)), CAST(218 AS Decimal(18, 0)), N'印度咖哩雞胸肉', N'/images/products/chicken_05.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (20, 75, 8, CAST(119 AS Decimal(18, 0)), 2, CAST(238 AS Decimal(18, 0)), CAST(238 AS Decimal(18, 0)), N'迷迭香烤雞胸肉', N'/images/products/chicken_08.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (21, 80, 7, CAST(119 AS Decimal(18, 0)), 2, CAST(238 AS Decimal(18, 0)), CAST(238 AS Decimal(18, 0)), N'義式香草雞胸肉', N'/images/products/chicken_07.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (27, 77, 3, CAST(99 AS Decimal(18, 0)), 3, CAST(297 AS Decimal(18, 0)), CAST(297 AS Decimal(18, 0)), N'蒜香風味雞胸肉', N'/images/products/chicken_03.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (38, 78, 9, CAST(1200 AS Decimal(18, 0)), 1, CAST(1200 AS Decimal(18, 0)), CAST(1200 AS Decimal(18, 0)), N'濃縮乳清蛋白 - 醇厚巧克力', N'/images/products/protein_01.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (43, 80, 3, CAST(99 AS Decimal(18, 0)), 1, CAST(99 AS Decimal(18, 0)), CAST(99 AS Decimal(18, 0)), N'蒜香風味雞胸肉', N'/images/products/chicken_03.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (46, 2, 1, CAST(99 AS Decimal(18, 0)), 2, CAST(198 AS Decimal(18, 0)), CAST(198 AS Decimal(18, 0)), N'經典原味舒肥雞胸肉', N'/images/products/chicken_01.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (52, 75, 5, CAST(109 AS Decimal(18, 0)), 1, CAST(109 AS Decimal(18, 0)), CAST(109 AS Decimal(18, 0)), N'印度咖哩雞胸肉', N'/images/products/chicken_05.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (62, 79, 2, CAST(99 AS Decimal(18, 0)), 1, CAST(99 AS Decimal(18, 0)), CAST(99 AS Decimal(18, 0)), N'黑胡椒海鹽雞胸肉', N'/images/products/chicken_02.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (98, 77, 6, CAST(109 AS Decimal(18, 0)), 2, CAST(218 AS Decimal(18, 0)), CAST(218 AS Decimal(18, 0)), N'川味麻辣雞胸肉', N'/images/products/chicken_06.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (99, 75, 9, CAST(1200 AS Decimal(18, 0)), 2, CAST(2400 AS Decimal(18, 0)), CAST(2400 AS Decimal(18, 0)), N'濃縮乳清蛋白 - 醇厚巧克力', N'/images/products/protein_01.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (105, 77, 5, CAST(109 AS Decimal(18, 0)), 2, CAST(218 AS Decimal(18, 0)), CAST(218 AS Decimal(18, 0)), N'印度咖哩雞胸肉', N'/images/products/chicken_05.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (106, 72, 7, CAST(119 AS Decimal(18, 0)), 1, CAST(119 AS Decimal(18, 0)), CAST(119 AS Decimal(18, 0)), N'義式香草雞胸肉', N'/images/products/chicken_07.jpg', N'蝟餌絞?芸?鋆?')
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (107, 74, 9, CAST(1200 AS Decimal(18, 0)), 1, CAST(1200 AS Decimal(18, 0)), CAST(1200 AS Decimal(18, 0)), N'濃縮乳清蛋白 - 醇厚巧克力', N'/images/products/protein_01.jpg', N'蝟餌絞?芸?鋆?')
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (108, 76, 6, CAST(109 AS Decimal(18, 0)), 1, CAST(109 AS Decimal(18, 0)), CAST(109 AS Decimal(18, 0)), N'川味麻辣雞胸肉', N'/images/products/chicken_06.jpg', N'蝟餌絞?芸?鋆?')
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (109, 2, 3, CAST(99 AS Decimal(18, 0)), 2, CAST(99 AS Decimal(18, 0)), CAST(99 AS Decimal(18, 0)), N'蒜香風味雞胸肉', N'/images/products/chicken_03.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (120, 74, 5, CAST(109 AS Decimal(18, 0)), 2, CAST(109 AS Decimal(18, 0)), CAST(109 AS Decimal(18, 0)), N'印度咖哩雞胸肉', N'/images/products/chicken_05.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (128, 76, 2, CAST(99 AS Decimal(18, 0)), 2, CAST(99 AS Decimal(18, 0)), CAST(99 AS Decimal(18, 0)), N'黑胡椒海鹽雞胸肉', N'/images/products/chicken_02.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (132, 72, 5, CAST(109 AS Decimal(18, 0)), 2, CAST(109 AS Decimal(18, 0)), CAST(109 AS Decimal(18, 0)), N'印度咖哩雞胸肉', N'/images/products/chicken_05.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (135, 75, 5, CAST(109 AS Decimal(18, 0)), 2, CAST(109 AS Decimal(18, 0)), CAST(109 AS Decimal(18, 0)), N'印度咖哩雞胸肉', N'/images/products/chicken_05.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (143, 80, 4, CAST(109 AS Decimal(18, 0)), 2, CAST(109 AS Decimal(18, 0)), CAST(109 AS Decimal(18, 0)), N'泰式檸檬雞胸肉', N'/images/products/chicken_04.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (144, 76, 9, CAST(1200 AS Decimal(18, 0)), 1, CAST(1200 AS Decimal(18, 0)), CAST(1200 AS Decimal(18, 0)), N'濃縮乳清蛋白 - 醇厚巧克力', N'/images/products/protein_01.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (146, 76, 7, CAST(119 AS Decimal(18, 0)), 1, CAST(119 AS Decimal(18, 0)), CAST(119 AS Decimal(18, 0)), N'義式香草雞胸肉', N'/images/products/chicken_07.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (153, 77, 9, CAST(1200 AS Decimal(18, 0)), 2, CAST(1200 AS Decimal(18, 0)), CAST(1200 AS Decimal(18, 0)), N'濃縮乳清蛋白 - 醇厚巧克力', N'/images/products/protein_01.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (161, 1, 6, CAST(109 AS Decimal(18, 0)), 1, CAST(109 AS Decimal(18, 0)), CAST(109 AS Decimal(18, 0)), N'川味麻辣雞胸肉', N'/images/products/chicken_06.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (171, 1, 5, CAST(109 AS Decimal(18, 0)), 2, CAST(109 AS Decimal(18, 0)), CAST(109 AS Decimal(18, 0)), N'印度咖哩雞胸肉', N'/images/products/chicken_05.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (181, 75, 3, CAST(99 AS Decimal(18, 0)), 1, CAST(99 AS Decimal(18, 0)), CAST(99 AS Decimal(18, 0)), N'蒜香風味雞胸肉', N'/images/products/chicken_03.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (183, 75, 1, CAST(99 AS Decimal(18, 0)), 1, CAST(99 AS Decimal(18, 0)), CAST(99 AS Decimal(18, 0)), N'經典原味舒肥雞胸肉', N'/images/products/chicken_01.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (188, 75, 9, CAST(1200 AS Decimal(18, 0)), 2, CAST(1200 AS Decimal(18, 0)), CAST(1200 AS Decimal(18, 0)), N'濃縮乳清蛋白 - 醇厚巧克力', N'/images/products/protein_01.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (195, 72, 10, CAST(1200 AS Decimal(18, 0)), 2, CAST(1200 AS Decimal(18, 0)), CAST(1200 AS Decimal(18, 0)), N'濃縮乳清蛋白 - 經典香草', N'/images/products/protein_02.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (202, 78, 6, CAST(109 AS Decimal(18, 0)), 2, CAST(109 AS Decimal(18, 0)), CAST(109 AS Decimal(18, 0)), N'川味麻辣雞胸肉', N'/images/products/chicken_06.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (205, 73, 5, CAST(109 AS Decimal(18, 0)), 2, CAST(109 AS Decimal(18, 0)), CAST(109 AS Decimal(18, 0)), N'印度咖哩雞胸肉', N'/images/products/chicken_05.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (206, 82, 6, CAST(109 AS Decimal(18, 0)), 1, CAST(109 AS Decimal(18, 0)), CAST(109 AS Decimal(18, 0)), N'川味麻辣雞胸肉', N'/images/products/chicken_06.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (207, 83, 10, CAST(1200 AS Decimal(18, 0)), 1, CAST(1200 AS Decimal(18, 0)), CAST(1200 AS Decimal(18, 0)), N'濃縮乳清蛋白 - 經典香草', N'/images/products/protein_02.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (208, 84, 30, CAST(299 AS Decimal(18, 0)), 1, CAST(299 AS Decimal(18, 0)), CAST(299 AS Decimal(18, 0)), N'大容量運動雙層沙拉盒', N'/images/products/box_07.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (209, 85, 11, CAST(1450 AS Decimal(18, 0)), 1, CAST(1450 AS Decimal(18, 0)), CAST(1450 AS Decimal(18, 0)), N'分離乳清蛋白 - 鮮採草莓', N'/images/products/protein_03.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (210, 86, 17, CAST(450 AS Decimal(18, 0)), 1, CAST(450 AS Decimal(18, 0)), CAST(450 AS Decimal(18, 0)), N'高單位活力B群', N'/images/products/vitamin_01.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (211, 87, 1, CAST(99 AS Decimal(18, 0)), 1, CAST(99 AS Decimal(18, 0)), CAST(99 AS Decimal(18, 0)), N'經典原味舒肥雞胸肉', N'/images/products/chicken_01.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (212, 88, 4, CAST(109 AS Decimal(18, 0)), 1, CAST(109 AS Decimal(18, 0)), CAST(109 AS Decimal(18, 0)), N'泰式檸檬雞胸肉', N'/images/products/chicken_04.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (213, 89, 2, CAST(99 AS Decimal(18, 0)), 1, CAST(99 AS Decimal(18, 0)), CAST(99 AS Decimal(18, 0)), N'黑胡椒海鹽雞胸肉', N'/images/products/chicken_02.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (214, 90, 7, CAST(119 AS Decimal(18, 0)), 1, CAST(119 AS Decimal(18, 0)), CAST(119 AS Decimal(18, 0)), N'義式香草雞胸肉', N'/images/products/chicken_07.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (215, 91, 11, CAST(1450 AS Decimal(18, 0)), 1, CAST(1450 AS Decimal(18, 0)), CAST(1450 AS Decimal(18, 0)), N'分離乳清蛋白 - 鮮採草莓', N'/images/products/protein_03.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (216, 92, 3, CAST(99 AS Decimal(18, 0)), 1, CAST(99 AS Decimal(18, 0)), CAST(99 AS Decimal(18, 0)), N'蒜香風味雞胸肉', N'/images/products/chicken_03.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (217, 93, 27, CAST(250 AS Decimal(18, 0)), 1, CAST(250 AS Decimal(18, 0)), CAST(250 AS Decimal(18, 0)), N'耐熱玻璃保鮮盒 - 雙格800ml', N'/images/products/box_04.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (218, 94, 8, CAST(119 AS Decimal(18, 0)), 1, CAST(119 AS Decimal(18, 0)), CAST(119 AS Decimal(18, 0)), N'迷迭香烤雞胸肉', N'/images/products/chicken_08.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (219, 95, 18, CAST(280 AS Decimal(18, 0)), 1, CAST(280 AS Decimal(18, 0)), CAST(280 AS Decimal(18, 0)), N'維生素C1000發泡錠', N'/images/products/vitamin_02.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (220, 96, 20, CAST(650 AS Decimal(18, 0)), 1, CAST(650 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), N'綜合礦物質複方錠', N'/images/products/vitamin_04.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (221, 97, 11, CAST(1450 AS Decimal(18, 0)), 1, CAST(1450 AS Decimal(18, 0)), CAST(1450 AS Decimal(18, 0)), N'分離乳清蛋白 - 鮮採草莓', N'/images/products/protein_03.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (222, 98, 4, CAST(109 AS Decimal(18, 0)), 1, CAST(109 AS Decimal(18, 0)), CAST(109 AS Decimal(18, 0)), N'泰式檸檬雞胸肉', N'/images/products/chicken_04.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (223, 99, 2, CAST(99 AS Decimal(18, 0)), 1, CAST(99 AS Decimal(18, 0)), CAST(99 AS Decimal(18, 0)), N'黑胡椒海鹽雞胸肉', N'/images/products/chicken_02.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (224, 100, 5, CAST(109 AS Decimal(18, 0)), 1, CAST(109 AS Decimal(18, 0)), CAST(109 AS Decimal(18, 0)), N'印度咖哩雞胸肉', N'/images/products/chicken_05.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (225, 101, 9, CAST(1200 AS Decimal(18, 0)), 1, CAST(1200 AS Decimal(18, 0)), CAST(1200 AS Decimal(18, 0)), N'濃縮乳清蛋白 - 醇厚巧克力', N'/images/products/protein_01.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (226, 102, 20, CAST(650 AS Decimal(18, 0)), 1, CAST(650 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), N'綜合礦物質複方錠', N'/images/products/vitamin_04.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (227, 103, 6, CAST(109 AS Decimal(18, 0)), 1, CAST(109 AS Decimal(18, 0)), CAST(109 AS Decimal(18, 0)), N'川味麻辣雞胸肉', N'/images/products/chicken_06.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (228, 104, 28, CAST(499 AS Decimal(18, 0)), 1, CAST(499 AS Decimal(18, 0)), CAST(499 AS Decimal(18, 0)), N'日式質感木製便當盒', N'/images/products/box_05.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (229, 105, 28, CAST(499 AS Decimal(18, 0)), 1, CAST(499 AS Decimal(18, 0)), CAST(499 AS Decimal(18, 0)), N'日式質感木製便當盒', N'/images/products/box_05.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (230, 106, 26, CAST(199 AS Decimal(18, 0)), 1, CAST(199 AS Decimal(18, 0)), CAST(199 AS Decimal(18, 0)), N'耐熱玻璃保鮮盒 - 單格600ml', N'/images/products/box_03.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (231, 107, 20, CAST(650 AS Decimal(18, 0)), 1, CAST(650 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), N'綜合礦物質複方錠', N'/images/products/vitamin_04.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (232, 108, 13, CAST(1300 AS Decimal(18, 0)), 1, CAST(1300 AS Decimal(18, 0)), CAST(1300 AS Decimal(18, 0)), N'緩釋型酪蛋白 - 原味', N'/images/products/protein_05.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (233, 109, 23, CAST(720 AS Decimal(18, 0)), 1, CAST(720 AS Decimal(18, 0)), CAST(720 AS Decimal(18, 0)), N'海藻鈣+鎂+D3', N'/images/products/vitamin_07.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (234, 110, 10, CAST(1200 AS Decimal(18, 0)), 1, CAST(1200 AS Decimal(18, 0)), CAST(1200 AS Decimal(18, 0)), N'濃縮乳清蛋白 - 經典香草', N'/images/products/protein_02.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (235, 111, 25, CAST(420 AS Decimal(18, 0)), 1, CAST(420 AS Decimal(18, 0)), CAST(420 AS Decimal(18, 0)), N'白金矽膠摺疊便當盒', N'/images/products/box_02.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (236, 112, 6, CAST(109 AS Decimal(18, 0)), 1, CAST(109 AS Decimal(18, 0)), CAST(109 AS Decimal(18, 0)), N'川味麻辣雞胸肉', N'/images/products/chicken_06.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (237, 113, 17, CAST(450 AS Decimal(18, 0)), 1, CAST(450 AS Decimal(18, 0)), CAST(450 AS Decimal(18, 0)), N'高單位活力B群', N'/images/products/vitamin_01.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (238, 114, 15, CAST(1150 AS Decimal(18, 0)), 1, CAST(1150 AS Decimal(18, 0)), CAST(1150 AS Decimal(18, 0)), N'綜合植物蛋白粉 - 芝麻', N'/images/products/protein_07.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (239, 115, 16, CAST(990 AS Decimal(18, 0)), 1, CAST(990 AS Decimal(18, 0)), CAST(990 AS Decimal(18, 0)), N'高蛋白能量代餐飲 - 香蕉', N'/images/products/protein_08.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (240, 116, 15, CAST(1150 AS Decimal(18, 0)), 1, CAST(1150 AS Decimal(18, 0)), CAST(1150 AS Decimal(18, 0)), N'綜合植物蛋白粉 - 芝麻', N'/images/products/protein_07.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (241, 117, 11, CAST(1450 AS Decimal(18, 0)), 1, CAST(1450 AS Decimal(18, 0)), CAST(1450 AS Decimal(18, 0)), N'分離乳清蛋白 - 鮮採草莓', N'/images/products/protein_03.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (242, 118, 6, CAST(109 AS Decimal(18, 0)), 1, CAST(109 AS Decimal(18, 0)), CAST(109 AS Decimal(18, 0)), N'川味麻辣雞胸肉', N'/images/products/chicken_06.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (243, 119, 5, CAST(109 AS Decimal(18, 0)), 1, CAST(109 AS Decimal(18, 0)), CAST(109 AS Decimal(18, 0)), N'印度咖哩雞胸肉', N'/images/products/chicken_05.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (244, 120, 9, CAST(1200 AS Decimal(18, 0)), 1, CAST(1200 AS Decimal(18, 0)), CAST(1200 AS Decimal(18, 0)), N'濃縮乳清蛋白 - 醇厚巧克力', N'/images/products/protein_01.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (245, 121, 4, CAST(109 AS Decimal(18, 0)), 1, CAST(109 AS Decimal(18, 0)), CAST(109 AS Decimal(18, 0)), N'泰式檸檬雞胸肉', N'/images/products/chicken_04.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (246, 122, 24, CAST(350 AS Decimal(18, 0)), 1, CAST(350 AS Decimal(18, 0)), CAST(350 AS Decimal(18, 0)), N'304不鏽鋼分隔便當盒', N'/images/products/box_01.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (247, 123, 1, CAST(99 AS Decimal(18, 0)), 1, CAST(99 AS Decimal(18, 0)), CAST(99 AS Decimal(18, 0)), N'經典原味舒肥雞胸肉', N'/images/products/chicken_01.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (248, 124, 23, CAST(720 AS Decimal(18, 0)), 1, CAST(720 AS Decimal(18, 0)), CAST(720 AS Decimal(18, 0)), N'海藻鈣+鎂+D3', N'/images/products/vitamin_07.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (249, 125, 30, CAST(299 AS Decimal(18, 0)), 1, CAST(299 AS Decimal(18, 0)), CAST(299 AS Decimal(18, 0)), N'大容量運動雙層沙拉盒', N'/images/products/box_07.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (250, 126, 6, CAST(109 AS Decimal(18, 0)), 1, CAST(109 AS Decimal(18, 0)), CAST(109 AS Decimal(18, 0)), N'川味麻辣雞胸肉', N'/images/products/chicken_06.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (251, 127, 9, CAST(1200 AS Decimal(18, 0)), 1, CAST(1200 AS Decimal(18, 0)), CAST(1200 AS Decimal(18, 0)), N'濃縮乳清蛋白 - 醇厚巧克力', N'/images/products/protein_01.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (252, 128, 16, CAST(990 AS Decimal(18, 0)), 1, CAST(990 AS Decimal(18, 0)), CAST(990 AS Decimal(18, 0)), N'高蛋白能量代餐飲 - 香蕉', N'/images/products/protein_08.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (253, 129, 30, CAST(299 AS Decimal(18, 0)), 1, CAST(299 AS Decimal(18, 0)), CAST(299 AS Decimal(18, 0)), N'大容量運動雙層沙拉盒', N'/images/products/box_07.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (254, 130, 24, CAST(350 AS Decimal(18, 0)), 1, CAST(350 AS Decimal(18, 0)), CAST(350 AS Decimal(18, 0)), N'304不鏽鋼分隔便當盒', N'/images/products/box_01.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (255, 131, 9, CAST(1200 AS Decimal(18, 0)), 1, CAST(1200 AS Decimal(18, 0)), CAST(1200 AS Decimal(18, 0)), N'濃縮乳清蛋白 - 醇厚巧克力', N'/images/products/protein_01.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (256, 132, 24, CAST(350 AS Decimal(18, 0)), 1, CAST(350 AS Decimal(18, 0)), CAST(350 AS Decimal(18, 0)), N'304不鏽鋼分隔便當盒', N'/images/products/box_01.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (257, 133, 17, CAST(450 AS Decimal(18, 0)), 1, CAST(450 AS Decimal(18, 0)), CAST(450 AS Decimal(18, 0)), N'高單位活力B群', N'/images/products/vitamin_01.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (258, 134, 26, CAST(199 AS Decimal(18, 0)), 1, CAST(199 AS Decimal(18, 0)), CAST(199 AS Decimal(18, 0)), N'耐熱玻璃保鮮盒 - 單格600ml', N'/images/products/box_03.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (259, 135, 16, CAST(990 AS Decimal(18, 0)), 1, CAST(990 AS Decimal(18, 0)), CAST(990 AS Decimal(18, 0)), N'高蛋白能量代餐飲 - 香蕉', N'/images/products/protein_08.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (260, 136, 10, CAST(1200 AS Decimal(18, 0)), 1, CAST(1200 AS Decimal(18, 0)), CAST(1200 AS Decimal(18, 0)), N'濃縮乳清蛋白 - 經典香草', N'/images/products/protein_02.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (261, 137, 25, CAST(420 AS Decimal(18, 0)), 1, CAST(420 AS Decimal(18, 0)), CAST(420 AS Decimal(18, 0)), N'白金矽膠摺疊便當盒', N'/images/products/box_02.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (262, 138, 7, CAST(119 AS Decimal(18, 0)), 1, CAST(119 AS Decimal(18, 0)), CAST(119 AS Decimal(18, 0)), N'義式香草雞胸肉', N'/images/products/chicken_07.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (263, 139, 28, CAST(499 AS Decimal(18, 0)), 1, CAST(499 AS Decimal(18, 0)), CAST(499 AS Decimal(18, 0)), N'日式質感木製便當盒', N'/images/products/box_05.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (264, 140, 2, CAST(99 AS Decimal(18, 0)), 1, CAST(99 AS Decimal(18, 0)), CAST(99 AS Decimal(18, 0)), N'黑胡椒海鹽雞胸肉', N'/images/products/chicken_02.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (265, 141, 10, CAST(1200 AS Decimal(18, 0)), 1, CAST(1200 AS Decimal(18, 0)), CAST(1200 AS Decimal(18, 0)), N'濃縮乳清蛋白 - 經典香草', N'/images/products/protein_02.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (266, 142, 9, CAST(1200 AS Decimal(18, 0)), 1, CAST(1200 AS Decimal(18, 0)), CAST(1200 AS Decimal(18, 0)), N'濃縮乳清蛋白 - 醇厚巧克力', N'/images/products/protein_01.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (267, 143, 20, CAST(650 AS Decimal(18, 0)), 1, CAST(650 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), N'綜合礦物質複方錠', N'/images/products/vitamin_04.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (268, 144, 16, CAST(990 AS Decimal(18, 0)), 1, CAST(990 AS Decimal(18, 0)), CAST(990 AS Decimal(18, 0)), N'高蛋白能量代餐飲 - 香蕉', N'/images/products/protein_08.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (269, 145, 14, CAST(1100 AS Decimal(18, 0)), 1, CAST(1100 AS Decimal(18, 0)), CAST(1100 AS Decimal(18, 0)), N'純素大豆分離蛋白 - 抹茶', N'/images/products/protein_06.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (270, 146, 30, CAST(299 AS Decimal(18, 0)), 1, CAST(299 AS Decimal(18, 0)), CAST(299 AS Decimal(18, 0)), N'大容量運動雙層沙拉盒', N'/images/products/box_07.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (271, 147, 27, CAST(250 AS Decimal(18, 0)), 1, CAST(250 AS Decimal(18, 0)), CAST(250 AS Decimal(18, 0)), N'耐熱玻璃保鮮盒 - 雙格800ml', N'/images/products/box_04.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (272, 148, 26, CAST(199 AS Decimal(18, 0)), 1, CAST(199 AS Decimal(18, 0)), CAST(199 AS Decimal(18, 0)), N'耐熱玻璃保鮮盒 - 單格600ml', N'/images/products/box_03.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (273, 149, 3, CAST(99 AS Decimal(18, 0)), 1, CAST(99 AS Decimal(18, 0)), CAST(99 AS Decimal(18, 0)), N'蒜香風味雞胸肉', N'/images/products/chicken_03.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (274, 150, 30, CAST(299 AS Decimal(18, 0)), 1, CAST(299 AS Decimal(18, 0)), CAST(299 AS Decimal(18, 0)), N'大容量運動雙層沙拉盒', N'/images/products/box_07.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (275, 151, 6, CAST(109 AS Decimal(18, 0)), 1, CAST(109 AS Decimal(18, 0)), CAST(109 AS Decimal(18, 0)), N'川味麻辣雞胸肉', N'/images/products/chicken_06.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (276, 152, 9, CAST(1200 AS Decimal(18, 0)), 1, CAST(1200 AS Decimal(18, 0)), CAST(1200 AS Decimal(18, 0)), N'濃縮乳清蛋白 - 醇厚巧克力', N'/images/products/protein_01.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (277, 153, 16, CAST(990 AS Decimal(18, 0)), 1, CAST(990 AS Decimal(18, 0)), CAST(990 AS Decimal(18, 0)), N'高蛋白能量代餐飲 - 香蕉', N'/images/products/protein_08.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (278, 154, 9, CAST(1200 AS Decimal(18, 0)), 1, CAST(1200 AS Decimal(18, 0)), CAST(1200 AS Decimal(18, 0)), N'濃縮乳清蛋白 - 醇厚巧克力', N'/images/products/protein_01.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (279, 155, 26, CAST(199 AS Decimal(18, 0)), 1, CAST(199 AS Decimal(18, 0)), CAST(199 AS Decimal(18, 0)), N'耐熱玻璃保鮮盒 - 單格600ml', N'/images/products/box_03.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (280, 156, 14, CAST(1100 AS Decimal(18, 0)), 1, CAST(1100 AS Decimal(18, 0)), CAST(1100 AS Decimal(18, 0)), N'純素大豆分離蛋白 - 抹茶', N'/images/products/protein_06.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (281, 157, 30, CAST(299 AS Decimal(18, 0)), 1, CAST(299 AS Decimal(18, 0)), CAST(299 AS Decimal(18, 0)), N'大容量運動雙層沙拉盒', N'/images/products/box_07.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (282, 158, 9, CAST(1200 AS Decimal(18, 0)), 1, CAST(1200 AS Decimal(18, 0)), CAST(1200 AS Decimal(18, 0)), N'濃縮乳清蛋白 - 醇厚巧克力', N'/images/products/protein_01.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (283, 159, 18, CAST(280 AS Decimal(18, 0)), 1, CAST(280 AS Decimal(18, 0)), CAST(280 AS Decimal(18, 0)), N'維生素C1000發泡錠', N'/images/products/vitamin_02.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (284, 160, 12, CAST(1450 AS Decimal(18, 0)), 1, CAST(1450 AS Decimal(18, 0)), CAST(1450 AS Decimal(18, 0)), N'分離乳清蛋白 - 英式奶茶', N'/images/products/protein_04.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (285, 161, 26, CAST(199 AS Decimal(18, 0)), 1, CAST(199 AS Decimal(18, 0)), CAST(199 AS Decimal(18, 0)), N'耐熱玻璃保鮮盒 - 單格600ml', N'/images/products/box_03.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (286, 162, 6, CAST(109 AS Decimal(18, 0)), 1, CAST(109 AS Decimal(18, 0)), CAST(109 AS Decimal(18, 0)), N'川味麻辣雞胸肉', N'/images/products/chicken_06.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (287, 163, 25, CAST(420 AS Decimal(18, 0)), 1, CAST(420 AS Decimal(18, 0)), CAST(420 AS Decimal(18, 0)), N'白金矽膠摺疊便當盒', N'/images/products/box_02.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (288, 164, 15, CAST(1150 AS Decimal(18, 0)), 1, CAST(1150 AS Decimal(18, 0)), CAST(1150 AS Decimal(18, 0)), N'綜合植物蛋白粉 - 芝麻', N'/images/products/protein_07.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (289, 165, 24, CAST(350 AS Decimal(18, 0)), 1, CAST(350 AS Decimal(18, 0)), CAST(350 AS Decimal(18, 0)), N'304不鏽鋼分隔便當盒', N'/images/products/box_01.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (290, 166, 5, CAST(109 AS Decimal(18, 0)), 1, CAST(109 AS Decimal(18, 0)), CAST(109 AS Decimal(18, 0)), N'印度咖哩雞胸肉', N'/images/products/chicken_05.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (291, 167, 28, CAST(499 AS Decimal(18, 0)), 1, CAST(499 AS Decimal(18, 0)), CAST(499 AS Decimal(18, 0)), N'日式質感木製便當盒', N'/images/products/box_05.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (292, 168, 2, CAST(99 AS Decimal(18, 0)), 1, CAST(99 AS Decimal(18, 0)), CAST(99 AS Decimal(18, 0)), N'黑胡椒海鹽雞胸肉', N'/images/products/chicken_02.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (293, 169, 3, CAST(99 AS Decimal(18, 0)), 1, CAST(99 AS Decimal(18, 0)), CAST(99 AS Decimal(18, 0)), N'蒜香風味雞胸肉', N'/images/products/chicken_03.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (294, 170, 9, CAST(1200 AS Decimal(18, 0)), 1, CAST(1200 AS Decimal(18, 0)), CAST(1200 AS Decimal(18, 0)), N'濃縮乳清蛋白 - 醇厚巧克力', N'/images/products/protein_01.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (295, 171, 18, CAST(280 AS Decimal(18, 0)), 1, CAST(280 AS Decimal(18, 0)), CAST(280 AS Decimal(18, 0)), N'維生素C1000發泡錠', N'/images/products/vitamin_02.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (296, 172, 6, CAST(109 AS Decimal(18, 0)), 1, CAST(109 AS Decimal(18, 0)), CAST(109 AS Decimal(18, 0)), N'川味麻辣雞胸肉', N'/images/products/chicken_06.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (297, 173, 9, CAST(1200 AS Decimal(18, 0)), 1, CAST(1200 AS Decimal(18, 0)), CAST(1200 AS Decimal(18, 0)), N'濃縮乳清蛋白 - 醇厚巧克力', N'/images/products/protein_01.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (298, 174, 26, CAST(199 AS Decimal(18, 0)), 1, CAST(199 AS Decimal(18, 0)), CAST(199 AS Decimal(18, 0)), N'耐熱玻璃保鮮盒 - 單格600ml', N'/images/products/box_03.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (299, 175, 23, CAST(720 AS Decimal(18, 0)), 1, CAST(720 AS Decimal(18, 0)), CAST(720 AS Decimal(18, 0)), N'海藻鈣+鎂+D3', N'/images/products/vitamin_07.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (300, 176, 24, CAST(350 AS Decimal(18, 0)), 1, CAST(350 AS Decimal(18, 0)), CAST(350 AS Decimal(18, 0)), N'304不鏽鋼分隔便當盒', N'/images/products/box_01.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (301, 177, 20, CAST(650 AS Decimal(18, 0)), 1, CAST(650 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), N'綜合礦物質複方錠', N'/images/products/vitamin_04.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (302, 178, 5, CAST(109 AS Decimal(18, 0)), 1, CAST(109 AS Decimal(18, 0)), CAST(109 AS Decimal(18, 0)), N'印度咖哩雞胸肉', N'/images/products/chicken_05.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (303, 179, 11, CAST(1450 AS Decimal(18, 0)), 1, CAST(1450 AS Decimal(18, 0)), CAST(1450 AS Decimal(18, 0)), N'分離乳清蛋白 - 鮮採草莓', N'/images/products/protein_03.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (304, 180, 7, CAST(119 AS Decimal(18, 0)), 1, CAST(119 AS Decimal(18, 0)), CAST(119 AS Decimal(18, 0)), N'義式香草雞胸肉', N'/images/products/chicken_07.jpg', NULL)
GO
INSERT [dbo].[ProductOrderDetails] ([Id], [ProductOrderId], [ProductId], [UnitPrice], [Qty], [SubTotal], [DiscountedPrice], [ProductName], [ImageURL], [Memo]) VALUES (305, 181, 8, CAST(119 AS Decimal(18, 0)), 1, CAST(119 AS Decimal(18, 0)), CAST(119 AS Decimal(18, 0)), N'迷迭香烤雞胸肉', N'/images/products/chicken_08.jpg', NULL)
GO
SET IDENTITY_INSERT [dbo].[ProductOrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductOrders] ON 
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (1, 1, CAST(N'2026-03-07T20:14:45.0000000' AS DateTime2), CAST(1943 AS Decimal(18, 0)), CAST(200 AS Decimal(18, 0)), N'張怡君', N'新竹市成功路237號', N'0912345678', NULL, 0, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (2, 2, CAST(N'2026-03-14T18:23:20.0000000' AS DateTime2), CAST(1447 AS Decimal(18, 0)), CAST(200 AS Decimal(18, 0)), N'吳詠晴', N'桃園市民生路297號', N'0987654321', NULL, 0, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (72, 65, CAST(N'2026-03-14T23:48:58.0000000' AS DateTime2), CAST(1428 AS Decimal(18, 0)), CAST(50 AS Decimal(18, 0)), N'吳昱廷', N'台中市民生路245號', N'0912345678', NULL, 1, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (73, 9, CAST(N'2026-03-05T21:09:12.0000000' AS DateTime2), CAST(327 AS Decimal(18, 0)), CAST(50 AS Decimal(18, 0)), N'吳美玲', N'新竹市延平路223號', N'0912345678', NULL, 4, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (74, 18, CAST(N'2026-03-08T13:25:01.0000000' AS DateTime2), CAST(1309 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'鄭詠晴', N'新北市民族路289號', N'0912345678', NULL, 3, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (75, 40, CAST(N'2026-03-16T17:06:33.0000000' AS DateTime2), CAST(4254 AS Decimal(18, 0)), CAST(100 AS Decimal(18, 0)), N'楊雅婷', N'桃園市民生路82號', N'0912345678', NULL, 5, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (76, 6, CAST(N'2026-03-14T21:09:16.0000000' AS DateTime2), CAST(1527 AS Decimal(18, 0)), CAST(50 AS Decimal(18, 0)), N'張佩璇', N'新竹市中山路198號', N'0912345678', NULL, 2, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (77, 1, CAST(N'2026-03-12T04:22:02.0000000' AS DateTime2), CAST(1933 AS Decimal(18, 0)), CAST(50 AS Decimal(18, 0)), N'吳大明', N'台中市成功路81號', N'0912345678', NULL, 4, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (78, 59, CAST(N'2026-03-08T12:18:53.0000000' AS DateTime2), CAST(1309 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'李昱廷', N'高雄市文心路103號', N'0912345678', NULL, 2, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (79, 11, CAST(N'2026-03-04T16:45:31.0000000' AS DateTime2), CAST(99 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'黃慧君', N'新竹市復興路121號', N'0912345678', NULL, 3, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (80, 23, CAST(N'2026-03-11T19:31:33.0000000' AS DateTime2), CAST(664 AS Decimal(18, 0)), CAST(50 AS Decimal(18, 0)), N'鄭美玲', N'高雄市民生路61號', N'0912345678', NULL, 1, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (82, 61, CAST(N'2026-03-14T08:06:31.0000000' AS DateTime2), CAST(109 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'宋冠宇', N'新北市中正路57號', N'0912345678', NULL, 3, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (83, 18, CAST(N'2026-03-04T10:32:05.0000000' AS DateTime2), CAST(1200 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'林志豪', N'新北市中正路102號', N'0912345678', NULL, 0, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (84, 18, CAST(N'2026-03-15T05:31:09.0000000' AS DateTime2), CAST(299 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'鄭欣怡', N'新竹市復興路255號', N'0912345678', NULL, 4, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (85, 99, CAST(N'2026-03-04T19:17:59.0000000' AS DateTime2), CAST(1450 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'鄭大明', N'台北市復興路268號', N'0912345678', NULL, 1, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (86, 80, CAST(N'2026-03-08T10:41:00.0000000' AS DateTime2), CAST(450 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'周慧君', N'台中市成功路224號', N'0912345678', NULL, 1, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (87, 79, CAST(N'2026-03-13T12:58:04.0000000' AS DateTime2), CAST(99 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'周冠宇', N'台中市文心路99號', N'0912345678', NULL, 3, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (88, 98, CAST(N'2026-03-05T05:50:07.0000000' AS DateTime2), CAST(109 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'趙欣怡', N'台南市成功路96號', N'0912345678', NULL, 2, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (89, 75, CAST(N'2026-03-08T17:07:03.0000000' AS DateTime2), CAST(99 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'王承翰', N'台中市復興路142號', N'0912345678', NULL, 1, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (90, 76, CAST(N'2026-03-11T15:18:21.0000000' AS DateTime2), CAST(119 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'周雅婷', N'台中市延平路65號', N'0912345678', NULL, 4, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (91, 47, CAST(N'2026-03-04T08:37:55.0000000' AS DateTime2), CAST(1450 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'黃怡君', N'台北市民生路202號', N'0912345678', NULL, 1, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (92, 83, CAST(N'2026-03-09T04:55:26.0000000' AS DateTime2), CAST(99 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'羅建宏', N'台北市復興路62號', N'0912345678', NULL, 0, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (93, 57, CAST(N'2026-03-06T02:50:38.0000000' AS DateTime2), CAST(250 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'王欣怡', N'高雄市復興路148號', N'0912345678', NULL, 5, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (94, 80, CAST(N'2026-03-10T22:26:21.0000000' AS DateTime2), CAST(119 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'黃冠宇', N'桃園市民生路183號', N'0912345678', NULL, 3, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (95, 38, CAST(N'2026-03-16T11:33:27.0000000' AS DateTime2), CAST(280 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'李冠宇', N'桃園市民族路239號', N'0912345678', NULL, 1, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (96, 56, CAST(N'2026-03-12T19:51:29.0000000' AS DateTime2), CAST(650 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'吳慧君', N'高雄市中山路4號', N'0912345678', NULL, 1, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (97, 2, CAST(N'2026-03-07T03:04:28.0000000' AS DateTime2), CAST(1450 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'羅慧君', N'台南市民生路26號', N'0912345678', NULL, 0, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (98, 40, CAST(N'2026-03-09T09:59:01.0000000' AS DateTime2), CAST(109 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'周怡君', N'新竹市民族路183號', N'0912345678', NULL, 3, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (99, 86, CAST(N'2026-03-15T11:06:41.0000000' AS DateTime2), CAST(99 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'趙慧君', N'台南市民權路107號', N'0912345678', NULL, 0, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (100, 86, CAST(N'2026-03-10T22:09:19.0000000' AS DateTime2), CAST(109 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'羅志豪', N'新竹市民權路102號', N'0912345678', NULL, 2, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (101, 54, CAST(N'2026-03-10T08:27:13.0000000' AS DateTime2), CAST(1200 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'王昱廷', N'新竹市民族路218號', N'0912345678', NULL, 1, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (102, 13, CAST(N'2026-03-04T20:15:01.0000000' AS DateTime2), CAST(650 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'羅詠晴', N'台北市民權路278號', N'0912345678', NULL, 5, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (103, 62, CAST(N'2026-03-15T06:29:47.0000000' AS DateTime2), CAST(109 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'李志豪', N'高雄市復興路107號', N'0912345678', NULL, 0, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (104, 100, CAST(N'2026-03-07T02:37:04.0000000' AS DateTime2), CAST(499 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'林怡君', N'新竹市中山路191號', N'0912345678', NULL, 4, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (105, 90, CAST(N'2026-03-08T22:03:16.0000000' AS DateTime2), CAST(499 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'吳淑惠', N'新北市民生路142號', N'0912345678', NULL, 4, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (106, 72, CAST(N'2026-03-06T12:26:33.0000000' AS DateTime2), CAST(199 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'李佩璇', N'新竹市民權路212號', N'0912345678', NULL, 0, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (107, 70, CAST(N'2026-03-14T05:42:39.0000000' AS DateTime2), CAST(650 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'黃佩璇', N'台中市復興路83號', N'0912345678', NULL, 4, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (108, 33, CAST(N'2026-03-07T23:09:39.0000000' AS DateTime2), CAST(1300 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'張慧君', N'新竹市中山路265號', N'0912345678', NULL, 5, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (109, 106, CAST(N'2026-03-13T17:22:59.0000000' AS DateTime2), CAST(720 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'陳雅婷', N'台北市中山路290號', N'0912345678', NULL, 2, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (110, 3, CAST(N'2026-03-09T09:43:59.0000000' AS DateTime2), CAST(1200 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'周佩璇', N'台北市中山路12號', N'0912345678', NULL, 5, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (111, 49, CAST(N'2026-03-10T22:00:29.0000000' AS DateTime2), CAST(420 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'吳昱廷', N'台北市文心路116號', N'0912345678', NULL, 1, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (112, 58, CAST(N'2026-03-11T03:14:25.0000000' AS DateTime2), CAST(109 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'梁怡君', N'台南市文心路165號', N'0912345678', NULL, 2, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (113, 74, CAST(N'2026-03-09T22:34:36.0000000' AS DateTime2), CAST(450 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'王怡君', N'台中市民族路174號', N'0912345678', NULL, 3, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (114, 79, CAST(N'2026-03-04T14:23:10.0000000' AS DateTime2), CAST(1150 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'梁怡君', N'新北市文心路122號', N'0912345678', NULL, 2, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (115, 51, CAST(N'2026-03-07T19:06:15.0000000' AS DateTime2), CAST(990 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'王怡君', N'桃園市民生路278號', N'0912345678', NULL, 5, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (116, 6, CAST(N'2026-03-06T18:01:44.0000000' AS DateTime2), CAST(1150 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'周淑惠', N'新北市中正路23號', N'0912345678', NULL, 4, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (117, 98, CAST(N'2026-03-15T12:29:18.0000000' AS DateTime2), CAST(1450 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'羅佩璇', N'台南市民族路164號', N'0912345678', NULL, 5, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (118, 83, CAST(N'2026-03-10T06:41:36.0000000' AS DateTime2), CAST(109 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'宋冠宇', N'高雄市中正路256號', N'0912345678', NULL, 2, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (119, 9, CAST(N'2026-03-09T03:52:27.0000000' AS DateTime2), CAST(109 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'周淑惠', N'新北市民生路159號', N'0912345678', NULL, 1, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (120, 76, CAST(N'2026-03-06T17:29:16.0000000' AS DateTime2), CAST(1200 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'吳冠宇', N'新竹市民生路186號', N'0912345678', NULL, 2, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (121, 44, CAST(N'2026-03-16T06:17:01.0000000' AS DateTime2), CAST(109 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'宋大明', N'台南市民族路286號', N'0912345678', NULL, 2, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (122, 17, CAST(N'2026-03-09T10:13:16.0000000' AS DateTime2), CAST(350 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'王美玲', N'台北市成功路136號', N'0912345678', NULL, 4, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (123, 91, CAST(N'2026-03-07T00:34:57.0000000' AS DateTime2), CAST(99 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'宋慧君', N'新竹市中正路182號', N'0912345678', NULL, 3, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (124, 95, CAST(N'2026-03-16T13:34:59.0000000' AS DateTime2), CAST(720 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'鄭志豪', N'新北市延平路190號', N'0912345678', NULL, 1, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (125, 29, CAST(N'2026-03-11T02:14:13.0000000' AS DateTime2), CAST(299 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'楊詠晴', N'台南市延平路234號', N'0912345678', NULL, 0, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (126, 23, CAST(N'2026-03-11T18:05:35.0000000' AS DateTime2), CAST(109 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'羅怡君', N'新北市復興路66號', N'0912345678', NULL, 3, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (127, 48, CAST(N'2026-03-05T11:21:23.0000000' AS DateTime2), CAST(1200 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'周美玲', N'台南市文心路8號', N'0912345678', NULL, 5, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (128, 15, CAST(N'2026-03-05T11:55:43.0000000' AS DateTime2), CAST(990 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'梁雅婷', N'台北市民生路229號', N'0912345678', NULL, 3, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (129, 12, CAST(N'2026-03-10T00:48:21.0000000' AS DateTime2), CAST(299 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'周淑惠', N'桃園市民生路223號', N'0912345678', NULL, 4, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (130, 68, CAST(N'2026-03-09T01:51:10.0000000' AS DateTime2), CAST(350 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'張志偉', N'桃園市中山路257號', N'0912345678', NULL, 2, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (131, 103, CAST(N'2026-03-04T03:07:58.0000000' AS DateTime2), CAST(1200 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'李昱廷', N'台中市民權路70號', N'0912345678', NULL, 1, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (132, 67, CAST(N'2026-03-04T12:07:05.0000000' AS DateTime2), CAST(350 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'張美玲', N'台南市民權路38號', N'0912345678', NULL, 4, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (133, 49, CAST(N'2026-03-09T10:23:15.0000000' AS DateTime2), CAST(450 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'楊志偉', N'高雄市民族路269號', N'0912345678', NULL, 4, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (134, 103, CAST(N'2026-03-15T11:15:35.0000000' AS DateTime2), CAST(199 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'鄭淑惠', N'桃園市民權路279號', N'0912345678', NULL, 5, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (135, 57, CAST(N'2026-03-15T07:39:06.0000000' AS DateTime2), CAST(990 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'李志偉', N'台南市中正路188號', N'0912345678', NULL, 0, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (136, 88, CAST(N'2026-03-13T17:36:11.0000000' AS DateTime2), CAST(1200 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'林欣怡', N'高雄市文心路197號', N'0912345678', NULL, 3, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (137, 7, CAST(N'2026-03-09T01:57:12.0000000' AS DateTime2), CAST(420 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'陳怡君', N'新北市文心路293號', N'0912345678', NULL, 5, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (138, 75, CAST(N'2026-03-15T14:47:08.0000000' AS DateTime2), CAST(119 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'李雅婷', N'桃園市中正路209號', N'0912345678', NULL, 4, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (139, 73, CAST(N'2026-03-11T21:56:38.0000000' AS DateTime2), CAST(499 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'周佩璇', N'高雄市文心路246號', N'0912345678', NULL, 0, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (140, 34, CAST(N'2026-03-14T14:47:47.0000000' AS DateTime2), CAST(99 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'張大明', N'新竹市延平路231號', N'0912345678', NULL, 4, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (141, 106, CAST(N'2026-03-09T04:37:10.0000000' AS DateTime2), CAST(1200 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'楊怡君', N'台中市成功路48號', N'0912345678', NULL, 4, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (142, 48, CAST(N'2026-03-04T00:53:01.0000000' AS DateTime2), CAST(1200 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'陳淑惠', N'台北市民權路57號', N'0912345678', NULL, 4, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (143, 88, CAST(N'2026-03-14T15:43:38.0000000' AS DateTime2), CAST(650 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'陳承翰', N'新北市文心路251號', N'0912345678', NULL, 5, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (144, 99, CAST(N'2026-03-08T19:04:06.0000000' AS DateTime2), CAST(990 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'鄭美玲', N'新北市民權路261號', N'0912345678', NULL, 2, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (145, 96, CAST(N'2026-03-06T06:56:10.0000000' AS DateTime2), CAST(1100 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'羅美玲', N'新竹市中正路63號', N'0912345678', NULL, 3, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (146, 35, CAST(N'2026-03-05T09:13:07.0000000' AS DateTime2), CAST(299 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'羅欣怡', N'高雄市民生路116號', N'0912345678', NULL, 2, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (147, 12, CAST(N'2026-03-04T03:25:04.0000000' AS DateTime2), CAST(250 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'吳志偉', N'桃園市延平路205號', N'0912345678', NULL, 5, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (148, 23, CAST(N'2026-03-08T07:33:03.0000000' AS DateTime2), CAST(199 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'楊大明', N'台北市成功路268號', N'0912345678', NULL, 3, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (149, 98, CAST(N'2026-03-06T21:24:01.0000000' AS DateTime2), CAST(99 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'陳志偉', N'台南市民權路213號', N'0912345678', NULL, 2, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (150, 10, CAST(N'2026-03-13T08:08:06.0000000' AS DateTime2), CAST(299 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'吳淑惠', N'桃園市復興路135號', N'0912345678', NULL, 0, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (151, 67, CAST(N'2026-03-04T03:45:52.0000000' AS DateTime2), CAST(109 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'張冠宇', N'高雄市中山路234號', N'0912345678', NULL, 2, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (152, 28, CAST(N'2026-03-13T10:19:03.0000000' AS DateTime2), CAST(1200 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'林佩璇', N'高雄市中山路149號', N'0912345678', NULL, 0, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (153, 90, CAST(N'2026-03-10T23:05:41.0000000' AS DateTime2), CAST(990 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'梁欣怡', N'新北市成功路208號', N'0912345678', NULL, 1, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (154, 80, CAST(N'2026-03-15T19:36:05.0000000' AS DateTime2), CAST(1200 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'陳欣怡', N'台北市中正路190號', N'0912345678', NULL, 0, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (155, 54, CAST(N'2026-03-13T02:03:22.0000000' AS DateTime2), CAST(199 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'李大明', N'高雄市中山路201號', N'0912345678', NULL, 4, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (156, 106, CAST(N'2026-03-10T08:39:01.0000000' AS DateTime2), CAST(1100 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'黃佩璇', N'新北市民權路76號', N'0912345678', NULL, 1, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (157, 87, CAST(N'2026-03-14T12:43:55.0000000' AS DateTime2), CAST(299 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'宋慧君', N'台南市復興路150號', N'0912345678', NULL, 0, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (158, 67, CAST(N'2026-03-07T07:02:53.0000000' AS DateTime2), CAST(1200 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'趙冠宇', N'台北市復興路281號', N'0912345678', NULL, 3, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (159, 39, CAST(N'2026-03-06T17:45:46.0000000' AS DateTime2), CAST(280 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'周冠宇', N'新北市中山路71號', N'0912345678', NULL, 0, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (160, 98, CAST(N'2026-03-12T08:22:55.0000000' AS DateTime2), CAST(1450 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'梁慧君', N'新北市民權路38號', N'0912345678', NULL, 3, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (161, 12, CAST(N'2026-03-10T07:50:19.0000000' AS DateTime2), CAST(199 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'林慧君', N'桃園市成功路297號', N'0912345678', NULL, 0, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (162, 34, CAST(N'2026-03-07T08:46:19.0000000' AS DateTime2), CAST(109 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'王怡君', N'台南市成功路190號', N'0912345678', NULL, 5, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (163, 34, CAST(N'2026-03-13T08:20:47.0000000' AS DateTime2), CAST(420 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'李志偉', N'台中市文心路255號', N'0912345678', NULL, 0, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (164, 87, CAST(N'2026-03-11T08:47:45.0000000' AS DateTime2), CAST(1150 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'林冠宇', N'台中市延平路58號', N'0912345678', NULL, 0, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (165, 102, CAST(N'2026-03-14T21:47:14.0000000' AS DateTime2), CAST(350 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'周志豪', N'台南市文心路232號', N'0912345678', NULL, 4, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (166, 51, CAST(N'2026-03-10T03:10:44.0000000' AS DateTime2), CAST(109 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'劉慧君', N'台中市成功路96號', N'0912345678', NULL, 1, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (167, 35, CAST(N'2026-03-09T18:23:05.0000000' AS DateTime2), CAST(499 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'梁大明', N'台北市成功路93號', N'0912345678', NULL, 3, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (168, 61, CAST(N'2026-03-10T00:43:52.0000000' AS DateTime2), CAST(99 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'周詠晴', N'新北市民族路235號', N'0912345678', NULL, 3, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (169, 13, CAST(N'2026-03-15T04:36:58.0000000' AS DateTime2), CAST(99 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'林怡君', N'台南市民族路63號', N'0912345678', NULL, 5, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (170, 29, CAST(N'2026-03-10T06:52:27.0000000' AS DateTime2), CAST(1200 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'李志豪', N'台中市復興路94號', N'0912345678', NULL, 5, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (171, 86, CAST(N'2026-03-12T05:29:10.0000000' AS DateTime2), CAST(280 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'張慧君', N'新竹市民族路192號', N'0912345678', NULL, 3, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (172, 64, CAST(N'2026-03-10T12:05:50.0000000' AS DateTime2), CAST(109 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'周美玲', N'桃園市成功路140號', N'0912345678', NULL, 0, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (173, 92, CAST(N'2026-03-09T15:21:38.0000000' AS DateTime2), CAST(1200 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'吳昱廷', N'新竹市成功路22號', N'0912345678', NULL, 3, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (174, 53, CAST(N'2026-03-15T21:39:54.0000000' AS DateTime2), CAST(199 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'吳詠晴', N'台北市中山路63號', N'0912345678', NULL, 1, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (175, 54, CAST(N'2026-03-07T07:27:34.0000000' AS DateTime2), CAST(720 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'周承翰', N'台中市復興路251號', N'0912345678', NULL, 0, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (176, 99, CAST(N'2026-03-15T10:07:04.0000000' AS DateTime2), CAST(350 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'陳大明', N'台中市民族路4號', N'0912345678', NULL, 3, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (177, 52, CAST(N'2026-03-09T11:15:33.0000000' AS DateTime2), CAST(650 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'梁詠晴', N'台北市民生路178號', N'0912345678', NULL, 0, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (178, 43, CAST(N'2026-03-11T05:06:01.0000000' AS DateTime2), CAST(109 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'陳怡君', N'台中市成功路12號', N'0912345678', NULL, 4, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (179, 64, CAST(N'2026-03-08T18:42:19.0000000' AS DateTime2), CAST(1450 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'鄭怡君', N'台中市延平路146號', N'0912345678', NULL, 0, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (180, 72, CAST(N'2026-03-06T12:58:30.0000000' AS DateTime2), CAST(119 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'張慧君', N'新北市延平路299號', N'0912345678', NULL, 3, NULL)
GO
INSERT [dbo].[ProductOrders] ([Id], [MemberId], [CreateAt], [OriginalAmount], [DiscountAmount], [Receiver], [Address], [Mobile], [TaxNumber], [Status], [Memo]) VALUES (181, 8, CAST(N'2026-03-05T11:20:17.0000000' AS DateTime2), CAST(119 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'梁雅婷', N'台北市文心路243號', N'0912345678', NULL, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[ProductOrders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (1, 1, N'經典原味舒肥雞胸肉', N'/images/products/chicken_01.jpg', CAST(120 AS Decimal(18, 0)), CAST(99 AS Decimal(18, 0)), N'鮮嫩多汁，低脂高蛋白，無過多調味', 1, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (2, 1, N'黑胡椒海鹽雞胸肉', N'/images/products/chicken_02.jpg', CAST(120 AS Decimal(18, 0)), CAST(99 AS Decimal(18, 0)), N'使用天然海鹽與粗粒黑胡椒，經典百搭', 2, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (3, 1, N'蒜香風味雞胸肉', N'/images/products/chicken_03.jpg', CAST(120 AS Decimal(18, 0)), CAST(99 AS Decimal(18, 0)), N'濃郁蒜香，健身後補充的最佳首選', 3, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (4, 1, N'泰式檸檬雞胸肉', N'/images/products/chicken_04.jpg', CAST(130 AS Decimal(18, 0)), CAST(109 AS Decimal(18, 0)), N'微酸微辣，清爽解膩的泰式風味', 4, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (5, 1, N'印度咖哩雞胸肉', N'/images/products/chicken_05.jpg', CAST(130 AS Decimal(18, 0)), CAST(109 AS Decimal(18, 0)), N'濃郁咖哩香氣，異國風味口感豐富', 5, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (6, 1, N'川味麻辣雞胸肉', N'/images/products/chicken_06.jpg', CAST(130 AS Decimal(18, 0)), CAST(109 AS Decimal(18, 0)), N'嗜辣者必備，刺激味蕾好下飯', 6, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (7, 1, N'義式香草雞胸肉', N'/images/products/chicken_07.jpg', CAST(140 AS Decimal(18, 0)), CAST(119 AS Decimal(18, 0)), N'特選義式綜合香料醃製，香氣四溢', 7, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (8, 1, N'迷迭香烤雞胸肉', N'/images/products/chicken_08.jpg', CAST(140 AS Decimal(18, 0)), CAST(119 AS Decimal(18, 0)), N'高級餐廳等級口感，在家也能輕鬆享受', 8, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (9, 2, N'濃縮乳清蛋白 - 醇厚巧克力', N'/images/products/protein_01.jpg', CAST(1500 AS Decimal(18, 0)), CAST(1200 AS Decimal(18, 0)), N'每份含25g蛋白質，濃郁可可風味', 1, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (10, 2, N'濃縮乳清蛋白 - 經典香草', N'/images/products/protein_02.jpg', CAST(1500 AS Decimal(18, 0)), CAST(1200 AS Decimal(18, 0)), N'百搭香草風味，適合搭配牛奶或燕麥', 2, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (11, 2, N'分離乳清蛋白 - 鮮採草莓', N'/images/products/protein_03.jpg', CAST(1800 AS Decimal(18, 0)), CAST(1450 AS Decimal(18, 0)), N'乳糖不耐症適用，酸甜草莓口感', 3, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (12, 2, N'分離乳清蛋白 - 英式奶茶', N'/images/products/protein_04.jpg', CAST(1800 AS Decimal(18, 0)), CAST(1450 AS Decimal(18, 0)), N'超人氣奶茶口味，享受喝手搖飲的快感', 4, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (13, 2, N'緩釋型酪蛋白 - 原味', N'/images/products/protein_05.jpg', CAST(1600 AS Decimal(18, 0)), CAST(1300 AS Decimal(18, 0)), N'緩慢釋放胺基酸，睡前補充最佳選擇', 5, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (14, 2, N'純素大豆分離蛋白 - 抹茶', N'/images/products/protein_06.jpg', CAST(1400 AS Decimal(18, 0)), CAST(1100 AS Decimal(18, 0)), N'素食者健身必備，日式靜岡抹茶風味', 6, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (15, 2, N'綜合植物蛋白粉 - 芝麻', N'/images/products/protein_07.jpg', CAST(1450 AS Decimal(18, 0)), CAST(1150 AS Decimal(18, 0)), N'富含多種植物性胺基酸，濃郁芝麻香', 7, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (16, 2, N'高蛋白能量代餐飲 - 香蕉', N'/images/products/protein_08.jpg', CAST(1200 AS Decimal(18, 0)), CAST(990 AS Decimal(18, 0)), N'富含飽足感，減脂期代餐好幫手', 8, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (17, 3, N'高單位活力B群', N'/images/products/vitamin_01.jpg', CAST(600 AS Decimal(18, 0)), CAST(450 AS Decimal(18, 0)), N'增強體力，精神旺盛，運動後恢復必備', 1, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (18, 3, N'維生素C1000發泡錠', N'/images/products/vitamin_02.jpg', CAST(350 AS Decimal(18, 0)), CAST(280 AS Decimal(18, 0)), N'酸甜好喝，日常保養與促進膠原蛋白形成', 2, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (19, 3, N'陽光維生素D3軟膠囊', N'/images/products/vitamin_03.jpg', CAST(500 AS Decimal(18, 0)), CAST(390 AS Decimal(18, 0)), N'室內族必備，促進鈣質吸收', 3, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (20, 3, N'綜合礦物質複方錠', N'/images/products/vitamin_04.jpg', CAST(800 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), N'一次補充多種流汗流失的必需礦物質', 4, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (21, 3, N'高濃度深海魚油 Omega-3', N'/images/products/vitamin_05.jpg', CAST(1200 AS Decimal(18, 0)), CAST(890 AS Decimal(18, 0)), N'晶亮護明，循環順暢，維持健康', 5, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (22, 3, N'胺基酸螯合鋅錠', N'/images/products/vitamin_06.jpg', CAST(550 AS Decimal(18, 0)), CAST(420 AS Decimal(18, 0)), N'高吸收率，維持生長發育與生殖機能', 6, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (23, 3, N'海藻鈣+鎂+D3', N'/images/products/vitamin_07.jpg', CAST(900 AS Decimal(18, 0)), CAST(720 AS Decimal(18, 0)), N'完美吸收比例，維持骨骼與牙齒健康', 7, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (24, 4, N'304不鏽鋼分隔便當盒', N'/images/products/box_01.jpg', CAST(450 AS Decimal(18, 0)), CAST(350 AS Decimal(18, 0)), N'耐用好洗，不殘留異味，環保首選', 1, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (25, 4, N'白金矽膠摺疊便當盒', N'/images/products/box_02.jpg', CAST(550 AS Decimal(18, 0)), CAST(420 AS Decimal(18, 0)), N'可摺疊收納節省空間，外出攜帶超方便', 2, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (26, 4, N'耐熱玻璃保鮮盒 - 單格600ml', N'/images/products/box_03.jpg', CAST(300 AS Decimal(18, 0)), CAST(199 AS Decimal(18, 0)), N'微波、烤箱、電鍋皆適用，安全無毒', 3, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (27, 4, N'耐熱玻璃保鮮盒 - 雙格800ml', N'/images/products/box_04.jpg', CAST(380 AS Decimal(18, 0)), CAST(250 AS Decimal(18, 0)), N'飯菜分離不串味，備餐最佳容器', 4, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (28, 4, N'日式質感木製便當盒', N'/images/products/box_05.jpg', CAST(650 AS Decimal(18, 0)), CAST(499 AS Decimal(18, 0)), N'文青風格，適合冷食與輕食沙拉專用', 5, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (29, 4, N'微波專用加熱分隔餐盒', N'/images/products/box_06.jpg', CAST(250 AS Decimal(18, 0)), CAST(150 AS Decimal(18, 0)), N'食品級PP材質，附透氣孔方便微波', 6, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (30, 4, N'大容量運動雙層沙拉盒', N'/images/products/box_07.jpg', CAST(400 AS Decimal(18, 0)), CAST(299 AS Decimal(18, 0)), N'附獨立沙拉醬料盒與環保叉匙', 7, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (31, 1, N'經典原味舒肥雞胸肉', N'/images/products/a5280659-028a-49a8-9992-594e20de8639_800x.webp', CAST(160 AS Decimal(18, 0)), CAST(150 AS Decimal(18, 0)), N'', 31, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (37, 7, N'低脂雙拼雙份烤雞腿便當', N'/images/products/bento_01.jpg', CAST(180 AS Decimal(18, 0)), CAST(150 AS Decimal(18, 0)), N'嚴選去骨雞腿肉，搭配時令水煮蔬菜，健康無負擔!!!', 1, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (38, 7, N'日式鹽烤鯖魚健康餐', N'/images/products/bento_02.jpg', CAST(190 AS Decimal(18, 0)), CAST(160 AS Decimal(18, 0)), N'富含Omega-3，搭配紫米飯與和風配菜，營養滿分', 2, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (39, 7, N'蒜香低脂牛腱輕食盒', N'/images/products/bento_03.jpg', CAST(220 AS Decimal(18, 0)), CAST(180 AS Decimal(18, 0)), N'慢火滷製特選牛腱，肉質Q彈，高蛋白增肌首選', 3, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (40, 7, N'舒肥嫩雞胸藜麥沙拉', N'/images/products/bento_04.jpg', CAST(160 AS Decimal(18, 0)), CAST(139 AS Decimal(18, 0)), N'低GI超級食物紅藜麥，結合大量鮮脆生菜與低溫舒肥雞胸', 4, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (41, 7, N'田園鮮蔬豆腐鮮菇餐', N'/images/products/bento_05.jpg', CAST(150 AS Decimal(18, 0)), CAST(120 AS Decimal(18, 0)), N'純素可食，多種菇類與非基改豆腐，植物性蛋白好吸收', 5, 1)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [ImageUrl], [OriginalPrice], [UnitPrice], [Description], [SortOrder], [IsActive]) VALUES (1035, 1, N'舒肥土雞胸', N'/images/products/7782e7aa-bbb1-44d3-b50e-fcc303ee1e94_舒肥土雞胸_demo.jpg', CAST(200 AS Decimal(18, 0)), CAST(180 AS Decimal(18, 0)), N'', 0, 1)
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ReserveOrders] ON 
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (4, 2, 1, CAST(N'2026-03-05T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', N'體重管理與外食挑選建議', NULL, CAST(1200.00 AS Decimal(10, 2)), N'建議減少精緻澱粉，多攝取蔬菜')
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (5, 91, 2, CAST(N'2026-02-26T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (6, 83, 3, CAST(N'2026-02-27T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (7, 67, 4, CAST(N'2026-03-04T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (8, 82, 5, CAST(N'2026-02-22T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (9, 85, 7, CAST(N'2026-02-25T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (10, 65, 8, CAST(N'2026-03-06T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (11, 35, 9, CAST(N'2026-03-03T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (12, 76, 10, CAST(N'2026-03-02T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (13, 68, 11, CAST(N'2025-12-11T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (14, 17, 12, CAST(N'2025-11-28T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (15, 57, 13, CAST(N'2025-12-31T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (16, 2, 15, CAST(N'2026-03-14T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (17, 99, 76, CAST(N'2025-10-08T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (18, 15, 77, CAST(N'2025-12-07T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (19, 99, 78, CAST(N'2025-10-27T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (20, 74, 79, CAST(N'2025-10-02T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (21, 19, 80, CAST(N'2026-03-07T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (22, 28, 81, CAST(N'2026-02-13T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (23, 62, 82, CAST(N'2025-12-26T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (24, 27, 83, CAST(N'2026-02-26T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (25, 90, 84, CAST(N'2026-01-11T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (26, 62, 85, CAST(N'2025-12-06T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (27, 23, 86, CAST(N'2025-12-06T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (28, 30, 87, CAST(N'2026-01-15T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (29, 14, 88, CAST(N'2025-09-15T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (30, 59, 89, CAST(N'2026-02-09T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (31, 95, 90, CAST(N'2025-12-03T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (32, 104, 91, CAST(N'2025-11-06T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (33, 27, 92, CAST(N'2025-12-22T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (34, 67, 93, CAST(N'2025-11-28T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (35, 71, 94, CAST(N'2025-12-02T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (37, 81, 95, CAST(N'2026-02-23T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (38, 38, 96, CAST(N'2026-03-01T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (39, 53, 97, CAST(N'2026-02-06T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (40, 102, 98, CAST(N'2026-01-15T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (41, 52, 99, CAST(N'2026-03-02T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (42, 91, 100, CAST(N'2025-09-23T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (43, 47, 101, CAST(N'2026-01-14T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (44, 4, 102, CAST(N'2026-02-21T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (45, 54, 103, CAST(N'2025-11-19T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (46, 13, 104, CAST(N'2025-10-28T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (47, 5, 105, CAST(N'2026-02-03T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (48, 9, 107, CAST(N'2025-12-25T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (49, 42, 108, CAST(N'2026-02-25T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (50, 86, 109, CAST(N'2025-10-14T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (51, 57, 110, CAST(N'2026-01-26T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (52, 58, 111, CAST(N'2025-12-07T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (53, 46, 112, CAST(N'2026-02-18T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (54, 10, 113, CAST(N'2025-12-03T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (55, 23, 114, CAST(N'2025-10-15T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (56, 22, 115, CAST(N'2025-11-26T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (57, 86, 116, CAST(N'2025-12-31T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (58, 42, 117, CAST(N'2025-12-26T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (59, 82, 118, CAST(N'2026-01-09T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (60, 76, 119, CAST(N'2026-02-08T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (61, 82, 120, CAST(N'2025-09-15T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (62, 47, 121, CAST(N'2026-02-07T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (63, 57, 122, CAST(N'2026-02-28T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (64, 75, 123, CAST(N'2025-12-11T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (65, 65, 124, CAST(N'2025-10-15T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (66, 11, 125, CAST(N'2025-11-10T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (67, 54, 126, CAST(N'2026-01-20T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (68, 87, 127, CAST(N'2026-01-01T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (69, 50, 128, CAST(N'2025-10-12T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (70, 16, 129, CAST(N'2025-10-21T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (71, 88, 130, CAST(N'2025-09-07T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (72, 92, 131, CAST(N'2025-10-25T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (73, 104, 132, CAST(N'2025-09-29T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (74, 53, 133, CAST(N'2025-10-04T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (75, 103, 134, CAST(N'2026-02-04T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (76, 6, 135, CAST(N'2026-01-13T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (77, 40, 136, CAST(N'2025-10-28T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (78, 3, 137, CAST(N'2025-10-04T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (79, 102, 138, CAST(N'2025-09-24T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (80, 15, 139, CAST(N'2025-10-01T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (81, 78, 140, CAST(N'2025-12-21T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (82, 26, 141, CAST(N'2025-12-25T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (83, 36, 142, CAST(N'2026-03-01T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (84, 39, 143, CAST(N'2026-01-18T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (85, 95, 144, CAST(N'2025-09-12T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (86, 3, 145, CAST(N'2025-10-27T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (87, 9, 146, CAST(N'2025-10-01T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (88, 49, 147, CAST(N'2025-11-01T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (89, 8, 148, CAST(N'2025-10-09T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (90, 65, 149, CAST(N'2025-12-01T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (91, 83, 150, CAST(N'2025-10-01T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (92, 93, 151, CAST(N'2025-10-07T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (93, 40, 152, CAST(N'2025-11-08T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (94, 64, 153, CAST(N'2025-10-17T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (95, 15, 154, CAST(N'2026-03-08T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (96, 89, 155, CAST(N'2025-09-19T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (97, 68, 156, CAST(N'2026-01-17T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (98, 40, 157, CAST(N'2026-03-07T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (99, 65, 158, CAST(N'2025-10-22T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (100, 52, 159, CAST(N'2025-12-24T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (101, 54, 160, CAST(N'2025-11-27T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (102, 91, 161, CAST(N'2025-12-24T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (103, 86, 162, CAST(N'2026-01-21T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (104, 87, 163, CAST(N'2026-01-28T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (105, 43, 164, CAST(N'2026-02-24T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (106, 97, 165, CAST(N'2025-11-07T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (107, 49, 166, CAST(N'2025-11-15T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (108, 9, 167, CAST(N'2026-03-01T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (109, 101, 168, CAST(N'2026-01-18T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (110, 8, 169, CAST(N'2026-02-17T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (111, 19, 170, CAST(N'2025-12-03T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (112, 2, 171, CAST(N'2025-10-10T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (113, 21, 172, CAST(N'2025-10-06T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (114, 82, 173, CAST(N'2025-09-27T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (115, 58, 174, CAST(N'2025-10-28T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (116, 66, 175, CAST(N'2025-12-27T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (117, 92, 176, CAST(N'2025-11-14T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (118, 89, 177, CAST(N'2025-11-21T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (119, 88, 178, CAST(N'2025-10-13T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (120, 103, 179, CAST(N'2025-11-22T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (121, 60, 180, CAST(N'2026-02-24T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (122, 32, 181, CAST(N'2025-09-11T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (123, 105, 182, CAST(N'2025-12-05T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (124, 97, 183, CAST(N'2026-02-23T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (125, 92, 184, CAST(N'2025-12-30T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (126, 82, 185, CAST(N'2025-12-04T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (127, 30, 186, CAST(N'2025-12-05T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (128, 25, 187, CAST(N'2026-01-27T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (129, 65, 188, CAST(N'2026-03-08T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (130, 46, 189, CAST(N'2025-10-12T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (131, 44, 190, CAST(N'2025-12-03T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (132, 33, 191, CAST(N'2025-12-15T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (133, 22, 192, CAST(N'2026-01-08T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (134, 105, 193, CAST(N'2025-12-14T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (135, 83, 194, CAST(N'2026-01-25T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (136, 70, 195, CAST(N'2026-01-07T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (137, 65, 196, CAST(N'2025-10-25T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (138, 97, 197, CAST(N'2025-10-18T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (139, 25, 198, CAST(N'2025-10-14T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (140, 51, 199, CAST(N'2026-01-28T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (142, 69, 200, CAST(N'2025-11-08T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (143, 9, 201, CAST(N'2025-10-12T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (144, 65, 202, CAST(N'2025-10-06T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (145, 56, 203, CAST(N'2025-11-27T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (146, 3, 204, CAST(N'2026-01-19T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (147, 60, 205, CAST(N'2025-12-11T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (148, 70, 206, CAST(N'2026-01-09T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (149, 45, 207, CAST(N'2025-10-03T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (150, 95, 208, CAST(N'2026-02-19T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (151, 51, 209, CAST(N'2025-10-04T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (152, 89, 210, CAST(N'2025-09-18T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (153, 56, 212, CAST(N'2025-12-05T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (154, 102, 213, CAST(N'2026-01-08T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (155, 14, 214, CAST(N'2025-09-22T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (156, 68, 215, CAST(N'2025-12-18T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (157, 90, 216, CAST(N'2025-09-26T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (158, 7, 217, CAST(N'2025-11-11T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (159, 90, 218, CAST(N'2026-01-28T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (160, 69, 219, CAST(N'2025-11-16T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (161, 73, 220, CAST(N'2025-11-03T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (162, 56, 221, CAST(N'2025-10-27T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (163, 73, 222, CAST(N'2025-11-05T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (164, 45, 223, CAST(N'2025-09-25T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (165, 3, 224, CAST(N'2026-02-16T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (166, 61, 225, CAST(N'2026-02-19T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (167, 55, 226, CAST(N'2026-02-01T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (168, 81, 227, CAST(N'2026-01-16T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (169, 48, 228, CAST(N'2025-09-10T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (170, 105, 229, CAST(N'2025-09-24T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (171, 55, 230, CAST(N'2025-11-22T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (172, 49, 231, CAST(N'2026-02-06T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (173, 82, 232, CAST(N'2025-10-02T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (174, 51, 233, CAST(N'2025-11-20T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (175, 19, 234, CAST(N'2025-10-20T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (176, 19, 235, CAST(N'2025-10-29T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (177, 72, 236, CAST(N'2025-10-01T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (178, 17, 237, CAST(N'2026-02-10T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (179, 63, 238, CAST(N'2025-12-12T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (180, 67, 239, CAST(N'2025-12-18T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (181, 97, 240, CAST(N'2025-12-20T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (182, 106, 241, CAST(N'2025-10-27T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (183, 23, 242, CAST(N'2025-11-15T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (184, 80, 243, CAST(N'2025-11-30T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (185, 65, 244, CAST(N'2026-01-17T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (186, 88, 245, CAST(N'2026-01-17T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (187, 84, 246, CAST(N'2025-11-02T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (188, 54, 247, CAST(N'2025-10-18T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (189, 6, 248, CAST(N'2026-01-24T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (190, 73, 249, CAST(N'2025-09-22T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (191, 31, 250, CAST(N'2026-02-01T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (192, 48, 251, CAST(N'2025-11-22T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (193, 71, 252, CAST(N'2025-10-13T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (194, 11, 253, CAST(N'2025-10-15T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (195, 19, 254, CAST(N'2026-01-31T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (196, 22, 255, CAST(N'2025-09-07T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (197, 19, 256, CAST(N'2026-02-24T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (198, 63, 257, CAST(N'2025-10-26T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (199, 84, 258, CAST(N'2025-11-30T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (200, 99, 259, CAST(N'2025-10-13T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (201, 73, 260, CAST(N'2025-10-12T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (202, 41, 261, CAST(N'2026-01-28T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (203, 80, 262, CAST(N'2026-03-10T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (204, 97, 263, CAST(N'2026-01-08T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (205, 28, 264, CAST(N'2026-02-15T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (206, 65, 265, CAST(N'2025-12-17T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (207, 67, 266, CAST(N'2026-02-04T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (208, 98, 267, CAST(N'2025-12-20T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (209, 22, 268, CAST(N'2025-12-28T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (211, 90, 269, CAST(N'2025-10-27T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (212, 92, 270, CAST(N'2026-01-27T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (213, 74, 271, CAST(N'2026-01-24T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (214, 60, 272, CAST(N'2026-01-28T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (215, 91, 273, CAST(N'2026-02-23T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (218, 31, 274, CAST(N'2026-02-10T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, NULL, CAST(1200.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (219, 67, 275, CAST(N'2026-03-14T00:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (220, 103, 276, CAST(N'2026-03-03T00:00:00.0000000' AS DateTime2), N'已完成', N'點數', NULL, 800, NULL, NULL)
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (222, 1, 277, CAST(N'2026-03-15T10:00:00.0000000' AS DateTime2), N'已預約', N'信用卡', N'預約狀態變更測試', NULL, CAST(1200.00 AS Decimal(10, 2)), N'專門提供給 Admin 測試狀態變更的訂單，無評論')
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (223, 1, 278, CAST(N'2026-03-15T10:00:00.0000000' AS DateTime2), N'已預約', N'信用卡', N'預約狀態變更測試', NULL, CAST(1200.00 AS Decimal(10, 2)), N'專門提供給 Admin 測試狀態變更的訂單，無評論')
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (224, 1, 297, CAST(N'2026-03-15T10:00:00.0000000' AS DateTime2), N'已預約', N'信用卡', N'預約狀態變更測試', NULL, CAST(1200.00 AS Decimal(10, 2)), N'專門提供給 Admin 測試狀態變更的訂單，無評論')
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (225, 1, 298, CAST(N'2026-03-15T10:00:00.0000000' AS DateTime2), N'已預約', N'信用卡', N'預約狀態變更測試', NULL, CAST(1200.00 AS Decimal(10, 2)), N'專門提供給 Admin 測試狀態變更的訂單，無評論')
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (227, 2, 300, CAST(N'2026-01-27T14:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', N'二月營養諮詢', NULL, CAST(1200.00 AS Decimal(10, 2)), N'系統自動產生測試資料')
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (228, 3, 301, CAST(N'2026-01-28T14:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', N'二月營養諮詢', NULL, CAST(1200.00 AS Decimal(10, 2)), N'系統自動產生測試資料')
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (229, 4, 302, CAST(N'2026-01-29T14:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', N'二月營養諮詢', NULL, CAST(1200.00 AS Decimal(10, 2)), N'系統自動產生測試資料')
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (230, 5, 303, CAST(N'2026-01-30T14:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', N'二月營養諮詢', NULL, CAST(1200.00 AS Decimal(10, 2)), N'系統自動產生測試資料')
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (231, 6, 304, CAST(N'2026-01-31T14:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', N'二月營養諮詢', NULL, CAST(1200.00 AS Decimal(10, 2)), N'系統自動產生測試資料')
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (232, 7, 305, CAST(N'2026-02-01T14:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', N'二月營養諮詢', NULL, CAST(1200.00 AS Decimal(10, 2)), N'系統自動產生測試資料')
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (233, 8, 306, CAST(N'2026-02-02T14:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', N'二月營養諮詢', NULL, CAST(1200.00 AS Decimal(10, 2)), N'系統自動產生測試資料')
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (234, 9, 307, CAST(N'2026-02-03T14:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', N'二月營養諮詢', NULL, CAST(1200.00 AS Decimal(10, 2)), N'系統自動產生測試資料')
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (235, 10, 308, CAST(N'2026-02-04T14:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', N'二月營養諮詢', NULL, CAST(1200.00 AS Decimal(10, 2)), N'系統自動產生測試資料')
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (236, 11, 309, CAST(N'2026-02-05T14:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', N'二月營養諮詢', NULL, CAST(1200.00 AS Decimal(10, 2)), N'系統自動產生測試資料')
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (237, 12, 310, CAST(N'2026-02-06T14:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', N'二月營養諮詢', NULL, CAST(1200.00 AS Decimal(10, 2)), N'系統自動產生測試資料')
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (238, 13, 311, CAST(N'2026-02-07T14:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', N'二月營養諮詢', NULL, CAST(1200.00 AS Decimal(10, 2)), N'系統自動產生測試資料')
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (239, 14, 312, CAST(N'2026-02-08T14:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', N'二月營養諮詢', NULL, CAST(1200.00 AS Decimal(10, 2)), N'系統自動產生測試資料')
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (240, 15, 313, CAST(N'2026-02-09T14:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', N'二月營養諮詢', NULL, CAST(1200.00 AS Decimal(10, 2)), N'系統自動產生測試資料')
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (241, 16, 314, CAST(N'2026-02-10T14:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', N'二月營養諮詢', NULL, CAST(1200.00 AS Decimal(10, 2)), N'系統自動產生測試資料')
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (242, 17, 315, CAST(N'2026-02-11T14:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', N'二月營養諮詢', NULL, CAST(1200.00 AS Decimal(10, 2)), N'系統自動產生測試資料')
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (243, 18, 316, CAST(N'2026-02-12T14:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', N'二月營養諮詢', NULL, CAST(1200.00 AS Decimal(10, 2)), N'系統自動產生測試資料')
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (244, 19, 317, CAST(N'2026-02-13T14:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', N'二月營養諮詢', NULL, CAST(1200.00 AS Decimal(10, 2)), N'系統自動產生測試資料')
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (245, 20, 318, CAST(N'2026-02-14T14:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', N'二月營養諮詢', NULL, CAST(1200.00 AS Decimal(10, 2)), N'系統自動產生測試資料')
GO
INSERT [dbo].[ReserveOrders] ([Id], [MemberId], [ShiftId], [CreateAt], [Status], [PaymentMethod], [Target], [PointCost], [Price], [Memorandum]) VALUES (246, 1, 319, CAST(N'2026-02-15T14:00:00.0000000' AS DateTime2), N'已完成', N'信用卡', N'二月營養諮詢', NULL, CAST(1200.00 AS Decimal(10, 2)), N'系統自動產生測試資料')
GO
SET IDENTITY_INSERT [dbo].[ReserveOrders] OFF
GO
SET IDENTITY_INSERT [dbo].[Reviews] ON 
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (3, 4, 2, 2, 5, N'李營養師非常專業，給了很具體的外食建議，非常感謝！', CAST(N'2026-03-09T19:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (4, 5, 1, 1, 4, N'講解得很清楚，但希望能多提供一些超商能買到的具體品項建議。', CAST(N'2026-03-12T04:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (5, 6, 5, 83, 3, N'跟預期不一樣，回答比較保守。可能需要多點客製化。', CAST(N'2026-03-09T09:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (6, 7, 7, 67, 1, N'浪費我的時間，菜單根本不能吃。爛到笑出來。', CAST(N'2026-03-16T11:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (7, 8, 4, 82, 5, N'非常感謝指導，不只給方法還給滿滿鼓勵。收穫非常多。 神仙教練！', CAST(N'2026-03-08T16:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (8, 9, 11, 85, 4, N'超級用心！給了很好的調整方向。絕對五星好評！ 錢花得很值得！', CAST(N'2026-03-12T21:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (9, 10, 4, 65, 5, N'收穫超乎預期，菜單很符合作息。準備好開始執行了！ 超推！', CAST(N'2026-03-11T03:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (10, 11, 5, 35, 5, N'收穫超乎預期，讓我清楚營養素分配。更有動力了！', CAST(N'2026-03-16T15:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (11, 12, 5, 76, 4, N'教練非常專業，給的建議超實用。期待下次的諮詢。 超推！', CAST(N'2026-03-10T14:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (12, 13, 6, 68, 1, N'長那什麼醜八怪樣子，完全不聽我的需求。一星都不想給。 態度極差！', CAST(N'2025-12-21T23:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (13, 14, 9, 17, 5, N'講解非常詳細，給的建議超實用。準備好開始執行了！ 錢花得很值得！', CAST(N'2025-12-12T11:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (14, 15, 11, 57, 3, N'稍微可惜，外食部分講得比較少。這點滿可惜的。 普普。', CAST(N'2026-01-04T06:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (15, 16, 13, 2, 4, N'完全命中問題，細心客製化了我的計畫。絕對五星好評！ 大推薦！', CAST(N'2026-03-15T10:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (16, 17, 5, 99, 2, N'超級不專業，上課還在看手機。氣到發抖。 智商稅！', CAST(N'2025-10-23T05:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (17, 18, 11, 15, 3, N'不太符合期待，建議不太好執行。或許不太適合我。 沒感覺。', CAST(N'2025-12-21T14:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (18, 19, 8, 99, 4, N'完全命中問題，提供很多超商就能買的選擇。更有動力了！', CAST(N'2025-10-30T19:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (19, 20, 2, 74, 5, N'態度很親切，解答了我的盲點。更有動力了！ 錢花得很值得！', CAST(N'2025-10-03T21:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (20, 21, 2, 19, 3, N'跟預期不一樣，外食部分講得比較少。算是買個經驗。 普普。', CAST(N'2026-03-16T12:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (21, 22, 3, 28, 5, N'教練非常專業，菜單很符合作息。之後一定會再預約。 神仙教練！', CAST(N'2026-02-17T01:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (22, 23, 9, 62, 5, N'非常感謝指導，菜單很符合作息。準備好開始執行了！ 感謝教練！', CAST(N'2025-12-30T17:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (23, 24, 2, 27, 3, N'跟預期不一樣，沒有完全針對我的狀況。或許不太適合我。', CAST(N'2026-03-04T22:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (24, 25, 9, 90, 4, N'態度很親切，不只給方法還給滿滿鼓勵。超乎想像的好！ 錢花得很值得！', CAST(N'2026-01-14T02:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (25, 26, 1, 62, 3, N'不太符合期待，沒有完全針對我的狀況。算是買個經驗。 沒感覺。', CAST(N'2025-12-12T09:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (26, 27, 7, 23, 1, N'遇到這教練真倒楣，只會一直推銷課程。一星都不想給。 根本在騙錢！', CAST(N'2025-12-20T10:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (27, 28, 9, 30, 5, N'非常感謝指導，給的建議超實用。準備好開始執行了！', CAST(N'2026-01-28T19:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (28, 29, 14, 14, 1, N'有夠敷衍，講廢話就下課了。這種素質也能當教練？ 根本在騙錢！', CAST(N'2025-09-21T05:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (29, 30, 11, 59, 3, N'整體普普通通，講的東西大概都知道了。就這樣吧。 沒感覺。', CAST(N'2026-02-20T08:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (30, 31, 3, 95, 4, N'教練非常專業，破解了減脂迷思。馬上推薦給朋友。 超推！', CAST(N'2025-12-12T04:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (31, 32, 14, 104, 5, N'態度很親切，給的建議超實用。馬上推薦給朋友。 神仙教練！', CAST(N'2025-11-11T09:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (32, 33, 4, 27, 4, N'很喜歡這位營養師，提供很多超商就能買的選擇。超乎想像的好！', CAST(N'2026-01-03T16:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (33, 34, 10, 67, 3, N'稍微可惜，時間掌控上可再好一點。或許不太適合我。 勉強給過。', CAST(N'2025-12-04T16:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (34, 35, 3, 71, 4, N'態度很親切，解答了我的盲點。之後一定會再預約。 大推薦！', CAST(N'2025-12-08T16:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (36, 37, 12, 81, 4, N'真的很棒，提供很多超商就能買的選擇。絕對五星好評！', CAST(N'2026-02-26T23:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (37, 38, 5, 38, 3, N'不太符合期待，回答比較保守。希望下次能更好。', CAST(N'2026-03-02T15:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (38, 39, 3, 53, 5, N'收穫超乎預期，給了很好的調整方向。更有動力了！ 感謝教練！', CAST(N'2026-02-22T14:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (39, 40, 13, 102, 2, N'長那什麼醜八怪樣子，這點程度也敢出來教。退錢啦！ 態度極差！', CAST(N'2026-01-28T16:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (40, 41, 8, 52, 5, N'教練非常專業，破解了減脂迷思。之後一定會再預約。 大推薦！', CAST(N'2026-03-15T06:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (41, 42, 8, 91, 4, N'真的很棒，破解了減脂迷思。準備好開始執行了！ 感謝教練！', CAST(N'2025-10-05T00:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (42, 43, 4, 47, 5, N'這堂課太有價值，菜單很符合作息。馬上推薦給朋友。', CAST(N'2026-01-26T16:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (43, 44, 2, 4, 4, N'超級用心！解答了我的盲點。真心推薦給大家。 感謝教練！', CAST(N'2026-03-03T01:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (44, 45, 7, 54, 5, N'很喜歡這位營養師，解答了我的盲點。更有動力了！ 大推薦！', CAST(N'2025-12-05T21:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (45, 46, 13, 13, 4, N'完全命中問題，解答了我的盲點。收穫非常多。 感謝教練！', CAST(N'2025-10-31T01:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (46, 47, 6, 5, 2, N'超級不專業，連營養素都算錯。這種素質也能當教練？ 態度極差！', CAST(N'2026-02-06T08:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (47, 48, 5, 9, 3, N'有進步空間，外食部分講得比較少。當作參考囉。 勉強給過。', CAST(N'2025-12-28T20:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (48, 49, 10, 42, 4, N'收穫超乎預期，破解了減脂迷思。太喜歡這模式了！ 超推！', CAST(N'2026-03-02T04:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (49, 50, 7, 86, 5, N'超級用心！讓我清楚營養素分配。絕對五星好評！ 感謝教練！', CAST(N'2025-10-22T04:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (50, 51, 6, 57, 4, N'超級用心！提供很多超商就能買的選擇。絕對五星好評！ 超推！', CAST(N'2026-02-05T19:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (51, 52, 3, 58, 4, N'教練非常專業，對接下來備餐更有頭緒。收穫非常多。 大推薦！', CAST(N'2025-12-16T00:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (52, 53, 1, 46, 2, N'氣死我了，這點程度也敢出來教。瞎了眼才買這堂課。', CAST(N'2026-03-01T16:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (53, 54, 8, 10, 5, N'這堂課太有價值，解答了我的盲點。期待下次的諮詢。', CAST(N'2025-12-06T17:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (54, 55, 12, 23, 3, N'跟預期不一樣，回答比較保守。不知道怎麼給評。 表現中規中矩。', CAST(N'2025-10-25T05:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (55, 56, 13, 22, 5, N'很喜歡這位營養師，讓我清楚營養素分配。真心推薦給大家。', CAST(N'2025-12-03T16:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (56, 57, 7, 86, 5, N'態度很親切，讓我清楚營養素分配。期待下次的諮詢。 錢花得很值得！', CAST(N'2026-01-10T20:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (57, 58, 3, 42, 5, N'很喜歡這位營養師，提供很多超商就能買的選擇。期待下次的諮詢。 神仙教練！', CAST(N'2026-01-05T18:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (58, 59, 4, 82, 1, N'這什麼白癡建議，這點程度也敢出來教。一星都不想給。 智商稅！', CAST(N'2026-01-22T17:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (59, 60, 1, 76, 2, N'長那什麼醜八怪樣子，連營養素都算錯。大家千萬別踩坑。 根本在騙錢！', CAST(N'2026-02-14T20:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (60, 61, 7, 82, 5, N'態度很親切，不只給方法還給滿滿鼓勵。期待下次的諮詢。 錢花得很值得！', CAST(N'2025-09-30T05:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (61, 62, 1, 47, 3, N'跟預期不一樣，外食部分講得比較少。希望之後能改善。 普普。', CAST(N'2026-02-19T07:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (62, 63, 11, 57, 4, N'非常感謝指導，不只給方法還給滿滿鼓勵。真心推薦給大家。', CAST(N'2026-03-05T11:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (63, 64, 6, 75, 5, N'非常感謝指導，對接下來備餐更有頭緒。太喜歡這模式了！ 感謝教練！', CAST(N'2025-12-18T07:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (64, 65, 3, 65, 1, N'有夠敷衍，只會一直推銷課程。氣到發抖。 避雷！', CAST(N'2025-10-24T02:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (65, 66, 11, 11, 4, N'教練非常專業，解答了我的盲點。絕對五星好評！ 大推薦！', CAST(N'2025-11-14T19:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (66, 67, 4, 54, 4, N'非常感謝指導，不只給方法還給滿滿鼓勵。準備好開始執行了！ 大推薦！', CAST(N'2026-02-02T10:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (67, 68, 9, 87, 2, N'體驗極差，這點程度也敢出來教。瞎了眼才買這堂課。 態度極差！', CAST(N'2026-01-12T00:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (68, 69, 7, 50, 4, N'講解非常詳細，不只給方法還給滿滿鼓勵。絕對五星好評！ 感謝教練！', CAST(N'2025-10-19T00:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (69, 70, 2, 16, 3, N'有進步空間，時間掌控上可再好一點。或許不太適合我。 表現中規中矩。', CAST(N'2025-10-30T18:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (70, 71, 9, 88, 1, N'體驗極差，連營養素都算錯。退錢啦！', CAST(N'2025-09-22T15:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (71, 72, 12, 92, 4, N'很喜歡這位營養師，對接下來備餐更有頭緒。收穫非常多。', CAST(N'2025-10-30T00:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (72, 73, 7, 104, 3, N'不太符合期待，互動感覺偏制式化。算是買個經驗。 普普。', CAST(N'2025-10-08T12:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (73, 74, 6, 53, 5, N'態度很親切，給的建議超實用。準備好開始執行了！ 感謝教練！', CAST(N'2025-10-08T13:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (74, 75, 13, 103, 5, N'超級用心！細心客製化了我的計畫。更有動力了！', CAST(N'2026-02-07T09:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (75, 76, 9, 6, 2, N'浪費我的時間，態度跩個二五八萬。準備被投訴吧。 態度極差！', CAST(N'2026-01-26T05:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (76, 77, 11, 40, 2, N'長那什麼醜八怪樣子，只會一直推銷課程。瞎了眼才買這堂課。 智商稅！', CAST(N'2025-11-04T09:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (77, 78, 5, 3, 4, N'非常感謝指導，讓我清楚營養素分配。期待下次的諮詢。 錢花得很值得！', CAST(N'2025-10-13T13:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (78, 79, 10, 102, 4, N'態度很親切，對接下來備餐更有頭緒。太喜歡這模式了！', CAST(N'2025-10-08T10:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (79, 80, 13, 15, 4, N'很喜歡這位營養師，讓我清楚營養素分配。準備好開始執行了！ 錢花得很值得！', CAST(N'2025-10-14T20:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (80, 81, 14, 78, 1, N'浪費我的時間，講廢話就下課了。退錢啦！ 態度極差！', CAST(N'2025-12-27T14:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (81, 82, 3, 26, 3, N'跟預期不一樣，希望多給實際的例子。這點滿可惜的。 普普。', CAST(N'2025-12-31T00:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (82, 83, 6, 36, 5, N'態度很親切，給了很好的調整方向。準備好開始執行了！ 大推薦！', CAST(N'2026-03-13T04:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (83, 84, 5, 39, 4, N'教練非常專業，提供很多超商就能買的選擇。準備好開始執行了！ 大推薦！', CAST(N'2026-01-20T02:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (84, 85, 5, 95, 2, N'遇到這教練真倒楣，這點程度也敢出來教。準備被投訴吧。 避雷！', CAST(N'2025-09-25T12:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (85, 86, 2, 3, 4, N'超級用心！破解了減脂迷思。絕對五星好評！ 錢花得很值得！', CAST(N'2025-11-04T21:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (86, 87, 13, 9, 2, N'體驗極差，問問題都不想回。退錢啦！ 避雷！', CAST(N'2025-10-03T18:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (87, 88, 7, 49, 3, N'表現平平，菜單變化比較少。算是買個經驗。', CAST(N'2025-11-07T12:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (88, 89, 14, 8, 1, N'靠北，連營養素都算錯。爛到笑出來。 智商稅！', CAST(N'2025-10-11T15:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (89, 90, 6, 65, 3, N'跟預期不一樣，時間掌控上可再好一點。這點滿可惜的。 普普。', CAST(N'2025-12-11T21:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (90, 91, 8, 83, 5, N'很喜歡這位營養師，菜單很符合作息。更有動力了！ 感謝教練！', CAST(N'2025-10-08T13:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (91, 92, 6, 93, 4, N'真的很棒，給的建議超實用。超乎想像的好！', CAST(N'2025-10-12T00:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (92, 93, 1, 40, 5, N'很喜歡這位營養師，提供很多超商就能買的選擇。期待下次的諮詢。 大推薦！', CAST(N'2025-11-10T06:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (93, 94, 14, 64, 1, N'遇到這教練真倒楣，問問題都不想回。這種素質也能當教練？ 避雷！', CAST(N'2025-10-23T17:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (94, 95, 4, 15, 2, N'爛透了，上課還在看手機。大家千萬別踩坑。 態度極差！', CAST(N'2026-03-14T11:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (95, 96, 5, 89, 5, N'講解非常詳細，解答了我的盲點。之後一定會再預約。', CAST(N'2025-09-25T06:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (96, 97, 8, 68, 4, N'教練非常專業，菜單很符合作息。太喜歡這模式了！', CAST(N'2026-01-28T15:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (97, 98, 11, 40, 4, N'教練非常專業，不只給方法還給滿滿鼓勵。絕對五星好評！ 感謝教練！', CAST(N'2026-03-17T12:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (98, 99, 7, 65, 1, N'氣死我了，講廢話就下課了。退錢啦！ 避雷！', CAST(N'2025-10-27T19:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (99, 100, 5, 52, 3, N'跟預期不一樣，菜單變化比較少。希望下次能更好。 普普。', CAST(N'2026-01-01T18:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (100, 101, 9, 54, 4, N'完全命中問題，給的建議超實用。期待下次的諮詢。 大推薦！', CAST(N'2025-12-06T16:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (101, 102, 11, 91, 5, N'講解非常詳細，細心客製化了我的計畫。真心推薦給大家。 神仙教練！', CAST(N'2026-01-02T09:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (102, 103, 9, 86, 4, N'很喜歡這位營養師，給了很好的調整方向。太喜歡這模式了！', CAST(N'2026-01-29T17:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (103, 104, 14, 87, 4, N'完全命中問題，對接下來備餐更有頭緒。真心推薦給大家。 感謝教練！', CAST(N'2026-02-03T14:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (104, 105, 8, 43, 2, N'浪費我的時間，問問題都不想回。大家千萬別踩坑。 避雷！', CAST(N'2026-03-11T03:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (105, 106, 9, 97, 1, N'長那什麼醜八怪樣子，講廢話就下課了。這種素質也能當教練？ 避雷！', CAST(N'2025-11-11T08:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (106, 107, 8, 49, 4, N'很喜歡這位營養師，給的建議超實用。馬上推薦給朋友。 神仙教練！', CAST(N'2025-11-17T16:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (107, 108, 10, 9, 4, N'講解非常詳細，給的建議超實用。更有動力了！ 大推薦！', CAST(N'2026-03-07T00:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (108, 109, 5, 101, 5, N'超級用心！解答了我的盲點。之後一定會再預約。 錢花得很值得！', CAST(N'2026-01-26T21:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (109, 110, 1, 8, 5, N'收穫超乎預期，提供很多超商就能買的選擇。更有動力了！ 感謝教練！', CAST(N'2026-03-03T16:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (110, 111, 9, 19, 1, N'長那什麼醜八怪樣子，講廢話就下課了。退錢啦！', CAST(N'2025-12-19T17:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (111, 112, 12, 2, 5, N'態度很親切，破解了減脂迷思。更有動力了！ 錢花得很值得！', CAST(N'2025-10-12T07:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (112, 113, 11, 21, 2, N'氣死我了，完全不聽我的需求。氣到發抖。 避雷！', CAST(N'2025-10-14T08:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (113, 114, 1, 82, 3, N'感覺還好，外食部分講得比較少。算是買個經驗。 沒感覺。', CAST(N'2025-10-02T20:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (114, 115, 14, 58, 4, N'教練非常專業，對接下來備餐更有頭緒。準備好開始執行了！ 大推薦！', CAST(N'2025-11-02T21:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (115, 116, 10, 66, 5, N'教練非常專業，提供很多超商就能買的選擇。之後一定會再預約。 神仙教練！', CAST(N'2026-01-02T00:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (116, 117, 6, 92, 5, N'教練非常專業，解答了我的盲點。太喜歡這模式了！', CAST(N'2025-11-21T07:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (117, 118, 6, 89, 4, N'這堂課太有價值，不只給方法還給滿滿鼓勵。超乎想像的好！ 大推薦！', CAST(N'2025-11-25T17:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (118, 119, 9, 88, 1, N'有夠敷衍，講廢話就下課了。一星都不想給。 智商稅！', CAST(N'2025-10-18T16:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (119, 120, 4, 103, 2, N'這什麼白癡建議，連營養素都算錯。爛到笑出來。 根本在騙錢！', CAST(N'2025-12-06T07:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (120, 121, 12, 60, 1, N'超級不專業，只會一直推銷課程。準備被投訴吧。 根本在騙錢！', CAST(N'2026-03-12T18:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (121, 122, 4, 32, 1, N'超級不專業，菜單根本不能吃。瞎了眼才買這堂課。 根本在騙錢！', CAST(N'2025-09-22T03:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (122, 123, 14, 105, 4, N'完全命中問題，給的建議超實用。收穫非常多。', CAST(N'2025-12-14T07:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (123, 124, 4, 97, 5, N'非常感謝指導，提供很多超商就能買的選擇。絕對五星好評！ 神仙教練！', CAST(N'2026-03-05T15:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (124, 125, 14, 92, 4, N'非常感謝指導，解答了我的盲點。絕對五星好評！ 神仙教練！', CAST(N'2026-01-12T09:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (125, 126, 1, 82, 1, N'長那什麼醜八怪樣子，菜單根本不能吃。瞎了眼才買這堂課。 根本在騙錢！', CAST(N'2025-12-17T03:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (126, 127, 2, 30, 5, N'非常感謝指導，提供很多超商就能買的選擇。馬上推薦給朋友。 錢花得很值得！', CAST(N'2025-12-13T11:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (127, 128, 4, 25, 5, N'收穫超乎預期，細心客製化了我的計畫。絕對五星好評！', CAST(N'2026-02-01T05:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (128, 129, 10, 65, 1, N'爛透了，只會一直推銷課程。絕對不會再來！ 態度極差！', CAST(N'2026-03-15T03:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (129, 130, 10, 46, 4, N'講解非常詳細，給了很好的調整方向。更有動力了！', CAST(N'2025-10-27T10:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (130, 131, 5, 44, 3, N'有點小失望，外食部分講得比較少。可能需要多點客製化。 普普。', CAST(N'2025-12-07T07:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (131, 132, 13, 33, 4, N'完全命中問題，給的建議超實用。期待下次的諮詢。 感謝教練！', CAST(N'2025-12-18T18:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (132, 133, 14, 22, 5, N'講解非常詳細，提供很多超商就能買的選擇。太喜歡這模式了！ 神仙教練！', CAST(N'2026-01-19T19:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (133, 134, 3, 105, 5, N'很喜歡這位營養師，菜單很符合作息。超乎想像的好！ 錢花得很值得！', CAST(N'2025-12-23T21:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (134, 135, 4, 83, 4, N'完全命中問題，提供很多超商就能買的選擇。準備好開始執行了！ 超推！', CAST(N'2026-01-31T23:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (135, 136, 4, 70, 1, N'體驗極差，只會一直推銷課程。退錢啦！ 根本在騙錢！', CAST(N'2026-01-21T12:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (136, 137, 6, 65, 5, N'收穫超乎預期，對接下來備餐更有頭緒。期待下次的諮詢。 超推！', CAST(N'2025-11-06T07:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (137, 138, 3, 97, 4, N'這堂課太有價值，解答了我的盲點。之後一定會再預約。', CAST(N'2025-10-22T13:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (138, 139, 8, 25, 4, N'這堂課太有價值，提供很多超商就能買的選擇。之後一定會再預約。 錢花得很值得！', CAST(N'2025-10-29T09:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (139, 140, 4, 51, 4, N'很喜歡這位營養師，給的建議超實用。絕對五星好評！ 大推薦！', CAST(N'2026-02-02T21:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (141, 142, 11, 69, 3, N'算不錯但菜單變化比較少。希望下次能更好。 普普。', CAST(N'2025-11-11T03:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (142, 143, 6, 9, 4, N'完全命中問題，破解了減脂迷思。馬上推薦給朋友。 錢花得很值得！', CAST(N'2025-10-26T10:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (143, 144, 5, 65, 5, N'收穫超乎預期，解答了我的盲點。準備好開始執行了！ 感謝教練！', CAST(N'2025-10-11T17:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (144, 145, 11, 56, 5, N'態度很親切，不只給方法還給滿滿鼓勵。真心推薦給大家。', CAST(N'2025-12-01T14:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (145, 146, 5, 3, 4, N'真的很棒，給了很好的調整方向。超乎想像的好！ 感謝教練！', CAST(N'2026-01-27T02:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (146, 147, 2, 60, 1, N'氣死我了，上課還在看手機。準備被投訴吧。 智商稅！', CAST(N'2025-12-16T21:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (147, 148, 5, 70, 2, N'靠北，菜單根本不能吃。這種素質也能當教練？ 根本在騙錢！', CAST(N'2026-01-13T06:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (148, 149, 11, 45, 5, N'講解非常詳細，菜單很符合作息。真心推薦給大家。', CAST(N'2025-10-12T10:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (149, 150, 6, 95, 3, N'體驗一般般，沒有完全針對我的狀況。算是買個經驗。 勉強給過。', CAST(N'2026-02-24T00:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (150, 151, 1, 51, 4, N'很喜歡這位營養師，解答了我的盲點。收穫非常多。 錢花得很值得！', CAST(N'2025-10-15T08:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (151, 152, 7, 89, 2, N'超級不專業，態度跩個二五八萬。爛到笑出來。', CAST(N'2025-10-03T04:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (152, 153, 6, 56, 1, N'遇到這教練真倒楣，完全不聽我的需求。準備被投訴吧。 根本在騙錢！', CAST(N'2025-12-17T17:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (153, 154, 2, 102, 3, N'跟預期不一樣，回答比較保守。或許不太適合我。 表現中規中矩。', CAST(N'2026-01-22T08:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (154, 155, 7, 14, 5, N'教練非常專業，提供很多超商就能買的選擇。之後一定會再預約。 錢花得很值得！', CAST(N'2025-10-03T06:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (155, 156, 9, 68, 5, N'講解非常詳細，不只給方法還給滿滿鼓勵。收穫非常多。 超推！', CAST(N'2025-12-26T07:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (156, 157, 2, 90, 4, N'態度很親切，讓我清楚營養素分配。絕對五星好評！', CAST(N'2025-10-07T14:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (157, 158, 4, 7, 5, N'完全命中問題，對接下來備餐更有頭緒。收穫非常多。 超推！', CAST(N'2025-11-20T22:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (158, 159, 4, 90, 4, N'真的很棒，讓我清楚營養素分配。收穫非常多。 大推薦！', CAST(N'2026-02-04T22:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (159, 160, 4, 69, 5, N'講解非常詳細，破解了減脂迷思。真心推薦給大家。', CAST(N'2025-11-19T13:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (160, 161, 3, 73, 5, N'教練非常專業，讓我清楚營養素分配。超乎想像的好！ 感謝教練！', CAST(N'2025-11-13T11:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (161, 162, 9, 56, 1, N'遇到這教練真倒楣，這點程度也敢出來教。快點逃啊各位。 智商稅！', CAST(N'2025-11-11T19:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (162, 163, 12, 73, 1, N'長那什麼醜八怪樣子，只會一直推銷課程。氣到發抖。 智商稅！', CAST(N'2025-11-17T13:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (163, 164, 12, 45, 2, N'遇到這教練真倒楣，這點程度也敢出來教。爛到笑出來。 避雷！', CAST(N'2025-10-07T10:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (164, 165, 14, 3, 1, N'超級不專業，只會一直推銷課程。快點逃啊各位。 態度極差！', CAST(N'2026-02-26T14:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (165, 166, 3, 61, 4, N'這堂課太有價值，不只給方法還給滿滿鼓勵。準備好開始執行了！ 超推！', CAST(N'2026-02-21T15:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (166, 167, 7, 55, 4, N'超級用心！解答了我的盲點。絕對五星好評！ 神仙教練！', CAST(N'2026-02-12T17:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (167, 168, 1, 81, 4, N'完全命中問題，給了很好的調整方向。準備好開始執行了！ 感謝教練！', CAST(N'2026-01-28T12:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (168, 169, 3, 48, 3, N'體驗一般般，時間掌控上可再好一點。當作參考囉。', CAST(N'2025-09-25T13:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (169, 170, 5, 105, 3, N'算不錯但互動感覺偏制式化。再觀望看看好了。 表現中規中矩。', CAST(N'2025-10-07T02:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (170, 171, 2, 55, 2, N'靠北，這點程度也敢出來教。一星都不想給。 態度極差！', CAST(N'2025-12-06T16:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (171, 172, 9, 49, 4, N'這堂課太有價值，讓我清楚營養素分配。太喜歡這模式了！', CAST(N'2026-02-21T21:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (172, 173, 3, 82, 5, N'態度很親切，不只給方法還給滿滿鼓勵。準備好開始執行了！ 感謝教練！', CAST(N'2025-10-04T15:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (173, 174, 2, 51, 1, N'靠北，只會一直推銷課程。爛到笑出來。', CAST(N'2025-12-04T00:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (174, 175, 1, 19, 5, N'完全命中問題，給了很好的調整方向。馬上推薦給朋友。 大推薦！', CAST(N'2025-10-30T23:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (175, 176, 12, 19, 4, N'真的很棒，讓我清楚營養素分配。太喜歡這模式了！ 大推薦！', CAST(N'2025-11-03T04:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (176, 177, 4, 72, 2, N'體驗極差，問問題都不想回。這種素質也能當教練？ 智商稅！', CAST(N'2025-10-08T23:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (177, 178, 5, 17, 3, N'跟預期不一樣，沒有完全針對我的狀況。希望下次能更好。 沒感覺。', CAST(N'2026-02-17T15:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (178, 179, 1, 63, 3, N'不太符合期待，沒有完全針對我的狀況。就這樣吧。 普普。', CAST(N'2025-12-21T00:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (179, 180, 3, 67, 4, N'真的很棒，給的建議超實用。超乎想像的好！ 感謝教練！', CAST(N'2025-12-24T07:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (180, 181, 2, 97, 5, N'非常感謝指導，給的建議超實用。真心推薦給大家。 錢花得很值得！', CAST(N'2025-12-22T19:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (181, 182, 7, 106, 3, N'表現平平，時間掌控上可再好一點。這點滿可惜的。 沒感覺。', CAST(N'2025-11-09T08:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (182, 183, 7, 23, 4, N'超級用心！給的建議超實用。超乎想像的好！ 大推薦！', CAST(N'2025-11-28T23:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (183, 184, 7, 80, 4, N'非常感謝指導，不只給方法還給滿滿鼓勵。絕對五星好評！ 大推薦！', CAST(N'2025-12-14T14:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (184, 185, 14, 65, 1, N'遇到這教練真倒楣，這點程度也敢出來教。絕對不會再來！ 智商稅！', CAST(N'2026-01-30T17:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (185, 186, 11, 88, 5, N'非常感謝指導，菜單很符合作息。絕對五星好評！ 超推！', CAST(N'2026-01-21T05:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (186, 187, 11, 84, 5, N'收穫超乎預期，對接下來備餐更有頭緒。真心推薦給大家。 感謝教練！', CAST(N'2025-11-06T22:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (187, 188, 1, 54, 1, N'體驗極差，講廢話就下課了。爛到笑出來。 避雷！', CAST(N'2025-10-24T04:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (188, 189, 10, 6, 5, N'收穫超乎預期，給了很好的調整方向。太喜歡這模式了！ 大推薦！', CAST(N'2026-02-06T02:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (189, 190, 5, 73, 4, N'完全命中問題，對接下來備餐更有頭緒。準備好開始執行了！ 感謝教練！', CAST(N'2025-09-30T18:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (190, 191, 1, 31, 1, N'這什麼白癡建議，只會一直推銷課程。絕對不會再來！', CAST(N'2026-02-04T20:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (191, 192, 1, 48, 5, N'非常感謝指導，解答了我的盲點。馬上推薦給朋友。 超推！', CAST(N'2025-11-26T07:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (192, 193, 7, 71, 3, N'有點小失望，建議不太好執行。就這樣吧。', CAST(N'2025-10-29T17:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (193, 194, 7, 11, 1, N'超級不專業，菜單根本不能吃。快點逃啊各位。 避雷！', CAST(N'2025-10-28T09:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (194, 195, 13, 19, 3, N'稍微可惜，希望多給實際的例子。可能需要多點客製化。 表現中規中矩。', CAST(N'2026-02-16T14:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (195, 196, 2, 22, 5, N'超級用心！菜單很符合作息。超乎想像的好！ 超推！', CAST(N'2025-09-20T09:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (196, 197, 3, 19, 4, N'真的很棒，給的建議超實用。期待下次的諮詢。 錢花得很值得！', CAST(N'2026-02-26T19:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (197, 198, 10, 63, 4, N'態度很親切，提供很多超商就能買的選擇。太喜歡這模式了！ 感謝教練！', CAST(N'2025-11-02T11:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (198, 199, 9, 84, 2, N'長那什麼醜八怪樣子，講廢話就下課了。氣到發抖。', CAST(N'2025-12-15T13:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (199, 200, 8, 99, 3, N'表現平平，時間掌控上可再好一點。或許不太適合我。 表現中規中矩。', CAST(N'2025-10-19T10:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (200, 201, 1, 73, 4, N'收穫超乎預期，提供很多超商就能買的選擇。超乎想像的好！ 錢花得很值得！', CAST(N'2025-10-24T01:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (201, 202, 2, 41, 5, N'真的很棒，菜單很符合作息。真心推薦給大家。 超推！', CAST(N'2026-02-12T15:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (202, 203, 1, 80, 1, N'體驗極差，連營養素都算錯。準備被投訴吧。 智商稅！', CAST(N'2026-03-16T04:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (203, 204, 12, 97, 4, N'超級用心！讓我清楚營養素分配。超乎想像的好！ 神仙教練！', CAST(N'2026-01-11T18:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (204, 205, 3, 28, 4, N'真的很棒，給的建議超實用。之後一定會再預約。 神仙教練！', CAST(N'2026-02-28T21:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (205, 206, 1, 65, 4, N'完全命中問題，細心客製化了我的計畫。收穫非常多。 大推薦！', CAST(N'2025-12-31T16:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (206, 207, 1, 67, 1, N'靠北，講廢話就下課了。準備被投訴吧。 避雷！', CAST(N'2026-02-15T17:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (207, 208, 1, 98, 4, N'真的很棒，給了很好的調整方向。收穫非常多。', CAST(N'2025-12-24T02:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (208, 209, 1, 22, 2, N'浪費我的時間，上課還在看手機。絕對不會再來！', CAST(N'2026-01-04T07:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (210, 211, 1, 90, 4, N'教練非常專業，解答了我的盲點。絕對五星好評！ 超推！', CAST(N'2025-10-30T07:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (211, 212, 1, 92, 3, N'感覺還好，建議不太好執行。算是買個經驗。', CAST(N'2026-02-02T21:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (212, 213, 1, 74, 4, N'超級用心！解答了我的盲點。更有動力了！ 超推！', CAST(N'2026-02-08T07:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (213, 214, 1, 60, 5, N'很喜歡這位營養師，不只給方法還給滿滿鼓勵。絕對五星好評！ 錢花得很值得！', CAST(N'2026-02-12T20:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (214, 215, 1, 91, 5, N'非常感謝指導，提供很多超商就能買的選擇。馬上推薦給朋友。 超推！', CAST(N'2026-02-27T17:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (215, 227, 2, 2, 5, N'胡營養師非常專業，解說得淺顯易懂，對我二月份的減重計畫幫助很大！超級推薦！', CAST(N'2026-02-01T14:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (216, 228, 2, 3, 5, N'胡營養師非常專業，解說得淺顯易懂，對我二月份的減重計畫幫助很大！超級推薦！', CAST(N'2026-02-02T14:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (217, 229, 2, 4, 5, N'胡營養師非常專業，解說得淺顯易懂，對我二月份的減重計畫幫助很大！超級推薦！', CAST(N'2026-02-03T14:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (218, 230, 2, 5, 4, N'給的建議很實用，如果能多點外食菜單的照片參考會更好！', CAST(N'2026-02-04T14:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (219, 231, 2, 6, 5, N'胡營養師非常專業，解說得淺顯易懂，對我二月份的減重計畫幫助很大！超級推薦！', CAST(N'2026-02-05T14:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (220, 232, 2, 7, 5, N'胡營養師非常專業，解說得淺顯易懂，對我二月份的減重計畫幫助很大！超級推薦！', CAST(N'2026-02-06T14:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (221, 233, 2, 8, 5, N'胡營養師非常專業，解說得淺顯易懂，對我二月份的減重計畫幫助很大！超級推薦！', CAST(N'2026-02-07T14:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (222, 234, 2, 9, 4, N'給的建議很實用，如果能多點外食菜單的照片參考會更好！', CAST(N'2026-02-08T14:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (223, 235, 2, 10, 5, N'胡營養師非常專業，解說得淺顯易懂，對我二月份的減重計畫幫助很大！超級推薦！', CAST(N'2026-02-09T14:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (224, 236, 2, 11, 5, N'胡營養師非常專業，解說得淺顯易懂，對我二月份的減重計畫幫助很大！超級推薦！', CAST(N'2026-02-10T14:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (225, 237, 2, 12, 5, N'胡營養師非常專業，解說得淺顯易懂，對我二月份的減重計畫幫助很大！超級推薦！', CAST(N'2026-02-11T14:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (226, 238, 2, 13, 4, N'給的建議很實用，如果能多點外食菜單的照片參考會更好！', CAST(N'2026-02-12T14:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (227, 239, 2, 14, 5, N'胡營養師非常專業，解說得淺顯易懂，對我二月份的減重計畫幫助很大！超級推薦！', CAST(N'2026-02-13T14:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (228, 240, 2, 15, 5, N'胡營養師非常專業，解說得淺顯易懂，對我二月份的減重計畫幫助很大！超級推薦！', CAST(N'2026-02-14T14:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (229, 241, 2, 16, 5, N'胡營養師非常專業，解說得淺顯易懂，對我二月份的減重計畫幫助很大！超級推薦！', CAST(N'2026-02-15T14:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (230, 242, 2, 17, 4, N'給的建議很實用，如果能多點外食菜單的照片參考會更好！', CAST(N'2026-02-16T14:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (231, 243, 2, 18, 5, N'胡營養師非常專業，解說得淺顯易懂，對我二月份的減重計畫幫助很大！超級推薦！', CAST(N'2026-02-17T14:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (232, 244, 2, 19, 5, N'胡營養師非常專業，解說得淺顯易懂，對我二月份的減重計畫幫助很大！超級推薦！', CAST(N'2026-02-18T14:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (233, 245, 2, 20, 5, N'胡營養師非常專業，解說得淺顯易懂，對我二月份的減重計畫幫助很大！超級推薦！', CAST(N'2026-02-19T14:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Reviews] ([Id], [ReserveOrderId], [InstructorId], [MemberId], [Rating], [Comment], [CreatedAt], [IsBanned]) VALUES (234, 246, 2, 1, 4, N'給的建議很實用，如果能多點外食菜單的照片參考會更好！', CAST(N'2026-02-20T14:00:00.0000000' AS DateTime2), 0)
GO
SET IDENTITY_INSERT [dbo].[Reviews] OFF
GO
SET IDENTITY_INSERT [dbo].[RoleFunctions] ON 
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (142, 2, 18)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (143, 2, 19)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (144, 2, 20)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (145, 2, 31)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (146, 2, 32)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (147, 2, 34)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (148, 2, 49)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (53, 3, 18)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (54, 3, 25)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (55, 3, 26)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (56, 3, 27)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (57, 3, 35)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (58, 3, 36)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (59, 3, 37)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (49, 4, 18)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (50, 4, 28)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (51, 4, 29)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (52, 4, 30)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (60, 4, 35)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (61, 4, 36)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (62, 4, 37)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (1102, 5, 18)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (1103, 5, 21)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (1104, 5, 22)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (1105, 5, 23)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (1106, 5, 24)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (1107, 5, 25)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (1108, 5, 26)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (1109, 5, 27)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (1110, 5, 28)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (1111, 5, 29)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (1112, 5, 30)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (1113, 5, 31)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (1114, 5, 32)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (1115, 5, 33)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (1116, 5, 40)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (1117, 5, 41)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (1118, 5, 42)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (1119, 5, 43)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (1120, 5, 44)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (1121, 5, 45)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (1122, 5, 46)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (1123, 5, 47)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (1124, 5, 48)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (1125, 5, 49)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (1126, 5, 50)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (1127, 5, 51)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (1128, 5, 52)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (63, 10, 35)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (64, 10, 36)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (65, 10, 37)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (66, 10, 38)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (67, 10, 39)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (106, 11, 18)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (107, 11, 19)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (108, 11, 20)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (109, 11, 21)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (110, 11, 22)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (111, 11, 23)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (112, 11, 24)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (113, 11, 25)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (114, 11, 26)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (115, 11, 27)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (116, 11, 28)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (117, 11, 29)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (118, 11, 30)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (119, 11, 31)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (120, 11, 32)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (121, 11, 33)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (122, 11, 34)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (123, 11, 35)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (124, 11, 36)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (125, 11, 37)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (126, 11, 38)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (127, 11, 39)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (128, 11, 40)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (129, 11, 41)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (130, 11, 42)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (131, 11, 43)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (132, 11, 44)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (133, 11, 45)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (134, 11, 46)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (135, 11, 47)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (136, 11, 48)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (137, 11, 49)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (140, 11, 50)
GO
INSERT [dbo].[RoleFunctions] ([Id], [RoleId], [FunctionId]) VALUES (141, 11, 51)
GO
SET IDENTITY_INSERT [dbo].[RoleFunctions] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([Id], [RoleName], [IsActive], [Description]) VALUES (1, N'member', 1, N'登入會員，可使用飲食、生理數據紀錄、方案購買權限、購買運動用品')
GO
INSERT [dbo].[Roles] ([Id], [RoleName], [IsActive], [Description]) VALUES (2, N'instructor', 1, N'專業教練')
GO
INSERT [dbo].[Roles] ([Id], [RoleName], [IsActive], [Description]) VALUES (3, N'purchasor', 1, N'採購人員，負責上下架商品及庫存管理')
GO
INSERT [dbo].[Roles] ([Id], [RoleName], [IsActive], [Description]) VALUES (4, N'marketor', 1, N'行銷人員，負責制定促銷方案或活動折扣')
GO
INSERT [dbo].[Roles] ([Id], [RoleName], [IsActive], [Description]) VALUES (5, N'admin', 1, N'系統管理員')
GO
INSERT [dbo].[Roles] ([Id], [RoleName], [IsActive], [Description]) VALUES (6, N'visitor', 1, N'訪客(未登入前)，只能瀏覽網頁')
GO
INSERT [dbo].[Roles] ([Id], [RoleName], [IsActive], [Description]) VALUES (10, N'manager', 1, N'部門主管，負責審核請假申請')
GO
INSERT [dbo].[Roles] ([Id], [RoleName], [IsActive], [Description]) VALUES (11, N'Role_forDemo', 1, N'Demo用 包含所有權限')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Shifts] ON 
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (1, 2, CAST(N'2026-03-08' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (2, 2, CAST(N'2026-03-10' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (3, 2, CAST(N'2026-03-07' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (4, 2, CAST(N'2026-03-14' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (5, 2, CAST(N'2026-03-06' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (7, 2, CAST(N'2026-03-11' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (8, 2, CAST(N'2026-03-09' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (9, 2, CAST(N'2026-03-16' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (10, 2, CAST(N'2026-03-10' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (11, 2, CAST(N'2025-12-21' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (12, 2, CAST(N'2025-12-11' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (13, 2, CAST(N'2026-01-04' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (15, 2, CAST(N'2026-03-15' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (76, 5, CAST(N'2025-10-22' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (77, 7, CAST(N'2025-12-20' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (78, 4, CAST(N'2025-10-28' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (79, 11, CAST(N'2025-10-03' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (80, 4, CAST(N'2026-03-16' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (81, 5, CAST(N'2026-02-15' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (82, 5, CAST(N'2025-12-30' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (83, 6, CAST(N'2026-03-02' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (84, 9, CAST(N'2026-01-14' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (85, 11, CAST(N'2025-12-10' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (86, 13, CAST(N'2025-12-20' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (87, 5, CAST(N'2026-01-26' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (88, 11, CAST(N'2025-09-20' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (89, 8, CAST(N'2026-02-19' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (90, 2, CAST(N'2025-12-12' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (91, 2, CAST(N'2025-11-11' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (92, 3, CAST(N'2026-01-01' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (93, 9, CAST(N'2025-12-02' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (94, 2, CAST(N'2025-12-08' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (95, 9, CAST(N'2026-02-24' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (96, 1, CAST(N'2026-03-02' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (97, 7, CAST(N'2026-02-20' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (98, 9, CAST(N'2026-01-28' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (99, 14, CAST(N'2026-03-14' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (100, 11, CAST(N'2025-10-02' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (101, 3, CAST(N'2026-01-26' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (102, 14, CAST(N'2026-03-02' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (103, 4, CAST(N'2025-12-03' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (104, 10, CAST(N'2025-10-30' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (105, 3, CAST(N'2026-02-05' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (107, 12, CAST(N'2025-12-26' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (108, 5, CAST(N'2026-03-02' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (109, 3, CAST(N'2025-10-21' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (110, 13, CAST(N'2026-02-05' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (111, 8, CAST(N'2025-12-13' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (112, 8, CAST(N'2026-02-27' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (113, 4, CAST(N'2025-12-06' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (114, 2, CAST(N'2025-10-23' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (115, 7, CAST(N'2025-12-03' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (116, 13, CAST(N'2026-01-10' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (117, 6, CAST(N'2026-01-03' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (118, 5, CAST(N'2026-01-22' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (119, 10, CAST(N'2026-02-13' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (120, 7, CAST(N'2025-09-28' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (121, 6, CAST(N'2026-02-18' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (122, 3, CAST(N'2026-03-03' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (123, 1, CAST(N'2025-12-17' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (124, 8, CAST(N'2025-10-23' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (125, 12, CAST(N'2025-11-12' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (126, 13, CAST(N'2026-02-02' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (127, 7, CAST(N'2026-01-11' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (128, 3, CAST(N'2025-10-18' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (129, 4, CAST(N'2025-10-29' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (130, 1, CAST(N'2025-09-20' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (131, 7, CAST(N'2025-10-29' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (132, 1, CAST(N'2025-10-08' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (133, 11, CAST(N'2025-10-08' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (134, 6, CAST(N'2026-02-06' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (135, 3, CAST(N'2026-01-25' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (136, 11, CAST(N'2025-11-02' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (137, 4, CAST(N'2025-10-13' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (138, 9, CAST(N'2025-10-07' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (139, 7, CAST(N'2025-10-12' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (140, 2, CAST(N'2025-12-25' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (141, 9, CAST(N'2025-12-30' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (142, 12, CAST(N'2026-03-13' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (143, 7, CAST(N'2026-01-19' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (144, 6, CAST(N'2025-09-25' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (145, 13, CAST(N'2025-11-02' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (146, 9, CAST(N'2025-10-02' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (147, 11, CAST(N'2025-11-05' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (148, 5, CAST(N'2025-10-10' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (149, 10, CAST(N'2025-12-09' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (150, 13, CAST(N'2025-10-08' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (151, 14, CAST(N'2025-10-10' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (152, 3, CAST(N'2025-11-09' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (153, 6, CAST(N'2025-10-23' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (154, 5, CAST(N'2026-03-13' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (155, 5, CAST(N'2025-09-23' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (156, 2, CAST(N'2026-01-26' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (157, 13, CAST(N'2026-03-15' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (158, 7, CAST(N'2025-10-26' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (159, 14, CAST(N'2025-12-30' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (160, 6, CAST(N'2025-12-06' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (161, 8, CAST(N'2026-01-01' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (162, 6, CAST(N'2026-01-27' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (163, 1, CAST(N'2026-02-01' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (164, 14, CAST(N'2026-03-09' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (165, 4, CAST(N'2025-11-10' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (166, 5, CAST(N'2025-11-17' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (167, 8, CAST(N'2026-03-06' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (168, 11, CAST(N'2026-01-24' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (169, 7, CAST(N'2026-03-02' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (170, 5, CAST(N'2025-12-17' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (171, 9, CAST(N'2025-10-11' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (172, 11, CAST(N'2025-10-12' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (173, 9, CAST(N'2025-09-30' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (174, 14, CAST(N'2025-11-01' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (175, 8, CAST(N'2025-12-30' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (176, 9, CAST(N'2025-11-19' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (177, 8, CAST(N'2025-11-25' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (178, 10, CAST(N'2025-10-17' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (179, 5, CAST(N'2025-12-06' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (180, 1, CAST(N'2026-03-10' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (181, 9, CAST(N'2025-09-22' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (182, 12, CAST(N'2025-12-14' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (183, 11, CAST(N'2026-03-04' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (184, 1, CAST(N'2026-01-10' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (185, 14, CAST(N'2025-12-16' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (186, 10, CAST(N'2025-12-11' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (187, 6, CAST(N'2026-01-30' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (188, 6, CAST(N'2026-03-15' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (189, 9, CAST(N'2025-10-25' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (190, 4, CAST(N'2025-12-05' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (191, 12, CAST(N'2025-12-16' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (192, 4, CAST(N'2026-01-19' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (193, 14, CAST(N'2025-12-23' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (194, 4, CAST(N'2026-01-31' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (195, 14, CAST(N'2026-01-19' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (196, 1, CAST(N'2025-11-05' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (197, 2, CAST(N'2025-10-21' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (198, 4, CAST(N'2025-10-27' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (199, 10, CAST(N'2026-02-01' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (200, 10, CAST(N'2025-11-11' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (201, 5, CAST(N'2025-10-24' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (202, 13, CAST(N'2025-10-10' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (203, 14, CAST(N'2025-12-01' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (204, 3, CAST(N'2026-01-27' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (205, 4, CAST(N'2025-12-14' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (206, 4, CAST(N'2026-01-11' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (207, 6, CAST(N'2025-10-11' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (208, 3, CAST(N'2026-02-22' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (209, 8, CAST(N'2025-10-13' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (210, 4, CAST(N'2025-10-02' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (212, 11, CAST(N'2025-12-17' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (213, 6, CAST(N'2026-01-20' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (214, 5, CAST(N'2025-10-01' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (215, 11, CAST(N'2025-12-24' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (216, 5, CAST(N'2025-10-07' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (217, 2, CAST(N'2025-11-19' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (218, 5, CAST(N'2026-02-04' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (219, 11, CAST(N'2025-11-18' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (220, 6, CAST(N'2025-11-11' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (221, 1, CAST(N'2025-11-10' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (222, 7, CAST(N'2025-11-17' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (223, 6, CAST(N'2025-10-05' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (224, 2, CAST(N'2026-02-24' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (225, 7, CAST(N'2026-02-21' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (226, 9, CAST(N'2026-02-11' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (227, 2, CAST(N'2026-01-26' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (228, 4, CAST(N'2025-09-23' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (229, 4, CAST(N'2025-10-07' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (230, 4, CAST(N'2025-12-04' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (231, 3, CAST(N'2026-02-19' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (232, 9, CAST(N'2025-10-03' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (233, 12, CAST(N'2025-12-03' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (234, 12, CAST(N'2025-10-30' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (235, 14, CAST(N'2025-11-03' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (236, 3, CAST(N'2025-10-07' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (237, 7, CAST(N'2026-02-16' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (238, 1, CAST(N'2025-12-19' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (239, 3, CAST(N'2025-12-24' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (240, 5, CAST(N'2025-12-22' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (241, 2, CAST(N'2025-11-09' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (242, 9, CAST(N'2025-11-27' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (243, 3, CAST(N'2025-12-13' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (244, 2, CAST(N'2026-01-30' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (245, 1, CAST(N'2026-01-19' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (246, 12, CAST(N'2025-11-04' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (247, 4, CAST(N'2025-10-24' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (248, 5, CAST(N'2026-02-04' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (249, 1, CAST(N'2025-09-29' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (250, 3, CAST(N'2026-02-03' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (251, 2, CAST(N'2025-11-25' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (252, 7, CAST(N'2025-10-27' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (253, 7, CAST(N'2025-10-27' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (254, 7, CAST(N'2026-02-14' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (255, 14, CAST(N'2025-09-20' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (256, 11, CAST(N'2026-02-26' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (257, 11, CAST(N'2025-11-01' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (258, 1, CAST(N'2025-12-14' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (259, 10, CAST(N'2025-10-19' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (260, 5, CAST(N'2025-10-23' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (261, 1, CAST(N'2026-02-10' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (262, 1, CAST(N'2026-03-15' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (263, 7, CAST(N'2026-01-11' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (264, 7, CAST(N'2026-02-26' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (265, 13, CAST(N'2025-12-31' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (266, 2, CAST(N'2026-02-14' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (267, 3, CAST(N'2025-12-23' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (268, 10, CAST(N'2026-01-03' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (269, 9, CAST(N'2025-10-28' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (270, 8, CAST(N'2026-01-31' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (271, 1, CAST(N'2026-02-07' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (272, 2, CAST(N'2026-02-10' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (273, 1, CAST(N'2026-02-25' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (274, 12, CAST(N'2026-02-19' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (275, 3, CAST(N'2026-03-16' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (276, 1, CAST(N'2026-03-09' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (277, 1, CAST(N'2026-03-06' AS Date), N'09-10 (早)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (278, 1, CAST(N'2026-03-07' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (279, 1, CAST(N'2026-03-17' AS Date), N'09-10 (早)', 0)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (281, 1, CAST(N'2026-03-13' AS Date), N'09-10 (早)', 0)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (282, 1, CAST(N'2026-03-12' AS Date), N'14-15 (午)', 0)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (283, 1, CAST(N'2026-03-12' AS Date), N'18-19 (晚)', 0)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (284, 1, CAST(N'2026-03-19' AS Date), N'14-15 (午)', 0)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (285, 1, CAST(N'2026-03-24' AS Date), N'14-15 (午)', 0)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (288, 1, CAST(N'2026-03-23' AS Date), N'14-15 (午)', 0)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (289, 1, CAST(N'2026-03-21' AS Date), N'14-15 (午)', 0)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (290, 1, CAST(N'2026-03-20' AS Date), N'18-19 (晚)', 0)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (292, 2, CAST(N'2026-03-25' AS Date), N'18-19 (晚)', 0)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (296, 2, CAST(N'2026-03-21' AS Date), N'14-15 (午)', 0)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (297, 2, CAST(N'2026-03-21' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (298, 2, CAST(N'2026-03-25' AS Date), N'18-19 (晚)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (300, 2, CAST(N'2026-02-01' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (301, 2, CAST(N'2026-02-02' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (302, 2, CAST(N'2026-02-03' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (303, 2, CAST(N'2026-02-04' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (304, 2, CAST(N'2026-02-05' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (305, 2, CAST(N'2026-02-06' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (306, 2, CAST(N'2026-02-07' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (307, 2, CAST(N'2026-02-08' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (308, 2, CAST(N'2026-02-09' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (309, 2, CAST(N'2026-02-10' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (310, 2, CAST(N'2026-02-11' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (311, 2, CAST(N'2026-02-12' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (312, 2, CAST(N'2026-02-13' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (313, 2, CAST(N'2026-02-14' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (314, 2, CAST(N'2026-02-15' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (315, 2, CAST(N'2026-02-16' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (316, 2, CAST(N'2026-02-17' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (317, 2, CAST(N'2026-02-18' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (318, 2, CAST(N'2026-02-19' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (319, 2, CAST(N'2026-02-20' AS Date), N'14-15 (午)', 1)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (320, 2, CAST(N'2026-03-27' AS Date), N'09-10 (早)', 0)
GO
INSERT [dbo].[Shifts] ([Id], [InstructorId], [ScheduleDate], [TimeSlot], [IsBooked]) VALUES (321, 2, CAST(N'2026-03-29' AS Date), N'18-19 (晚)', 0)
GO
SET IDENTITY_INSERT [dbo].[Shifts] OFF
GO
SET IDENTITY_INSERT [dbo].[TopUpPlans] ON 
GO
INSERT [dbo].[TopUpPlans] ([Id], [PlanName], [ImageUrl], [Price], [Points], [Description], [IsActive], [SortOrder]) VALUES (1, N'單堂體驗方案', N'/images/plans/plan_01.jpg', CAST(1000 AS Decimal(18, 0)), 1, N'購買 1 點，適合初次體驗諮詢課程的學員。', 1, 1)
GO
INSERT [dbo].[TopUpPlans] ([Id], [PlanName], [ImageUrl], [Price], [Points], [Description], [IsActive], [SortOrder]) VALUES (2, N'雙效入門方案', N'/images/plans/plan_02.jpg', CAST(1800 AS Decimal(18, 0)), 2, N'購買 2 點，享 9 折優惠，適合有短期諮詢需求的你。', 1, 2)
GO
INSERT [dbo].[TopUpPlans] ([Id], [PlanName], [ImageUrl], [Price], [Points], [Description], [IsActive], [SortOrder]) VALUES (3, N'五星進階方案', N'/images/plans/plan_03.jpg', CAST(4000 AS Decimal(18, 0)), 5, N'購買 5 點，享 8 折優惠，單次諮詢低至 800 元！', 1, 3)
GO
INSERT [dbo].[TopUpPlans] ([Id], [PlanName], [ImageUrl], [Price], [Points], [Description], [IsActive], [SortOrder]) VALUES (4, N'十分超值方案', N'/images/plans/plan_04.jpg', CAST(7000 AS Decimal(18, 0)), 10, N'購買 10 點，享 7 折優惠，穩定長期諮詢的最佳選擇。', 1, 4)
GO
INSERT [dbo].[TopUpPlans] ([Id], [PlanName], [ImageUrl], [Price], [Points], [Description], [IsActive], [SortOrder]) VALUES (5, N'尊榮鐵粉方案', N'/images/plans/plan_05.jpg', CAST(12000 AS Decimal(18, 0)), 20, N'購買 20 點，享 6 折最高優惠，單次只要 600 元，買到賺到！', 1, 5)
GO
SET IDENTITY_INSERT [dbo].[TopUpPlans] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRoles] ON 
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3152, 1, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (2, 2, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3, 3, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (6, 6, 3)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (7, 7, 3)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (8, 8, 4)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (9, 9, 4)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (11, 11, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (12, 12, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (1002, 13, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (4164, 1014, 5)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3183, 2013, 2)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3184, 2014, 2)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3185, 2015, 2)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3186, 2016, 2)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3187, 2017, 2)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3188, 2018, 2)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3189, 2019, 2)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3190, 2020, 2)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3191, 2021, 2)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3192, 2022, 2)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3193, 2023, 2)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3194, 2024, 2)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3195, 2025, 2)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3196, 2026, 2)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3022, 2027, 3)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3023, 2028, 3)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3024, 2029, 3)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3025, 2030, 3)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3026, 2031, 3)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3027, 2032, 3)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3028, 2033, 3)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3029, 2034, 3)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3030, 2035, 3)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3031, 2036, 3)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3032, 2037, 4)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3033, 2038, 4)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3034, 2039, 4)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3035, 2040, 4)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3036, 2041, 4)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3037, 2042, 4)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3038, 2043, 4)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3039, 2044, 4)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3040, 2045, 4)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3041, 2046, 4)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (4165, 2047, 5)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (4166, 2048, 5)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (4167, 2049, 5)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (4168, 2050, 5)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (4169, 2051, 5)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3047, 2052, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3048, 2053, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3049, 2054, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3050, 2055, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3051, 2056, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3052, 2057, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3053, 2058, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3054, 2059, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3055, 2060, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3056, 2061, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3057, 2062, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3058, 2063, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3059, 2064, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3060, 2065, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3061, 2066, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3062, 2067, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3063, 2068, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3064, 2069, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3065, 2070, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3066, 2071, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3067, 2072, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3068, 2073, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3069, 2074, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3070, 2075, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3071, 2076, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3072, 2077, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3073, 2078, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3074, 2079, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3075, 2080, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3076, 2081, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3077, 2082, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3078, 2083, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3079, 2084, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3080, 2085, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3081, 2086, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3082, 2087, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3083, 2088, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3084, 2089, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3085, 2090, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3086, 2091, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3087, 2092, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3088, 2093, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3089, 2094, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3090, 2095, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3091, 2096, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3092, 2097, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3093, 2098, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3094, 2099, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3095, 2100, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3096, 2101, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3097, 2102, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3098, 2103, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3099, 2104, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3100, 2105, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3101, 2106, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3102, 2107, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3103, 2108, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3104, 2109, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3105, 2110, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3106, 2111, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3107, 2112, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3108, 2113, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3109, 2114, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3110, 2115, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3111, 2116, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3112, 2117, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3113, 2118, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3114, 2119, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3115, 2120, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3116, 2121, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3117, 2122, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3118, 2123, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3119, 2124, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3120, 2125, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3121, 2126, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3122, 2127, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3123, 2128, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3124, 2129, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3125, 2130, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3126, 2131, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3127, 2132, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3128, 2133, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3129, 2134, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3130, 2135, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3131, 2136, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3132, 2137, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3133, 2138, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3134, 2139, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3135, 2140, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3136, 2141, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3137, 2142, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3138, 2143, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3139, 2144, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3140, 2145, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3141, 2146, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3142, 2147, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3143, 2148, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3144, 2149, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3145, 2150, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3146, 2151, 1)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (4156, 2152, 3)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (4157, 2152, 10)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3148, 2153, 10)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3149, 2154, 10)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3150, 2155, 10)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (4154, 3156, 3)
GO
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (1, N'liulinjin01', N'AQAAAAIAAYagAAAAEP0mUPSkyrn6ftw1a8vThzMKvFPhVLAbw9ZYw0orGTG21UdoTbEN9jiMWPLT/y+swQ==', N'劉林瑾', N'alice@example.com', N'0912345601', 1, 0, NULL, NULL, N'3e8b83608fe64a63b82f13fc9b61c02a', CAST(N'2026-03-09T17:38:06.0000000' AS DateTime2))
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2, N'chenhanmu02', N'AQAAAAIAAYagAAAAEP0mUPSkyrn6ftw1a8vThzMKvFPhVLAbw9ZYw0orGTG21UdoTbEN9jiMWPLT/y+swQ==', N'陳涵沐', N'bob@example.com', N'0912345602', 1, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (3, N'linlannan03', N'AQAAAAIAAYagAAAAEP0mUPSkyrn6ftw1a8vThzMKvFPhVLAbw9ZYw0orGTG21UdoTbEN9jiMWPLT/y+swQ==', N'林蘭楠', N'carol@example.com', N'0912345603', 1, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (6, N'chenshuan04', N'AQAAAAIAAYagAAAAEP0mUPSkyrn6ftw1a8vThzMKvFPhVLAbw9ZYw0orGTG21UdoTbEN9jiMWPLT/y+swQ==', N'陳書安', N'frank@example.com', N'0912345606', 1, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (7, N'huqingqing05', N'AQAAAAIAAYagAAAAEP0mUPSkyrn6ftw1a8vThzMKvFPhVLAbw9ZYw0orGTG21UdoTbEN9jiMWPLT/y+swQ==', N'胡清清', N'grace@example.com', N'0912345607', 1, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (8, N'lishilin06', N'AQAAAAIAAYagAAAAEP0mUPSkyrn6ftw1a8vThzMKvFPhVLAbw9ZYw0orGTG21UdoTbEN9jiMWPLT/y+swQ==', N'李詩林', N'henry@example.com', N'0912345608', 1, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (9, N'wulangyan07', N'AQAAAAIAAYagAAAAEP0mUPSkyrn6ftw1a8vThzMKvFPhVLAbw9ZYw0orGTG21UdoTbEN9jiMWPLT/y+swQ==', N'吳朗妍', N'iris@example.com', N'0912345609', 1, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (11, N'gaozhuohang08', NULL, N'高卓航', N'kevin.google@gmail.com', N'0912345611', 1, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (12, N'luomuchen09', N'AQAAAAIAAYagAAAAEKXNcyRsUPCGPi/VWEPStx7Ab1Ea7APP+o7+Fa5GcpiODzES8R625L39OoB/CnVMYA==', N'羅沐晨', N'myfitnesscoach2026+staff@gmail.com', N'0912345612', 1, 1, NULL, NULL, N'b8e5fa68426b4b659042172ad143dfe7', CAST(N'2026-03-20T13:25:43.0000000' AS DateTime2))
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (13, N'xuyaoze10', N'AQAAAAIAAYagAAAAEP0mUPSkyrn6ftw1a8vThzMKvFPhVLAbw9ZYw0orGTG21UdoTbEN9jiMWPLT/y+swQ==', N'徐瑤澤', N'aaaa@bbbbb.com', N'0912345678', 0, 0, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (1014, N'zhouchenhan11', N'AQAAAAIAAYagAAAAEMj7/DwGlJfLr+SnWkq+6QFfV5sAiy+6tGqHH26BQChTjJV0YoX1XMq/spoGlW7rew==', N'周晨涵', N'zhouchenhan11@myfitnesscoach.com', NULL, 1, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2013, N'huqingwei12', N'AQAAAAIAAYagAAAAEM6qBWR8ds8S4bO3TD6fbDCAVU3jSsdIyqqrq0eglFErU4jIfQIlBjgq16BRCxLq1g==', N'胡青薇', N'huqingwei12@gmail.com', NULL, 1, 1, NULL, NULL, N'548f4ac32df64846b3acbabe295ba01a', CAST(N'2026-03-19T16:34:45.0000000' AS DateTime2))
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2014, N'liweiyin13', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'李薇音', N'liweiyin13@gmail.com', NULL, 1, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2015, N'luoqinglin14', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'羅青林', N'nutri1@fitness.com', N'0912384756', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2016, N'zhouanrou15', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'周安柔', N'nutri2@fitness.com', N'0921475869', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2017, N'zhuchenyuan16', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'朱辰遠', N'nutri3@fitness.com', N'0933582417', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2018, N'linningran17', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'林寧然', N'nutri4@fitness.com', N'0975614238', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2019, N'liyaoqing18', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'李瑤清', N'nutri5@fitness.com', N'0988231457', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2020, N'herouran19', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'何柔然', N'nutri6@fitness.com', N'0919456782', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2021, N'liuweiyin20', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'劉薇音', N'nutri7@fitness.com', N'0928374651', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2022, N'lizeqing21', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'李澤清', N'nutri8@fitness.com', N'0932145698', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2023, N'linranlan22', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'林然蘭', N'nutri9@fitness.com', N'0955874123', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2024, N'maruoyun23', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'馬若雲', N'nutri10@fitness.com', N'0910234567', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2025, N'lilangyao24', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'李朗瑤', N'nutri11@fitness.com', N'0963214587', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2026, N'gaojingwei25', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'高景薇', N'nutri12@fitness.com', N'0972581436', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2027, N'gaoqingxing26', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'高清星', N'purch1@fitness.com', N'0937123456', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2028, N'wangyinning27', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'王音寧', N'purch2@fitness.com', N'0911223344', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2029, N'zhaochenting28', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'趙晨庭', N'purch3@fitness.com', N'0922334455', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2030, N'gaoshining29', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'高詩寧', N'purch4@fitness.com', N'0955667788', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2031, N'maruoyao30', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'馬若瑤', N'purch5@fitness.com', N'0966778899', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2032, N'zhanglinjin31', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'張霖瑾', N'purch6@fitness.com', N'0977889900', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2033, N'wuqingyang32', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'吳青揚', N'purch7@fitness.com', N'0988990011', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2034, N'heyaze33', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'何雅澤', N'purch8@fitness.com', N'0900112233', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2035, N'liuchenrou34', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'劉晨柔', N'purch9@fitness.com', N'0911558899', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2036, N'huangyanghang35', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'黃揚航', N'purch10@fitness.com', N'0922446688', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2037, N'zhaoyuqing36', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'趙宇清', N'market1@fitness.com', N'0910001111', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2038, N'chenrouchen37', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'陳柔辰', N'market2@fitness.com', N'0920002222', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2039, N'yangyangyuan38', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'楊揚遠', N'market3@fitness.com', N'0930003333', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2040, N'huanghanya39', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'黃涵雅', N'market4@fitness.com', N'0940004444', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2041, N'sunnanqing40', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'孫楠清', N'market5@fitness.com', N'0950005555', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2042, N'zhanglangwei41', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'張朗薇', N'market6@fitness.com', N'0960006666', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2043, N'zhaoweimu42', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'趙薇沐', N'market7@fitness.com', N'0970007777', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2044, N'sunanwei43', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'孫安薇', N'market8@fitness.com', N'0980008888', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2045, N'liushumu44', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'劉書沐', N'market9@fitness.com', N'0990009999', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2046, N'linchenshu45', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'林辰書', N'market10@fitness.com', N'0900000000', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2047, N'admin1', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'admin1', N'admin1@fitness.com', N'0912121212', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2048, N'admin2', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'admin2', N'admin2@fitness.com', N'0923232323', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2049, N'admin3', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'admin3', N'admin3@fitness.com', N'0934343434', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2050, N'admin4', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'admin4', N'admin4@fitness.com', N'0945454545', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2051, N'admin5', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'admin5', N'admin5@fitness.com', N'0956565656', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2052, N'linxuanyu51', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'林軒宇', N'member001@fitness.com', N'0960000001', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2053, N'liuyuanlang52', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'劉遠朗', N'member002@fitness.com', N'0960000002', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2054, N'huangyunyang53', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'黃雲揚', N'member003@fitness.com', N'0960000003', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2055, N'guohanqing54', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'郭涵清', N'member004@fitness.com', N'0960000004', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2056, N'sunyanshi55', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'孫妍詩', N'member005@fitness.com', N'0960000005', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2057, N'chenlinwei56', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'陳林薇', N'member006@fitness.com', N'0960000006', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2058, N'luoxinghao57', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'羅星皓', N'member007@fitness.com', N'0960000007', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2059, N'xuyangan58', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'徐揚安', N'member008@fitness.com', N'0960000008', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2060, N'xuweizhuo59', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'徐薇卓', N'member009@fitness.com', N'0960000009', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2061, N'huangqingjin60', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'黃青瑾', N'member010@fitness.com', N'0960000010', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2062, N'liuhaoya61', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'劉皓雅', N'member011@fitness.com', N'0960000011', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2063, N'guoxinglang62', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'郭星朗', N'member012@fitness.com', N'0960000012', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2064, N'sunlanran63', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'孫蘭然', N'member013@fitness.com', N'0960000013', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2065, N'mayarou64', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'馬雅柔', N'member014@fitness.com', N'0960000014', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2066, N'chenshuxuan65', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'陳書軒', N'member015@fitness.com', N'0960000015', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2067, N'huqinghan66', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'胡清涵', N'member016@fitness.com', N'0960000016', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2068, N'wuxuanwei67', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'吳軒薇', N'member017@fitness.com', N'0960000017', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2069, N'guomuan68', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'郭沐安', N'member018@fitness.com', N'0960000018', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2070, N'zhangchenyao69', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'張晨瑤', N'member019@fitness.com', N'0960000019', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2071, N'heyunshu70', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'何雲書', N'member020@fitness.com', N'0960000020', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2072, N'luoweiwei71', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'羅薇薇', N'member021@fitness.com', N'0960000021', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2073, N'zhuyinyuan72', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'朱音遠', N'member022@fitness.com', N'0960000022', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2074, N'zhaohaoshi73', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'趙皓詩', N'member023@fitness.com', N'0960000023', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2075, N'maqingrou74', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'馬清柔', N'member024@fitness.com', N'0960000024', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2076, N'liuyaoze75', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'劉瑤澤', N'member025@fitness.com', N'0960000025', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2077, N'liuanhang76', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'劉安航', N'member026@fitness.com', N'0960000026', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2078, N'zhangzhuoqing77', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'張卓晴', N'member027@fitness.com', N'0960000027', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2079, N'guolinwei78', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'郭霖薇', N'member028@fitness.com', N'0960000028', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2080, N'zhangmulan79', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'張沐蘭', N'member029@fitness.com', N'0960000029', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2081, N'zhujinting80', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'朱瑾庭', N'member030@fitness.com', N'0960000030', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2082, N'maboze81', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'馬柏澤', N'member031@fitness.com', N'0960000031', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2083, N'zhoumuqing82', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'周沐青', N'member032@fitness.com', N'0960000032', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2084, N'zhaojingze83', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'趙景澤', N'member033@fitness.com', N'0960000033', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2085, N'zhangmuning84', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'張沐寧', N'member034@fitness.com', N'0960000034', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2086, N'zhaotingjing85', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'趙庭景', N'member035@fitness.com', N'0960000035', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2087, N'mananzhuo86', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'馬楠卓', N'member036@fitness.com', N'0960000036', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2088, N'guozhuolang87', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'郭卓朗', N'member037@fitness.com', N'0960000037', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2089, N'yangzechen88', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'楊澤辰', N'member038@fitness.com', N'0960000038', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2090, N'wuxinghao89', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'吳星皓', N'member039@fitness.com', N'0960000039', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2091, N'luozehan90', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'羅澤涵', N'member040@fitness.com', N'0960000040', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2092, N'sunhanyin91', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'孫涵音', N'member041@fitness.com', N'0960000041', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2093, N'luoqingning92', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'羅清寧', N'member042@fitness.com', N'0960000042', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2094, N'wulangchuan93', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'吳朗川', N'member043@fitness.com', N'0960000043', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2095, N'liyalin94', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'李雅霖', N'member044@fitness.com', N'0960000044', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2096, N'huyanting95', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'胡言庭', N'member045@fitness.com', N'0960000045', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2097, N'zhangchenya96', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'張辰雅', N'member046@fitness.com', N'0960000046', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2098, N'chenyuchen97', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'陳宇晨', N'member047@fitness.com', N'0960000047', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2099, N'zhanganyang98', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'張安揚', N'member048@fitness.com', N'0960000048', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2100, N'xuchenyun99', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'徐辰雲', N'member049@fitness.com', N'0960000049', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2101, N'zhurouqing100', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'朱柔青', N'member050@fitness.com', N'0960000050', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2102, N'gaomuyan101', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'高沐言', N'member051@fitness.com', N'0960000051', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2103, N'zhangxuanting102', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'張軒庭', N'member052@fitness.com', N'0960000052', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2104, N'yangnanhang103', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'楊楠航', N'member053@fitness.com', N'0960000053', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2105, N'luoyaoyan104', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'羅瑤妍', N'member054@fitness.com', N'0960000054', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2106, N'majingyin105', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'馬景音', N'member055@fitness.com', N'0960000055', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2107, N'xubaihao106', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'徐柏皓', N'member056@fitness.com', N'0960000056', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2108, N'zhuoruolang107', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'朱若朗', N'member057@fitness.com', N'0960000057', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2109, N'yangyuyang108', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'楊宇揚', N'member058@fitness.com', N'0960000058', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2110, N'zhaoyaoqing109', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'趙瑤清', N'member059@fitness.com', N'0960000059', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2111, N'heweihao110', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'何薇皓', N'member060@fitness.com', N'0960000060', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2112, N'zhouhangyu111', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'周航宇', N'member061@fitness.com', N'0960000061', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2113, N'wuweiyang112', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'吳薇揚', N'member062@fitness.com', N'0960000062', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2114, N'wulinyao113', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'吳霖瑤', N'member063@fitness.com', N'0960000063', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2115, N'zhouyunya114', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'周雲雅', N'member064@fitness.com', N'0960000064', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2116, N'zhouyanyang115', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'周言揚', N'member065@fitness.com', N'0960000065', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2117, N'sunbaihao116', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'孫柏皓', N'member066@fitness.com', N'0960000066', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2118, N'sunruozhuo117', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'孫若卓', N'member067@fitness.com', N'0960000067', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2119, N'sunmumu118', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'孫沐沐', N'member068@fitness.com', N'0960000068', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2120, N'zhoulinyan119', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'周林妍', N'member069@fitness.com', N'0960000069', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2121, N'linzeting120', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'林澤庭', N'member070@fitness.com', N'0960000070', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2122, N'hejinze121', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'何瑾澤', N'member071@fitness.com', N'0960000071', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2123, N'wunanlin122', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'吳楠霖', N'member072@fitness.com', N'0960000072', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2124, N'wuyanhan123', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'吳言涵', N'member073@fitness.com', N'0960000073', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2125, N'luoweiyan124', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'羅薇言', N'member074@fitness.com', N'0960000074', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2126, N'heweihao125', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'何薇皓', N'member075@fitness.com', N'0960000075', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2127, N'zhoutingzhuo126', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'周庭卓', N'member076@fitness.com', N'0960000076', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2128, N'wuranze127', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'吳然澤', N'member077@fitness.com', N'0960000077', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2129, N'lizemu128', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'李澤沐', N'member078@fitness.com', N'0960000078', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2130, N'linyinting129', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'林音庭', N'member079@fitness.com', N'0960000079', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2131, N'heyuruo130', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'何宇若', N'member080@fitness.com', N'0960000080', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2132, N'gaoanqing131', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'高安清', N'member081@fitness.com', N'0960000081', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2133, N'zhaolangyao132', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'趙朗瑤', N'member082@fitness.com', N'0960000082', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2134, N'wangjinjin133', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'王瑾瑾', N'member083@fitness.com', N'0960000083', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2135, N'gaoyunan134', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'高雲安', N'member084@fitness.com', N'0960000084', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2136, N'malangyan135', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'馬朗妍', N'member085@fitness.com', N'0960000085', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2137, N'gaoqingan136', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'高晴安', N'member086@fitness.com', N'0960000086', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2138, N'liulinran137', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'劉霖然', N'member087@fitness.com', N'0960000087', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2139, N'huningya138', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'胡寧雅', N'member088@fitness.com', N'0960000088', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2140, N'zhouhangjing139', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'周航景', N'member089@fitness.com', N'0960000089', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2141, N'huqingyang140', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'胡晴揚', N'member090@fitness.com', N'0960000090', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2142, N'huyanshi141', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'胡言詩', N'member091@fitness.com', N'0960000091', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2143, N'zhuhaolin142', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'朱皓林', N'member092@fitness.com', N'0960000092', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2144, N'xumuyang143', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'徐沐揚', N'member093@fitness.com', N'0960000093', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2145, N'wuhanghang144', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'吳航航', N'member094@fitness.com', N'0960000094', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2146, N'wuyuxing145', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'吳宇星', N'member095@fitness.com', N'0960000095', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2147, N'huangshijing146', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'黃詩景', N'member096@fitness.com', N'0960000096', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2148, N'heyanyun147', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'何言雲', N'member097@fitness.com', N'0960000097', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2149, N'gaoyangbai148', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'高揚柏', N'member098@fitness.com', N'0960000098', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2150, N'zhuqinghan149', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'朱青涵', N'member099@fitness.com', N'0960000099', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2151, N'zhangxingnan150', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'張星楠', N'member100@fitness.com', N'0960000100', 1, 1, N'd516b394-c7dc-4d99-b17f-277bfa2627db', CAST(N'2026-03-08T09:49:59.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2152, N'chenzhiming1', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'陳志明', N'manager01@fitness.com', N'0960000001', 1, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2153, N'linmeiling2', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'林美玲', N'manager02@fitness.com', N'0960000002', 1, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2154, N'zhangjianguo3', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'張建國', N'manager03@fitness.com', N'0960000003', 1, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2155, N'wangshufen4', N'AQAAAAIAAYagAAAAEP55tPFRA+060E7a1jD4Q+h5/eTw7Tx1YONAEud0TZGOnZHB1t0UnPQqoyheaOXRSg==', N'王淑芬', N'manager04@fitness.com', N'0960000004', 1, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (2164, N'yvonne123', N'AQAAAAIAAYagAAAAEGLZp+rFxGKimCmUWkzGrcP+T4bruq+/qJbsy4GhJVSTxbne40OR9XqY1jaPdMc2sQ==', N'吳怡潁', N'yiyingwu0423@gmail.com', NULL, 1, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (3156, NULL, NULL, N'吳怡潁', N'myfitnesscoach2026+register@gmail.com', NULL, 0, 1, N'ddbbf352-188d-41f8-847a-50bb55a916db', CAST(N'2026-03-27T11:09:28.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (3157, N'yvonne456', N'AQAAAAIAAYagAAAAEIM3kqhOBu7Q7/4lwJAwrDeWnUgUCmu4dCqzYsWfhlZuA4QccDl2M071T8fzD7tDEg==', N'吳怡潁', N'myfitnesscoach2026+register1@gmail.com', NULL, 1, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (3158, NULL, NULL, N'吳怡潁', N'myfitnesscoach2026+register2@gmail.com', NULL, 0, 1, N'45c945b9-1d00-43a9-91bc-e3b04825c0e8', CAST(N'2026-03-27T11:35:44.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (3159, N'demo1', N'AQAAAAIAAYagAAAAEIBgMfEEhMRJPPlgqhElTOYC4XGDHbBlAXHtlMYaZTjljMi41aHEpJUaXuV/8DV0iA==', N'吳怡潁', N'myfitnesscoach2026+register3@gmail.com', NULL, 1, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [Account], [HashedPassword], [UserName], [Email], [Mobile], [IsConfirmed], [IsActive], [NewMemberConfirmCode], [NewMemberConfirmCodeExpiry], [ResetPasswordConfirmCode], [ResetPasswordConfirmCodeExpiry]) VALUES (3160, NULL, NULL, N'吳怡潁', N'myfitnesscoach2026+register10@gmail.com', NULL, 0, 1, N'a23c8b5e-27e9-4be5-bd6e-7ade9aaadfca', CAST(N'2026-03-27T12:54:41.0000000' AS DateTime2), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserWallets] ON 
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (1, 1, CAST(2000.00 AS Decimal(10, 2)), CAST(N'2026-03-08T09:40:56.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (2, 2, CAST(500.00 AS Decimal(10, 2)), CAST(N'2026-03-08T09:40:56.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (3, 7, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (4, 8, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (5, 9, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (6, 10, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (7, 11, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (8, 12, CAST(1001.00 AS Decimal(10, 2)), CAST(N'2026-03-01T13:31:07.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (9, 13, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (10, 14, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (11, 15, CAST(1002.00 AS Decimal(10, 2)), CAST(N'2026-03-01T13:31:27.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (12, 16, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (13, 17, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (14, 18, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (15, 19, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (16, 20, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (17, 21, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (18, 22, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (19, 23, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (20, 24, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (21, 25, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (22, 26, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (23, 27, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (24, 28, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (25, 29, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (26, 30, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (27, 31, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (28, 32, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (29, 33, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (30, 34, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (31, 35, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (32, 36, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (33, 37, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (34, 38, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (35, 39, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (36, 40, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (37, 41, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (38, 42, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (39, 43, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (40, 44, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (41, 45, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (42, 46, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (43, 47, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (44, 48, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (45, 49, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (46, 50, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (47, 51, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (48, 52, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (49, 53, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (50, 54, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (51, 55, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (52, 56, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (53, 57, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (54, 58, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (55, 59, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (56, 60, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (57, 61, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (58, 62, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (59, 63, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (60, 64, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (61, 65, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (62, 66, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (63, 67, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (64, 68, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (65, 69, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (66, 70, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (67, 71, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (68, 72, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (69, 73, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (70, 74, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (71, 75, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (72, 76, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:13.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (73, 77, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:13.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (74, 78, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:13.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (75, 79, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:13.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (76, 80, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:13.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (77, 81, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:13.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (78, 82, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:13.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (79, 83, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:13.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (80, 84, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:13.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (81, 85, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:13.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (82, 86, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:13.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (83, 87, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:13.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (84, 88, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:13.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (85, 89, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:13.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (86, 90, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:13.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (87, 91, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:13.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (88, 92, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:13.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (89, 93, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:13.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (90, 94, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:13.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (91, 95, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:13.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (92, 96, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:13.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (93, 97, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:13.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (94, 98, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:13.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (95, 99, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:13.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (96, 100, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:13.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (97, 101, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:13.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (98, 102, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:13.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (99, 103, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:13.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (100, 104, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:13.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (101, 105, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:13.0000000' AS DateTime2))
GO
INSERT [dbo].[UserWallets] ([Id], [MemberId], [CurrentBalance], [LastUpdated]) VALUES (102, 106, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2026-03-15T21:04:13.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[UserWallets] OFF
GO
/****** Object:  Index [UQ_Employees_UserId]    Script Date: 2026/4/9 下午 04:46:56 ******/
ALTER TABLE [dbo].[Employees] ADD  CONSTRAINT [UQ_Employees_UserId] UNIQUE NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_LeaveBalances_Key]    Script Date: 2026/4/9 下午 04:46:56 ******/
ALTER TABLE [dbo].[LeaveBalances] ADD  CONSTRAINT [UQ_LeaveBalances_Key] UNIQUE NONCLUSTERED 
(
	[EmployeeId] ASC,
	[LeaveTypeId] ASC,
	[Year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_MemberViolations_MemberId]    Script Date: 2026/4/9 下午 04:46:56 ******/
ALTER TABLE [dbo].[MemberViolations] ADD  CONSTRAINT [UQ_MemberViolations_MemberId] UNIQUE NONCLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_RoleFunctions]    Script Date: 2026/4/9 下午 04:46:56 ******/
ALTER TABLE [dbo].[RoleFunctions] ADD  CONSTRAINT [UQ_RoleFunctions] UNIQUE NONCLUSTERED 
(
	[RoleId] ASC,
	[FunctionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Roles_RoleName]    Script Date: 2026/4/9 下午 04:46:56 ******/
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [UQ_Roles_RoleName] UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_UserRoles]    Script Date: 2026/4/9 下午 04:46:56 ******/
ALTER TABLE [dbo].[UserRoles] ADD  CONSTRAINT [UQ_UserRoles] UNIQUE NONCLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Users_Email]    Script Date: 2026/4/9 下午 04:46:56 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UQ_Users_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_UserWallets_Member]    Script Date: 2026/4/9 下午 04:46:56 ******/
ALTER TABLE [dbo].[UserWallets] ADD  CONSTRAINT [UQ_UserWallets_Member] UNIQUE NONCLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BodyRecords] ADD  CONSTRAINT [DF_BodyRecords_CreateAt]  DEFAULT (getdate()) FOR [CreateAt]
GO
ALTER TABLE [dbo].[Employees] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[FoodCategories] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[FoodRecords] ADD  DEFAULT (getdate()) FOR [EatDT]
GO
ALTER TABLE [dbo].[Foods] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Functions] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Holidays] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Instructors] ADD  DEFAULT ((1)) FOR [CancelCount]
GO
ALTER TABLE [dbo].[Instructors] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[LeaveApprovalDelegations] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[LeaveApprovalDelegations] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[LeaveAttachments] ADD  DEFAULT (getdate()) FOR [UploadedAt]
GO
ALTER TABLE [dbo].[LeaveBalanceHistories] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[LeaveBalances] ADD  DEFAULT ((0)) FOR [UsedDays]
GO
ALTER TABLE [dbo].[LeaveRequests] ADD  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[LeaveRequests] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[LeaveTypes] ADD  DEFAULT ((0)) FOR [CarryOver]
GO
ALTER TABLE [dbo].[LeaveTypes] ADD  DEFAULT ((0)) FOR [RequiresDoc]
GO
ALTER TABLE [dbo].[LeaveTypes] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[LeaveTypes] ADD  DEFAULT ('PreAllocated') FOR [QuotaType]
GO
ALTER TABLE [dbo].[Members] ADD  DEFAULT ((1)) FOR [CancelCount]
GO
ALTER TABLE [dbo].[MemberViolations] ADD  DEFAULT ((0)) FOR [WarningCount]
GO
ALTER TABLE [dbo].[MemberViolations] ADD  DEFAULT ((0)) FOR [IsSuspended]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[PointOrders] ADD  CONSTRAINT [DF__PointOrde__Creat__70DDC3D8]  DEFAULT (getdate()) FOR [CreateAt]
GO
ALTER TABLE [dbo].[PointsRecordDetails] ADD  DEFAULT (getdate()) FOR [CreateAt]
GO
ALTER TABLE [dbo].[ProductCategories] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ProductOrders] ADD  DEFAULT (getdate()) FOR [CreateAt]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF__Products__IsActi__7E37BEF6]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ReserveOrders] ADD  DEFAULT (getdate()) FOR [CreateAt]
GO
ALTER TABLE [dbo].[Reviews] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Reviews] ADD  CONSTRAINT [DF_Reviews_IsBanned]  DEFAULT ((0)) FOR [IsBanned]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Shifts] ADD  DEFAULT ((0)) FOR [IsBooked]
GO
ALTER TABLE [dbo].[TopUpPlans] ADD  CONSTRAINT [DF__TopUpPlan__IsAct__0B91BA14]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[TopUpPlans] ADD  CONSTRAINT [DF__TopUpPlan__SortO__0C85DE4D]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[UserWallets] ADD  DEFAULT ((0)) FOR [CurrentBalance]
GO
ALTER TABLE [dbo].[UserWallets] ADD  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[BodyRecords]  WITH CHECK ADD  CONSTRAINT [FK_BodyRecords_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[BodyRecords] CHECK CONSTRAINT [FK_BodyRecords_Members]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [FK_Dept_Manager] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [FK_Dept_Manager]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Dept] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Dept]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Manager] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Manager]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Users]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_WorkDel] FOREIGN KEY([WorkDelegateId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_WorkDel]
GO
ALTER TABLE [dbo].[FoodRecords]  WITH CHECK ADD  CONSTRAINT [FK_FoodRecords_Foods] FOREIGN KEY([FoodId])
REFERENCES [dbo].[Foods] ([Id])
GO
ALTER TABLE [dbo].[FoodRecords] CHECK CONSTRAINT [FK_FoodRecords_Foods]
GO
ALTER TABLE [dbo].[FoodRecords]  WITH CHECK ADD  CONSTRAINT [FK_FoodRecords_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[FoodRecords] CHECK CONSTRAINT [FK_FoodRecords_Members]
GO
ALTER TABLE [dbo].[Foods]  WITH CHECK ADD  CONSTRAINT [FK_Foods_FoodCategories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[FoodCategories] ([Id])
GO
ALTER TABLE [dbo].[Foods] CHECK CONSTRAINT [FK_Foods_FoodCategories]
GO
ALTER TABLE [dbo].[Instructors]  WITH CHECK ADD  CONSTRAINT [FK_Instructors_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Instructors] CHECK CONSTRAINT [FK_Instructors_Users]
GO
ALTER TABLE [dbo].[InstructorWalletDetails]  WITH CHECK ADD  CONSTRAINT [FK_InstructorWalletDetails_InstructorWallets] FOREIGN KEY([InstructorWalletId])
REFERENCES [dbo].[InstructorWallets] ([Id])
GO
ALTER TABLE [dbo].[InstructorWalletDetails] CHECK CONSTRAINT [FK_InstructorWalletDetails_InstructorWallets]
GO
ALTER TABLE [dbo].[InstructorWallets]  WITH CHECK ADD  CONSTRAINT [FK_InstructorWallets_Instructors] FOREIGN KEY([InstructorId])
REFERENCES [dbo].[Instructors] ([Id])
GO
ALTER TABLE [dbo].[InstructorWallets] CHECK CONSTRAINT [FK_InstructorWallets_Instructors]
GO
ALTER TABLE [dbo].[LeaveApprovalDelegations]  WITH CHECK ADD  CONSTRAINT [FK_ApprDel_Delegate] FOREIGN KEY([DelegateEmployeeId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[LeaveApprovalDelegations] CHECK CONSTRAINT [FK_ApprDel_Delegate]
GO
ALTER TABLE [dbo].[LeaveApprovalDelegations]  WITH CHECK ADD  CONSTRAINT [FK_ApprDel_LeaveReq] FOREIGN KEY([LeaveRequestId])
REFERENCES [dbo].[LeaveRequests] ([Id])
GO
ALTER TABLE [dbo].[LeaveApprovalDelegations] CHECK CONSTRAINT [FK_ApprDel_LeaveReq]
GO
ALTER TABLE [dbo].[LeaveApprovalDelegations]  WITH CHECK ADD  CONSTRAINT [FK_ApprDel_Manager] FOREIGN KEY([ManagerEmployeeId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[LeaveApprovalDelegations] CHECK CONSTRAINT [FK_ApprDel_Manager]
GO
ALTER TABLE [dbo].[LeaveAttachments]  WITH CHECK ADD  CONSTRAINT [FK_Attach_Request] FOREIGN KEY([RequestId])
REFERENCES [dbo].[LeaveRequests] ([Id])
GO
ALTER TABLE [dbo].[LeaveAttachments] CHECK CONSTRAINT [FK_Attach_Request]
GO
ALTER TABLE [dbo].[LeaveBalanceHistories]  WITH CHECK ADD  CONSTRAINT [FK_LeaveBalanceHistories_LeaveBalance] FOREIGN KEY([LeaveBalanceId])
REFERENCES [dbo].[LeaveBalances] ([Id])
GO
ALTER TABLE [dbo].[LeaveBalanceHistories] CHECK CONSTRAINT [FK_LeaveBalanceHistories_LeaveBalance]
GO
ALTER TABLE [dbo].[LeaveBalanceHistories]  WITH CHECK ADD  CONSTRAINT [FK_LeaveBalanceHistories_Operator] FOREIGN KEY([OperatorId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[LeaveBalanceHistories] CHECK CONSTRAINT [FK_LeaveBalanceHistories_Operator]
GO
ALTER TABLE [dbo].[LeaveBalances]  WITH CHECK ADD  CONSTRAINT [FK_Balance_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[LeaveBalances] CHECK CONSTRAINT [FK_Balance_Employee]
GO
ALTER TABLE [dbo].[LeaveBalances]  WITH CHECK ADD  CONSTRAINT [FK_Balance_LeaveType] FOREIGN KEY([LeaveTypeId])
REFERENCES [dbo].[LeaveTypes] ([Id])
GO
ALTER TABLE [dbo].[LeaveBalances] CHECK CONSTRAINT [FK_Balance_LeaveType]
GO
ALTER TABLE [dbo].[LeaveRequests]  WITH CHECK ADD  CONSTRAINT [FK_Leave_ApprovedBy] FOREIGN KEY([ApprovedBy])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[LeaveRequests] CHECK CONSTRAINT [FK_Leave_ApprovedBy]
GO
ALTER TABLE [dbo].[LeaveRequests]  WITH CHECK ADD  CONSTRAINT [FK_Leave_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[LeaveRequests] CHECK CONSTRAINT [FK_Leave_Employee]
GO
ALTER TABLE [dbo].[LeaveRequests]  WITH CHECK ADD  CONSTRAINT [FK_Leave_LeaveDelegate] FOREIGN KEY([LeaveDelegateId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[LeaveRequests] CHECK CONSTRAINT [FK_Leave_LeaveDelegate]
GO
ALTER TABLE [dbo].[LeaveRequests]  WITH CHECK ADD  CONSTRAINT [FK_Leave_LeaveType] FOREIGN KEY([LeaveTypeId])
REFERENCES [dbo].[LeaveTypes] ([Id])
GO
ALTER TABLE [dbo].[LeaveRequests] CHECK CONSTRAINT [FK_Leave_LeaveType]
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD  CONSTRAINT [FK_Members_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Members] CHECK CONSTRAINT [FK_Members_Users]
GO
ALTER TABLE [dbo].[MemberViolations]  WITH CHECK ADD  CONSTRAINT [FK_MemberViolations_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[MemberViolations] CHECK CONSTRAINT [FK_MemberViolations_Members]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_Users_Receiver] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_Users_Receiver]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_Users_Sender] FOREIGN KEY([SenderId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_Users_Sender]
GO
ALTER TABLE [dbo].[Nutrients]  WITH CHECK ADD  CONSTRAINT [FK_Nutrients_Foods] FOREIGN KEY([FoodId])
REFERENCES [dbo].[Foods] ([Id])
GO
ALTER TABLE [dbo].[Nutrients] CHECK CONSTRAINT [FK_Nutrients_Foods]
GO
ALTER TABLE [dbo].[PointOrders]  WITH CHECK ADD  CONSTRAINT [FK_PointOrders_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[PointOrders] CHECK CONSTRAINT [FK_PointOrders_Members]
GO
ALTER TABLE [dbo].[PointOrders]  WITH CHECK ADD  CONSTRAINT [FK_PointOrders_TopUpPlans] FOREIGN KEY([TopUpPlanId])
REFERENCES [dbo].[TopUpPlans] ([Id])
GO
ALTER TABLE [dbo].[PointOrders] CHECK CONSTRAINT [FK_PointOrders_TopUpPlans]
GO
ALTER TABLE [dbo].[PointsRecordDetails]  WITH CHECK ADD  CONSTRAINT [FK_PointsRecordDetails_PointOrders] FOREIGN KEY([PointOrderId])
REFERENCES [dbo].[PointOrders] ([Id])
GO
ALTER TABLE [dbo].[PointsRecordDetails] CHECK CONSTRAINT [FK_PointsRecordDetails_PointOrders]
GO
ALTER TABLE [dbo].[PointsRecordDetails]  WITH CHECK ADD  CONSTRAINT [FK_PointsRecordDetails_ReserveOrders] FOREIGN KEY([ReserveOrderId])
REFERENCES [dbo].[ReserveOrders] ([Id])
GO
ALTER TABLE [dbo].[PointsRecordDetails] CHECK CONSTRAINT [FK_PointsRecordDetails_ReserveOrders]
GO
ALTER TABLE [dbo].[PointsRecordDetails]  WITH CHECK ADD  CONSTRAINT [FK_PointsRecordDetails_UserWallets] FOREIGN KEY([UserWalletId])
REFERENCES [dbo].[UserWallets] ([Id])
GO
ALTER TABLE [dbo].[PointsRecordDetails] CHECK CONSTRAINT [FK_PointsRecordDetails_UserWallets]
GO
ALTER TABLE [dbo].[ProductOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_ProductOrderDetails_ProductOrders] FOREIGN KEY([ProductOrderId])
REFERENCES [dbo].[ProductOrders] ([Id])
GO
ALTER TABLE [dbo].[ProductOrderDetails] CHECK CONSTRAINT [FK_ProductOrderDetails_ProductOrders]
GO
ALTER TABLE [dbo].[ProductOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_ProductOrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductOrderDetails] CHECK CONSTRAINT [FK_ProductOrderDetails_Products]
GO
ALTER TABLE [dbo].[ProductOrders]  WITH CHECK ADD  CONSTRAINT [FK_ProductOrders_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[ProductOrders] CHECK CONSTRAINT [FK_ProductOrders_Members]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductCategories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[ProductCategories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductCategories]
GO
ALTER TABLE [dbo].[ReserveOrders]  WITH CHECK ADD  CONSTRAINT [FK_ReserveOrders_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[ReserveOrders] CHECK CONSTRAINT [FK_ReserveOrders_Members]
GO
ALTER TABLE [dbo].[ReserveOrders]  WITH CHECK ADD  CONSTRAINT [FK_ReserveOrders_Shifts] FOREIGN KEY([ShiftId])
REFERENCES [dbo].[Shifts] ([Id])
GO
ALTER TABLE [dbo].[ReserveOrders] CHECK CONSTRAINT [FK_ReserveOrders_Shifts]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Instructors] FOREIGN KEY([InstructorId])
REFERENCES [dbo].[Instructors] ([Id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Instructors]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Members]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_ReserveOrders] FOREIGN KEY([ReserveOrderId])
REFERENCES [dbo].[ReserveOrders] ([Id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_ReserveOrders]
GO
ALTER TABLE [dbo].[RoleFunctions]  WITH CHECK ADD  CONSTRAINT [FK_RoleFunctions_Function] FOREIGN KEY([FunctionId])
REFERENCES [dbo].[Functions] ([Id])
GO
ALTER TABLE [dbo].[RoleFunctions] CHECK CONSTRAINT [FK_RoleFunctions_Function]
GO
ALTER TABLE [dbo].[RoleFunctions]  WITH CHECK ADD  CONSTRAINT [FK_RoleFunctions_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[RoleFunctions] CHECK CONSTRAINT [FK_RoleFunctions_Role]
GO
ALTER TABLE [dbo].[Shifts]  WITH CHECK ADD  CONSTRAINT [FK_Shifts_Instructors] FOREIGN KEY([InstructorId])
REFERENCES [dbo].[Instructors] ([Id])
GO
ALTER TABLE [dbo].[Shifts] CHECK CONSTRAINT [FK_Shifts_Instructors]
GO
ALTER TABLE [dbo].[UserExternalLogins]  WITH CHECK ADD  CONSTRAINT [FK_ExternalLogins_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserExternalLogins] CHECK CONSTRAINT [FK_ExternalLogins_Users]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Role]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_User]
GO
ALTER TABLE [dbo].[UserWallets]  WITH CHECK ADD  CONSTRAINT [FK_UserWallets_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[UserWallets] CHECK CONSTRAINT [FK_UserWallets_Members]
GO
ALTER TABLE [dbo].[LeaveRequests]  WITH CHECK ADD  CONSTRAINT [CK_LeaveRequests_Status] CHECK  (([Status]='CancelRejected' OR [Status]='CancelPending' OR [Status]='Cancelled' OR [Status]='Rejected' OR [Status]='Approved' OR [Status]='Pending'))
GO
ALTER TABLE [dbo].[LeaveRequests] CHECK CONSTRAINT [CK_LeaveRequests_Status]
GO
