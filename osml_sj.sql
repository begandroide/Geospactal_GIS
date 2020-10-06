```sql
SELECT way from planet_osm_roads;
```

```sql
SELECT way from planet_osm_polygon;
```

```sql
ALTER TABLE planet_osm_roads ADD COLUMN source INTEGER;
ALTER TABLE planet_osm_roads ADD COLUMN target INTEGER;
SELECT pgr_createTopology('planet_osm_roads', 10, 'way', 'osm_id', 'source', 'target');
```

```sql
SELECT * from planet_osm_roads;
```

```sql
SELECT * from pgr_dijkstra ('SELECT osm_id AS id, source, target, st_length(way) AS cost FROM planet_osm_roads', 1, 6, true);
```

```sql
SELECT way from planet_osm_roads where (source = 1 and target = 2) or (source = 2 and target = 5) or (source = 5 and target = 6);
```
