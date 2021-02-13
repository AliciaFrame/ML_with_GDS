// 3. Create an appeared together relationship
MATCH (c1:Character)-[:APPEARED_IN]->(c:Comic)<-[:APPEARED_IN]-(c2:Character) 
WITH c1, c2, count(c) as weight
MERGE (c1)-[:APPEARED_WITH{times:weight}]->(c2)
MERGE (c2)-[:APPEARED_WITH{times:weight}]->(c1)