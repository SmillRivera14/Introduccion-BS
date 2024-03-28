--create FUNCTION nombre de la funcion (parametro) RETURNS tipi de 
--as 
--BEGIN

--comportamiento

--end

create FUNCTION optener_edad (@id_edad int ) RETURNS int 
    AS
        BEGIN
        DECLARE @edad int 
        SELECT @edad = (IDedad) from Ciudadanos3 where IDedad= @id_edad
        RETURN @edad

    end
GO

select* from Edad


SELECT  personas, dbo.optener_edad (1) 'Edad'  from Ciudadanos3 where IDedad = 2
go 
-------------------------------------------------------------------------
-------------------------------------------------------------------------

create FUNCTION cedula (@id_cedula int) RETURNs int
as
BEGIN
DECLARE @cedula int
SELECT  @cedula= (Cédula) from vwCiudadanos3 where Cédula= @id_cedula
RETURN @cedula
end
go 

select  personas, edad, dbo.cedula(111) as cedula from vwCiudadanos3 where Cédula = 111

-------------------------------------------------------------------------
-------------------------------------------------------------------------

SELECT*from Ciudadanos3
GO

create VIEW vwCiudadanos3
as 
SELECT c.Cédula, c.personas, s.sexo, e.edad, p.provincias,  m.municipios, sc.sectores from Ciudadanos3 c 
            join Edad e on c.IDedad= e.id
            join Municipios m on c.IDmunicipios= m.id
            join Sexo s on c.IDsexo = s.id
            join Provincias p on c.IDprovincias= p.id
            join Sectores sc on c.IDsectores= sc.id
go 

select * from vwCiudadanos3
SELECT *from Municipios
-------------------------------------------------------------------------
-------------------------------------------------------------------------

select Cédula, personas, IDmunicipios =     ---Muestra los datos

case IDmunicipios       ---campo a evaluar

    when 3 then 'Vive en la Capital'        ---condición

    else 'No vive en la capital'            ---En canso de no cumplir la condición.

END     ---por defecto entrega null

from Ciudadanos3        ---tabla
go

-------------------------------------------------------------------------
-------------------------------------------------------------------------

----create trigger nombredeltrigger
    --on tabla a afectar
    --for | after| instead of - insert | delete | update |
    --as 
    -- sentencias

SELECT* FROM Ciudadanos3
GO

create TRIGGER tr_edad_insert
    on Edad 
        for insert
        as 
        if (select COUNT(*) from Edad)>5 --operación, cuentame todo lo que se inserte de la tabla edad y si es mayor a 5 realiza lo siguiente

        BEGIN
        RAISERROR('No se puede añadir más de un registro', 16,1) -- Lanza un mensaje de error, en el ¿nivel 16 y el estado 1?

        ROLLBACK TRAN  --Luego de esto realiza un rollback a la transacción realizada 

        end  --finaliza las operaciones
GO

BEGIN TRAN 
insert into Edad values (14, 53), (15, 30),(16, 31), (17, 32), (18, 33), (19, 34)

ROLLBACK
SELECT*from edad