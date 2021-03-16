//4. compute fastRP extended embedding
// I'm writing this back because I'm only going to train my model on known characters, but I want the embedding for the full graph
CALL gds.beta.fastRPExtended.write('marvel-character-graph',{
    relationshipTypes:['APPEARS_WITH_UNDIRECTED'],
    featureProperties: ['strength','fighting_skills','durability','speed','intelligence','appeared_with_pageRank','ally_pageRank','enemy_pageRank','appeared_with_betweenness','ally_betweenness','enemy_betweenness','appeared_with_hub','appeared_with_auth','ally_hub','ally_auth','enemy_hub','enemy_auth'], //14 node features
    relationshipWeightProperty: 'times',
    propertyDimension: 45,
    embeddingDimension: 250,
    iterationWeights: [0, 0, 1.0, 1.0],
    normalizationStrength:0.05,
    writeProperty: 'fastRP_Extended_Embedding'
})
