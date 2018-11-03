/* Creacion Base de Datos llamada PuntoVenta*/

create database PuntoVenta

/*Uso de la base de datos PuntoVenta*/

use PuntoVenta

/*Creacion de "Tablas" usando varios "tipos de datos" y "llaves primarias" y "restricciones" y "columnas computadas"*/

create table Empleado (Id_Empleado int not null identity(2,1), NombreEmpleado varchar(50), ApPaEmpleado varchar(50), ApMaEmpleado varchar(50), FechaNacimiento varchar(50), FechaContratacion varchar(50), DireccionEmpleado varchar(50), CiudadEmpleado varchar(50), CP_Empleado varchar(50), PaisEmpleado varchar(50), TelefonoEmpleado int, RFC_Empleado varchar(50), Id_Sucursal int, Id_Turno int, Id_Puesto int)

create table Cliente (Id_Cliente int not null identity(2,1), NombreCliente varchar(10), ApPaCliente varchar(10), ApMaCliente varchar(10), DireccionCliente varchar(50), TelefonoCliente int)

create table Proveedor (Id_Poveedor int not null identity(2,1), NombreProveedor varchar(50), DireccionProveedor varchar(50), CiudadProveedor varchar(50), CP_Proveedor varchar(50), PaisProveedor varchar(50), TelefonoProveedor int)

create table Sucursal (Id_Sucursal int not null identity(2,1), DireccionSuc varchar(50), TelefonoSuc int)

create table Turno (Id_Turno int not null identity(2,1), Turno varchar(50), HoraEntrada varchar(50), HoraSalida varchar(50))

create table RegistroEntrada(Id_RegistroEntrada int not null identity(2,1), FechaRegistroEntrada varchar(50), RegHoraEntrada varchar(50), Id_Empleado int )

create table RegistroSalida(Id_RegistroSalida int not null identity(2,1), FechaRegistroSalida varchar(50), RegHoraSalida varchar(50), Id_Empleado int )

create table Puesto(Id_Puesto int not null identity(2,1), NombrePuesto varchar(50), SueldoBase int)

create table ModoPago(Id_ModoPago int not null identity(2,1), ModoPago varchar(50))

create table Pago (Id_Pago int not null identity(2,1), Id_Empleado int, SueldoBaseHora int, HorasTrabajadas int, HorasCumplir int , PagoTotal as SueldoBaseHora* HorasTrabajadas, FechaPago varchar(50))

create table Producto(Id_Producto int not null identity(2,1), NombreProducto varchar(50), Precio int, Id_CategoriaProducto int, Id_Marca int)

create table Marca(Id_Marca int not null identity(2,1), Marca varchar(50))

create table InventarioActual(Id_InventarioActual int not null identity(2,1), Id_Sucursal int, Id_Producto int, NumPiezas int)

create table Venta(Id_Venta int not null identity(2,1), Id_Producto int, FechaVenta varchar(50), HoraVenta varchar(50), Id_Empleado int, Id_Cliente int, Id_ModoPago int, CantidadPiezas int, Costo int, SubTotal as Costo * CantidadPiezas,CostoTotal as (0.16 * Costo + Costo)*CantidadPiezas)

create table PedidoProveedor(Id_PedidoProveedor int not null identity(2,1), Id_Proveedor int, FechaPedido varchar(50), FechaEntreaPedido varchar(50))

create table CompraProducto(Id_CompraProducto int not null identity(2,1), Id_PedidoProveedor int, Id_Producto int, PrecioProdProv int, CantidadPzas int, TotalCompra as PrecioProdProv * CantidadPzas, Id_ModoPago int)

create table Factura(Id_Factura int not null identity(2,1), Id_Venta int, Id_Empleado int, Id_Cliente int, FechaFactura varchar(50))

create table DealleFactura(Id_DetalleFactura int not null identity(2,1), Id_Factura int, Id_Producto int, PrecioProducto int, Cantidad int, MontoSubtotal as Cantidad * PrecioProducto,  MontoTotal as (0.16 * PrecioProducto + PrecioProducto)*Cantidad, FechaDetalleFac varchar(50))

create table CategoriaProducto(Id_CategoriaProducto int not null identity(2,1), NombreCategoria varchar(50))

create table Devolucion(Id_Devolucion int not null identity(2,1), Id_Factura int,Id_Empleado int, Id_Cliente int, PrecioProductoFac int, CantidadPzasDev int, ReembolsoTotal as PrecioProductoFac*CantidadPzasDev , FechaDev varchar(50), Id_ModoPago int)
/*Creacion de Indices*/

