IF OBJECT_ID('Stage.Vent', 'U') IS NOT NULL
	DROP TABLE Stage.Vent
CREATE TABLE Stage.Vent (
	Fecha DATE,
	CodigoCliente NVARCHAR(50),
	NombreCliente NVARCHAR(80),
	TipoCliente NVARCHAR(50),
	DireccionCliente NVARCHAR(300),
	NumeroCliente NVARCHAR(50),
	CodVendedor NVARCHAR(50),
	NombreVendedor NVARCHAR(80),
	Vacacionista NVARCHAR(20),
	CodProducto NVARCHAR(50),
	NombreProducto NVARCHAR(150),
	MarcaProducto NVARCHAR(80),
	Categoria NVARCHAR(80),
	SodSuSursal NVARCHAR(50),
	NombreSucursal NVARCHAR(100),
	DireccionSucursal NVARCHAR(300),
	Region NVARCHAR(80),
	Departamento NVARCHAR(80),
	Unidades INT,
	PrecioUnitario MONEY
);

IF OBJECT_ID('Stage.Comp', 'U') IS NOT NULL
	DROP TABLE Stage.Comp
CREATE TABLE Stage.Comp (
	Fecha DATE,
	CodProveedor NVARCHAR(50),
	NombreProveedor NVARCHAR(150),
	DireccionProveedor NVARCHAR(300),
	NumeroProveedor NVARCHAR(30),
	WebProveedor NVARCHAR(1),
	CodProducto NVARCHAR(50),
	NombreProducto NVARCHAR(150),
	MarcaProducto NVARCHAR(50),
	Categoria NVARCHAR(80),
	SodSuSursal NVARCHAR(40),
	NombreSucursal NVARCHAR(80),
	DireccionSucursal NVARCHAR(300),
	Region NVARCHAR(50),
	Departamento NVARCHAR(60),
	Unidades INT,
	CostoU MONEY
);

IF OBJECT_ID('StageVent.AC01', 'U') IS NOT NULL
	DROP TABLE StageVent.AC01
CREATE TABLE StageVent.AC01 (
	Fecha DATE,
	CodigoCliente NVARCHAR(50),
	NombreCliente NVARCHAR(80),
	TipoCliente NVARCHAR(50),
	DireccionCliente NVARCHAR(300),
	NumeroCliente NVARCHAR(50),
	CodVendedor NVARCHAR(50),
	NombreVendedor NVARCHAR(80),
	Vacacionista NVARCHAR(10),
	CodProducto NVARCHAR(50),
	NombreProducto NVARCHAR(150),
	MarcaProducto NVARCHAR(80),
	Categoria NVARCHAR(80),
	SodSuSursal NVARCHAR(50),
	NombreSucursal NVARCHAR(100),
	DireccionSucursal NVARCHAR(300),
	Region NVARCHAR(80),
	Departamento NVARCHAR(80),
	Unidades INT,
	PrecioUnitario MONEY
);

IF OBJECT_ID('StageVent.AC02', 'U') IS NOT NULL
	DROP TABLE StageVent.AC02
CREATE TABLE StageVent.AC02 (
	Fecha DATE,
	CodigoCliente NVARCHAR(50),
	NombreCliente NVARCHAR(80),
	TipoCliente NVARCHAR(50),
	DireccionCliente NVARCHAR(300),
	NumeroCliente NVARCHAR(50),
	CodVendedor NVARCHAR(50),
	NombreVendedor NVARCHAR(80),
	Vacacionista NVARCHAR(10),
	CodProducto NVARCHAR(50),
	NombreProducto NVARCHAR(150),
	MarcaProducto NVARCHAR(80),
	Categoria NVARCHAR(80),
	SodSuSursal NVARCHAR(50),
	NombreSucursal NVARCHAR(100),
	DireccionSucursal NVARCHAR(300),
	Region NVARCHAR(80),
	Departamento NVARCHAR(80),
	Unidades INT,
	PrecioUnitario MONEY
);

IF OBJECT_ID('StageVent.AC03', 'U') IS NOT NULL
	DROP TABLE StageVent.AC03
CREATE TABLE StageVent.AC03 (
	Fecha DATE,
	CodigoCliente NVARCHAR(50),
	NombreCliente NVARCHAR(80),
	TipoCliente NVARCHAR(50),
	DireccionCliente NVARCHAR(300),
	NumeroCliente NVARCHAR(50),
	CodVendedor NVARCHAR(50),
	NombreVendedor NVARCHAR(80),
	Vacacionista NVARCHAR(10),
	CodProducto NVARCHAR(50),
	NombreProducto NVARCHAR(150),
	MarcaProducto NVARCHAR(80),
	Categoria NVARCHAR(80),
	SodSuSursal NVARCHAR(50),
	NombreSucursal NVARCHAR(100),
	DireccionSucursal NVARCHAR(300),
	Region NVARCHAR(80),
	Departamento NVARCHAR(80),
	Unidades INT,
	PrecioUnitario MONEY
);

IF OBJECT_ID('StageComp.AC01', 'U') IS NOT NULL
	DROP TABLE StageComp.AC01
CREATE TABLE StageComp.AC01 (
	Fecha DATE,
	CodProveedor NVARCHAR(50),
	NombreProveedor NVARCHAR(150),
	DireccionProveedor NVARCHAR(300),
	NumeroProveedor NVARCHAR(30),
	WebProveedor NVARCHAR(1),
	CodProducto NVARCHAR(50),
	NombreProducto NVARCHAR(150),
	MarcaProducto NVARCHAR(50),
	Categoria NVARCHAR(80),
	SodSuSursal NVARCHAR(40),
	NombreSucursal NVARCHAR(80),
	DireccionSucursal NVARCHAR(300),
	Region NVARCHAR(50),
	Departamento NVARCHAR(60),
	Unidades INT,
	CostoU MONEY
);

IF OBJECT_ID('StageComp.AC02', 'U') IS NOT NULL
	DROP TABLE StageComp.AC02
CREATE TABLE StageComp.AC02 (
	Fecha DATE,
	CodProveedor NVARCHAR(50),
	NombreProveedor NVARCHAR(150),
	DireccionProveedor NVARCHAR(300),
	NumeroProveedor NVARCHAR(30),
	WebProveedor NVARCHAR(1),
	CodProducto NVARCHAR(50),
	NombreProducto NVARCHAR(150),
	MarcaProducto NVARCHAR(50),
	Categoria NVARCHAR(80),
	SodSuSursal NVARCHAR(40),
	NombreSucursal NVARCHAR(80),
	DireccionSucursal NVARCHAR(300),
	Region NVARCHAR(50),
	Departamento NVARCHAR(60),
	Unidades INT,
	CostoU MONEY
);

IF OBJECT_ID('StageComp.AC03', 'U') IS NOT NULL
	DROP TABLE StageComp.AC03
CREATE TABLE StageComp.AC03 (
	Fecha DATE,
	CodProveedor NVARCHAR(50),
	NombreProveedor NVARCHAR(150),
	DireccionProveedor NVARCHAR(300),
	NumeroProveedor NVARCHAR(30),
	WebProveedor NVARCHAR(1),
	CodProducto NVARCHAR(50),
	NombreProducto NVARCHAR(150),
	MarcaProducto NVARCHAR(50),
	Categoria NVARCHAR(80),
	SodSuSursal NVARCHAR(40),
	NombreSucursal NVARCHAR(80),
	DireccionSucursal NVARCHAR(300),
	Region NVARCHAR(50),
	Departamento NVARCHAR(60),
	Unidades INT,
	CostoU MONEY
);