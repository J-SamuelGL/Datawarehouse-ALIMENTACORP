IF OBJECT_ID('Ventas', 'U') IS NOT NULL
	DROP TABLE Ventas
CREATE TABLE Ventas (
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

IF OBJECT_ID('Compras', 'U') IS NOT NULL
	DROP TABLE Compras
CREATE TABLE Compras (
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