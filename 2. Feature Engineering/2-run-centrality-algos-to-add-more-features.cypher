//2. run centrality algos to add more features
// pageRank
CALL gds.pageRank.write('marvel-character-graph',{
     relationshipTypes: ['APPEARS_WITH_DIRECTED'],
     writeProperty: 'appeared_with_pageRank'
});
CALL gds.pageRank.write('marvel-character-graph',{
     relationshipTypes: ['ALLY_DIRECTED'],
     writeProperty: 'ally_pageRank'
});
CALL gds.pageRank.write('marvel-character-graph',{
     relationshipTypes: ['ENEMY_DIRECTED'],
     writeProperty: 'enemy_pageRank'
});

// betweenness
CALL gds.betweenness.write('marvel-character-graph',{
     relationshipTypes: ['APPEARS_WITH_UNDIRECTED'],
     writeProperty: 'appeared_with_betweenness'
});
CALL gds.betweenness.write('marvel-character-graph',{
     relationshipTypes: ['ALLY_UNDIRECTED'],
     writeProperty: 'ally_betweenness'
});
CALL gds.betweenness.write('marvel-character-graph',{
     relationshipTypes: ['ENEMY_UNDIRECTED'],
     writeProperty: 'enemy_betweenness'
});

//HITS
CALL gds.alpha.hits.write('marvel-character-graph',{
     relationshipTypes: ['APPEARS_WITH_DIRECTED'],
     hitsIterations: 50,
     authProperty: 'appeared_with_auth',
     hubProperty: 'appeared_with_hub'
});
CALL gds.alpha.hits.write('marvel-character-graph',{
     relationshipTypes: ['ALLY_DIRECTED'],
     hitsIterations: 50,
     authProperty: 'ally_auth',
     hubProperty: 'ally_hub'
});
CALL gds.alpha.hits.write('marvel-character-graph',{
     relationshipTypes: ['ENEMY_DIRECTED'],
     hitsIterations: 50,
     authProperty: 'enemy_auth',
     hubProperty: 'enemy_hub'
});
