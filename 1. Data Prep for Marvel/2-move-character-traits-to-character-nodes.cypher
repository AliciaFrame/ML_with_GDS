//2. Move character traits to character nodes
MATCH (c:Character)-[:HAS_STATS]->(s)
WITH c, s.strength as strength, s.fighting_skills as fighting_skills, s.durability as durability, s.speed as speed, s.intelligence as intelligence, s.energy as energy
SET c.strength=strength,
    c.fighting_skills=fighting_skills,
    c.durability=durability,
    c.speed=speed,
    c.intelligence=intelligence,
    c.energy=energy
RETURN count(c)