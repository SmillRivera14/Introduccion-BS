Create database Ciudadania;
USE Ciudadania;
Create table Ciudadanos (
 numero_cedula VARCHAR (150) primary key,
 Nombre_completo VARCHAR (175),
 id_Lugar_de_nacimiento int,
 Fecha_de_nacimiento datetime,
 id_Nacionalidad int,
 id_Sexo varchar(10), 
 id_Sangre int,
 id_Estado_civil int,
 id_Ocupacion int,
 id_COLEGIO_ELECTORAL int,
 Direccion_de_residencia varchar (147)
);

create table Lugar_de_nacimiento (
id int primary key,
Lugar_de_nacimiento varchar (70)
);
create table  Nacionalidad(
id int primary key,
 Nacionalidad varchar (70)
);
create table Sexo_ (
id int primary key,
Sexo varchar (10)
);
create table Sangre(
id int primary key,
Sangre varchar (10)
);
create table Estado_civil(
id int primary key,
Estado_civil varchar (10)
);
create table COLEGIO_ELECTORAL(
id int primary key,
COLEGIO_ELECTORAL int);

Create view vwDatosCiudadanos
as

select t1.numero_cedula, t1.Nombre_completo, t1.id_Sexo, t2.Sexo as Sexo
from Ciudadanos t1 inner join Sexo_ t2 on (t1.id_Sexo=t2.id)