create clustered index IDX_Empleado
on Empleado (NombreEmpleado) 

create clustered index IDX_Cliente
on Cliente (NombreCliente) 

create clustered index IDX_Proveedor
on Proveedor (NombreProveedor) 

create clustered index IDX_Sucursal
on Sucursal (DireccionSuc) 

create clustered index IDX_Turno
on Turno (Turno) 

create clustered index IDX_RegistroEntrada
on RegistroEntrada (FechaRegistroEntrada) 

create clustered index IDX_RegistroSalida
on RegistroSalida (FechaRegistroSalida) 

create clustered index IDX_Puesto
on Puesto (NombrePuesto) 

create clustered index IDX_ModoPago
on ModoPago (ModoPago) 

create clustered index IDX_Pago
on Pago (HorasTrabajadas) 

create clustered index IDX_Producto
on Producto (NombreProducto) 

create clustered index IDX_Marca
on Marca (Marca) 

create clustered index IDX_InventarioActual
on InventarioActual (NumPiezas) 

/*Uso de Insert, Update, Delete*/
insert into Empleado (NombreEmpleado, ApPaEmpleado, ApMaEmpleado, FechaNacimiento, FechaContratacion, DireccionEmpleado, CiudadEmpleado, CP_Empleado, PaisEmpleado, TelefonoEmpleado, RFC_Empleado, Id_Sucursal, Id_Turno, Id_Puesto) values( 'Omar','Garcia','Tovar','26-06-1996', '10-01-2017', 'Solidaridad', 'Monterrey', '64100', 'Mexico', 11682488, 'dsdssd', 2, 2, 2)
insert into Empleado (NombreEmpleado, ApPaEmpleado, ApMaEmpleado, FechaNacimiento, FechaContratacion, DireccionEmpleado, CiudadEmpleado, CP_Empleado, PaisEmpleado, TelefonoEmpleado, RFC_Empleado, Id_Sucursal, Id_Turno, Id_Puesto) values( 'Adrian','Garcia','Tovar','25-11-2000', '10-01-2017', 'Solidaridad', 'Monterrey', '64100', 'Mexico', 11683488, 'dsdssd', 2, 2, 2)
insert into Empleado (NombreEmpleado, ApPaEmpleado, ApMaEmpleado, FechaNacimiento, FechaContratacion, DireccionEmpleado, CiudadEmpleado, CP_Empleado, PaisEmpleado, TelefonoEmpleado, RFC_Empleado, Id_Sucursal, Id_Turno, Id_Puesto) values( 'Nadia','Garcia','Tovar','14-12-2005', '10-01-2017', 'Solidaridad', 'Monterrey', '64100', 'Mexico', 11682488, 'dsdssd', 2, 2, 2)
insert into Empleado (NombreEmpleado, ApPaEmpleado, ApMaEmpleado, FechaNacimiento, FechaContratacion, DireccionEmpleado, CiudadEmpleado, CP_Empleado, PaisEmpleado, TelefonoEmpleado, RFC_Empleado, Id_Sucursal, Id_Turno, Id_Puesto) values( 'Juan','Leal','Cruz','26-06-1995', '10-01-2017', 'Solidaridad', 'Monterrey', '64100', 'Mexico', 11682488, 'dsdssd', 2, 2, 2)
insert into Empleado (NombreEmpleado, ApPaEmpleado, ApMaEmpleado, FechaNacimiento, FechaContratacion, DireccionEmpleado, CiudadEmpleado, CP_Empleado, PaisEmpleado, TelefonoEmpleado, RFC_Empleado, Id_Sucursal, Id_Turno, Id_Puesto) values( 'Johan','Ibarra','Martinez','26-06-1996', '10-01-2017', 'Solidaridad', 'Monterrey', '64100', 'Mexico', 11682418, 'dsdssd', 2, 2, 2)
insert into Empleado (NombreEmpleado, ApPaEmpleado, ApMaEmpleado, FechaNacimiento, FechaContratacion, DireccionEmpleado, CiudadEmpleado, CP_Empleado, PaisEmpleado, TelefonoEmpleado, RFC_Empleado, Id_Sucursal, Id_Turno, Id_Puesto) values( 'Alan','Benavides','Sanchez','23-01-1996', '10-01-2017', 'Solidaridad', 'Monterrey', '64100', 'Mexico', 22682488, 'dsdssd', 2, 2, 2)
insert into Empleado (NombreEmpleado, ApPaEmpleado, ApMaEmpleado, FechaNacimiento, FechaContratacion, DireccionEmpleado, CiudadEmpleado, CP_Empleado, PaisEmpleado, TelefonoEmpleado, RFC_Empleado, Id_Sucursal, Id_Turno, Id_Puesto) values( 'Karina','Rojas','Tovar','16-02-1996', '10-01-2017', 'Solidaridad', 'Monterrey', '64100', 'Mexico', 21682488, 'dsdssd', 2, 2, 2)
insert into Empleado (NombreEmpleado, ApPaEmpleado, ApMaEmpleado, FechaNacimiento, FechaContratacion, DireccionEmpleado, CiudadEmpleado, CP_Empleado, PaisEmpleado, TelefonoEmpleado, RFC_Empleado, Id_Sucursal, Id_Turno, Id_Puesto) values( 'William','Villegaz','Ruiz','16-06-1996', '10-01-2017', 'Solidaridad', 'Monterrey', '64100', 'Mexico', 11282488, 'dsdssd', 2, 2, 2)
insert into Empleado (NombreEmpleado, ApPaEmpleado, ApMaEmpleado, FechaNacimiento, FechaContratacion, DireccionEmpleado, CiudadEmpleado, CP_Empleado, PaisEmpleado, TelefonoEmpleado, RFC_Empleado, Id_Sucursal, Id_Turno, Id_Puesto) values( 'Ivan','Ruiz','Carreon','26-02-1996', '10-01-2017', 'Solidaridad', 'Monterrey', '64100', 'Mexico', 13682488, 'dsdssd', 2, 2, 2)
insert into Empleado (NombreEmpleado, ApPaEmpleado, ApMaEmpleado, FechaNacimiento, FechaContratacion, DireccionEmpleado, CiudadEmpleado, CP_Empleado, PaisEmpleado, TelefonoEmpleado, RFC_Empleado, Id_Sucursal, Id_Turno, Id_Puesto) values( 'Arecely','Dimas','Ortiz','26-04-1996', '10-01-2017', 'Solidaridad', 'Monterrey', '64100', 'Mexico', 11282488, 'dsdssd', 2, 2, 2)
select * from Empleado



