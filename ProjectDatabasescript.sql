USE [Restaurant_DB]
GO
/****** Object:  Table [dbo].[BillDetails]    Script Date: 7/12/2019 10:39:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetails](
	[billdetailid] [int] IDENTITY(1,1) NOT NULL,
	[billid] [int] NULL,
	[menuitemid] [int] NULL,
	[quantity] [int] NULL,
	[unitprice] [money] NULL,
	[isdiscountavailable] [bit] NULL,
	[totalprice] [money] NULL,
	[receivedby] [int] NULL,
 CONSTRAINT [PK_BillDetails] PRIMARY KEY CLUSTERED 
(
	[billdetailid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BillInfo]    Script Date: 7/12/2019 10:39:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillInfo](
	[billid] [int] IDENTITY(1,1) NOT NULL,
	[billno] [nchar](10) NULL,
	[subtotal] [money] NULL,
	[discountpercent] [int] NULL,
	[discountamount] [money] NULL,
	[vatpercent] [int] NULL,
	[vatamount] [money] NULL,
	[grandtotal] [money] NULL,
	[billdate] [date] NULL,
	[paymenttype] [int] NULL,
	[tableno] [int] NULL,
	[billstatus] [nchar](10) NULL,
	[entrydatetime] [datetime] NULL,
	[receivedby] [int] NULL,
	[remarks] [nvarchar](50) NULL,
	[isclosed] [bit] NULL,
	[servicechargepercent] [int] NULL,
	[servicechargeamount] [money] NULL,
	[servicetypeid] [int] NULL,
	[paymenttypeid] [int] NULL,
	[waiterid] [int] NULL,
	[tableid] [int] NULL,
	[kotno] [nchar](10) NULL,
 CONSTRAINT [PK_BillInfo] PRIMARY KEY CLUSTERED 
(
	[billid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChargeConfiguration]    Script Date: 7/12/2019 10:39:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChargeConfiguration](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[discountpercent] [int] NULL,
	[servicechargepercent] [int] NULL,
	[vatpercent] [int] NULL,
 CONSTRAINT [PK_ChargeConfiguration] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MenuCategory]    Script Date: 7/12/2019 10:39:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuCategory](
	[menucategoryid] [int] IDENTITY(1,1) NOT NULL,
	[menucategoryname] [nvarchar](250) NULL,
 CONSTRAINT [PK_MenuCategory] PRIMARY KEY CLUSTERED 
(
	[menucategoryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MenuItem]    Script Date: 7/12/2019 10:39:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuItem](
	[menuitemid] [int] IDENTITY(1,1) NOT NULL,
	[menuitemname] [nvarchar](250) NULL,
	[price] [money] NULL,
	[menuitemcode] [int] NOT NULL,
	[menucategoryid] [int] NULL,
	[description] [nvarchar](500) NULL,
 CONSTRAINT [PK_MenuItem] PRIMARY KEY CLUSTERED 
(
	[menuitemcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 7/12/2019 10:39:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentType](
	[paymenttypeid] [int] IDENTITY(1,1) NOT NULL,
	[paymenttype] [nchar](20) NULL,
 CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED 
(
	[paymenttypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RestaurantInfo]    Script Date: 7/12/2019 10:39:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RestaurantInfo](
	[id] [int] NULL,
	[restaurantname] [nvarchar](100) NULL,
	[address] [nvarchar](250) NULL,
	[city] [nvarchar](50) NULL,
	[country] [nvarchar](50) NULL,
	[contactno1] [nvarchar](50) NULL,
	[contactno2] [nvarchar](50) NULL,
	[email] [nvarchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ServiceType]    Script Date: 7/12/2019 10:39:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceType](
	[servicetypeid] [int] IDENTITY(1,1) NOT NULL,
	[servicetype] [nchar](20) NULL,
 CONSTRAINT [PK_ServiceType] PRIMARY KEY CLUSTERED 
(
	[servicetypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableDetails]    Script Date: 7/12/2019 10:39:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableDetails](
	[tableid] [int] IDENTITY(1,1) NOT NULL,
	[tablecode] [nchar](10) NULL,
 CONSTRAINT [PK_TableDetails] PRIMARY KEY CLUSTERED 
(
	[tableid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TempBillDetails]    Script Date: 7/12/2019 10:39:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempBillDetails](
	[billdetailid] [int] IDENTITY(1,1) NOT NULL,
	[billid] [int] NULL,
	[menuitemid] [int] NULL,
	[quantity] [int] NULL,
	[unitprice] [money] NULL,
	[isdiscountavailable] [bit] NULL,
	[totalprice] [money] NULL,
	[receivedby] [int] NULL,
	[isdeleted] [bit] NULL,
 CONSTRAINT [PK_TempBillDetails] PRIMARY KEY CLUSTERED 
(
	[billdetailid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 7/12/2019 10:39:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[userpassword] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Waiters]    Script Date: 7/12/2019 10:39:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Waiters](
	[waiterid] [int] IDENTITY(1,1) NOT NULL,
	[waitername] [nvarchar](100) NULL,
	[waitercode] [nchar](10) NULL,
 CONSTRAINT [PK_Waiters] PRIMARY KEY CLUSTERED 
(
	[waiterid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ChargeConfiguration] ON 

INSERT [dbo].[ChargeConfiguration] ([id], [discountpercent], [servicechargepercent], [vatpercent]) VALUES (1, 10, 10, 15)
SET IDENTITY_INSERT [dbo].[ChargeConfiguration] OFF
SET IDENTITY_INSERT [dbo].[MenuCategory] ON 

INSERT [dbo].[MenuCategory] ([menucategoryid], [menucategoryname]) VALUES (1, N'STARTERS')
INSERT [dbo].[MenuCategory] ([menucategoryid], [menucategoryname]) VALUES (2, N'MAIN COURSES')
INSERT [dbo].[MenuCategory] ([menucategoryid], [menucategoryname]) VALUES (4, N'DRINKS')
INSERT [dbo].[MenuCategory] ([menucategoryid], [menucategoryname]) VALUES (6, N'Demo')
SET IDENTITY_INSERT [dbo].[MenuCategory] OFF
SET IDENTITY_INSERT [dbo].[MenuItem] ON 

INSERT [dbo].[MenuItem] ([menuitemid], [menuitemname], [price], [menuitemcode], [menucategoryid], [description]) VALUES (1, N'Chicken breast', 240.0000, 201, 2, N'Chicken breast stuffed with stilton, wrapped in bacon and roasted')
INSERT [dbo].[MenuItem] ([menuitemid], [menuitemname], [price], [menuitemcode], [menucategoryid], [description]) VALUES (2, N'Beef', 250.0000, 202, 2, N'Beef curry')
SET IDENTITY_INSERT [dbo].[MenuItem] OFF
SET IDENTITY_INSERT [dbo].[PaymentType] ON 

INSERT [dbo].[PaymentType] ([paymenttypeid], [paymenttype]) VALUES (1, N'Cash                ')
INSERT [dbo].[PaymentType] ([paymenttypeid], [paymenttype]) VALUES (2, N'Card                ')
INSERT [dbo].[PaymentType] ([paymenttypeid], [paymenttype]) VALUES (3, N'Company Credit      ')
INSERT [dbo].[PaymentType] ([paymenttypeid], [paymenttype]) VALUES (4, N'Complementary       ')
INSERT [dbo].[PaymentType] ([paymenttypeid], [paymenttype]) VALUES (5, N'Void                ')
SET IDENTITY_INSERT [dbo].[PaymentType] OFF
INSERT [dbo].[RestaurantInfo] ([id], [restaurantname], [address], [city], [country], [contactno1], [contactno2], [email]) VALUES (1, N'Restaurant Name', N'77/1 Anarkali Super Market, Siddishawari, Dhaka 1217', N'Dhaka', N'Bangladesh', N'01921884040', NULL, NULL)
SET IDENTITY_INSERT [dbo].[ServiceType] ON 

INSERT [dbo].[ServiceType] ([servicetypeid], [servicetype]) VALUES (1, N'Dine In             ')
INSERT [dbo].[ServiceType] ([servicetypeid], [servicetype]) VALUES (2, N'Take Out            ')
SET IDENTITY_INSERT [dbo].[ServiceType] OFF
SET IDENTITY_INSERT [dbo].[TableDetails] ON 

INSERT [dbo].[TableDetails] ([tableid], [tablecode]) VALUES (1, N'1         ')
INSERT [dbo].[TableDetails] ([tableid], [tablecode]) VALUES (2, N'2         ')
INSERT [dbo].[TableDetails] ([tableid], [tablecode]) VALUES (3, N'3         ')
SET IDENTITY_INSERT [dbo].[TableDetails] OFF
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([userid], [username], [userpassword]) VALUES (1, N'admin', N'123456')
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
SET IDENTITY_INSERT [dbo].[Waiters] ON 

INSERT [dbo].[Waiters] ([waiterid], [waitername], [waitercode]) VALUES (1, N'A', N'W1        ')
INSERT [dbo].[Waiters] ([waiterid], [waitername], [waitercode]) VALUES (2, N'B', N'W2        ')
SET IDENTITY_INSERT [dbo].[Waiters] OFF
