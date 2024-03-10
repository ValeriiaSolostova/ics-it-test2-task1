create table dbo.SKU (
  ID int not null identity,
  Code as ('s' + cast(ID as varchar(255))) persisted not null,
  Name varchar(255) not null,
  constraint PK_SKU primary key (ID)
  constraint UK_Code unique (Code)
);

create table dbo.Family (
  ID int not null identity,
  SurName varchar(30) not null,
  BudgetValue decimal(18, 2) not null
);

create table dbo.Basket (
  ID int not null identity,
  ID_SKU int,
  ID_Family int,
  Quantity int not null check(Quantity >= 0),
  value decimal(18, 2) not null check(value >= 0),
  PurchaseDate datetime not null default(sysdatetime()),
  DiscountValue decimal(18, 2) not null,
  constraint FK_Basket_SKU foreign key(ID_SKU) references dbo.SKU(ID),
  constraint FK_Basket_Family foreign key(ID_Family) references dbo.Family(ID)
);