insert into Cliente (NombreCliente, ApPaCliente, ApMaCliente, DireccionCliente, TelefonoCliente) values ('Alex','Salazar','Balderas','Monterrey',11447788) 
insert into Cliente (NombreCliente, ApPaCliente, ApMaCliente, DireccionCliente, TelefonoCliente) values ('Dilan','Valdez','Contreras','Monterrey',11147788) 
insert into Cliente (NombreCliente, ApPaCliente, ApMaCliente, DireccionCliente, TelefonoCliente) values ('Hector','Moncada','Ortiz','Monterrey',11247788) 
insert into Cliente (NombreCliente, ApPaCliente, ApMaCliente, DireccionCliente, TelefonoCliente) values ('Pierre','Esparza','Carreon','Monterrey',11347788) 
insert into Cliente (NombreCliente, ApPaCliente, ApMaCliente, DireccionCliente, TelefonoCliente) values ('Iram','Martinez','Obviedo','Monterrey',11547788) 
insert into Cliente (NombreCliente, ApPaCliente, ApMaCliente, DireccionCliente, TelefonoCliente) values ('Mauricio','Castañda','Lopez','Monterrey',11647788) 
insert into Cliente (NombreCliente, ApPaCliente, ApMaCliente, DireccionCliente, TelefonoCliente) values ('Gustavo','Cobain','Garza','Monterrey',11747788) 
insert into Cliente (NombreCliente, ApPaCliente, ApMaCliente, DireccionCliente, TelefonoCliente) values ('Edgar','Hernandez','Camacho','Monterrey',11847788) 
insert into Cliente (NombreCliente, ApPaCliente, ApMaCliente, DireccionCliente, TelefonoCliente) values ('Angel','Leonel','Santana','Monterrey',11947788) 
insert into Cliente (NombreCliente, ApPaCliente, ApMaCliente, DireccionCliente, TelefonoCliente) values ('Maricela','Escamilla','Villeda','Monterrey',11107788) 
select * from Cliente


