/*
    Vivek Patel
    CSC 453 Section 810
    Assignment 1
    1/19/2019
*/

drop table Request;
drop table FullOrder;
drop table Customer;
drop table Product;

create table Customer (
    CustomerID  number(3),
    CustomerName varchar(25) not null,
    Address     varchar(50) not null,

    primary key (CustomerID)
);

create table FullOrder (
    OrderID    number(5),
    OrderDate   date,
    CustomerID  number(3),

    primary key (OrderID),
    foreign key (CustomerID) references Customer(CustomerID)
);

create table Product (
    ProductID          number(2),
    ProductDescription varchar(28) not null,
    ProductFinish      varchar(10) not null,
    Price               number(*, 2) check (Price > 0) check (Price < 1000) not null,
    
    primary key (ProductID)
);

create table Request (
    OrderID    number(5),
    ProductID   number(2),
    Quantity    number check (Quantity >= 1) check (Quantity <= 100) not null,
     
    primary key (OrderID, ProductID),
    foreign key (OrderID) references FullOrder(OrderID),
    foreign key (productID) references Product(ProductID)
);

insert into Customer values (2, 'Casual Furniture', 'Plano, TX');
insert into Customer values (6, 'Mountain Gallery', 'Boulder, CO');

insert into FullOrder values (1006, '24-MAR-10', 2);
insert into FullOrder values (1007, '25-MAR-10', 6);
insert into FullOrder values (1008, '25-MAR-10', 6);
insert into FullOrder values (1009, '26-MAR-10', 2);

insert into Product values (10, 'Writing Desk', 'Oak', 425);
insert into Product values (30, 'Dining Table', 'Ash', 600);
insert into Product values (40, 'Entertainment Center', 'Maple', 650);
insert into Product values (70, 'Childrens Dresser', 'Pine', 300);

insert into Request values (1006, 10, 4);
insert into Request values (1006, 30, 2);
insert into Request values (1006, 40, 1);
insert into Request values (1007, 40, 3);
insert into Request values (1007, 70, 2);
insert into Request values (1008, 70, 1);
insert into Request values (1009, 10, 2);
insert into Request values (1009, 40, 1);


select * from customer;
select * from fullorder;
select * from product;
select * from request;