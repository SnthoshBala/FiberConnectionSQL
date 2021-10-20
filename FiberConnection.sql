create database fiber_connection

use fiber_connection

create table Employee(EmployeeID int primary key,Name varchar(max),Age int,Address varchar(max),WorkLocation varchar(max),PhoneNumber varchar(10),Employee_mail varchar(max),Employee_password varchar(14))
create table Customer(CustomerID int primary key identity(100,1),CustomerName varchar(max),DateOfBirth date,CustomerAddress varchar(max),CustomerPhoneNumber varchar(13),CustomerAadharNo varchar(16),CustomerMailId varchar(max),CustomerPassword varchar(14))
create table Offers(OfferID int primary key identity(200,1),Voot varchar(3),Lionplay varchar(3),Hungamaplay varchar(3),Ultra varchar(3),Hotstar varchar(3),Netflix varchar(3),Others varchar(max))
create table FiberPlan(PlanID int primary key,PlanName varchar(max),PlanPrice varchar(10),PlanSpeed varchar(20),Validity varchar(10),OfferID int references Offers(OfferID),Image varchar(max))
create table Billing(BillingNumber int primary key identity(1,1),CustomerID int references Customer(CustomerID),PlanID int references FiberPlan(PlanID),BookedDate date,CustomerName varchar(max),
DateOfBirth date,CustomerAddress varchar(max),CustomerPhoneNumber varchar(13),CustomerAadharNo varchar(16),CustomerMailId varchar(max),PlanName varchar(max),PlanPrice varchar(max)
,Tax float,Total float,PaymentMethod varchar(max))
create table Admin(AdminID int primary key identity(1,1),AdminUserName varchar(max),AdminPassword varchar(max))

CREATE TABLE [dbo].[Status](
	[StatusID] [int] IDENTITY(900,1) NOT NULL,
	[Status] [varchar](max) NULL,
	[EmployeeID] [int] NULL,
	[CustomerID] [int] NULL,
	[PlanID] [int] NULL,
	[BillingNumber] [int] NULL,
	[PlanPrice] [float] NULL,
	[PlanName] [varchar](max) NULL,
	[CustomerName] [varchar](max) NULL,
	[EmployeeName] [varchar](max) NULL,
	[EmployeePhonenumber] [varchar](12) NULL,
	[CustomerAddress] [varchar](max) NULL,
	[CustomerPhonenumber] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Status]  WITH CHECK ADD FOREIGN KEY([BillingNumber])
REFERENCES [dbo].[Billing] ([BillingNumber])
GO

ALTER TABLE [dbo].[Status]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO

ALTER TABLE [dbo].[Status]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO

ALTER TABLE [dbo].[Status]  WITH CHECK ADD FOREIGN KEY([PlanID])
REFERENCES [dbo].[FiberPlan] ([PlanID])
GO


insert into Admin values('admin','admin')

select * from Employee
select * from Customer
select * from Status
select * from Offers
select * from FiberPlan
select * from Billing
