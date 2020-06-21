## Network Analysis
## Date: 21.06.2020
## Tanay Mukherjee

# Remove all the objects we created so far.
rm(list = ls()) 

# Load [Libraries]ackages
library(igraph)

#-------Create networks--------

g1 <- graph( edges=c(1,2, 2,3, 3,1), n=3, directed=F ) # an undirected graph with 3 edges
# The numbers are interpreted as vertex IDs, so the edges are 1-->2, 2-->3, 3-->1
plot(g1) # A simple plot of the network - we'll talk more about plots later
class(g1)
g1

g2 <- graph( edges=c(1,2, 2,3, 3,1), n=10 ) # now with 10 vertices, and directed by default
plot(g2)   
g2

g3 <- graph( c("John", "Jim", "Jim", "Jill", "Jill", "John")) # named vertices
# When the edge list has vertex names, the number of nodes is not needed
plot(g3)
g3

g4 <- graph( c("John", "Jim", "Jim", "Jack", "Jim", "Jack", "John", "John"), 
             isolates=c("Jesse", "Janis", "Jennifer", "Justin") )  
# In named graphs we can specify isolates by providing a list of their names.

plot(g4, edge.arrow.size=.5, vertex.color="gold", vertex.size=15, 
     vertex.frame.color="gray", vertex.label.color="black", 
     vertex.label.cex=1.5, vertex.label.dist=2, edge.curved=0.2) 

# Small graphs can also be generated with a description of this kind:
# '-' for undirected tie, "+-' or "-+" for directed ties pointing left & right, 
# "++" for a symmetric tie, and ":" for sets of vertices

plot(graph_from_literal(a---b, b---c)) # the number of dashes doesn't matter
plot(graph_from_literal(a--+b, b+--c))
plot(graph_from_literal(a+-+b, b+-+c)) 
plot(graph_from_literal(a:b:c---d:f:e))

gl <- graph_from_literal(a-b-c-d-e-f, a-g-h-b, h-e:f:i, j)
plot(gl)



#  ------->> Edge, vertex, and network attributes --------

# Access vertices and edges:
E(g4) # The edges of the object
V(g4) # The vertices of the object


# You can examine the network matrix directly:
g4[]
g4[1,] 

# Add attributes to the network, vertices, or edges:
V(g4)$name # automatically generated when we created the network.
V(g4)$gender <- c("male", "male", "male", "male", "female", "female", "male")
E(g4)$type <- "email" # Edge attribute, assign "email" to all edges
E(g4)$weight <- 10    # Edge weight, setting all existing edges to 10

# Examine attributes
edge_attr(g4)
vertex_attr(g4)
graph_attr(g4)

# Another way to set attributes
# (you can similarly use set_edge_attr(), set_vertex_attr(), etc.)
g4 <- set_graph_attr(g4, "name", "Email Network")
g4 <- set_graph_attr(g4, "something", "A thing")

graph_attr_names(g4)
graph_attr(g4, "name")
graph_attr(g4)

g4 <- delete_graph_attr(g4, "something")
graph_attr(g4)

plot(g4, edge.arrow.size=.5, vertex.label.color="black", vertex.label.dist=1.5,
     vertex.color=c( "pink", "skyblue")[1+(V(g4)$gender=="male")] ) 

# g4 has two edges going from Jim to Jack, and a loop from John to himself.
# We can simplify our graph to remove loops & multiple edges between the same nodes.
# Use 'edge.attr.comb' to indicate how edge attributes are to be combined - possible 
# options include "sum", "mean", "prod" (product), min, max, first/last (selects 
# the first/last edge's attribute). Option "ignore" says the attribute should be 
# disregarded and dropped.

g4s <- simplify( g4, remove.multiple = T, remove.loops = F, 
                 edge.attr.comb=list(weight="sum", type="ignore") )
plot(g4s, vertex.label.dist=1.5)
g4s

# Let's take a look at the description of the igraph object.
# Those will typically start with up to four letters:
# 1. D or U, for a directed or undirected graph
# 2. N for a named graph (where nodes have a name attribute)
# 3. W for a weighted graph (where edges have a weight attribute)
# 4. B for a bipartite (two-mode) graph (where nodes have a type attribute)
#
# The two numbers that follow refer to the number of nodes and edges in the graph. 
# The description also lists graph, node & edge attributes, for example:
# (g/c) - graph-level character attribute
# (v/c) - vertex-level character attribute
# (e/n) - edge-level numeric attribute

