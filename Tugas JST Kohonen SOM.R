library(readxl)
data <- read_excel("Data_JST_SOM.xlsx")
str(data)

library(kohonen)
grid <- somgrid(xdim = 6 , ydim = 6 , topo = "hexagonal")
som.data <- som(as.matrix(data[,-1]), grid)
plot(som.data)

som.data$grid$pts
som.data$codes[[1]]

hclust(dist(som.data$codes[[1]]))

daerah <- cutree(hclust(dist(som.data$codes[[1]])),4)
plot(som.data, type = "codes", bgcol = rainbow(5)[daerah])
add.cluster.boundaries(som.data, daerah)
