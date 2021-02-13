// 4. check predicted links 
MATCH (c1:Character)-[r:APPEARED_WITH_PREDICTED]->(c2:Character) 
RETURN c1.name, c2.name