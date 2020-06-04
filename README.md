# GS-remote-sensing
Summary of landscape changes in Gran Sabana using remote sensing

## load environment

```sh
source $HOME/proyectos/IVIC/GS-remote-sensing/.loadenv
cd $WORKDIR
unzip $SCRIPTDIR/input/Canaima.zip
unzip $SCRIPTDIR/input/GS_teritory.zip
unzip $SCRIPTDIR/input/area_powierzchnia.zip
tar -xjvf input.tar.bz2 ## after doing this in terra.ad.unsw.edu.au

```

```R
R --vanilla
require(raster)
r0 <- raster("input/GFC-2019-v1.7/Hansen_GFC-2019-v1.7_treecover2000.tif")
r1 <- raster("input/GFC-2019-v1.7/Hansen_GFC-2019-v1.7_gain.tif")
r2 <- raster("input/GFC-2019-v1.7/Hansen_GFC-2019-v1.7_lossyear.tif")

canaima <- shapefile("Canaima.shp")
canaima.ll <- spTransform(canaima,r0@crs)

cr0 <- crop(r0,canaima.ll)
cr2 <- crop(r2,canaima.ll)
cr1 <- crop(r1,canaima.ll)

table(values(cr0))
table(values(cr1))
table(values(cr2))

r3 <- stack(dir("input/nightlights/","tif$",full.name=T))

tt <- apply(values(r3),2,quantile)

matplot(t(tt),ylim=c(-1,50),type="l")

# mean(values(raster(r3,1)))
r4 <- r3>(0.18*1.5)



```
