//1. load graph with features
CALL gds.graph.create(
  'marvel-character-graph',
  {
    Person: {
      label: 'Character',
      properties: { 
      strength:{property:'strength',defaultValue:0},
      fighting_skills:{property:'fighting_skills', defaultValue:0},
      durability:{property:'durability', defaultValue:0},
      speed:{property:'speed', defaultValue:0},
      intelligence:{property:'intelligence', defaultValue:0},
      group_membership:{property:'group_membership',defaultValue:[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]}
      }
    }
  }, {
    APPEARS_WITH_UNDIRECTED: {
      type: 'APPEARED_WITH',
      orientation: 'UNDIRECTED',
      aggregation: 'SINGLE',
      properties: ['times']
    },
    APPEARS_WITH_DIRECTED: {
      type: 'APPEARED_WITH',
      orientation: 'NATURAL',
      properties: ['times'],
      aggregation: 'SINGLE'
    },
    ALLY_UNDIRECTED: {
      type: 'ALLY',
      orientation: 'UNDIRECTED',
      aggregation: 'SINGLE'
    },
    ALLY_DIRECTED: {
      type: 'ALLY',
      orientation: 'NATURAL',
      aggregation: 'SINGLE'
    },    
    ENEMY_UNDIRECTED: {
      type: 'ENEMY',
      orientation: 'UNDIRECTED',
      aggregation: 'SINGLE'
    },
    ENEMY_DIRECTED: {
      type: 'ENEMY',
      orientation: 'NATURAL',
      aggregation: 'SINGLE'
    }
   
});

