SELECT categoria, COUNT(*) AS total
FROM Producto
GROUP BY categoria
ORDER BY total DESC
LIMIT 1;
SELECT p.nombre_producto, s.cantidad
FROM Producto p
JOIN Stock s ON p.id_producto = s.id_producto
ORDER BY s.cantidad DESC;
SELECT color, COUNT(*) AS total
FROM Producto
GROUP BY color
ORDER BY total DESC
LIMIT 1;
SELECT pr.nombre_corporativo, SUM(s.cantidad) AS total_stock
FROM Proveedor pr
JOIN Producto p ON pr.id_proveedor = p.id_proveedor
JOIN Stock s ON p.id_producto = s.id_producto
GROUP BY pr.nombre_corporativo
ORDER BY total_stock ASC;