insert into Proveedor (NombreProveedor, DireccionProveedor, CiudadProveedor, CP_Proveedor, PaisProveedor, TelefonoProveedor) values ('Gamesa', 'Centro','Monterrey', '64100', 'Mexico', 22554477)
insert into Proveedor (NombreProveedor, DireccionProveedor, CiudadProveedor, CP_Proveedor, PaisProveedor, TelefonoProveedor) values ('Barcel', 'Centro','Monterrey', '64100', 'Mexico', 22554477)
insert into Proveedor (NombreProveedor, DireccionProveedor, CiudadProveedor, CP_Proveedor, PaisProveedor, TelefonoProveedor) values ('CocaCola', 'Centro','Monterrey', '64100', 'Mexico', 22554477)
insert into Proveedor (NombreProveedor, DireccionProveedor, CiudadProveedor, CP_Proveedor, PaisProveedor, TelefonoProveedor) values ('Bokados', 'Centro','Monterrey', '64100', 'Mexico', 22554477)
insert into Proveedor (NombreProveedor, DireccionProveedor, CiudadProveedor, CP_Proveedor, PaisProveedor, TelefonoProveedor) values ('SanJose', 'Centro','Monterrey', '64100', 'Mexico', 22554477)
insert into Proveedor (NombreProveedor, DireccionProveedor, CiudadProveedor, CP_Proveedor, PaisProveedor, TelefonoProveedor) values ('Lala', 'Centro','Monterrey', '64100', 'Mexico', 22554477)
insert into Proveedor (NombreProveedor, DireccionProveedor, CiudadProveedor, CP_Proveedor, PaisProveedor, TelefonoProveedor) values ('LaCosteña', 'Centro','Monterrey', '64100', 'Mexico', 22554477)
insert into Proveedor (NombreProveedor, DireccionProveedor, CiudadProveedor, CP_Proveedor, PaisProveedor, TelefonoProveedor) values ('Pepsi', 'Centro','Monterrey', '64100', 'Mexico', 22554477)
insert into Proveedor (NombreProveedor, DireccionProveedor, CiudadProveedor, CP_Proveedor, PaisProveedor, TelefonoProveedor) values ('Jumex', 'Centro','Monterrey', '64100', 'Mexico', 22554477)
insert into Proveedor (NombreProveedor, DireccionProveedor, CiudadProveedor, CP_Proveedor, PaisProveedor, TelefonoProveedor) values ('Peñafiel', 'Centro','Monterrey', '64100', 'Mexico', 22554477)

select * from Sucursal
insert into Sucursal (DireccionSuc, TelefonoSuc) values ('Monterrey', 11485698)
insert into Sucursal (DireccionSuc, TelefonoSuc) values ('SanPadro', 12485698)
insert into Sucursal (DireccionSuc, TelefonoSuc) values ('Apodaca', 13485698)
insert into Sucursal (DireccionSuc, TelefonoSuc) values ('Guadalupe', 14485698)
insert into Sucursal (DireccionSuc, TelefonoSuc) values ('SanNicolas', 15485698)
select * from Empleado

insert into Turno (Turno, HoraEntrada, HoraSalida) values ('Completo', '8:00', '16:00')
insert into Turno (Turno, HoraEntrada, HoraSalida) values ('MedioTiempo', '8:00', '12:00')

insert into RegistroEntrada(FechaRegistroEntrada, RegHoraEntrada, Id_Empleado) values ('03/11/2018', '8:00',4)
insert into RegistroEntrada(FechaRegistroEntrada, RegHoraEntrada, Id_Empleado) values ('03/11/2018', '8:00',6)
insert into RegistroEntrada(FechaRegistroEntrada, RegHoraEntrada, Id_Empleado) values ('03/11/2018', '8:00',5)
insert into RegistroEntrada(FechaRegistroEntrada, RegHoraEntrada, Id_Empleado) values ('03/11/2018', '8:00',7)
insert into RegistroEntrada(FechaRegistroEntrada, RegHoraEntrada, Id_Empleado) values ('03/11/2018','8:00',8)
insert into RegistroEntrada(FechaRegistroEntrada, RegHoraEntrada, Id_Empleado) values ('03/11/2018','8:00',9)
insert into RegistroEntrada(FechaRegistroEntrada, RegHoraEntrada, Id_Empleado) values ('03/11/2018','8:00',10)
insert into RegistroEntrada(FechaRegistroEntrada, RegHoraEntrada, Id_Empleado) values ('03/11/2018','8:00',11)
insert into RegistroEntrada(FechaRegistroEntrada, RegHoraEntrada, Id_Empleado) values ('03/11/2018','8:00',12)
insert into RegistroEntrada(FechaRegistroEntrada, RegHoraEntrada, Id_Empleado) values ('03/11/2018','8:00',13)


