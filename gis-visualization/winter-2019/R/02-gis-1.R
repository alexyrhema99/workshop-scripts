# Challenge: import 1986 ward data and project it into the correct UTM projection
library(sf)
ward86 <- st_read("data/ward1986.shp")
ward86 <- st_transform(ward86, 32616)
plot(ward86)

plot(st_geometry(ward86))
?st_centroid

centroids <- st_centroid(ward86)
plot(st_geometry(centroids), cex = 0.1)
plot(st_geometry(ward86), add = T)

plot(st_geometry(ward86))
plot(st_geometry(centroids), cex = 0.1, add = T)

# challenge: figure out how to set a bounding box to something else
st_bbox(centroids)
ward_bbox <- st_bbox(ward86)

# to get coordinates of something
st_coordinates(centroids)

# random detour - plot a single ward and centroid
library(dplyr)
ward1 <- filter(ward86, WARDNO == "01")
centroid1 <- filter(centroids, WARDNO == "01")

plot(st_geometry(ward1))
plot(st_geometry(centroid1), add = T, cex = 0.1)

# make buffers
st_crs(centroids)
buffers <- st_buffer(centroids, 1000)

# challenge: plot wards, centroids, buffers altogether on one map
plot(st_geometry(buffers), col = "yellow")
plot(st_geometry(ward86), add = T)
plot(st_geometry(centroids), add = T, cex = 0.2, col = "red")

# functions learned
st_geometry()
st_centroid()
st_buffer()
st_bbox()
st_coordinates()