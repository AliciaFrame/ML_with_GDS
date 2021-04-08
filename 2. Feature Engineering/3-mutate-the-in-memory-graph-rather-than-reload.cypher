//3. mutate the in-memory graph rather than reload
// pageRank
CALL gds.pageRank.mutate('marvel-character-graph',{
     relationshipTypes: ['APPEARS_WITH_DIRECTED'],
     mutateProperty: 'appeared_with_pageRank'
});
CALL gds.pageRank.mutate('marvel-character-graph',{
     relationshipTypes: ['ALLY_DIRECTED'],
     mutateProperty: 'ally_pageRank'
});
CALL gds.pageRank.mutate('marvel-character-graph',{
     relationshipTypes: ['ENEMY_DIRECTED'],
     mutateProperty: 'enemy_pageRank'
});

// betweenness
CALL gds.betweenness.mutate('marvel-character-graph',{
     relationshipTypes: ['APPEARS_WITH_UNDIRECTED'],
     mutateProperty: 'appeared_with_betweenness'
});
CALL gds.betweenness.mutate('marvel-character-graph',{
     relationshipTypes: ['ALLY_UNDIRECTED'],
     mutateProperty: 'ally_betweenness'
});
CALL gds.betweenness.mutate('marvel-character-graph',{
     relationshipTypes: ['ENEMY_UNDIRECTED'],
     mutateProperty: 'enemy_betweenness'
});

//HITS
CALL gds.alpha.hits.mutate('marvel-character-graph',{
     relationshipTypes: ['APPEARS_WITH_DIRECTED'],
     hitsIterations: 50,
     authProperty: 'appeared_with_auth',
     hubProperty: 'appeared_with_hub'
});
CALL gds.alpha.hits.mutate('marvel-character-graph',{
     relationshipTypes: ['ALLY_DIRECTED'],
     hitsIterations: 50,
     authProperty: 'ally_auth',
     hubProperty: 'ally_hub'
});
CALL gds.alpha.hits.mutate('marvel-character-graph',{
     relationshipTypes: ['ENEMY_DIRECTED'],
     hitsIterations: 50,
     authProperty: 'enemy_auth',
     hubProperty: 'enemy_hub'
});

// write back properties 
CALL gds.graph.writeNodeProperties(
  'marvel-character-graph',
  ['appeared_with_pageRank', 'appeared_with_betweenness','appeared_with_auth','appeared_with_auth','ally_pageRank',
  'ally_betweenness','ally_hub','ally_auth','enemy_pageRank','enemy_betweenness','enemy_hub','enemy_auth'],
  ['Character']
);