select * from RegistroSalida
insert into RegistroSalida(FechaRegistroSalida, RegHoraSalida, Id_Empleado) values ('03/11/2018', '16:00',4)
insert into RegistroSalida(FechaRegistroSalida, RegHoraSalida, Id_Empleado) values ('03/11/2018', '16:00',5)
insert into RegistroSalida(FechaRegistroSalida, RegHoraSalida, Id_Empleado) values ('03/11/2018', '16:00',6)
insert into RegistroSalida(FechaRegistroSalida, RegHoraSalida, Id_Empleado) values ('03/11/2018', '16:00',7)
insert into RegistroSalida(FechaRegistroSalida, RegHoraSalida, Id_Empleado) values ('03/11/2018', '16:00',8)
insert into RegistroSalida(FechaRegistroSalida, RegHoraSalida, Id_Empleado) values ('03/11/2018', '16:00',9)
insert into RegistroSalida(FechaRegistroSalida, RegHoraSalida, Id_Empleado) values ('03/11/2018', '16:00',10)
insert into RegistroSalida(FechaRegistroSalida, RegHoraSalida, Id_Empleado) values ('03/11/2018', '16:00',11)
insert into RegistroSalida(FechaRegistroSalida, RegHoraSalida, Id_Empleado) values ('03/11/2018', '16:00',12)
insert into RegistroSalida(FechaRegistroSalida, RegHoraSalida, Id_Empleado) values ('03/11/2018', '16:00',13)



insert into Puesto(NombrePuesto, SueldoBase) values ('Cajero',2000)
insert into Puesto(NombrePuesto, SueldoBase) values ('Surtidor',1000)
insert into Puesto(NombrePuesto, SueldoBase) values ('AtencioClientes',3000)
insert into Puesto(NombrePuesto, SueldoBase) values ('Intendente',3000)
insert into Puesto(NombrePuesto, SueldoBase) values ('Guardia',4000)

insert into ModoPago(ModoPago) values ('Eefctivo')
insert into ModoPago(ModoPago) values ('Tarjeta')

select * from Marca
insert into Pago (Id_Empleado , SueldoBaseHora , HorasTrabajadas , HorasCumplir  , FechaPago) values (4,2000, 4, 4, '03/11/2018')
insert into Pago (Id_Empleado , SueldoBaseHora , HorasTrabajadas , HorasCumplir  , FechaPago) values (5,100, 4, 4, '03/11/2018')

insert into Producto(NombreProducto , Precio , Id_CategoriaProducto , Id_Marca) values ('Pepsi', 11, 2,2)
insert into Producto(NombreProducto , Precio , Id_CategoriaProducto , Id_Marca) values ('Tecate', 11, 3,3)
insert into Producto(NombreProducto , Precio , Id_CategoriaProducto , Id_Marca) values ('Donas', 14, 4,4)
insert into Producto(NombreProducto , Precio , Id_CategoriaProducto , Id_Marca) values ('Chetos', 8, 5,5)
insert into Producto(NombreProducto , Precio , Id_CategoriaProducto , Id_Marca) values ('Paleta', 4, 6,6)
insert into Producto(NombreProducto , Precio , Id_CategoriaProducto , Id_Marca) values ('Molida', 30, 7,7)


insert into Marca( Marca ) values ('Pepsi')
insert into Marca( Marca ) values ('Tecate')
insert into Marca( Marca ) values ('Bimbo')
insert into Marca( Marca ) values ('Sabritas')
insert into Marca( Marca ) values ('Vero')
insert into Marca( Marca ) values ('Sanjuan')

select * from InventarioActual
insert into InventarioActual(Id_Sucursal , Id_Producto , NumPiezas )values (2,2,100)
insert into InventarioActual(Id_Sucursal , Id_Producto , NumPiezas )values (2,3,100)
insert into InventarioActual(Id_Sucursal , Id_Producto , NumPiezas )values (2,4,100)
insert into InventarioActual(Id_Sucursal , Id_Producto , NumPiezas )values (2,5,100)
insert into InventarioActual(Id_Sucursal , Id_Producto , NumPiezas )values (2,6,100)

