here::i_am("read-GIS-data.R")
target <- here::here("sandbox")
if (!dir.exists(target))
  dir.create(target)

## unzip(here::here("input","sampling","area_Kav.zip"),exdir=target) # do not import
unzip(here::here("input","sampling","area_powierzchnia.zip"),exdir=target) # do not import

unzip(here::here("input","sampling","Canaima.zip"),exdir=target)

unzip(here::here("input","sampling","comunidades_GS.zip"),exdir=target)
unzip(here::here("input","sampling","conucos.zip"),exdir=target)
unzip(here::here("input","sampling","grid2km_Kavanayen.zip"),exdir=target)
unzip(here::here("input","sampling","grid2km_Warapata.zip"),exdir=target)

unzip(here::here("input","sampling","GS_teritory.zip"),exdir=target)
unzip(here::here("input","sampling","rios_WGS.zip"),exdir=target)

dir(target)
library(sf)

Canaima <- read_sf(here::here("sandbox","Canaima.shp"))
area_Kav <- read_sf(here::here("sandbox","area_powierzchnia.shp"))
conucos <- read_sf(here::here("sandbox","conucos.shp"))
comunidades <- read_sf(here::here("sandbox","comunidades.shp"))
grd1 <- read_sf(here::here("sandbox","grid2km_Warapata.shp"))
grd2 <- read_sf(here::here("sandbox","grid2km_Kavanayen.shp"))

grd <- rbind(grd1, grd2)
GS <- read_sf(here::here("sandbox","GS_teritory.shp"))
rios <- read_sf(here::here("sandbox","rios_WGS.shp"))

plot(st_geometry(Canaima))
plot(st_geometry(area_Kav), add = T, col="peru")
plot(st_geometry(GS), add = T, col="thistle")
plot(st_geometry(grd), add = T)
plot(st_geometry(rios), add = T)

#            "rgrd"            
# [5] "vbsq"             "fbsq"             "dist.conucos"     "dist.dbsq"       
# [9] "dist.comunidades" "current.dbsq"     "eventos"          "camaras"         
#[13] "dist.caza1"       "dist.caza2"       "frs.c"            "dist.frs"        
#[17] "current.frs"      "tracks"           "track_points"     "tps"             
#[21] "ndvi.camara"      "viq.camara"      
tracks <- read_sf(here::here("input","fieldwork","GS_track_all.gpx"), "tracks")
