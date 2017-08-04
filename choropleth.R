library(rgdal)
library(leaflet)


#1
england <- readOGR(dsn = "England_parl_2011_gen_clipped", layer = "england_parl_2011_gen_clipped", encoding = "UTF-8")

dbf <- england@data

#2
proj4string(england) <- CRS("+init=epsg:27700")         # tells it to be UK Grid system 
england <- spTransform(england, CRS("+init=epsg:4326")) # converts to lat-long WGS84

#3
england@data$area <- sapply(england@polygons, function(x) 1000*x@area)

#writeOGR(england, "england", "england", driver="ESRI Shapefile")

#4
pal <- colorQuantile(palette = "YlGnBu",domain = england@data$area, n = 10)

# Using a simple field for the popup. It could be more complex HTML

# finally draw the map
#5
leaflet(data = england) %>%
  addTiles() %>%
  setView(-1, 52, zoom = 7) %>%
  addLegend("bottomright", pal = pal, values = ~area,
            title = "Area size",
            opacity = 1) %>%
  addPolygons(fillColor = ~pal(area), 
              fillOpacity = 0.8, 
              color = "#FF0000", 
              weight = 1,
              popup = england$name)


#####################################

dbf <- england@data