insert into Venta(Id_Producto , FechaVenta , HoraVenta , Id_Empleado , Id_Cliente , Id_ModoPago, CantidadPiezas , Costo) values (2,'03/11/2018','00:00',4,2,2,2,11)

insert into  PedidoProveedor(Id_Proveedor, FechaPedido, FechaEntreaPedido) values (2,'22/10/2018','05/11/2018')

insert into CompraProducto(Id_PedidoProveedor , Id_Producto , PrecioProdProv , CantidadPzas ,Id_ModoPago) values (2,2,11,100,2)

insert into Factura(Id_Venta, Id_Empleado, Id_Cliente , FechaFactura) values (2,4,2,'03/11/2018')

insert into DealleFactura(Id_Factura , Id_Producto , PrecioProducto, Cantidad ,  FechaDetalleFac ) values (2,2,11,2,'03/11/2018')

insert into CategoriaProducto(NombreCategoria ) values ('Bebidas')
insert into CategoriaProducto(NombreCategoria ) values ('Pan')
insert into CategoriaProducto(NombreCategoria ) values ('Friuras')
insert into CategoriaProducto(NombreCategoria ) values ('Dulces')
insert into CategoriaProducto(NombreCategoria ) values ('Carne')

select * from PedidoProveedor

insert into Devolucion(Id_Factura ,Id_Empleado , Id_Cliente , PrecioProductoFac , CantidadPzasDev ,FechaDev , Id_ModoPago ) values (2,4,2,11,2,'',2)

select * from Devolucion

update CategoriaProducto Set NombreCategoria = 'Pollo'
from CategoriaProducto
where NombreCategoria = 'Carne'

update CategoriaProducto Set NombreCategoria = 'Papitas'
from CategoriaProducto
where NombreCategoria = 'Friuras'

update CategoriaProducto Set NombreCategoria = 'Caramelos'
from CategoriaProducto
where NombreCategoria = 'Dulces'

update CategoriaProducto Set NombreCategoria = 'Panecillo'
from CategoriaProducto
where NombreCategoria = 'Pan'

update CategoriaProducto Set NombreCategoria = 'Liquidos'
from CategoriaProducto
where NombreCategoria = 'Bebidas'


delete from Cliente
where Id_Cliente = 11

delete from Cliente
where Id_Cliente = 10

delete from Cliente
where Id_Cliente = 9

delete from Cliente
where Id_Cliente = 8

delete from Cliente
where Id_Cliente = 7


/*Uso Select Basico*/
select * from Empleado

select(NombreEmpleado + ' ' + ApPaEmpleado + '' + ApMaEmpleado) As 'Nomcompleto'
from Empleado as Emp

Select Count (Emp.Id_Empleado)
From Empleado As Emp

Select ('Caegoria: ' + CatP.NombreCategoria) As 'Caegorias de productos'
From CategoriaProducto As CatP

Select Max (CP_Empleado) 'Còdigo postal màs grande'
From Empleado As Emp

Select Min (TelefonoEmpleado) 'Nùmero Teleono màs chico'
From Empleado As Emp

Select Emp.NombreEmpleado As 'Nombre de Empleado', Pues.NombrePuesto As 'Tipo Puesto'
From Empleado As Emp
Inner Join Puesto As Pues
On Emp.Id_Puesto = Pues.Id_Puesto

Select Pues.SueldoBase As 'Sueldo Empleado', Emp.NombreEmpleado As 'Nombre de Empleado'
From Empleado As Emp
Left Join Puesto As Pues
On Emp.Id_Puesto = Pues.Id_Puesto

Select (Suc.DireccionSuc) As 'Sucursal de trabajo', Emp.NombreEmpleado As 'Nombre de Empleado'
From Sucursal As Suc
Right Join Empleado As Emp
On Suc.Id_Sucursal = Emp.Id_Sucursal

select Suc.DireccionSuc, Emp.DireccionEmpleado
From Sucursal As Suc
cross join Empleado As Emp

Select Prod.NombreProducto As 'Nombre Productos con P' 
From Producto As Prod
Where NombreProducto Like 'P%'

Select Ma.Marca As 'Marca de articulos que empiezen y terminen con s' 
From Marca As Ma
Where Marca Like 's%s'

Select (Prod.NombreProducto) As 'Producto A precio bajo' 
From Producto As Prod
Where Precio < 5

