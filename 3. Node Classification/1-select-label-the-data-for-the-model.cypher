//1. Select & label the data for the model
//MATCH(c:Model_Data) REMOVE (c:Model_Data);

//MATCH (c:Character) <-- you only need this if you're cleaning up from a previous run
//WHERE c.is_xman=0
//REMOVE c.is_xman;

//2: find the x-men and tag them, then flag to use in model
//MATCH (c:Character)-[:PART_OF_GROUP]-> (g:Group{name:'X-Men'})
//SET c.is_xman=1, c:Model_Data;

//2: find and include some unaffiliated individuals that are very far from x-men (but not orphan nodes)
// there are way more not x-men (133 with other affiliations, 936 with no known group) so we need to downsample for training
MATCH (c:Character)
WHERE NOT (c)-[:PART_OF_GROUP]->(:Group) WITH c
WHERE NOT (c)-[:APPEARED_WITH*2..3]-(:Character{is_xman:1}) 
AND apoc.node.degree(c)>0 WITH c
WHERE rand() < 0.2
SET c:Model_Data, c.is_xman=0;

//3. label the holdout data too (to predict on)
MATCH (c:Character)
WHERE NOT (c:Model_Data)
SET c:Holdout_Data;