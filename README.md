# Machine Learning with Neo4j's Graph Data Science Library

This library contains a demo of Neo4j's new *node classification* and *link prediction* algorithms - as applied to the Marvel Universe. It's built on top of Tomasnojo's Marvel Graph Gist available [here](https://gist.github.com/tomasonjo/fbc6d617c3f6476a3a825b5dd22fd29a). 

This demo shows how to:
1) Prepare data for using an ML model
2) Train graph embeddings as an input for a model
3) Predict missing node labels (in this case, who's an X-Man)
4) Predict missing relationships (who will appear in a future comic book together)
5) Use the trained models to make predictions

I've also uploaded a bloom perspective, to let you explore your results visually.

For further documentation on using the GDS ML functions, check out our docs [here](https://neo4j.com/docs/graph-data-science/1.5/algorithms/ml-models/)