Select Prod.NombreProducto As 'Nombre Producto', Prod.Precio As 'Precio Producto Menor a 14 Pesos'
From Producto As Prod
Where Prod.Precio < 14
Order By Prod.Precio Desc

Select *
From Pago As Pag
Where Pag.PagoTotal > 2000
Order By Pag.FechaPago Asc


Select Min (Prod.Precio) As PrecioMinimo
From Producto As Prod

Select Max (Prod.Precio) As PrecioMaximo
From Producto As Prod

Select Pag.PagoTotal As 'Pago Total', Count (Emp.Id_Empleado) As 'Cantidad de Empleados'
From Pago As Pag Full Join Empleado As Emp
On pag.Id_Empleado = Emp.Id_Empleado
Group By Pag.PagoTotal
Having Count (Emp.Id_Empleado) > 0

Select Clien.NombreCliente As 'Nombre Cliente', Avg (vent.CostoTotal) As 'Promedio del total de ventas'
From Cliente As Clien Full Join Venta As vent
On Clien.Id_Cliente =  vent.Id_Cliente
Group By Clien.NombreCliente
Having Avg (vent.CostoTotal) > 10

Select Emp.NombreEmpleado As 'Nombre Empleado', Stdevp (pag.PagoTotal) As 'Desviaciòn estandar del pagototal'
From Empleado As Emp Full Join Pago As pag
On Emp.Id_Empleado =  pag.Id_Empleado
Group By Emp.NombreEmpleado
Having Stdevp (pag.PagoTotal)< 10

Select (Emp.NombreEmpleado+ ' '+ Emp.ApPaEmpleado+ ' ' + Emp.ApMaEmpleado) As 'Nombre completo del Empleado', suc.DireccionSuc As LugarTrabajo
From Empleado As Emp Inner Join Sucursal As suc
On Emp.Id_Sucursal = suc.Id_Sucursal
Group By (Emp.NombreEmpleado+ ' '+ Emp.ApPaEmpleado+ ' ' + Emp.ApMaEmpleado), suc.DireccionSuc

Select Emp.NombreEmpleado As 'Nombre de Empleado', Pues.NombrePuesto As 'Puesto de Empleado'
From Empleado As Emp Inner Join Puesto As Pues
On Emp.Id_Puesto = Pues.Id_Puesto
Group By Emp.NombreEmpleado, Pues.NombrePuesto

Select Tur.Turno As 'Tipo de Turno', Emp.NombreEmpleado As 'Nombre de Empleado'
From Turno As Tur Left Join Empleado As Emp
On Tur.Id_Turno = Emp.Id_Turno
Group By Tur.Turno, Emp.NombreEmpleado


SELECT *
       INTO #TMPCategoria
       FROM CategoriaProducto

Select *
From #TMPCategoria

Select *
From CategoriaProducto

Drop Table CategoriaProducto

Select*
Into CategoriaProducto 
From #TMPCategoria

/*Uso de Subconsultas, Vistas, Consultas Dinamicas*/

--Subconsulta Tipo Columna*/
Select PagoTotal, (
					Select count(PagoTotal) 
					From Pago as pag 
					Where pag.PagoTotal=pag.PagoTotal
					) as 'Cantidad de sueldos'
	From Pago
	Group by PagoTotal
	Order by PagoTotal desc
	
--Subconsulta Tipo Tabla*/

Select *
From
	(Select DireccionSuc As 'NombSucursal', count (DireccionSuc) As 'Cantidad'
		From Sucursal
		Group by DireccionSuc
	) As Sucursales
	

--Subconsulta con With


with SumaHoras As (
select HorasTrabajadas, count(HorasTrabajadas) as [Cantidad]
	From Pago
	group by HorasTrabajadas)

select *
from SumaHoras

--Vistas

Create View ReportePagoTotal
as select Pag.PagoTotal As [Pago Total], Count (Emp.Id_Empleado) As [Cantidad de Empleados]
From Pago As Pag Full Join Empleado As Emp
On pag.Id_Empleado = Emp.Id_Empleado
Group By Pag.PagoTotal
select * From ReportePagoTotal

Create View ReporteEmpleadoPuesto
as Select Emp.NombreEmpleado As [Nombre de Empleado], Pues.NombrePuesto As [Tipo Puesto]
From Empleado As Emp
Inner Join Puesto As Pues
On Emp.Id_Puesto = Pues.Id_Puesto

select * From ReporteEmpleadoPuesto

