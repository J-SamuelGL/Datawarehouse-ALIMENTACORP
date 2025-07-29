-- Los codigos clientes son unicos
SELECT 
	CodigoCliente,
	COUNT(CodigoCliente) AS Coincidencias
FROM (
	SELECT
		CodigoCliente,
		NombreCliente,
		COUNT(*) AS CantidadVentas
	FROM Stage.Vent
	GROUP BY
		CodigoCliente,
		NombreCliente
) AS ClientesCompras
GROUP BY 
	CodigoCliente
HAVING 
	COUNT(CodigoCliente) > 1;

-- !!!!!!!!!!!!!!!!!!!!!!!!!Hay clientes que tienen nombres iguales pero son distintas personas.
SELECT 
	COUNT(NombreCliente)
FROM (
SELECT DISTINCT
	CodigoCliente,
	NombreCliente
FROM 
	Stage.Vent
	) AS Clientes
GROUP BY 
	NombreCliente;

-- ==============================Hay clientes sin codigo
SELECT 
	*
FROM 
	Stage.Vent
WHERE 
	CodigoCliente IN (NULL, '');

-- No hay fechas vacias.
SELECT 
	*
FROM 
	Stage.Vent
WHERE 
	Fecha IN (NULL, '');

-- Los nombres de clientes no tienen espacios extra al inicio o final
SELECT 
	CodigoCliente,
	NombreCliente
FROM 
(
	SELECT DISTINCT
		CodigoCliente,
		NombreCliente
	FROM 
		Stage.Vent
) AS Clientes
WHERE
	TRIM(NombreCliente) != NombreCliente;

-- Los tipo cliente solo son Mayorista y Minorista. No hay anormalidad
SELECT DISTINCT	
	TipoCliente
FROM 
	Stage.Vent;

-- Direcciones "buenas"
-- Hay que "arreglar" formato
SELECT *
FROM Stage.Vent
WHERE DireccionCliente IN (NULL, '') OR LEN(DireccionCliente) < 5;

-- Inicio numeros
-- Numeros buenos
-- Hay que dar formato
-- Numeros de 8 digitos
SELECT DISTINCT
	LEN(NumeroCliente) AS CantidadDigitos
FROM 
	Stage.Vent;
-- Numeros no negativos
SELECT 
	CAST(NumeroCliente AS INT) AS Numeros
FROM 
	Stage.Vent
WHERE 
	CAST(NumeroCliente AS INT) < 0;
-- Fin numeros

-- Los datos son unicos para cada cliente
SELECT 
	CodigoCliente,
	COUNT(CodigoCliente) AS Coincidencias
FROM 
(
	SELECT DISTINCT
		CodigoCliente,
		NombreCliente,
		TipoCliente,
		DireccionCliente,
		NumeroCliente
	FROM 
		Stage.Vent
) AS DatosClientes
GROUP BY 
	CodigoCliente
HAVING 
	COUNT(CodigoCliente) > 1;

-- =========================Los codigos vendedor no son unicos
SELECT 
	CodVendedor,
	COUNT(CodVendedor) AS Coincidencias
FROM (
	SELECT
		CodVendedor,
		NombreVendedor,
		COUNT(*) AS CantidadVentas
	FROM Stage.Vent
	GROUP BY
		CodVendedor,
		NombreVendedor
) AS VentasVendedores
GROUP BY 
	CodVendedor
HAVING 
	COUNT(CodVendedor) > 1;

-- =========================Vendedores con codigos iguales
SELECT DISTINCT
	CodVendedor,
	NombreVendedor
FROM 
	Stage.Vent
WHERE 
	CodVendedor = 'V0028';

-- Datos: 0, 1, NAC
SELECT DISTINCT
	Vacacionista
FROM 
	Stage.Vent;

-- ===========================Si hay vendedores con datos cambiantes
SELECT 
	CodVendedor,
	COUNT(CodVendedor) AS Coincidencias
FROM 
(
SELECT DISTINCT
	CodVendedor,
	NombreVendedor,
	Vacacionista
FROM 
	Stage.Vent
) AS DatosVendedor
GROUP BY 
	CodVendedor
HAVING 
	COUNT(CodVendedor) > 1;

-- ============================Vendedores con datos cambiantes
SELECT DISTINCT
	CodVendedor,
	NombreVendedor,
	Vacacionista
FROM 
	Stage.Vent
WHERE 
	CodVendedor IN ('V0012', 'V0028')
ORDER BY 
	CodVendedor;

-- PRODUCTOS
-- Los codigos de los productos son unicos
SELECT 
	CodProducto,
	COUNT(CodProducto) AS Coincidencias
FROM (
	SELECT
		CodProducto,
		NombreProducto,
		COUNT(*) AS CantidadVentas
	FROM Stage.Vent
	GROUP BY
		CodProducto,
		NombreProducto
) AS Productos
GROUP BY 
	CodProducto
HAVING 
	COUNT(CodProducto) > 1;

-- Los datos de los productos no cambian
SELECT 
	CodProducto,
	COUNT(CodProducto) AS Coincidencias
