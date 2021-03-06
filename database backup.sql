USE [AHD21_A104_Group1]
GO
/****** Object:  Table [dbo].[tbl_Menu]    Script Date: 05/16/2013 15:23:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Menu](
	[MenuID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](40) NOT NULL,
	[NavigationURL] [varchar](100) NOT NULL,
	[ParentMenuID] [int] NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[ToolTip] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_VendorDetails]    Script Date: 05/16/2013 15:23:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_VendorDetails](
	[VendorID] [int] IDENTITY(4000,1) NOT NULL,
	[NameOfOrganization] [varchar](100) NOT NULL,
	[NameOfContactPerson] [varchar](50) NOT NULL,
	[VendorAddress] [varchar](100) NOT NULL,
	[City] [varchar](30) NOT NULL,
	[State] [varchar](20) NOT NULL,
	[ContactNumber] [numeric](15, 0) NOT NULL,
	[VendorType] [varchar](50) NOT NULL,
	[EmailID] [varchar](40) NULL,
	[ServiceStatus] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [uk_autoid] UNIQUE NONCLUSTERED 
(
	[ContactNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Role]    Script Date: 05/16/2013 15:23:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Role](
	[RoleID] [int] IDENTITY(10,1) NOT NULL,
	[RoleName] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateOwner]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_UpdateOwner]
@OwnerId int,
@OwnerName varchar(40),
@OwnerContactNumber numeric(10),
@OwnerEMailId varchar(40),
@OwnerTurnOverAmount numeric(10,2)
AS
BEGIN
	update tbl_OwnerDetails684431
		set 
			OwnerName = @OwnerName,
			OwnerContactNumber = @OwnerContactNumber,
			OwnerEMailId = @OwnerEMailId,
			OwnerTurnOverAmount = @OwnerTurnOverAmount
			
		where 
			OwnerId = @OwnerId
END
GO
/****** Object:  StoredProcedure [dbo].[usp_viewOwner_680376]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_viewOwner_680376]
as
begin
select * from tbl_Owner_680376
end
GO
/****** Object:  Table [dbo].[tblSpecialization_685501]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSpecialization_685501](
	[SpecializationID] [int] IDENTITY(1,1) NOT NULL,
	[Specialization] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SpecializationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblDoctor_685501]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblDoctor_685501](
	[DoctorId] [int] IDENTITY(1,1) NOT NULL,
	[DoctorName] [varchar](20) NOT NULL,
	[Specialization] [varchar](30) NOT NULL,
	[Age] [int] NOT NULL,
	[DateOfJoining] [date] NOT NULL,
	[NoOfAppointment] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DoctorId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[CalAccessory]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CalAccessory]
  @fleet nvarchar(50),
  @Accessory nvarchar(50),
  @Rent float output
  As
  Begin
  set @Rent=(select price from dbo.accessory where 
  fleet_name=@fleet and accessory_name=@Accessory);
  return @rent
  
  
  End
GO
/****** Object:  Table [dbo].[tbl_CustomerDetails]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_CustomerDetails](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](40) NOT NULL,
	[PhoneNumber] [numeric](15, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Category]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Category](
	[CategoryID] [int] IDENTITY(5000,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [cname] UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_tbl_BillStatus]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_tbl_BillStatus]
 @BillNumber             INT
,@CustomerName          VARCHAR(40)
,@TotalBillAmount      NUMERIC(20,2)
,@BillStatus           VARCHAR(20)
AS
BEGIN
INSERT INTO tbl_BillStatus
(BillNumber, CustomerName, TotalBillAmount, BillStatus)
VALUES
(@BillNumber, @CustomerName, @TotalBillAmount, @BillStatus)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdatePassword]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_UpdatePassword]
@UserID int,
@Password varchar(14)
as
begin
update tbl_LogIn
set Password=@Password COLLATE SQL_Latin1_General_CP1_CS_AS 
where UserID=@UserID
end
GO
/****** Object:  Table [dbo].[tbl_ItemDetails]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ItemDetails](
	[ItemID] [int] IDENTITY(100,1) NOT NULL,
	[ItemName] [varchar](40) NOT NULL,
	[Quantity] [numeric](10, 0) NOT NULL,
	[ItemPrice] [numeric](20, 2) NOT NULL,
	[ItemDiscount] [numeric](10, 3) NULL,
	[ItemClosingCount] [int] NULL,
	[CategoryID] [int] NULL,
	[ITEMSTATUS] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Employee]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Employee](
	[EmployeeID] [int] IDENTITY(2000,1) NOT NULL,
	[EmployeeFirstName] [varchar](40) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[DateOfBirth] [date] NULL,
	[City] [varchar](30) NOT NULL,
	[State] [varchar](20) NOT NULL,
	[ContactNumber] [numeric](15, 0) NOT NULL,
	[DateOfJoining] [date] NULL,
	[EmployeeLastName] [varchar](40) NOT NULL,
	[RoleID] [int] NULL,
	[EmployeeStatus] [varchar](40) NULL,
	[SecurityAnswer] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ContactNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_addVendorDetails]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_addVendorDetails]
@nameOfOrganization	varchar(100),

@nameOfContactPerson    varchar(50)		,
@vendorAddress			varchar(100)	,
@city					varchar(30)		,
@state					varchar(20)		,
@contactNumber			numeric(15,0)	,
@vendorType				varchar(50)		,
@emailId                varchar(40),

@vendorId				int out
AS
BEGIN
INSERT INTO tbl_VendorDetails
(nameOfOrganization,nameOfContactPerson,vendorAddress,city,state,contactNumber,vendorType,emailId)
VALUES
(@nameOfOrganization,@nameOfContactPerson,@vendorAddress,@city,@state,@contactNumber,@vendorType,@emailId)
SET @vendorId=@@IDENTITY
END
GO
/****** Object:  Table [dbo].[tbl_MenuRoleAccess]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_MenuRoleAccess](
	[RoleID] [int] NOT NULL,
	[MenuID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[usp_addCustomerDetails]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_addCustomerDetails]
@CustomerName	VARCHAR(40)	,
@PhoneNumber	NUMERIC(15,0),
@CustomerID		INT		OUT
AS
BEGIN
INSERT INTO tbl_CustomerDetails
(CustomerName,PhoneNumber)
VALUES
(@CustomerName,@PhoneNumber)
SET @CustomerID=@@IDENTITY
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AddCategory]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_AddCategory]
@CategoryName varchar(50)
as
begin

insert into tbl_Category
(
CategoryName
)
values
(
@CategoryName
)
end
GO
/****** Object:  Table [dbo].[tblAppointment_685501]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAppointment_685501](
	[AppointmentId] [int] IDENTITY(1,1) NOT NULL,
	[DoctorId] [int] NULL,
	[SpecializationID] [int] NULL,
	[DateOfAppointment] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AppointmentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_VendorItemCategory]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_VendorItemCategory](
	[VendorID] [int] NULL,
	[CategoryID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Orders]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Orders](
	[OrderID] [int] IDENTITY(3000,1) NOT NULL,
	[VendorID] [int] NOT NULL,
	[Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetRoleDetails]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_GetRoleDetails]
AS
BEGIN
Select 
		RoleID,
		RoleName
		
		from tbl_Role
		
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetVendorByVendorId]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[usp_GetVendorByVendorId]
@VendorID int
AS
BEGIN

select * from tbl_VendorDetails
where VendorID=@VendorID
END
GO
/****** Object:  StoredProcedure [dbo].[usp_getitemcategory]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_getitemcategory]
AS
BEGIN
SELECT
*
from tbl_Category
end
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateVendor_Group1]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[usp_UpdateVendor_Group1]
@VendorID int
As
Begin

		Update tbl_VendorDetails
			Set ServiceStatus='Inactive'
				
		Where VendorID=@VendorID
		
End
GO
/****** Object:  StoredProcedure [dbo].[usp_ViewVendorDetails_group1]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_ViewVendorDetails_group1]
As
Begin
		Select 
				VendorID
				,NameOfOrganization
				,NameOfContactPerson
				,VendorAddress
				,City
				,State
				,ContactNumber
				,VendorType
				,EmailID
							   
		From tbl_VendorDetails
		where ServiceStatus is null
		
End
GO
/****** Object:  StoredProcedure [dbo].[usp_ViewReportPriceWise]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ViewReportPriceWise]
As
begin
select distinct 
case
when ItemPrice>=0 and ItemPrice<10 then 'Less than Rs.10'
when ItemPrice>=10 and ItemPrice<20 then 'Less than Rs.20'
when ItemPrice>=20 and ItemPrice<30 then 'Less than Rs.30'
when ItemPrice>=30 and ItemPrice<40 then 'Less than Rs.40'
when ItemPrice>=40 and ItemPrice<50 then 'Less than Rs.50'
when ItemPrice>=50 and ItemPrice<60 then 'Less than Rs.60'
when ItemPrice>=60 and ItemPrice<70 then 'Less than Rs.70'
when ItemPrice>=70 and ItemPrice<80 then 'Less than Rs.80'
when ItemPrice>=80 and ItemPrice<90 then 'Less than Rs.90'
when ItemPrice>=90 and ItemPrice<100 then 'Less than Rs.100'
else 'Item Price Greater than 100'
end as Range,
SUM(Quantity)as StockAvailable 
from tbl_ItemDetails
group by ItemPrice
end
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateEmployeeViewProfile]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_UpdateEmployeeViewProfile]
@EmployeeID int,
@Address varchar(100),
@State varchar(20),
@City varchar(30),
@ContactNumber numeric(15,0)
AS
BEGIN
	update tbl_Employee
		set 
			Address = @Address,
			State = @State,
			City = @City,
			ContactNumber = @ContactNumber
			
		where 
			EmployeeID = @EmployeeID
END
GO
/****** Object:  StoredProcedure [dbo].[usp_updateVendorDetails]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_updateVendorDetails]
 @VendorID int
				,@NameOfOrganization varchar(100)
				,@NameOfContactPerson  varchar(50)
				,@VendorAddress varchar(100)
				,@State varchar(20)
				,@City varchar(30)
			    ,@ContactNumber numeric(15, 0)
				,@VendorType varchar(50)
				,@EmailID varchar(40)

AS
BEGIN
update tbl_VendorDetails
               
set 

				 NameOfOrganization=@NameOfOrganization
				,NameOfContactPerson=@NameOfContactPerson
				,VendorAddress=@VendorAddress
				,State=@State
				,City=@City
				,ContactNumber=@ContactNumber
				,VendorType=@VendorType
				,EmailID=@EmailID

where VendorID = @VendorID

delete from tbl_VendorItemCategory
where VendorID=@VendorID 

END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateEmployee]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_UpdateEmployee]
@EmployeeID int
As
Begin

		Update tbl_Employee
			Set EmployeeStatus='Inactive'
				
		Where EmployeeID=@EmployeeID
		
End
GO
/****** Object:  StoredProcedure [dbo].[usp_SearchItembynameAndCategory]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_SearchItembynameAndCategory]
@ItemName   Varchar(50), 
@ItemCategory int
AS


BEGIN

SELECT * FROM tbl_ItemDetails i
join tbl_Category  c on c.CategoryID = i.CategoryID
where ItemName like (@ItemName+'%') AND i.CategoryID=@ItemCategory

END
GO
/****** Object:  StoredProcedure [dbo].[usp_SearchItembyname]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_SearchItembyname]
@ItemName   Varchar(50) 

AS


BEGIN

SELECT * FROM tbl_ItemDetails i
join tbl_Category  c on c.CategoryID = i.CategoryID
where ItemName like (@ItemName+'%') 

END
GO
/****** Object:  StoredProcedure [dbo].[usp_ReportCategoryWise]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ReportCategoryWise]
AS
BEGIN

	with cte_CloseCount as
	(
			select  CategoryID, sum(ItemClosingCount) totalItemCount	
			from tbl_ItemDetails
			group by CategoryID
	)
	
	select c1.totalItemCount, cat.CategoryName
	from cte_CloseCount c1
	join (select categoryName,CategoryID from tbl_Category) cat
	on c1.CategoryID = cat.CategoryID			
END
GO
/****** Object:  StoredProcedure [dbo].[usp_reportpricewise]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_reportpricewise]

@First		int  out,
@Second		int  out,
@Third	    int   out

As
Begin

set @First=(
select SUM(Quantity)as TotalQuantity 
from tbl_ItemDetails
where  ItemPrice < 1000
) 
  set @Second=(
select SUM(Quantity)as TotalQuantity 
from tbl_ItemDetails
where  ItemPrice < 200 and ItemPrice>10
) 
  set @Third=(
select SUM(Quantity)as TotalQuantity 
from tbl_ItemDetails
where  ItemPrice < 3000 and ItemPrice>2000
) 
End
GO
/****** Object:  StoredProcedure [dbo].[usp_getVendorCategoryWise]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_getVendorCategoryWise]
@CategoryID int
As
Begin
select distinct v.NameOfContactPerson,v.VendorID
 from tbl_VendorItemCategory vi
join tbl_VendorDetails v
on vi.VendorID=v.VendorID
where vi.CategoryID=@CategoryID and v.ServiceStatus is null
end
GO
/****** Object:  StoredProcedure [dbo].[usp_checkSecurityAnswer]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_checkSecurityAnswer]
@EmployeeID int,
@SecurityAnswer varchar(50)
as
begin
select *from tbl_Employee 
where EmployeeID=@EmployeeID and SecurityAnswer=@SecurityAnswer
end
GO
/****** Object:  StoredProcedure [dbo].[usp_checkEmployeeID]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_checkEmployeeID]
@EmployeeID int 
as
begin
select EmployeeID,EmployeeFirstName,Address from tbl_Employee
where EmployeeID=@EmployeeID
end
GO
/****** Object:  StoredProcedure [dbo].[usp_deleteItems]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_deleteItems]
@ItemID				 int
AS
BEGIN

		UPDATE tbl_ItemDetails
			SET ITEMSTATUS ='Inactive'
			from tbl_ItemDetails
		WHERE ItemID=@ItemID
		
END
GO
/****** Object:  StoredProcedure [dbo].[usp_deleteItem]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_deleteItem]
@ItemID           INT
AS
BEGIN
DELETE from tbl_ItemDetails
where ItemID=@ItemID
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetItemByItemId]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_GetItemByItemId]
@ItemID int
AS
BEGIN

select * from tbl_ItemDetails
where ItemID = @ItemID
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetEmployeeDetailsByName]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_GetEmployeeDetailsByName]
@name varchar(10)
AS
BEGIN
select 

		emp.EmployeeID,
		emp.EmployeeFirstName, 
		emp.EmployeeLastName,
		r.RoleName,
		emp.Address,
		emp.DateOfBirth,
		emp.City,
		emp.State,
		emp.ContactNumber,
		emp.DateOfJoining
		
		from tbl_Employee emp
		
		join tbl_Role r on r.RoleID = emp.RoleID
		where EmployeeStatus is null and (EmployeeFirstName like (@name+'%') or EmployeeLastName like (@name+'%'))

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetEmployeeDetails]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_GetEmployeeDetails]
AS
BEGIN
select 

		emp.EmployeeID,
		emp.EmployeeFirstName, 
		emp.EmployeeLastName,
		r.RoleName,
		emp.Address,
		emp.DateOfBirth,
		emp.City,
		emp.State,
		emp.ContactNumber,
		emp.DateOfJoining
		
		from tbl_Employee emp
		
		join tbl_Role r on r.RoleID = emp.RoleID
		where EmployeeStatus is null

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetEmployee]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_GetEmployee]
@EmployeeID int
AS
BEGIN
select 

		emp.EmployeeID,
		emp.EmployeeFirstName, 
		emp.EmployeeLastName,
		r.RoleName,
		emp.Address,
		emp.DateOfBirth,
		emp.City,
		emp.State,
		emp.ContactNumber,
		emp.DateOfJoining
		
		from tbl_Employee emp
		
		join tbl_Role r on r.RoleID = emp.RoleID
		where EmployeeID = @EmployeeID

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetMenuItems]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_GetMenuItems]
@RoleID int
as
begin
select RoleID,ma.MenuID,Title,NavigationURL,ToolTip
from tbl_MenuRoleAccess ma join tbl_Menu m
on ma.MenuID=m.MenuID
where RoleID=@RoleID
end
GO
/****** Object:  StoredProcedure [dbo].[usp_getItemStatus]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_getItemStatus]
AS
BEGIN
SELECT * FROM tbl_ItemDetails
WHERE Quantity between 0 and 20
END
GO
/****** Object:  StoredProcedure [dbo].[usp_getItemsNotAvailable]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_getItemsNotAvailable]
@CategoryID     INT
AS
BEGIN
SELECT a.ItemID, a.ItemName, b.CategoryName, a.Quantity, a.ItemPrice 
FROM tbl_ItemDetails a 
join tbl_Category b
ON a.CategoryID=b.CategoryID
WHERE  a.CategoryID=@CategoryID AND ITEMSTATUS is null and a.Quantity<50
END
GO
/****** Object:  StoredProcedure [dbo].[usp_getItemDetails]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_getItemDetails]
@CategoryID     INT
AS
BEGIN
SELECT a.ItemID, a.ItemName, b.CategoryName,b.CategoryID, a.Quantity, a.ItemPrice FROM tbl_ItemDetails a join tbl_Category b
ON a.CategoryID=b.CategoryID
WHERE  a.CategoryID=@CategoryID AND ITEMSTATUS is null
END
GO
/****** Object:  StoredProcedure [dbo].[usp_getItemCategoryForVendor]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_getItemCategoryForVendor]
@VendorID int
AS
BEGIN
SELECT
*
from tbl_VendorItemCategory
where VendorID=@VendorID
end
GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserName]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_GetUserName]
@EmployeeID int
as
begin
select EmployeeFirstName,EmployeeLastName,r.RoleName,EmployeeID
from tbl_Employee e join tbl_Role r on r.RoleID=e.RoleID
where EmployeeID=@EmployeeID
end
GO
/****** Object:  Table [dbo].[tbl_Quantity_added_by_admin]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Quantity_added_by_admin](
	[QuantityAdded] [int] NOT NULL,
	[AddDate] [date] NOT NULL,
	[ItemID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_place_order]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_place_order](
	[OrderID] [int] NOT NULL,
	[VendorName] [varchar](100) NOT NULL,
	[Quantity] [int] NOT NULL,
	[ItemName] [varchar](100) NOT NULL,
	[TotalPrice] [money] NOT NULL,
	[PlaceOrderDate] [datetime] NOT NULL,
	[Delivery] [datetime] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_LogInDetails]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_LogInDetails](
	[EmployeeID] [int] NOT NULL,
	[Password] [varchar](14) NOT NULL,
	[RoleID] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Bill]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Bill](
	[BillNumber] [int] IDENTITY(1000,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[CustomerName] [varchar](40) NOT NULL,
	[BillDate] [datetime] NOT NULL,
	[TotalBillAmount] [numeric](20, 2) NOT NULL,
	[BillStatus] [varchar](20) NOT NULL,
	[MoneyIn] [numeric](20, 2) NOT NULL,
	[MoneyOut] [numeric](20, 2) NOT NULL,
	[ReturnAmount] [numeric](20, 2) NULL,
	[Remarks] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[BillNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_OrderItems]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_OrderItems](
	[ItemID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[ItemName] [varchar](40) NOT NULL,
	[Quantity] [numeric](10, 0) NOT NULL,
	[CategoryID] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_notavailableitems]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_notavailableitems](
	[ItemID] [int] NULL,
	[ItemName] [varchar](40) NULL,
	[Quantity] [numeric](10, 0) NULL,
	[ItemPrice] [numeric](20, 2) NULL,
	[CategoryID] [int] NULL,
	[CategoryName] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_addItemDetails]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_addItemDetails]
@ItemName          VARCHAR(40)
,@CategoryID     VARCHAR(40)
,@Quantity         NUMERIC(10)
,@ItemPrice        NUMERIC(20,2)
,@ItemDiscount     NUMERIC(10,3)
,@ItemClosingCount INT
,@ItemID           INT OUT
AS
BEGIN
INSERT INTO tbl_ItemDetails
(ItemName,CategoryID, Quantity, ItemPrice, ItemDiscount, ItemClosingCount)
VALUES
(@ItemName
,@CategoryID
,@Quantity
,@ItemPrice
,@ItemDiscount
,@ItemClosingCount)
SET @ItemID=@@IDENTITY
END
GO
/****** Object:  StoredProcedure [dbo].[usp_addEmployee]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_addEmployee]
@EmployeeFirstName	VARCHAR(40)	,
@EmployeeLastName  VARCHAR(40),
@RoleId	int,
@Address		VARCHAR(100),
@DateOfBirth	DATE,
@City			VARCHAR(30),
@State			VARCHAR(20),
@ContactNumber	NUMERIC(15,0),
@DateOfJoining	DATE,
@EmployeeID		INT		OUT
AS
BEGIN
INSERT INTO tbl_Employee
(EmployeeFirstName, EmployeeLastName,RoleID,Address,DateOfBirth,City,State,ContactNumber,DateOfJoining)
VALUES
(@EmployeeFirstName, @EmployeeLastName,@RoleId,@Address,@DateOfBirth,@City,@State,@ContactNumber,@DateOfJoining)
SET @EmployeeID=@@IDENTITY


END
GO
/****** Object:  StoredProcedure [dbo].[usp_AddOrder]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[usp_AddOrder]
@VendorID		int,
@Date		Datetime,
@OrderID	int    out 

As
Begin
		Insert into tbl_Orders(
												VendorID
												,Date
												
												)
												
		Values(									@VendorID
												,@Date
												)
												
		Set @OrderID =@@IDENTITY
End
GO
/****** Object:  StoredProcedure [dbo].[usp_addOrders]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_addOrders]
@vendorName varchar(100),
@vendorId int ,
@date datetime,
@orderId int	out

AS
BEGIN
INSERT INTO tbl_Orders
(vendorName,vendorId,date)
VALUES
(@vendorName,@vendorId,@date)
SET @orderId=@@IDENTITY
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AddVendorItemCategory_group1]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_AddVendorItemCategory_group1]
@VendorID			int,
@CategoryID			int
As
Begin
		Insert into tbl_VendorItemCategory
		(
												VendorID
												,CategoryID
												)
												Values
												(
												@VendorID,
												@CategoryID
												
												)
												End
GO
/****** Object:  Table [dbo].[tbl_BillDetails]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_BillDetails](
	[BillNumber] [int] NOT NULL,
	[ItemName] [varchar](40) NOT NULL,
	[QuantityPurchased] [numeric](10, 0) NOT NULL,
	[LineTotal] [numeric](20, 2) NOT NULL,
	[ItemWiseDiscount] [numeric](10, 3) NULL,
	[ItemStatus] [varchar](20) NOT NULL,
	[QuantityReturned] [numeric](10, 0) NULL,
	[ReturnedTotal] [numeric](20, 2) NULL,
	[Remark] [varchar](100) NULL,
	[ItemID] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_addBill]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_addBill]
@CustomerID        INT
,@CustomerName     VARCHAR(40)
,@BillDate         DATETIME
,@TotalBillAmount  NUMERIC(20,2)
,@BillStatus       VARCHAR(20)
,@MoneyIn          NUMERIC(20,2)
,@MoneyOut         NUMERIC(20,2)
,@ReturnAmount     NUMERIC(20,2)
,@BillNumber       INT OUT
,@EmployeeID       INT 
AS
BEGIN
INSERT INTO tbl_Bill
(CustomerID,
CustomerName, 
BillDate,
TotalBillAmount,
BillStatus,
MoneyIn,
MoneyOut,
ReturnAmount,
EmployeeID 
)
VALUES
(@CustomerID,
 @CustomerName,
 @BillDate,
 @TotalBillAmount,
 @BillStatus,
 @MoneyIn,
 @MoneyOut,
 @ReturnAmount,
 @EmployeeID
 )
SET @BillNumber=@@IDENTITY
END
GO
/****** Object:  StoredProcedure [dbo].[usp_addToLoginDetails]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_addToLoginDetails]
@EmployeeID	int	,
@RoleId	int,
@Password varchar(14)

AS
BEGIN
INSERT INTO tbl_LogInDetails
(EmployeeID, Password, RoleID)
VALUES
(@EmployeeID, @Password, @RoleId)

END
GO
/****** Object:  StoredProcedure [dbo].[usp_addOrderItems]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_addOrderItems]
@ItemID int ,
@OrderID int,
@ItemName varchar(40),
@CategoryID int,
@Quantity numeric(10,0)

AS
BEGIN
INSERT INTO tbl_OrderItems
(ItemID,OrderID,ItemName,CategoryID,Quantity)
VALUES
(@ItemID,@OrderID,@ItemName,@CategoryID,@Quantity)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_addLogInDetails]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_addLogInDetails]
@EmployeeID		INT,
@Password		VARCHAR(14)	,
@RoleID			INT	

AS
BEGIN
INSERT INTO tbl_LogInDetails
(EmployeeID,Password,RoleID)
VALUES
(@EmployeeID,@Password,@RoleID)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AddItemOrder]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_AddItemOrder]
@ItemID		int,
@OrderID	int,
@ItemName	varchar(50) ,
@Quantity  int,
@CategoryID int

As
Begin
		Insert into tbl_OrderItems(
												
ItemID		,
OrderID	,
ItemName	 ,
Quantity  ,
CategoryID 
			
											)
										
		Values(	
@ItemID		,
@OrderID	,
@ItemName	 ,
@Quantity  ,
@CategoryID
											)
												
	End
GO
/****** Object:  StoredProcedure [dbo].[usp_getNotAvailableItems]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_getNotAvailableItems]

AS
BEGIN
SELECT ItemID, ItemName,CategoryName,CategoryID, ItemPrice,Quantity FROM tbl_notavailableitems
where Quantity < 50

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetCancelledBills]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetCancelledBills]

@BillDate DATETIME
AS
BEGIN
SELECT * FROM tbl_Bill
where cast(CONVERT(varchar(8), BillDate, 112) AS datetime) = @BillDate and BillStatus = 'cancelled'
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetBillDetails]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetBillDetails]
@BillNumber INT
AS
BEGIN
SELECT BillNumber, EmployeeID, CustomerName, BillDate, TotalBillAmount
FROM tbl_Bill
WHERE BillNumber = @BillNumber 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ChkLogin]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ChkLogin]
@EmployeeID int,
@Password varchar(14)
AS
BEGIN
 
 select l.RoleID from tbl_LogInDetails l
      
          join tbl_Employee e on e.EmployeeID   =  l.EmployeeID
          
          where l.EmployeeID = @EmployeeID and 
            l.Password = @Password COLLATE SQL_Latin1_General_CP1_CS_AS and
            e.EmployeeStatus is NULL
            

END
GO
/****** Object:  StoredProcedure [dbo].[usp_saveNotAvailableItems]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_saveNotAvailableItems]
@ItemID  int,
@ItemName varchar(40),
@Quantity numeric(10, 0),
@ItemPrice numeric(20, 2),
@CategoryName varchar(50),
@CategoryID int

AS
BEGIN
INSERT INTO tbl_notavailableitems
(
ItemID,
ItemName,
Quantity,
ItemPrice,
CategoryID,
CategoryName
)
VALUES
(@ItemID,@ItemName,@Quantity,@ItemPrice,@CategoryID,@CategoryName)

END
GO
/****** Object:  StoredProcedure [dbo].[usp_highLowRollingItems]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_highLowRollingItems]
@FromDate DATETIME,
@ToDate DATETIME
AS
BEGIN
WITH CTE_ItemSold as 
(
SELECT DISTINCT TOP 3 SUM(ItemQuantitySold) ItemSold,ItemID FROM tbl_ItemStatus GROUP BY ItemID ORDER BY ItemSold
)
SELECT t1.ItemID,t1.ItemName,t1.ItemCategory,t1.ItemSold
FROM tbl_ItemStatus t1
JOIN CTE_ItemSold t2
ON
t1.ItemID=t2.ItemID
JOIN
tbl_Bill t3
ON
t3.ItemID=t2.ItemID
WHERE
t3.BillDate >=@FromDate AND t3.BillDate <=@ToDate 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_viewBillByDate]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_viewBillByDate]
@BillDate  DATETIME
AS
BEGIN
select BillNumber, CustomerName, TotalBillAmount
from tbl_Bill
where cast(CONVERT(varchar(8), BillDate, 112) AS datetime) = @BillDate
END
GO
/****** Object:  StoredProcedure [dbo].[usp_updatepswrd]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_updatepswrd]
@EmployeeID int,
@Password varchar(14)
as
begin
update tbl_LogInDetails
set Password=@Password COLLATE SQL_Latin1_General_CP1_CS_AS 
where EmployeeID=@EmployeeID
end
GO
/****** Object:  StoredProcedure [dbo].[usp_updateItemDetails]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_updateItemDetails]
@ItemID int,
@ItemName varchar(40),
@Quantity numeric(10,0),
@ItemPrice numeric(20,2),
@ItemDiscount numeric(10,3),
@ItemClosingCount int,
@CategoryID int

AS
BEGIN
update tbl_ItemDetails
set 

			ItemName = @ItemName,
			Quantity = @Quantity,
			ItemPrice = @ItemPrice,
			ItemDiscount = @ItemDiscount,
			ItemClosingCount = @ItemClosingCount,
			CategoryID = @CategoryID
			
where ItemID = @ItemID

if(@Quantity>(select Quantity from tbl_ItemDetails where ItemID=@ItemID))
insert into tbl_Quantity_added_by_admin
(AddDate,ItemID,QuantityAdded)
values
(
GETDATE(),@ItemID ,(@Quantity-(select Quantity from tbl_ItemDetails where ItemID=@ItemID))
)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_updateEmployeeDetails]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_updateEmployeeDetails]
@EmployeeID int,
@RoleId int
AS
BEGIN
update tbl_Employee
set 
RoleID = @RoleId
where EmployeeID = @EmployeeID

update tbl_LogInDetails 
set 
RoleID = @RoleId
where EmployeeID = @EmployeeID
END
GO
/****** Object:  StoredProcedure [dbo].[usp_viewMoneyTransaction]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_viewMoneyTransaction]
@BillDate		DATETIME
AS
BEGIN
select BillNumber,MoneyIn,ReturnAmount,TotalBillAmount
from tbl_Bill
where cast(CONVERT(varchar(8), BillDate, 112) AS datetime) = @BillDate
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ViewReturnedItems]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ViewReturnedItems]
@Date datetime
AS
BEGIN

select ItemID,
ItemName,
b.BillNumber,
QuantityReturned,
Remark

from tbl_BillDetails bd
join tbl_Bill b
on b.BillNumber= bd.BillNumber
where ItemStatus = 'ok' and @Date=cast(CONVERT(varchar(8), b.BillDate, 112) AS datetime)

END
GO
/****** Object:  StoredProcedure [dbo].[usp_ViewBillDetails]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ViewBillDetails]
@BillNo int
AS
BEGIN	

select
ItemName,
QuantityPurchased,
ItemStatus,
QuantityReturned,
ItemWiseDiscount,
LineTotal,
ReturnedTotal,
Remark,
ItemID
	
from tbl_BillDetails
	
where BillNumber = @BillNo

END
GO
/****** Object:  StoredProcedure [dbo].[usp_tbl_BillDetails]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_tbl_BillDetails]
@CustomerName         VARCHAR(40),
@BillDate             DATETIME,
@ItemName             VARCHAR(40),
@ItemCategory         VARCHAR(40),
@QuantityPurchased    NUMERIC(10),
@TotalPrice           NUMERIC(20,2),
@ItemWiseDiscount     NUMERIC(10,3),
@ItemStatus           VARCHAR(20),
@QuantityReturned     NUMERIC(10),
@ReturnedTotal        NUMERIC(20,2),
@Remark               VARCHAR(100)
,@BillNumber          INT OUT
AS
BEGIN
INSERT INTO tbl_BillDetails
(CustomerName, 
BillDate, 
ItemName, 
ItemCategory, 
QuantityPurchased, 
TotalPrice,
ItemWiseDiscount,
ItemStatus,
QuantityReturned,
ReturnedTotal,
Remark)
VALUES
(@CustomerName,
 @BillDate,
 @ItemName,
 @ItemCategory,
 @QuantityPurchased,
 @TotalPrice,
 @ItemWiseDiscount,
 @ItemStatus,
 @QuantityReturned,
 @ReturnedTotal,
 @Remark
 )
SET @BillNumber=@@IDENTITY
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ReturnItems]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ReturnItems]
@QuantityReturned numeric(10,0),
@ReturnedTotal numeric(20,2),
@Remark varchar (100),
@BillNumber int,
@ItemID int

AS
BEGIN
  update tbl_BillDetails 
  
		set QuantityReturned = @QuantityReturned,
			ReturnedTotal = @ReturnedTotal,
			Remark = @Remark
			
		where BillNumber = @BillNumber and ItemID=@ItemID

END
GO
/****** Object:  StoredProcedure [dbo].[usp_reportDateWise]    Script Date: 05/16/2013 15:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_reportDateWise]
@BillDate1	datetime,
@BillDate2	datetime

AS
BEGIN
SELECT b.BillDate,sum(b.TotalBillAmount)as TotalSales,bd.ItemName
from tbl_Bill b join tbl_BillDetails bd
on b.BillNumber=bd.BillNumber
where b.BillDate>=@BillDate1 and b.BillDate<=@BillDate2 and b.BillStatus='ok'
group by b.BillDate,bd.ItemName
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ReportCategoryWiseSM]    Script Date: 05/16/2013 15:23:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ReportCategoryWiseSM]
@BillDate1	datetime,
@BillDate2	datetime
AS
BEGIN
SELECT a.BillDate, d.CategoryName, SUM(a.TotalBillAmount) AS TotalSales
FROM tbl_Bill a join tbl_BillDetails b
ON a.BillNumber=b.BillNumber
JOIN tbl_ItemDetails c
ON c.ItemID=b.ItemID
JOIN tbl_Category d
ON d.CategoryID=c.CategoryID
WHERE a.BillDate >= @BillDate1 AND a.BillDate<=@BillDate2 AND a.BillStatus='ok' 
GROUP BY d.CategoryName, a.BillDate
END
GO
/****** Object:  StoredProcedure [dbo].[usp_LR]    Script Date: 05/16/2013 15:23:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_LR]
@FromDate DATETIME,
@ToDate DATETIME
AS
BEGIN
WITH CTE_ItemSold as 
(

select distinct top 3 SUM(QuantityPurchased) ItemSold,ItemID FROM tbl_BillDetails group by ItemID ORDER BY ItemSold 
)
select distinct t1.ItemName,t2.ItemSold,t3.CategoryName
from tbl_ItemDetails t1
join CTE_ItemSold t2
on t1.ItemID=t2.ItemID
join tbl_BillDetails bd
on bd.ItemID=t2.ItemID
join tbl_Bill b
on b.BillNumber=bd.BillNumber
join tbl_Category t3
on t3.CategoryID=t1.CategoryID

where b.BillDate>=@FromDate and b.BillDate<=@ToDate 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_itemReport]    Script Date: 05/16/2013 15:23:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[usp_itemReport]
@ItemCategory		VARCHAR(40)
AS
BEGIN
SELECT a.ItemID,a.ItemName,a.Quantity,QuantityAvailable=a.Quantity -b.QuantityPurchased
from  tbl_ItemDetails a join tbl_BillDetails b
on a.ItemCategory=b.ItemCategory
WHERE a.ItemCategory=@ItemCategory
END
GO
/****** Object:  StoredProcedure [dbo].[usp_HRLR]    Script Date: 05/16/2013 15:23:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_HRLR]
AS
BEGIN
WITH CTE_ItemSold as 
(

select top 3 SUM(QuantityPurchased) ItemSold,ItemID FROM tbl_BillDetails group by ItemID ORDER BY ItemSold DESC
)
select t1.ItemName,t2.ItemSold,t3.CategoryName
from tbl_ItemDetails t1
join CTE_ItemSold t2
on t1.ItemID=t2.ItemID
join tbl_Category t3
on t3.CategoryID=t1.CategoryID
END
GO
/****** Object:  StoredProcedure [dbo].[usp_HR]    Script Date: 05/16/2013 15:23:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_HR]
@FromDate DATETIME,
@ToDate DATETIME
AS
BEGIN
WITH CTE_ItemSold as 
(

select distinct top 3 SUM(QuantityPurchased) ItemSold,ItemID FROM tbl_BillDetails group by ItemID ORDER BY ItemSold DESC
)
select distinct t1.ItemName,t2.ItemSold,t3.CategoryName
from tbl_ItemDetails t1
join CTE_ItemSold t2
on t1.ItemID=t2.ItemID
join tbl_BillDetails bd
on bd.ItemID=t2.ItemID
join tbl_Bill b
on b.BillNumber=bd.BillNumber
join tbl_Category t3
on t3.CategoryID=t1.CategoryID

where b.BillDate>=@FromDate and b.BillDate<=@ToDate 

END
GO
/****** Object:  StoredProcedure [dbo].[usp_crossCheckItems]    Script Date: 05/16/2013 15:23:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_crossCheckItems]
AS
BEGIN
WITH CTE_ItemSold as 
(

select SUM(QuantityPurchased) ItemSold,ItemID FROM tbl_BillDetails group by ItemID 
)
select t2.ItemName,t2.Quantity,t2.ItemClosingCount,t1.ItemSold,a.QuantityAdded
from CTE_ItemSold t1
join tbl_ItemDetails t2
on t1.ItemID=t2.ItemID
join tbl_BillDetails bd
on bd.ItemID=t2.ItemID 
join tbl_Quantity_added_by_admin a
on a.ItemID=bd.ItemID
join tbl_Bill b
on b.BillNumber=bd.BillNumber
where cast(CONVERT(varchar(8), b.BillDate, 112) AS datetime)= cast(CONVERT(varchar(8), GETDATE(), 112) AS datetime)

end
GO
/****** Object:  StoredProcedure [dbo].[usp_CancelBill]    Script Date: 05/16/2013 15:23:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_CancelBill]
@BillNumber            INT,
@Remarks               VARCHAR(100)
AS
BEGIN
UPDATE tbl_Bill
SET	BillStatus='cancelled', Remarks = @Remarks
where BillNumber=@BillNumber

UPDATE tbl_BillDetails
SET ItemStatus='cancelled'
where BillNumber=@BillNumber

UPDATE tbl_ItemDetails 
SET   tbl_ItemDetails.Quantity=tbl_ItemDetails.Quantity + tbl_BillDetails.QuantityPurchased

FROM   tbl_BillDetails
       JOIN tbl_ItemDetails
         ON tbl_ItemDetails.ItemID = tbl_BillDetails.ItemID  
		where tbl_BillDetails.ITEMSTATUS='cancelled' and tbl_BillDetails.BillNumber=@BillNumber 

END
GO
/****** Object:  StoredProcedure [dbo].[usp_addBillDetails]    Script Date: 05/16/2013 15:23:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_addBillDetails]
 
 @BillNumber int, 
 @ItemID int,
@ItemName	varchar(40),
@BillDate         DATETIME,
@QuantityPurchased numeric(10, 0),
@ItemWiseDiscount numeric(10, 3),
@ItemStatus  varchar(20),
@QuantityReturned numeric(10, 0),
@ReturnedTotal numeric(20, 2),
@Remark varchar(100),
@LineTotal int
 
AS
set @Remark = null
BEGIN

   INSERT INTO tbl_BillDetails
 (
 BillNumber,
 ItemID,
ItemName,

QuantityPurchased,
LineTotal,
ItemWiseDiscount,
ItemStatus,
QuantityReturned,
ReturnedTotal,
Remark
 )
 
 VALUES
(
@BillNumber,
@ItemID,
@ItemName,

@QuantityPurchased,
@LineTotal,
@ItemWiseDiscount,
@ItemStatus,
@QuantityReturned,
@ReturnedTotal,
@Remark
)

if (  cast(CONVERT(varchar(8), @BillDate, 112) AS datetime)!= cast(CONVERT(varchar(8), GETDATE(), 112) AS datetime))
update tbl_ItemDetails set ItemClosingCount = Quantity 

UPDATE tbl_ItemDetails
SET Quantity = (Quantity - @QuantityPurchased) 
WHERE @ItemID=ItemID

    
END
GO
/****** Object:  ForeignKey [FK__tbl_ItemD__Categ__7E02B4CC]    Script Date: 05/16/2013 15:23:29 ******/
ALTER TABLE [dbo].[tbl_ItemDetails]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[tbl_Category] ([CategoryID])
GO
/****** Object:  ForeignKey [FK__tbl_Emplo__RoleI__0B5CAFEA]    Script Date: 05/16/2013 15:23:29 ******/
ALTER TABLE [dbo].[tbl_Employee]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[tbl_Role] ([RoleID])
GO
/****** Object:  ForeignKey [FK__tbl_MenuR__MenuI__22751F6C]    Script Date: 05/16/2013 15:23:29 ******/
ALTER TABLE [dbo].[tbl_MenuRoleAccess]  WITH CHECK ADD FOREIGN KEY([MenuID])
REFERENCES [dbo].[tbl_Menu] ([MenuID])
GO
/****** Object:  ForeignKey [FK__tbl_MenuR__RoleI__2180FB33]    Script Date: 05/16/2013 15:23:29 ******/
ALTER TABLE [dbo].[tbl_MenuRoleAccess]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[tbl_Role] ([RoleID])
GO
/****** Object:  ForeignKey [FK__tblAppoin__Docto__6225902D]    Script Date: 05/16/2013 15:23:29 ******/
ALTER TABLE [dbo].[tblAppointment_685501]  WITH CHECK ADD FOREIGN KEY([DoctorId])
REFERENCES [dbo].[tblDoctor_685501] ([DoctorId])
GO
/****** Object:  ForeignKey [FK__tblAppoin__Speci__6319B466]    Script Date: 05/16/2013 15:23:29 ******/
ALTER TABLE [dbo].[tblAppointment_685501]  WITH CHECK ADD FOREIGN KEY([SpecializationID])
REFERENCES [dbo].[tblSpecialization_685501] ([SpecializationID])
GO
/****** Object:  ForeignKey [FK__tbl_Vendo__Categ__10216507]    Script Date: 05/16/2013 15:23:29 ******/
ALTER TABLE [dbo].[tbl_VendorItemCategory]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[tbl_Category] ([CategoryID])
GO
/****** Object:  ForeignKey [FK__tbl_Vendo__Vendo__0F2D40CE]    Script Date: 05/16/2013 15:23:29 ******/
ALTER TABLE [dbo].[tbl_VendorItemCategory]  WITH CHECK ADD FOREIGN KEY([VendorID])
REFERENCES [dbo].[tbl_VendorDetails] ([VendorID])
GO
/****** Object:  ForeignKey [FK__tbl_Order__Vendo__58D1301D]    Script Date: 05/16/2013 15:23:29 ******/
ALTER TABLE [dbo].[tbl_Orders]  WITH CHECK ADD FOREIGN KEY([VendorID])
REFERENCES [dbo].[tbl_VendorDetails] ([VendorID])
GO
/****** Object:  ForeignKey [FK__tbl_Quant__ItemI__6501FCD8]    Script Date: 05/16/2013 15:23:29 ******/
ALTER TABLE [dbo].[tbl_Quantity_added_by_admin]  WITH CHECK ADD FOREIGN KEY([ItemID])
REFERENCES [dbo].[tbl_ItemDetails] ([ItemID])
GO
/****** Object:  ForeignKey [FK__tbl_place__Order__5AB9788F]    Script Date: 05/16/2013 15:23:29 ******/
ALTER TABLE [dbo].[tbl_place_order]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[tbl_Orders] ([OrderID])
GO
/****** Object:  ForeignKey [FK__tbl_LogIn__Emplo__6CD828CA]    Script Date: 05/16/2013 15:23:29 ******/
ALTER TABLE [dbo].[tbl_LogInDetails]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[tbl_Employee] ([EmployeeID])
GO
/****** Object:  ForeignKey [FK__tbl_LogIn__RoleI__251C81ED]    Script Date: 05/16/2013 15:23:29 ******/
ALTER TABLE [dbo].[tbl_LogInDetails]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[tbl_Role] ([RoleID])
GO
/****** Object:  ForeignKey [FK__tbl_Bill__Custom__6442E2C9]    Script Date: 05/16/2013 15:23:29 ******/
ALTER TABLE [dbo].[tbl_Bill]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[tbl_CustomerDetails] ([CustomerID])
GO
/****** Object:  ForeignKey [FK__tbl_Bill__Employ__65370702]    Script Date: 05/16/2013 15:23:29 ******/
ALTER TABLE [dbo].[tbl_Bill]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[tbl_Employee] ([EmployeeID])
GO
/****** Object:  ForeignKey [FK__tbl_Order__Categ__0880433F]    Script Date: 05/16/2013 15:23:29 ******/
ALTER TABLE [dbo].[tbl_OrderItems]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[tbl_Category] ([CategoryID])
GO
/****** Object:  ForeignKey [FK__tbl_Order__ItemI__5CA1C101]    Script Date: 05/16/2013 15:23:29 ******/
ALTER TABLE [dbo].[tbl_OrderItems]  WITH CHECK ADD FOREIGN KEY([ItemID])
REFERENCES [dbo].[tbl_ItemDetails] ([ItemID])
GO
/****** Object:  ForeignKey [FK__tbl_Order__Order__5D95E53A]    Script Date: 05/16/2013 15:23:29 ******/
ALTER TABLE [dbo].[tbl_OrderItems]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[tbl_Orders] ([OrderID])
GO
/****** Object:  ForeignKey [FK_tbl_notavailableitems_tbl_ItemDetails]    Script Date: 05/16/2013 15:23:29 ******/
ALTER TABLE [dbo].[tbl_notavailableitems]  WITH CHECK ADD  CONSTRAINT [FK_tbl_notavailableitems_tbl_ItemDetails] FOREIGN KEY([ItemID])
REFERENCES [dbo].[tbl_ItemDetails] ([ItemID])
GO
ALTER TABLE [dbo].[tbl_notavailableitems] CHECK CONSTRAINT [FK_tbl_notavailableitems_tbl_ItemDetails]
GO
/****** Object:  ForeignKey [FK__tbl_BillD__BillN__671F4F74]    Script Date: 05/16/2013 15:23:29 ******/
ALTER TABLE [dbo].[tbl_BillDetails]  WITH CHECK ADD FOREIGN KEY([BillNumber])
REFERENCES [dbo].[tbl_Bill] ([BillNumber])
GO
