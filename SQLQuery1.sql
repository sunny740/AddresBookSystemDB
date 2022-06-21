create database AddressBook_Service
create table AddressBook_Table
(ID int IDENTITY(1,1) Primary Key,
FirstName varchar(15)Not Null,
LastName varchar(15)Not Null,
Address varchar(50)Not Null,
City varchar(10)Not Null,
State varchar(10) Not Null,
ZipCode Bigint Not Null,
PhoneNumber Bigint Not Null,
Email varchar(20) Not Null)
