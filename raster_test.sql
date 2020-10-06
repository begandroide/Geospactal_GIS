```sql
SELECT * FROM dem_raster;
```

```sql
SELECT (rc).x, (rc).y, (rc).val, ST_AsText((rc).geom) AS geom
FROM (SELECT ST_pixelaspolygons (rast) AS rc FROM dem_raster WHERE rid=1) AS tabla ORDER BY (rc).x, (rc).y;
```

```sql
SELECT (rc).x, (rc).y, (rc).val, ST_AsText((rc).geom), (rc).geom AS geom
FROM (SELECT ST_pixelaspolygons (rast) AS rc FROM dem_raster WHERE rid=1) AS tabla ORDER BY (rc).x, (rc).y;
```

```sql
SELECT (rc).x, (rc).y, (rc).val, ST_AsText((rc).geom), (rc).geom AS geom
FROM (SELECT ST_pixelaspolygons (rast) AS rc FROM dem_raster WHERE rid<10) AS tabla ORDER BY (rc).x, (rc).y;
```

