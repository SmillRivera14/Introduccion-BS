--Práctica final introducción a base de datos.
--Profesor Marino Junior Dicent Gil.
--Smill Emmanuel Rivera Diaz.
--Matrícula 2022-0134.

--1.	Se requiere hacer una base de datos para el almacenamiento de la información de todos los procesos, con las siguientes tablas:

--	Persona (Cliente, Ciudadano, Alumno, Empleado), 
--con los atributos ID, NOMBRE, APELLIDOS, FECHA_NACIMIENTO, DIRECCION, TELEFONO, IDSECTOR, IDMUNICIPIO, IDPROVINCIA, 
--IDREGION, EMAIL, FECHA_CREACION, ID_DEPARTAMENTO (Si Aplica)  

--	Todas las tablas con ID, con los atributos ID, DESCRIPCION. 

--	Todas las tablas concernientes a la empresa (Producto, Factura, DetalleProducto, Asignatura, Roles, Ventas).  

--2.	Insertar 10 registros en cada tabla.  

--3.	La tabla Factura, debe contener los datos de quién hizo la compra, qué producto compró, la cantidad, el total y la fecha de compra).  

--4.	Hacer una vista que muestre las compras o los servicios hechos por cada persona, depende el caso.  

--5.	Hacer un store procedure, que a través del ID de la persona, traiga el total de compras o servicios realizados (monto) 
--y otro que traiga todos los datos de la persona sólo con insertar el ID.


create database Prac_final;
use Prac_final;
--Empresa de enmarcado de cuadros.

create table solicitantes (
    id int PRIMARY KEY,
    Capacitacion VARCHAR (50),
    Nombre VARCHAR (50),
    Apellido VARCHAR (50),
    IDempleos int
);
go 
sele

create table empleos (
    id int PRIMARY KEY,
    puestos varchar (50),
);
GO

SELECT*from vwTrabajadores
go

create table Cliente(
    id int PRIMARY KEY,
    Nombre varchar (50),
    Apellido varchar (50),
    Direccion varchar (80),
    telefono varchar (18),
    Email varchar (50),
    IDproducto int,
    N_factura int,
    IDservicio int
);
go 

Select* from Cliente

insert into cliente values 
(100,    'Juan',     'Ramirez',    'Calle conrrado #5',      829-559-2221,    'alguien@example.com',   1, 1, 1, 121, 1),
(101,    'Marizol',  'Sosa',       'Calle conrrado #6',      829-559-2222,    'alguien@example.com',   2, 2, 2, 122, 2),
(102,    'Carlos',   'Alcantara',  'Calle conrrado #7',      829-559-2223,    'alguien@example.com',   3, 3, 3, 123, 3),
(103,    'Andrés',   'Niviera',    'Calle conrrado #8',      829-559-2224,    'alguien@example.com',   4, 4, 4, 124, 4),
(104,    'Luis',     'Rivera',     'Calle conrrado #9',      829-559-2225,    'alguien@example.com',   5, 5, 1, 125, 1),
(105,    'Miguel',   'Diaz',       'Calle conrrado #10',     829-559-2226,    'alguien@example.com',   6, 6, 2, 126, 2),
(106,    'Luan',     'Ramirez',    'Calle conrrado #11',     829-559-2227,    'alguien@example.com',   7, 7, 3, 127, 3),
(107,    'Liam',     'Castro',     'Calle conrrado #12',     829-559-2228,    'alguien@example.com',   8, 8, 4, 128, 4),
(108,    'Richart',  'Trump',      'Calle conrrado #13',     829-559-2229,    'alguien@example.com',   3, 3, 1, 129, 1),
(109,    'Jason',    'Momoa',      'Calle conrrado #14',     829-559-2230,    'alguien@example.com',   3, 3, 2, 130, 2),
(110,    'Feredico', 'Ruas',       'Calle conrrado #15',     829-559-2231,    'alguien@example.com',   3, 3, 3, 131, 3),
(111,    'Ramon',    'Alcantara',  'Calle conrrado #16',     829-559-2232,    'alguien@example.com',   2, 2, 4, 132, 4)
go 


create table servicio(
    ID int PRIMARY KEY,
    producto VARCHAR (100),
    precio int
);
go 

SELECT * from servicio

