library(datasets)
library(tidyverse)
library(cluster)
library(factoextra)       # Visualization of clustering

data("iris")
View(iris)

sum(is.na(iris))

cluster <- kmeans(iris[,1:4], centers = 3, nstart = 10, 
                  iter.max = 10000L)

cluster$centers

distance <- get_dist(df)
fviz_dist(distance, gradient = 
            list(low = "cyan", mid = "white",
                 high = "magenta"))

cluster$tot.withinss
# within the cluster sum of squares
wcss <- function(k) {
  kmeans(irix[,1:4], k, nstart = 10 )$tot.withinss
}

# Compute and plot wss for k = 1 to k = 15
k.values <- 1:15

# extract wss for 2-15 clusters
wcss_values <- map_dbl(k.values, wcss)
print(wcss_values)

plot(k.values, wcss_values,
     type="b", pch = 19, frame = FALSE, 
     xlab="Number of clusters K",
     ylab="Total within-clusters sum of squares")

# cluster_1 <- kmeans(USArrests, centers = 4, nstart = 10)
# str(cluster_1)
# 
# print(cluster_1)
# 
# # Display each rows value of cluster
# cluster_1$cluster
# 
# 
# # Centroids of clusters
# cluster_1$centers

# total wcss
cluster$tot.withinss
## Visulaization of Cluster
fviz_cluster(cluster, data = iris[,1:4])

dev.off()