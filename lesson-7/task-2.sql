USE shop;

SELECT
    id, name,
    (SELECT catalogs.name FROM catalogs WHERE catalogs.id = products.catalog_id) AS catalog_name
FROM 
    products;
