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
     authProperty: 'appeared_with_auth',
     hubProperty: 'appeared_with_hub'
});
CALL gds.alpha.hits.mutate('marvel-character-graph',{
     relationshipTypes: ['ENEMY_DIRECTED'],
     hitsIterations: 50,
     authProperty: 'appeared_with_auth',
     hubProperty: 'appeared_with_hub'
});