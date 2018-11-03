--------------------------------------------------------------------------------------
USE Puntodeventas
--3 triggers update/*instead/* after

Create trigger tr_Producto_Update
on producto
instead of update
as
begin
select*
from inserted
Select Id_Producto, GETDATE()
From deleted
end
select*
Update Producto Set Precio = 130
Where Id_Producto = 10

Select * from Producto



Create Trigger tr_Sucursal_Insert
on Sucursal
instead of insert
as
begin
	
	Select *
	From Inserted
end

Select * from sucursal
Update Sucursal Set DireccionSuc = 'lincon'
Where Id_Sucursal = 10



Create Trigger tr_Puesto_Delete
on Puesto
instead of Delete
as
begin
	Select *
	from deleted
end
print 'Error al intentar eliminar un registro en la tabla '

Delete from Puesto 
Where Id_Puesto = '10213'

Select * from Puesto