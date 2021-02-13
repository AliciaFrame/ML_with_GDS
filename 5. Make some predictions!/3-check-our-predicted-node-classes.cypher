//3. check our predicted node classes
MATCH (c:Character) 
WHERE c.predicted_xman = 1 AND NOT c:Model_Data
RETURN c.name, c.aliases, c.predicted_xman, c.predicted_xman_probability 

// (some of the results are unlabeled x men, like Beast, others are agents of SHIELD (frequent antagonists) or allies (avengers))