FROM 
(
SELECT DISTINCT
	CodProducto,
	NombreProducto,
	MarcaProducto,
	Categoria
FROM 
	Stage.Vent
) AS Productos
GROUP BY
	CodProducto
HAVING 
	COUNT(CodProducto) > 1;

-- No hay nada raro en las categorias
SELECT DISTINCT
	Categoria
FROM 
	Stage.Vent;

-- Marcas escritas mal
SELECT 
	Arreglado,
	COUNT(Arreglado)
FROM 
(
SELECT DISTINCT
	MarcaProducto,
	REPLACE(MarcaProducto, ' ', '') AS Arreglado
FROM 
	Stage.Vent
) AS df
GROUP BY 
	Arreglado
HAVING 
	COUNT(Arreglado) > 1;

-- A pesar de eso todos son productos distintos
SELECT	
	CodProducto,
	NombreProducto,
	MarcaProducto
FROM 
	Stage.Vent
WHERE 
	MarcaProducto IN ('Bonaire', 'Bon aire', 'Mc cain', 'mccain')
ORDER BY 
	MarcaProducto;

-- Todos los codigos de sucursales son unicos
SELECT 
	SodSuSursal,
	COUNT(SodSuSursal) AS Coincidencias
FROM (
	SELECT
		SodSuSursal,
		NombreSucursal,
		COUNT(*) AS CantidadVentas
	FROM Stage.Vent
	GROUP BY
		SodSuSursal,
		NombreSucursal
) AS Sucursales
GROUP BY 
	SodSuSursal
HAVING 
	COUNT(SodSuSursal) > 1;

-- Los datos de las sucursales no cambian
SELECT 
	SodSuSursal,
	COUNT(SodSuSursal) AS Coincidencias
FROM 
(
SELECT DISTINCT
	SodSuSursal,
	NombreSucursal,
	DireccionSucursal,
	Region,
	Departamento
FROM 
	Stage.Vent
) AS Sucursales
GROUP BY
	SodSuSursal
HAVING 
	COUNT(SodSuSursal) > 1;

-- Regiones se ve bien. Hay 20 distintas
SELECT DISTINCT
	Region
FROM 
	Stage.Vent;

-- Departamentos. Son 20.
SELECT DISTINCT
	Departamento
FROM 
	Stage.Vent;

-- ============================Hay unidades compradas negativas
SELECT 
	Unidades
FROM 
	Stage.Vent
WHERE
	Unidades <= 0;

-- ============================Hay ceros y negativos en precio unitario
SELECT 
	PrecioUnitario
FROM 
	Stage.Vent
WHERE
	PrecioUnitario <= 0;

SELECT *
FROM Stage.Vent;

-- =============
--		COMP
-- =============

-- Hay consistencia en la union de productos. COMP tiene 42 productos que estan en VENT.
SELECT DISTINCT
	v.CodProducto,
	v.NombreProducto,
	c.CodProducto,
	c.NombreProducto
FROM 
	Stage.Vent v
	LEFT JOIN 
(
	SELECT DISTINCT
		CodProducto,
		NombreProducto
	FROM 
		Stage.Comp
) AS c ON c.CodProducto = v.CodProducto;

-- Las uniones entre sucursales son consistentes. COMP es la maestra. Total 120. vent 78 comp las 42 restantes.
SELECT DISTINCT
	c.SodSuSursal,
	c.NombreSucursal,
	c.DireccionSucursal,
	v.SodSuSursal,
	v.NombreSucursal,
	v.DireccionSucursal
FROM 
	Stage.Comp c
	LEFT JOIN 
(
	SELECT DISTINCT
		SodSuSursal,
		NombreSucursal,
		DireccionSucursal
	FROM 
		Stage.Vent
) AS v ON v.SodSuSursal = c.SodSuSursal;

SELECT * FROM DW.DimSucursales;

-- Las regiones se ven bien. Son 22.
SELECT DISTINCT
	Region
FROM 
	Stage.Comp;

-- Los departamentos se ven bien. Son 22.
SELECT DISTINCT
	Departamento
FROM 
	Stage.Comp;

-- ========================================Hay unidades negativos.
SELECT
	Unidades
FROM 
	Stage.Comp
WHERE 
	Unidades <= 0;

-- =========================================Hay precios negativos y ceros.
SELECT
	CostoU
FROM 
	Stage.Comp
WHERE 
	CostoU <= 0;

-- No hay fechas vacias
SELECT 
	*
FROM 
	Stage.Comp
WHERE 
	Fecha IN (NULL, '');

-- Todas los codigos son unicos. Hay 9 proveedores sin codigo.
SELECT 
	CodProveedor,
	COUNT(CodProveedor) AS Coincidencias
FROM 
(
	SELECT DISTINCT
		CodProveedor,
		NombreProveedor
	FROM 
		Stage.Comp
) AS Proveedores
GROUP BY 
	CodProveedor
HAVING 
	COUNT(CodProveedor) > 1;

