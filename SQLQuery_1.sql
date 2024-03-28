Create database Ciudadania;
USE Ciudadania;
Create table Ciudadanos2 (
 número_cédula VARCHAR (150) primary key,
 Nombre_completo VARCHAR (175),
 id_Lugar_de_nacimiento int,
 Fecha_de_nacimiento datetime,
 id_Nacionalidad int,
 id_Sexo int, 
 id_Sangre int,
 id_Estado_civil int,
 id_Ocupación int,
 id_COLEGIO_ELECTORAL int,
 Dirección_de_residencia varchar (147)
);

create table ocupación (
    id int PRIMARY key,
    Ocupación varchar (70)
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
create table Sangre3(
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


/* Select {columna}
from {tabla}{t1}
inner join {tabla}{t2}
on t1.id=t2.id*/

SELECT t1.número_cédula 'Número Cédula', t1.Nombre_completo 'Nombre completp', t4.Sexo,
 t2.Lugar_de_nacimiento 'Lugar de nacimiento', t5.Nacionalidad, t1.Fecha_de_nacimiento 'Fecha de nacimiento',
 t1.Dirección_de_residencia 'Dirección de residencia', t6.Ocupación, t7.Sangre,
 t8.Estado_civil 'Estado civil', t9.COLEGIO_ELECTORAL 'Colegio electoral'
from Ciudadanos2 t1 join Lugar_de_nacimiento t2 on t1.id_Lugar_de_nacimiento= t2.id  
join Sexo_ t4 on t1.id_Sexo= t4.id
join Nacionalidad t5 on t1.id_Nacionalidad = t5.id 
join ocupación t6 on t1.id_Ocupación = t6.id
join Sangre3 t7 on t1.id_Sangre = t7.id
join Estado_civil t8 on t1.id_Estado_civil = t8.id
join COLEGIO_ELECTORAL t9 on t1.id_COLEGIO_ELECTORAL = t9.id
GO

create VIEW vwCiudadanos
as
select número_cédula, Nombre_completo, Fecha_de_nacimiento, Dirección_de_residencia,
Sangre, Sexo, Lugar_de_nacimiento, Ocupación, COLEGIO_ELECTORAL, Estado_civil, Nacionalidad

 from Ciudadanos2 t1, Sangre3 t2, Sexo_ t3, Lugar_de_nacimiento t4, ocupación t5, COLEGIO_ELECTORAL t6,
 Estado_civil t7, Nacionalidad t8

 where t1.id_Sangre= t2.id and t1.id_Sexo= t3.id and t1.id_Sangre= t2.id 
 and t1.id_Lugar_de_nacimiento= t4.id and t1.id_Nacionalidad= t8.id
 and t1.id_Ocupación= t5.id and t1.id_Estado_civil = t7.id 
 and t1.id_COLEGIO_ELECTORAL= t6.id
 GO

 select*from vwCiudadanos