Use Puntodeventas
go 
-----------------------------------------------------------------------------------
--3 Subconsultas

--1 subconsulta de columna
Select Montototal, (
	Select count(MontoTotal) 
	From DetalleFactura as E 
	Where Id_Producto > 50) as 'Pago'
	From DetalleFactura
	Group by MontoTotal
	Order by MontoTotal desc
	

--1 subconsulta tabla

Select *
From
	(Select Id_Marca As 'marcas', count (Marca) As 'marcas'
		From Marca
		Group by Marca
	) as marcas

--1 de la que sea (columna, tabla)

SELECT CantidadPzas, (
					Select count(CantidadPzas) 
					From CompraProducto as CP
					Where CantidadPzas > 0
					) as 'Cantidad'
	From CompraProducto
	Group by CantidadPzas
	Order by CantidadPzas desc

select CantidadPzas, count (CantidadPzas) as 'cantidad de piezas'
from CompraProducto
group by CantidadPzas
order by CantidadPzas desc

select Total, count (Total) as 'cantidad de sueldos'
from Venta
group by Total
order by Total desc

select Marca As 'marca', count (Marca) as 'cantidad'
from Marca
group by Marca

-----------------------------------------------------------------------------------
--1 subconsulta with

with CompaProducto (
select total, count(total) as [Cantidad]
	From CompraProducto
	group by total)

select *
from CompraProducto

-----------------------------------------------------------------------------------
--5 Vistas Deben ser reportes de su aplicacion
	--Join (cualquiera)
	--Función de Agregacion (cualquiera)

create view vista_empleados_ingreso (fecha,cantidad)
as select datepart(year,FechaContratacion),count(*)
from empleado group by datepart(year,FechaContratacion)

select *from vista_empleados_ingreso;


Create View ReporteMensualEmpleVentas
As select Venta.Total , sum (Total) as [Total de ventas]
from Venta as venta Inner join Producto
on Producto.Id_Producto = Venta.Id_Producto
Where MONTH(Venta.FechaVenta) = MONTH(GETDATE()) --convierte la fechas y ha ambas les trae el mes
group by Venta.Total


select * From ReporteMensualEmpleVentas


Create View ReporteMensualEntrada 
As select RegistroEntrada.FechaRegistroEntrada as [Fecha]
from RegistroEntrada,Empleado as RE Inner join Empleado as E
on RE.Id_Empleado = e.Id_Empleado
Where MONTH(RegistroEntrada.FechaRegistroEntrada) = MONTH(GETDATE())
group by RegistroEntrada.FechaRegistroEntrada

select * From ReporteMensualEntrada




Create View ReporteMensualPago
As select Emp.Id_Empleado as [Nombre de Empleado] , sum (PE.PagoTotal) as [Total]
from Pago as PE Inner join Empleado as Emp
on Emp.Id_Empleado = PE.Id_Empleado
Where MONTH(PE.FechaPago) = MONTH(GETDATE())
group by Emp.Id_Empleado,PE.PagoTotal


select * From  ReporteMensualPago


Create View ReporteDetalleFactura
As select DeF.PrecioProducto  as [Precio] , Max (DeF.MontoTotal) as [Monto Total],DeF.Cantidad
from DetalleFactura as DeF Inner join Producto as prod 
on DeF.Id_Producto = prod.Id_Producto
Where MONTH(DeF.FechaDetalleFac) = MONTH(GETDATE())
group by DeF.PrecioProducto,DeF.MontoTotal,DeF.Cantidad


select * From ReporteDetalleFactura




------------------------------------------------------------------------------------
--1 consulta dinamica

declare @queryCliente varchar(MAX)
set @queryCliente = 'Select NombreCliente From Cliente'
exec (@queryCliente)

declare @queryCliente2 VARCHAR(MAX)
declare @nomclien varchar(MAX) = 'Id_Cliente from Cliente--'
set @queryCliente2 = 'select Nombre_Completo as ' + @nomclien + ' from Cliente'

exec (@queryCliente2)



declare @queryCliente3 Varchar(MAX)
declare @nomclient Varchar(MAX) = 'NombreCliente,ApPaCliente ,ApMaCliente'
set @queryCliente3 = 'select ' + @nomclien + ' from Cliente'

exec (@queryCliente3)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--1 Procedimiento tipo Script 

create procedure ScripBorrarCrearTablaModoPago
(@parametroTabla varchar(100))
as
begin

	declare @variable varchar(100)
	set @variable = @parametroTabla
	if @variable = 'ModoPago'
	begin

	Select *
	Into #ModoPago --Tabla temporal 
	From ModoPago;

	Drop Table ModoPago;

	Select*
	Into ModoPago --Crear tabla  e introducir lo que haya en #ModoPago en la nueva tabla 
	From #ModoPago;
	end

end

exec ScripBorrarCrearTablaGenero @parametroTabla = 'ModoPago'
GO


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---5 Procedimientos almacenados donde consulten sus reportes y filtren con parametros

create procedure ProcedimientoEmpleVentas 
(@parametro nvarchar(100))
as
begin


	select * 
	From ReporteMensualEmpleVentas
	where [Total de ventas] >  @parametro


end


exec ProcedimientoEmpleVentas  @parametro = 1000
GO



create procedure ProcedimientoIngreso
(@parametro nvarchar(100))
as
begin


	select * 
	From vista_empleados_ingreso (fecha,cantidad)
	where [id_Producto] like '%A' + @parametro + '%'


end


exec ProcedimientoIngreso  @parametro = '%'
GO



create procedure ProcedimientoMensualEntrada
(@parametro varchar(100))
as
begin


	select * 
	From ReporteMensualEntrada
	where [RegistroEntrada] > @parametro and [Empleado] < 5


end


exec ProcedimientoEntrada  @parametro = 1800
GO



create procedure ProcedimientoMensualPago
(@parametro nvarchar(100))
as
begin


	select * 
	From ReporteMensualPago
	where [pago] Like '['+@parametro+']%'


end


exec ProcedimientomensualPago  @parametro = '>100'
GO




create procedure ProcedimientoDetalleFactura
(@parametro nvarchar(100))
as
begin


	select * 
	From ReporteDetalleFactura
	where [FechaFactura] Like @parametro 


end


exec ProcedimientoDetalleFactura  @parametro = '>1'
GO







-----------------------------------------------------------------------------------
--1 funcion

create function PagoTotal (@parametro int)
returns varchar(50)
as
begin
	declare @pago varchar(50)
	declare @Sueldo double precision

	Select @Sueldo = (SueldoBase*HorasTrabajabas)
	From Pago as pago
	Where Id_Pago = @parametro
	Return @pago

end



create function Suma(
@parametro int
) returns int
as
begin
	return 100 + @parametro
end

Select dbo.Suma(20) as Suma
