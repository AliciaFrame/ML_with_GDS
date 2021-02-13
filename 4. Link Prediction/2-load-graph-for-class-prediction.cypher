//2. load graph for class prediction
CALL gds.graph.create(
  'marvel_linkpred_data',
  {
    Character: {
      label: 'Character',
      properties: { 
        fastRP_embedding:{property:'fastRP_Extended_Embedding', defaultValue:0},
        graphSAGE_embedding:{property:'graphSAGE_embedding', defaultValue:0},
        strength:{property:'strength', defaultValue:0},
        durability:{property:'durability', defaultValue:0},
        intelligence:{property:'intelligence', defaultValue:0},
        energy:{property:'energy', defaultValue:0},
        speed:{property:'speed', defaultValue:0},
        is_xman:{property:'is_xman', defaultValue:0}
      }
    }
  }, {
    APPEARED_WITH: { //I don't actually need this for node classification
      type: 'APPEARED_WITH_MODEL',
      orientation: 'UNDIRECTED',
      properties: ['times'],
      aggregation: 'SINGLE'
    },
    APPEARED_WITH_HOLDOUT: { //I don't actually need this for node classification
      type: 'APPEARED_WITH_HOLDOUT',
      orientation: 'UNDIRECTED',
      properties: ['times'],
      aggregation: 'SINGLE'
    }
});