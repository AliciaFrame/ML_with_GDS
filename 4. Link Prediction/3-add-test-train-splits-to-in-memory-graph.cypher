//3. Add test train splits to in-memory graph
CALL gds.alpha.ml.splitRelationships.mutate('marvel_linkpred_data', {
  relationshipTypes: ['APPEARED_WITH'],
  remainingRelationshipType: 'APPEARED_WITH_REMAINING',
  holdoutRelationshipType: 'APPEARED_WITH_TESTGRAPH',
  holdoutFraction: 0.2
}) YIELD relationshipsWritten;

CALL gds.alpha.ml.splitRelationships.mutate('marvel_linkpred_data', {
  relationshipTypes: ['APPEARED_WITH_REMAINING'],
  remainingRelationshipType: 'APPEARED_WITH_IGNORED_FOR_TRAINING',
  holdoutRelationshipType: 'APPEARED_WITH_TRAINGRAPH',
  holdoutFraction: 0.2
}) YIELD relationshipsWritten;
