use PuntoDeVenta
---------------------------------------------------------------------------------------------------------
--5 Select básicos
SELECT NombreProveedor AS Provedor 
FROM Provedores 

 
SELECT NombreProducto as Producto 
FROM Productos 


SELECT idProducto as ID, PiezasEntrada as PE,PiezasVendidas as PV,TotalRestantes as TR FROM Inventario

SELECT * FROM Provedores 

SELECT  (NombreProveedor + '  ' + PrimerApellidoP + ' ' + SegundoApellidoP) A FROM Provedores

----------------------------------------------------------------------------------------------------------
--4 select join (Cross,Inner,Left,Rigth)

Select idcategoria. * , idproducto. *
From Categorias  idcategoria cross join Productos idproducto
Go

SELECT * FROM Productos RIGHT JOIN Categorias ON Productos.idCategoria = Categorias.idCategoria


SELECT * FROM Provedores
LEFT JOIN Productos
ON Provedores.idProvedor = Productos.idProvedor


SELECT * FROM Productos INNER JOIN Categorias ON Productos.idCategoria = Categorias.idCategoria
-------------------------------------------------------------------------------------------------------------------------------------
--5 select con uso de where en diferentes tablas y campos (1 con order by)


SELECT NombreProveedor AS Provedor 
FROM Provedores 
WHERE Ciudad= 'Monterrey'
 
SELECT NombreProducto as Producto 
FROM Productos 
WHERE idCategoria=1116
ORDER BY  idCategoria desc

SELECT idProducto as ID, PiezasEntrada as PE,PiezasVendidas as PV,TotalRestantes as TR FROM Inventario

SELECT * FROM Provedores  WHERE PrimerApellidoP like 'A%'

SELECT  (NombreProveedor + '  ' + PrimerApellidoP + ' ' + SegundoApellidoP) A FROM Provedores
WHERE Ciudad = 'Monterrey'

-------------------------------------------------------------------------------------------------------------------------------------------------------
--5 selects con uso de funciones de agregación (min, max, avg, std, count)
--2 sin group by
--3 con group by-->1 con having

SELECT * FROM Marcas

SELECT MIN(TotalRestantes)as TotalRestante
From inventario as inv

Select MAX(PiezasEntrada) AS PEntrada
from inventario as inv

SELECT COUNT(PiezasVendidas) as VENTA
FROM inventario AS PV
Group by  idCategoria
having idCategoria=1116


SELECT AVG (idProducto) as productomedio
from Productos
Group by NombreProducto 

Select HorasCumplir as 'Sueldo'
From Pago As Sueldo 
where  HorasCumplir > '0'
Group By HorasCumplir
Having Stdevp (PagoTotal) > 0
------------------------------------------------------------------------------------------------------------------------------------------------------------

--3 selects con join y group by


Select Id_CategoriaProducto
From CategoriaProducto cross join idcategoria as 'Categorias'
on Categorias.idcategoria = Productos.idcategoria
Group by Productos.NombreProducto,Categorias.NombreCategoria

Select Clien.vNombre_Completo As 'Nombre de Cliente', Tip.vTipo As 'Tipo de cliente'
From Cliente As Clien Inner Join Tipo As Tip
On Clien.iID_Tipo = Tip.iID_Tipo
Group By Clien.vNombre_Completo, Tip.vTipo

Select Pago.vForma_Pago As 'Tipo de pago', Clien.vNombre_Completo As 'Nombre de Cliente'
From Forma_Pago As Pago Left Join Cliente As Clien
On Pago.iID_Pago = Clien.iID_Pago
Group By Pago.vForma_Pago, Clien.vNombre_Completo
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--1 select into con drop table y reinsertar las filas

Select *
Into #Caregorias
From Categorias

Select *
From #Categorias 

Select *
From Categorias

Drop Table Categorias

Select*
Into Caregorias 
From #Categorias