Create View ReporteEmpleadoTurno
as Select Tur.Turno As [Tipo de Turno], Emp.NombreEmpleado As [Nombre de Empleado]
From Turno As Tur Left Join Empleado As Emp
On Tur.Id_Turno = Emp.Id_Turno
Group By Tur.Turno, Emp.NombreEmpleado
select * From ReporteEmpleadoTurno

Create View ReporteNomEmpSucursal
as Select (Emp.NombreEmpleado+ ' '+ Emp.ApPaEmpleado+ ' ' + Emp.ApMaEmpleado) As [Nombre completo del Empleado], suc.DireccionSuc As [LugarTrabajo]
From Empleado As Emp Inner Join Sucursal As suc
On Emp.Id_Sucursal = suc.Id_Sucursal
Group By (Emp.NombreEmpleado+ ' '+ Emp.ApPaEmpleado+ ' ' + Emp.ApMaEmpleado), suc.DireccionSuc
select * From ReporteNomEmpSucursal

Create View ReportePromedioVentas
as Select Clien.NombreCliente As [Nombre Cliente], Avg (vent.CostoTotal) As [Promedio del total de ventas]
From Cliente As Clien Full Join Venta As vent
On Clien.Id_Cliente =  vent.Id_Cliente
Group By Clien.NombreCliente
Having Avg (vent.CostoTotal) > 10
select * From ReportePromedioVentas


--Consulta Dinamica
declare @queryCliente nvarchar(MAX)
set @queryCliente = 'Select  NombreCliente From Cliente'

exec (@queryCliente)




/*Uso de Procedimientos almacenados*/

--5 Procedimientos Almacenados para consultar los Reportes Creados anteriormente

create procedure ProcedimientoPagoTotal
(@parametro nvarchar(100))
as
begin

	select * 
	From ReportePagoTotal
	where [Pago Total] >  @parametro

end

exec ProcedimientoPagoTotal  @parametro = 1000
GO


create procedure ProcedimientoEmpleadoPuesto
(@parametro varchar(100))
as
begin

	select * 
	From ReporteEmpleadoPuesto
	where [Nombre de Empleado] =  @parametro

end

exec ProcedimientoEmpleadoPuesto  @parametro = 'Adrian'
GO

create procedure ProcedimientoEmpleadoTurno
(@parametro varchar(100))
as
begin

	select * 
	From ReporteEmpleadoTurno
	where [Tipo de Turno] =  @parametro

end

exec ProcedimientoEmpleadoTurno  @parametro = 'Completo'
GO


create procedure ProcedimientoNomEmpSucursal
(@parametro varchar(100))
as
begin

	select * 
	From ReporteNomEmpSucursal
	where [Nombre completo del Empleado] =  @parametro

end

exec ProcedimientoNomEmpSucursal  @parametro = 'Adrian Garcia Tovar'
GO


create procedure ProcedimientoPromedioVentas
(@parametro varchar(100))
as
begin

	select * 
	From ReportePromedioVentas
	where [Nombre Cliente] =  @parametro

end

exec ProcedimientoPromedioVentas  @parametro = '%x'
GO

--1 Funcion

create function Suma(
@parametro int
) returns int
as
begin
	return 100 + @parametro
end

Select dbo.Suma(20) as Suma


--1 Procedimiento Tipo Script

create procedure ScripBorrarCrearTablaCategoriaProducto
(@parametroTabla nvarchar(100))
as
begin

	declare @variable nvarchar(100)
	set @variable = @parametroTabla
	if @variable = 'CategoriaProducto'
	begin

SELECT *
       INTO #TMPCategoria
       FROM CategoriaProducto;

	Drop Table CategoriaProducto;

	Select*
	Into CategoriaProducto 
	From #TMPCategoria;
	end

end

exec ScripBorrarCrearTablaCategoriaProducto @parametroTabla = 'CategoriaProducto'
GO





/*Uso de Triggers*/

/*Uso de Triggers*/



--(3 triggers)


--Update

Create Trigger TrrggerEmpleadoUpdate
on Empleado 
after update
as print 'Se Actualizo la Tabla Empleado'


--Insert

Create Trigger TriggerMarcaInsert2
on Marca
--for | after | instead of insert | update | delete--
after insert
as print 'Se Reigistro en tabla Marca'
go

--Delete

Create Trigger TriggerMarcaDelete2
on Marca
instead of Delete 
as 
begin
select *
from deleted

print 'Se Elimino registro en tabla Marca'
end





