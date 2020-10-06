```sql
SELECT
	neighborhoods.name AS neighborhood_name,
	Sum(census.popn_total) AS population,
	100.0 * Sum(census.popn_white) / Sum(census.popn_total) AS white_pct,
	100.0 * Sum(census.popn_black) / Sum(census.popn_total) AS black_pct
FROM nyc_neighborhoods AS neighborhoods
JOIN nyc_census_blocks AS census
ON ST_Intersects(neighborhoods.geom, census.geom)
WHERE neighborhoods.boroname = 'Manhattan'
GROUP BY neighborhoods.name
ORDER BY white_pct DESC;
```

```sql
SELECT blocks.blkid
FROM nyc_census_blocks blocks
JOIN nyc_subway_stations subways
ON ST_Contains(blocks.geom, subways.geom);

```

```sql
SELECT blocks.blkid, blocks.geom
FROM nyc_census_blocks blocks
JOIN nyc_subway_stations subways
ON ST_Contains(blocks.geom, subways.geom);
```

```sql
CREATE INDEX nyc_census_blocks_geom_idx
ON nyc_census_blocks
USING GIST (geom);
```

```sql
SELECT blocks.blkid, blocks.geom
FROM nyc_census_blocks blocks
JOIN nyc_subway_stations subways
ON ST_Contains(blocks.geom, subways.geom);
```

```sql
SELECT
	subways.name AS subway_name,
	neighborhoods.name AS neighborhood_name,
	neighborhoods.boroname AS borough
FROM nyc_neighborhoods AS neighborhoods
JOIN nyc_subway_stations AS subways
ON ST_Contains(neighborhoods.geom, subways.geom)
WHERE subways.name = 'Broad St';
```

```sql
SELECT
	subways.name AS subway_name,
	neighborhoods.name AS neighborhood_name,
	neighborhoods.boroname AS borough,
	neighborhoods.geom AS geom
FROM nyc_neighborhoods AS neighborhoods
JOIN nyc_subway_stations AS subways
ON ST_Contains(neighborhoods.geom, subways.geom)
WHERE subways.name = 'Broad St';
```

```sql
SELECT
	subways.name AS subway_name,
	neighborhoods.name AS neighborhood_name,
	neighborhoods.boroname AS borough,
	neighborhoods.geom AS geom
FROM nyc_neighborhoods AS neighborhoods
JOIN nyc_subway_stations AS subways
ON ST_Contains(neighborhoods.geom, subways.geom);
```

```sql
SELECT
	subways.name AS subway_name,
	neighborhoods.name AS neighborhood_name,
	neighborhoods.boroname AS borough,
	subways.geom AS geom
FROM nyc_neighborhoods AS neighborhoods
JOIN nyc_subway_stations AS subways
ON ST_Contains(neighborhoods.geom, subways.geom);
```

```sql
SELECT
	streets.name AS street_name,
	neighborhoods.name AS neighborhood_name,
	neighborhoods.boroname AS borough,
	streets.geom
FROM nyc_neighborhoods AS neighborhoods
JOIN nyc_streets AS streets
ON ST_Contains(neighborhoods.geom, streets.geom)
WHERE neighborhoods.name = 'Fort Green';
```

```sql
SELECT
	streets.name AS street_name,
	neighborhoods.name AS neighborhood_name,
	neighborhoods.boroname AS borough,
	streets.geom
FROM nyc_neighborhoods AS neighborhoods
JOIN nyc_streets AS streets
ON ST_Contains(neighborhoods.geom, streets.geom)
WHERE neighborhoods.boroname = 'Brooklyn';
```

```sql
SELECT
	neighborhoods.name AS neighborhood_name,
	Sum(census.popn_total) AS population,
	100.0 * Sum(census.popn_white) / Sum(census.popn_total) AS white_pct,
	100.0 * Sum(census.popn_black) / Sum(census.popn_total) AS black_pct,
	census.geom
FROM nyc_neighborhoods AS neighborhoods
JOIN nyc_census_blocks AS census
ON ST_Intersects(neighborhoods.geom, census.geom)
WHERE neighborhoods.boroname = 'State Island'
GROUP BY neighborhoods.name, census.geom
ORDER BY white_pct DESC;
```

```sql
SELECT name, geom
FROM nyc_subway_stations AS s
ORDER BY s.geom <#> ST_GeomFromText('POINT(596056 4523227)') LIMIT 5;
```

```sql
SELECT geom FROM nyc_streets
UNION ALL
SELECT geom FROM nyc_subway_stations;
```

```sql
SELECT gid, geom FROM nyc_streets WHERE ST_DWithin(geom, ST_GeomFromText('POINT(596056 4523227)', 26918), 1000)
UNION ALL
SELECT gid, geom FROM nyc_subway_stations WHERE ST_DWithin(geom, ST_GeomFromText('POINT(596056 4523227)', 26918), 1000);
```
