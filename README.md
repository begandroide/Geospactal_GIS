# Geospatial_GIS

Learning GIS applications

## Instalación PostGis

```bash
sudo apt install postresql
wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add - 
sudo apt-get update
sudo apt install pgadmin4 pgadmin4-apache2
systemctl status apache2
sudo -i -u postgres
sudo systemctl restart postgresql.service 
sudo -i -u postgres
sudo systemctl restart postgresql.service 
sudo apt install postgis postgresql-12-postgis-3
sudo systemctl restart postgresql.service 
sudo systemctl enable postgresql
sudo -i -u postgres
cd 12/main
nano pg_bha.conf ## editar permisos "allow"
```

## Como crear BD espacial

```bash
sudo -i -u postgres
createDb nyc
psql -d nyc -c "CREATE EXTENSION postgis;"
psql -d nyc -c "SELECT postgis_full_version();"
psql -d nyc -c "CREATE EXTENSION postgis_raster;"
psql -d nyc -c "CREATE EXTENSION postgis_topology;"
```

## Como insertar sql's

`26918` es el sistema de referencia que usaremos, además usamos el comando `shp2pgsql`
para hacer la transformación de shp to sql.

```bash
shp2pgsql -s 26918 nyc_census_blocks.shp > nyc_census_blocks.sql
shp2pgsql -s 26918 nyc_streets.shp > nyc_streets.sql
shp2pgsql -s 26918 nyc_neighborhoods.shp > nyc_neighborhoods.sql
shp2pgsql -s 26918 nyc_subway_stations.shp > nyc_subway_stations.sql
shp2pgsql -s 26918 nyc_homicides.shp > nyc_homicides.sql
```

Si no tenemos la carpeta /data dentro de /var/lib/postgresql, entonces crearla.

```bash
sudo mkdir /var/lib/postresql/data
sudo cp ./*.sql /var/lib/postgresql/data
```

Luego darle permisos de acceso a el usuario postgresql, suciamente lo podemos hacer:

```bash
sudo chmod 7777 /var/lib/postgresql/data*.sql
sudo -i -u postgres
cd data
psql -d nyc < nyc_census_blocks.sql
psql -d nyc < nyc_streets.sql
psql -d nyc < nyc_neighborhoods.sql
psql -d nyc < nyc_subway_stations.sql
psql -d nyc < nyc_homicides.sql
```

## Exportando e importando datos de OpenStreetMap (osm)

Instalar osm2pgsql

```bash
sudo apt-get install osm2pgsql
```

Entrar a openstreetmaps.org y buscar área de interes, luego exportar los datos... estos son
descargados en formato osm.

Luego copiar el archivo .osm descargado a una carpeta que tenga acceso postgres:

```bash
sudo cp map.osm /var/lib/postgresql/data/
sudo -i -u postgres
createdb osml
psql -d osml -c "CREATE EXTENSION postgis;"
psql -d osml -c "CREATE EXTENSION hstore;"
osm2pgsql --hstore-all -d osml ./data/map.osm
```
