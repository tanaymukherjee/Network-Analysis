# Network-Analysis-in-R

## Introduction:
Over a wide range of fields network analysis has become an increasingly popular tool for scholars to deal with the complexity of the interrelationships between actors of all sorts.

The promise of network analysis is the placement of significance on the relationships between actors, rather than seeing actors as isolated entities. The emphasis on complexity, along with the creation of a variety of algorithms to measure various aspects of networks, makes network analysis a central tool for digital humanities.

## Network Analysis: Nodes and Edges
The two primary aspects of networks are a multitude of separate entities and the connections between them. The vocabulary can be a bit technical and even inconsistent between different disciplines, packages, and software. The entities are referred to as nodes or vertices of a graph, while the connections are edges or links.

The network analysis packages need data to be in a particular form to create the special type of object used by each package. The object classes for network, igraph, and tidygraph are all based on adjacency matrices, also known as sociomatrices. An adjacency matrix is a square matrix in which the column and row names are the nodes of the network. Within the matrix a 1 indicates that there is a connection between the nodes, and a 0 indicates no connection. Adjacency matrices implement a very different data structure than data frames and do not fit within the tidyverse workflow that I have used in my previous posts. Helpfully, the specialized network objects can also be created from an edge-list data frame, which do fit in the tidyverse workflow. In this post I will stick to the data analysis techniques of the tidyverse to create edge lists, which will then be converted to the specific object classes for network, igraph, and tidygraph.

An edge list is a data frame that contains a minimum of two columns, one column of nodes that are the source of a connection and another column of nodes that are the target of the connection. The nodes in the data are identified by unique IDs. If the distinction between source and target is meaningful, the network is directed. If the distinction is not meaningful, the network is undirected. With the example of letters sent between cities, the distinction between source and target is clearly meaningful, and so the network is directed. For the examples below, I will name the source column as “from” and the target column as “to”. I will use integers beginning with one as node IDs. An edge list can also contain additional columns that describe attributes of the edges such as a magnitude aspect for an edge. If the edges have a magnitude attribute the graph is considered weighted.

## Task:
Here we will use the igraph package to create networks from edgelists and adjacency matrices. We then plot networks and their attributes to identify important vertices using measures like betweenness and degree. Next, this exercise covers network structures, including triangles and cliques.

## References:
https://www.jessesadler.com/post/network-analysis-with-r/
