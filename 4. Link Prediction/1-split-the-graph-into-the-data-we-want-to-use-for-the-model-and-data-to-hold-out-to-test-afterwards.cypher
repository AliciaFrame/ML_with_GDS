// 1. Split the graph into the data we want to use for the model, and data to hold out to test afterwards
MATCH (c1:Character)-[:APPEARED_IN]->(c:Comic)<-[:APPEARED_IN]-(c2:Character) 
WHERE c.year <> "2020" AND c.year <> "2019" AND c.year <> "2018" AND c.year <> "2017" AND c.year <> "2016" 
WITH c1, c2, count(c) as weight
MERGE (c1)-[:APPEARED_WITH_MODEL{times:weight}]->(c2)
MERGE (c2)-[:APPEARED_WITH_MODEL{times:weight}]->(c1);

//And label the data that's been held out
MATCH (c1:Character)-[:APPEARED_IN]->(c:Comic)<-[:APPEARED_IN]-(c2:Character) 
WHERE c.year="2020" OR c.year="2019" OR c.year="2018" OR c.year="2017" OR c.year="2016" 
WITH c1, c2, count(c) as weight
MERGE (c1)-[:APPEARED_WITH_HOLDOUT{times:weight}]->(c2)
MERGE (c2)-[:APPEARED_WITH_HOLDOUT{times:weight}]->(c1);