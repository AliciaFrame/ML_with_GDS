//1. Load data - from https://gist.github.com/tomasonjo/fbc6d617c3f6476a3a825b5dd22fd29a

CALL apoc.schema.assert({Character:['name']},{Comic:['id'], Character:['id'], Event:['id'], Group:['id']});

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/tomasonjo/blog-datasets/main/Marvel/heroes.csv" as row
CREATE (c:Character)
SET c += row;

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/tomasonjo/blog-datasets/main/Marvel/groups.csv" as row
CREATE (c:Group)
SET c += row;

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/tomasonjo/blog-datasets/main/Marvel/events.csv" as row
CREATE (c:Event)
SET c += row;

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/tomasonjo/blog-datasets/main/Marvel/comics.csv" as row
CREATE (c:Comic)
SET c += apoc.map.clean(row,[],["null"]);

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/tomasonjo/blog-datasets/main/Marvel/heroToComics.csv" as row
MATCH (c:Character{id:row.hero})
MATCH (co:Comic{id:row.comic})
MERGE (c)-[:APPEARED_IN]->(co);

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/tomasonjo/blog-datasets/main/Marvel/heroToEvent.csv" as row
MATCH (c:Character{id:row.hero})
MATCH (e:Event{id:row.event})
MERGE (c)-[:PART_OF_EVENT]->(e);

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/tomasonjo/blog-datasets/main/Marvel/heroToGroup.csv" as row
MATCH (c:Character{id:row.hero})
MATCH (g:Group{id:row.group})
MERGE (c)-[:PART_OF_GROUP]->(g);

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/tomasonjo/blog-datasets/main/Marvel/heroToHero.csv" as row
MATCH (s:Character{id:row.source})
MATCH (t:Character{id:row.target})
CALL apoc.create.relationship(s,row.type, {}, t) YIELD rel
RETURN distinct 'done';

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/tomasonjo/blog-datasets/main/Marvel/heroStats.csv" as row
MATCH (s:Character{id:row.hero})
CREATE (s)-[:HAS_STATS]->(stats:Stats)
SET stats += apoc.map.clean(row,['hero'],[]);

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/tomasonjo/blog-datasets/main/Marvel/heroFlight.csv" as row
MATCH (s:Character{id:row.hero})
SET s.flight = row.flight;

MATCH (s:Stats)
WITH keys(s) as keys LIMIT 1
MATCH (s:Stats)
UNWIND keys as key
CALL apoc.create.setProperty(s, key, toInteger(s[key]))
YIELD node
RETURN distinct 'done';