insert into servicio VALUES 
(1,  'Enmarcado tradicional',          1500),						
(2,  'Fabricación de Marco/s',         1600),							
(3,  'Compra de marcos',               1000),					
(4,  'Restauración de marcos',         1700),
(5,  'Restauración de pintura',        2000),
(6,  'Venta de pack restauración',     1000),
(7,  'mantenimiento preventivo',       600),
(8,  'Protección contra brillo',       100),
(9,  'Emarcado en carpentier',         2600 ),
(10, 'Restauración cuadros de marmol', 2000)
go 



create table factura(
    No_factura int PRIMARY KEY, 
    IDcliente int, 
    fecha_fac DATETIME,
    cantidad int,
    idDetelles int,
);
go



insert into factura VALUES
(121,   100,    1/6/2022,   1,	1),
(122,	101,	2/6/2022,	2,	2),
(123,	102,	3/6/2022,	3,	3),
(124,	103,	4/6/2022,	2,	4),
(125,	104,	5/6/2022,	1,	1),
(126,	105,	6/6/2022,	2,	2),
(127,	106,	7/6/2022,	3,	3),
(128,	107,	8/6/2022,	2,	4),
(129,	108,	9/6/2022,	1,	1),
(130,	109,	10/6/2022,	1,	2),
(131,	110,	11/6/2022,	1,	3),
(132,	111,	12/6/2022,	1,	4)
GO

create table detalle_factura (
    ID int PRIMARY KEY,         --el cliente puede tener varias facturas y estás a su vez datos distintos de compra
    Oficina varchar (80),
    Tipo_de_pago varchar (10),
    descripcion varchar (80)
);
go


Select * from detalle_factura

insert into detalle_factura values 
(1, 'Of.Sarasota',          'Efectivo',	'Enmarcado de una foto común'),
(2, 'Of.Haina',	            'Efectivo',	'Fabricación de un Lober Travell'),
(3, 'Of.Moca',	            'Efectivo',	'ninguna'),
(4, 'Of.Distrito nacional',	'Efectivo',	'Restauración de un Carlos Car'),
(5, 'Of.Sanches Ramirez',	'Efectivo',	'ninguna'),
(6, 'OF.Las Americas',      'Credito',  'Equipo de restauración profesional de marcos'),
(7, 'Of.San Francisco',     'Credito',  'ninguna'),
(8, 'Of.Cataluña',          'Credito',  'Resturación/integración de capa protectora'),
(9, 'Of.Silvestre',         'Efectivo', 'ninguna'),
(10, 'Of.Paseo ecologico',  'Credito',  'Restauracion Carlos Celin')
go 

--Vista con datos relacionados al cliente.

create VIEW vwTrabajo_final
as
select c.id 'ID', d.Oficina, f.No_factura, f.fecha_fac 'Fecha de Facturación', Nombre, c.Apellido, c.Email, 
        c.telefono 'Teléfono', s.producto 'Servicio solicitado', 
        d.Tipo_de_pago 'Tipo de pago', s.precio 'Precio'  
        from Cliente c 
            join servicio s on c.IDservicio = s.ID
            join detalle_factura d on c.IDproducto = d.id  
            join factura f on c.N_factura = f.No_factura
GO

select * from vwTrabajo_final
go

--Vista con datos relacionados al cliente.


--Este trae el total de la compra
--para hacer la primera parte, necesito saber cuantos servivcio soliticitó el cliente y el precio de dichos servicios
-- entonces, tengo que unir mi tabla clientes con factura y producto
-- en factura esta la cantidad, en servicio está el precio y en clientes la persona.
--luego multiplicar

create proc spTotal_Compra
@ID int
as
SELECT c.id 'ID', f.No_factura, c.Nombre, c.Apellido, s.producto 'Servicio', f.cantidad 'Cantidad', s.precio 'Precio',
f.cantidad * s.precio as 'Total'                      --aquí sucede el calculo
        from cliente c join servicio s on c.IDservicio = s.ID
                       join factura f  on  c.N_factura = f.No_factura 
where c.id= @ID
GO

EXEC spTotal_Compra '106';
EXEC spTotal_Compra '103';
go 


--Este trae datos de la persona a traves del ID
create proc srDatos_clientes
@ID int
AS
    select Nombre, Apellido, teléfono, Email
    from vwTrabajo_final
    where ID= @ID;
GO

EXEC srDatos_clientes '110';
EXEC srDatos_clientes '104';
EXEC srDatos_clientes '104';