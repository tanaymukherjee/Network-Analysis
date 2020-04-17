# load the libraries
library(tidyverse)
library(tidygraph)
library(ggraph)

# Use tbl_graph
library("navdata")
data("phone.call2")
phone.net <- tbl_graph(
  nodes = phone.call2$nodes, 
  edges = phone.call2$edges,
  directed = TRUE
)


## This is work in progress!
