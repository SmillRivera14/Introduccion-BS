use  Prac_final;

CREATE TABLE Provincias(
    id int PRIMARY KEY,
    provincias varchar (175)
);
GO

CREATE TABLE Municipios(
    id int PRIMARY KEY,
    municipios VARCHAR (175)
);
go 

CREATE TABLE Sector (
    id int PRIMARY KEY,
    sectores varchar (177)
);
GO


create view vwTrabajadores
as
SELECT s.Capacitacion, s.nombre, s.apellido, e.puestos from solicitantes s join empleos e on s.IDempleos = e.id
go