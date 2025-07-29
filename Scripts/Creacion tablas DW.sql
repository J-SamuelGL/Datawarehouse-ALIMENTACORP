IF OBJECT_ID('DW.FactVentas', 'U') IS NOT NULL
	DROP TABLE DW.FactVentas;
CREATE TABLE DW.FactVentas (
	VentaID INT,
	ClienteID INT,
	CodigoCliente NVARCHAR(50),
	ProductoID INT,
	CodProducto NVARCHAR(50),
	SucursalID INT,
	SodSuSursal NVARCHAR(50),
	VendedorID INT,
	CodVendedor NVARCHAR(50),
	FechaID INT,
	Unidades INT,
	PrecioUnitario MONEY,
	Total MONEY
);

IF OBJECT_ID('DW.FactOrdenesCompra', 'U') IS NOT NULL
	DROP TABLE DW.FactOrdenesCompra;
CREATE TABLE DW.FactOrdenesCompra(
	OrdenCompraID INT,
	ProveedorID INT,
	CodProveedor NVARCHAR(50),
	ProductoID INT,
	CodProducto NVARCHAR(50),
	FechaID INT,
	Unidades INT,
	CostoUnitario MONEY,
	TotalGasto MONEY
);

IF OBJECT_ID('DW.DimFechas', 'U') IS NOT NULL
	DROP TABLE DW.DimFechas;
CREATE TABLE DW.DimFechas (
	FechaID INT,
	Fecha DATE,
	FechaFormateada NVARCHAR(50),
	Año INT,
	Mes INT,
	Trimestre INT
);

IF OBJECT_ID('DW.DimClientes', 'U') IS NOT NULL
	DROP TABLE DW.DimClientes;
CREATE TABLE DW.DimClientes (
	ClienteID INT,
	CodigoCliente NVARCHAR(50),
	Nombre NVARCHAR(80),
	Tipo NVARCHAR(50),
	Direccion NVARCHAR(300),
	Celular NVARCHAR(50)
);

IF OBJECT_ID('DW.DimSucursales', 'U') IS NOT NULL
	DROP TABLE DW.DimSucursales;
CREATE TABLE DW.DimSucursales (
	SucursalID INT,
	SodSuSursal NVARCHAR(50),
	Nombre NVARCHAR(100),
	Direccion NVARCHAR(300),
	Region NVARCHAR(80),
	Departamento NVARCHAR(80)
);

IF OBJECT_ID('DW.DimVendedores', 'U') IS NOT NULL
	DROP TABLE DW.DimVendedores;
CREATE TABLE DW.DimVendedores (
	VendedorID INT,
	CodVendedor NVARCHAR(50),
	Nombre NVARCHAR(80),
	Vacacionista NVARCHAR(30)
);

IF OBJECT_ID('DW.DimProductos', 'U') IS NOT NULL
	DROP TABLE DW.DimProductos;
CREATE TABLE DW.DimProductos(
	ProductoID INT,
	CodProducto NVARCHAR(50),
	Nombre NVARCHAR(150),
	Marca NVARCHAR(80),
	Categoria NVARCHAR(80)
);

IF OBJECT_ID('DW.DimProveedores', 'U') IS NOT NULL
	DROP TABLE DW.DimProveedores;
CREATE TABLE DW.DimProveedores (
	ProveedorID INT,
	CodProveedor NVARCHAR(50),
	Nombre NVARCHAR(150),
	Direccion NVARCHAR(300),
	Celular NVARCHAR(30),
	Web NVARCHAR(1)
);