-- ========================================Proveedores sin codigos
SELECT DISTINCT
	CodProveedor,
	NombreProveedor
FROM 
	Stage.Comp
WHERE 
	CodProveedor = '';

-- Los datos son consistentes para los proveedores. Excepto para los que no tienen codigo.
SELECT 
	CodProveedor,
	COUNT(CodProveedor) AS Coincidencias
FROM 
(
	SELECT DISTINCT
		CodProveedor,
		NombreProveedor,
		DireccionProveedor,
		NumeroProveedor,
		WebProveedor
	FROM 
		Stage.Comp
) AS Proveedores
GROUP BY 
	CodProveedor;

-- Los WebProveedor estan bien. Son 2.
SELECT DISTINCT
	WebProveedor
FROM 
	Stage.Comp;

-- Los codigos de productos son unicos
SELECT 
	CodProducto,
	COUNT(CodProducto) AS Coincidencias
FROM (
	SELECT
		CodProducto,
		NombreProducto,
		COUNT(*) AS CantidadVentas
	FROM Stage.Comp
	GROUP BY
		CodProducto,
		NombreProducto
) AS Productos
GROUP BY 
	CodProducto
HAVING 
	COUNT(CodProducto) > 1;
-- Los datos de los Productos son consistentes con las uniones.
SELECT 
	VCodProducto,
	COUNT(VCodProducto) AS Coincidencias
FROM 
(
	SELECT DISTINCT
		v.CodProducto AS VCodProducto,
		v.NombreProducto AS VNombreProducto,
		v.MarcaProducto AS VMarcaProducto,
		v.Categoria AS VCategoria,
		c.CodProducto AS CCodProducto,
		c.NombreProducto AS CNombreProducto,
		c.MarcaProducto AS CMarcarProducto,
		c.Categoria AS CCategoria
	FROM 
		Stage.Vent v
		LEFT JOIN 
		(
			SELECT DISTINCT
				CodProducto,
				NombreProducto,
				MarcaProducto,
				Categoria
			FROM 
				Stage.Comp
		) AS c ON c.CodProducto= v.CodProducto
	WHERE 
		c.CodProducto IS NOT NULL
) AS Productos
GROUP BY 
	VCodProducto
HAVING 
	COUNT(VCodProducto) > 1;

-- =========================================Hay Productos sin codigo
SELECT *
FROM Stage.Comp
WHERE CodProducto IS NULL OR CodProducto = '';

-- ++++++++++++++++++++++++++ Query para obtener TODOS los productos de los archivos.
-- ========================== Un producto no tiene Codigo
SELECT
	RANK() OVER(ORDER BY CodProducto ASC) AS ProductoID,
	*
FROM 
(
	SELECT DISTINCT
		CodProducto,
		NombreProducto,
		MarcaProducto,
		Categoria
	FROM 
		Stage.Vent
	UNION
	SELECT DISTINCT
		CodProducto,
		NombreProducto,
		MarcaProducto,
		Categoria
	FROM 
		Stage.Comp
) AS Productos;

-- No hay datos repetidos para los productos despues de union.
SELECT 
	CodProducto,
	COUNT(CodProducto) AS Coincidencias
FROM 
(
SELECT DISTINCT
	*
FROM 
(
SELECT DISTINCT
	CodProducto,
	NombreProducto
FROM 
	Stage.Vent
UNION
SELECT DISTINCT
	CodProducto,
	NombreProducto
FROM 
	Stage.Comp
) AS Datos
) AS Datos2
GROUP BY 
	CodProducto
HAVING 
	COUNT(CodProducto) > 1;

-- No hay datos repetidos
SELECT * FROM Stage.Comp;
SELECT DISTINCT * FROM Stage.Comp;

--+++++++++++++++++++++ Query para sacar Sucursales
SELECT
	ROW_NUMBER() OVER (ORDER BY SodSuSursal ASC) AS SucursalID,
	*
FROM 
(
SELECT DISTINCT
	SodSuSursal,
	NombreSucursal,
	DireccionSucursal,
	Region,
	Departamento
FROM 
	Stage.Vent
UNION
SELECT DISTINCT	
	SodSuSursal,
	NombreSucursal,
	DireccionSucursal,
	Region,
	Departamento
FROM 
	Stage.Comp
) AS Sucursales;

SELECT *
FROM DW.DimSucursales;

--+++++++++++++++++++++++++++ Query para sacar Proveedores
SELECT DISTINCT
	DENSE_RANK() OVER(ORDER BY CodProveedor, NombreProveedor) AS ProveedorID,
	CodProveedor,
	NombreProveedor,
	DireccionProveedor,
	NumeroProveedor,
	WebProveedor
FROM 
	Stage.Comp;

SELECT 
	*
FROM Stage.Comp;


SELECT DISTINCT
	*
FROM 
	Stage.Vent;

SELECT *
FROM DW.DimProductos;

SELECT *
FROM StageVent.AC01;

SELECT *
FROM StageVent.AC02;

SELECT *
FROM StageVent.AC03;

