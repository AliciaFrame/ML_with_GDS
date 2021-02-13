//4. one hot encode group membership <-- I ended up not using this, but useful to know how to 
MATCH (group:Group)
WITH group
   ORDER BY group.name
WITH collect(group) AS groups
MATCH (c:Character)
WITH c, gds.alpha.ml.oneHotEncoding(groups, [(c)-[:PART_OF_GROUP]->(group) | group]) as group_membership
SET c.group_membership=group_membership
   