use PuntoDeVenta

insert into Categorias values(111,'Electronica','Productos para el hogar');
insert into Categorias values(1114,'juguetes','Entretenimiento');
insert into Categorias values(1115,'Dulces', 'Alimentos');
insert into Categorias values(1116,'Panaderia','Alimentos');
insert into Categorias values(1117,'Lacteos','Alimentos');
insert into Categorias values(1118,'Salsas','Chiles');
insert into Categorias values(1119,'Cereales','Alimentos');
insert into Categorias values(1120,'shampoo','Limpieza');
insert into Categorias values(1121,'Bebidas','Bebida Saborizada');
insert into Categorias values(1122,'Botana','Alimentos');
insert into Categorias values(1123,'Desinfectantes','limpieza');
insert into Categorias values(1124,'Articulos Escolares','Escuela');
insert into Categorias values(1125,'Croquetas','Alimento para mascotas');
insert into Categorias values(1126,'Detergentes','Limpieza');
insert into Categorias values(1167,'Ropa','Vestimenta');


insert into Provedores values(250,'Acotral','Alejandro','Acosta','Parra','Sata Marian 502','Monterrey',33064,'Mexico',18163249);
insert into Provedores values(251,'Cervera','Francisco','Hernandez','Gomez','Monte Celeste 403','Monterrey',39468,'Mexico',19436819);
insert into Provedores values(252,'Cosmoral', 'Javier','Chavez','Flores','Arboledas 420','Monterrey',33948,'Mexico',18401976);
insert into Provedores values(253,'Covap','Luis','Banda','Lara','Cedros 224','Monterrey',33698,'Mexico',16748293);
insert into Provedores values(254,'Apisol','Armando','Diaz','Esquivel','Monte Cristal 303','Monterrey',33496,'Mexico',19487682);
insert into Provedores values(255,'Aragon','Leticia','Hernandez',' Medina','Buenos Aires 648','Guadalajara',16498,'Mexico',81193485);
insert into Provedores values(256,'AudensFood','Rogelio','Quiroz','Solis','Mision la silla 232','Merida',34972,'Mexico',19764283);
insert into Provedores values(257,'Cidacos','Alfredo','Castro','Alfaro','Miguel Aleman 209','Tijuana',19475,'Mexico',1478963);
insert into Provedores values(258,'Seusis','Irma','Benevidez','Ortiz',' Bernardo Reyes 536','Morelia',19348,'Mexico',14869537);
insert into Provedores values(259,'interal','Rodolfo','Acedo','Pineda','Naucalpan 547','Guanajuato',16849,'Mexico',17584932);
insert into Provedores values(260,'itsa','Javier','Garcia','Amat','Lazaro Cardenas 163','Zacatecas',34786,'Mexico',34897652);
insert into Provedores values(261,'Elvimar','Franco','Rodriguez','Otero','Mexicali 529','Torreon',66894,'Mexico',18524932);
insert into Provedores values(262,'Fontiqudes','Oliver','Moctezuma','Guerrero',' Villa Hermosa 527','Nuevo Laredo',55879,'Mexico',34862594);
insert into Provedores values(263,'Snaksgill','David','Valera','Uriarte','Bernardo Reyes 720','Tepic',49586,'Mexico',81427596);
insert into Provedores values(264,'Harinera de mar','Enrique','Zaragoza','Villalobos',' Agustin Melgar 664','Morelia',48659,'Mexico',14783295);


insert into Marcas values(10,'Lays','imagen1');
insert into Marcas values(11,'Dell','imagen2');
insert into Marcas values(12,'Coca.Cola','imegen3');
insert into Marcas values(13,'Dove','imagen4');
insert into Marcas values(14,'Nestle','imagen5');
insert into Marcas values(15,'Sabritas','imegen6');
insert into Marcas values(16,'LaLa','imagen7');
insert into Marcas values(17,'La rosa','imagen8');
insert into Marcas values(18,'Bimbo','imagen9');
insert into Marcas values(19,'Pantene','imagen10');
insert into Marcas values(20,'Cloralex','imagen11');
insert into Marcas values(21,'Pedigree','imagen12');
insert into Marcas values(22,'Dog Chow','imagen13');
insert into Marcas values(23,'Scribe','imagen14');
insert into Marcas values(24,'Ricolino','imgen15');
insert into Marcas values(26,'Sonrics','imagen16');
insert into Marcas values(28,'Chokis','imagen17');
insert into Marcas values(25,'Kellogg´s','imagen18');
insert into Marcas values(27,'San Jose','imagen19');
insert into Marcas values(29,'Botanera','imagen19');


insert into Productos values (10234,'chocolate',1115,250,13)
insert into Productos values (10235,'leche',1117,251,16)
insert into Productos values (10236,'pan',1116,252,18)
insert into Productos values (10237,'froot loops',1119,257,25)
insert into Productos values (10238,'jabon',1126,254,17)
insert into Productos values (10239,'crema',1117,255,16)
insert into Productos values (10240,'pastel',1116,256,27)
insert into Productos values (10241,'donas',1116,256,18)
insert into Productos values (10242,'cafe',1121,258,14)
insert into Productos values (10243,'cloro',1123,259,20)
insert into Productos values (10244,'papitas',1122,260,10)
insert into Productos values (10245,'refrescos',1121,261,12)
insert into Productos values (10246,'Croquetas',1125,262,21)
insert into Productos values (10247,'celular',1113,263,11)
insert into Productos values (10248,'galletas',1115,264,28)
insert into Productos values (10249,'Panques',1116,260,18)
insert into Productos values (10250,'Salsa',1118,260,29)
insert into Productos values (10251,'Caprice',1120,261,19)






insert into inventario values (10236,1575,'320 piezas','98 piezas','222 piezas',1116)
insert into inventario values (10237,1576,'78 piezas','50 piezas','28 piezas',1119)
insert into inventario values (10238,1577,'250 piezas','190 piezas','60 piezas',1126)
insert into inventario values (10239,1578,'968 piezas','654 piezas','314 piezas',1117)
insert into inventario values (10240,1579,'458 piezas','345 piezas','113 piezas',1116)
insert into inventario values (10241,1580,'784 piezas','496 piezas','288 piezas',1116)
insert into inventario values (10242,1581,'148 piezas','67 piezas','81 piezas',1121)
insert into inventario values (10243,1582,'93 piezas','46 piezas','47 piezas',1123)
insert into inventario values (10244,1583,'548 piezas','430 piezas','118 piezas',1122)
insert into inventario values (10245,1584,'165 piezas','93 piezas','72 piezas',1121)
insert into inventario values (10246,1585,'486 piezas','159 piezas','327 piezas',1125)
insert into inventario values (10247,1586,'215 piezas','165 piezas','50 piezas',1113)
insert into inventario values (10248,1587,'147 piezas','57 piezas','90 piezas',1115)
insert into inventario values (10249,1588,'369 piezas','110 piezas','26 piezas',1116)
insert into inventario values (10250,1589,'258 piezas','63 piezas','195 piezas',1118)
insert into inventario values (10251,1590,'159 piezas','49 piezas','108 piezas',1120)


select * from Productos
select * from Provedores
select * from Categorias
select * from inventario
select * from Marcas

Delete from inventario 
Delete from Marcas Where Marca='leti'
Delete from inventario Where PiezasEntrada=0
Delete from Categorias Where idCategoria=0
Delete from Provedores Where idProvedor=300

Update "Marcas" set Marca='lays' WHERE idMarca=10;
Update Marcas set Marca='Dell',logo='image2' Where idmarca=11;
alter table inventario
alter column TotalRestantes VARCHAR(100)