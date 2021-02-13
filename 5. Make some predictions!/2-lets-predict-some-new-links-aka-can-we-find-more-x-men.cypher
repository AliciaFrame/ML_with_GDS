// 2. lets predict some new links (aka: can we find more x-men?)
//Add the predictions to the in-memory graph
CALL gds.alpha.ml.linkPrediction.predict.mutate('marvel_linkpred_data', {
  relationshipTypes: ['APPEARED_WITH'], //filter out the known relationship type
  modelName: 'lp-appearance-model',
  mutateRelationshipType: 'APPEARED_WITH_PREDICTED',
  topN: 500,
  threshold: 0.49
});

CALL gds.graph.writeRelationship(
  'marvel_linkpred_data',
  'APPEARED_WITH_PREDICTED'
);