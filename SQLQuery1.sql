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

Insert into AddressBook_Table(FirstName, Lastname, Address, City, State, ZipCode, PhoneNumber, Email)

Values('Sunny', 'Sej', 'Ghandhi Road', 'Gwa', 'MP', 475010, 9817782365, 'Sunny12@gmail.com'),
('Sunil', 'Rathod', 'Ambla Road', 'Roork', 'AP', 567001, 9837010289, 'sunil0@gmail.com'),
('Himansh', 'Mehra', 'Kappa Road','Noida', 'UP', 547965, 8926452301, 'himansh49@gmail.com'),
('komal','patil','saibaba nagar','surat','gujarat',34567,'7854216785','komal222@gmail.com'),
('riya','khairnar','shiv nagar','jaipur','Rajasthan',432007,'7285108928','riya8993@gmail.com');

select * from AddressBook_Table

Update AddressBook_Table set PhoneNumber = 8006907440 where Firstname = 'Himansh';
Update AddressBook_Table Set Address='bhilai',ZipCode='491335' where FirstName='riya';
select * from AddressBook_Table

Delete from AddressBook_Table where Firstname='riya' and Lastname='khairnar'
select * from AddressBook_Table

Select * from AddressBook_Table where City='surat' Order By FirstName;
Select * from AddressBook_Table where State='UP' Order By FirstName;

select count(*) from AddressBook_Table where city='Gwa';

select count(*) from AddressBook_Table where State='AP';

Select Count(*),State,City from AddressBook_Table Group by State,City;

select FirstName from AddressBook_Table Order By City ASC;
select FirstName,LastName,City from AddressBook_Table Order By City DESC;
select city from AddressBook_Table order by LastName;

Alter table AddressBook_Table Add Type VARCHAR(20)
Update AddressBook_Table SET Type = 'Friends' where Firstname = 'Himansh'
Update AddressBook_Table SET Type = 'Family' where Firstname = 'Komal'
Update AddressBook_Table SET Type = 'Family' where Firstname = 'riya'

 select count(*),Type from AddressBook_Table group by Type;

 alter table AddressBook_Table Drop column Type;

Select* from AddressBook_Table;

Create table AddressBookType( TypeId int NOT NULL Primary Key  Identity(1,1),Type varchar(25));

select* from AddressBookType

Create table AddressBookMapping( MappingID int primary key Identity (1,1),
AddressBookID int,
Typeid int,
);

alter table AddressBookMapping ADD Foreign key (AddressBookID) References AddressBook(Id);
alter table AddressBookMapping ADD Foreign key (Typeid) References AddressBookType(Typeid);

select * from AddressBookType;
select * from AddressBookMapping;

Insert into AddressBookType values('Friends'),('Family'),('Profession'),('others');

Insert into AddressBookMapping(AddressBookID,Typeid)values(1,1),(1,2);

select * from AddressBook_Table INNER JOIN AddressBookMapping ON AddressBookID=AddressBookMapping.AddressBookID INNER JOIN AddressBookType ON AddressBookType.Typeid=AddressBookMapping.Typeid

create table Location
(ID int,
Area varchar (20)
constraint Location_foreign_Key_ID foreign key(ID) references AddressBook_Table(ID) on delete cascade)

create table TypeTable
(ID int,
Type varchar(20),
constraint TypeTable_foreign_key foreign key(ID) references AddressBook_Table(ID) on delete cascade) 
Insert into TypeTable select ID, Type from AddressBook_Table

Select * from AddressBook_Table where City = 'Delhi' or State = 'Uttar Pradesh'
Select Count(*),State,City from AddressBook_Table Group by State,City
select * from AddressBook_Table where City='Dehradun' order by Firstname
Select COUNT(*),Type from AddressBook_Table Group by Type