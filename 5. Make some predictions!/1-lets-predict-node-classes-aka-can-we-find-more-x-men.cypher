// 1. lets predict node classes (aka: can we find more x-men?)
//Add the predictions to the in-memory graph
CALL gds.alpha.ml.nodeClassification.predict.mutate('marvel_model_data', {
  nodeLabels: ['Holdout_Character'], //filter our the character nodes
  modelName: 'xmen-model-fastRP',
  mutateProperty: 'predicted_xman',
  predictedProbabilityProperty: 'predicted_xman_probability'
});

CALL gds.graph.writeNodeProperties(
  'marvel_model_data',
  ['predicted_xman', 'predicted_xman_probability'],
  ['Holdout_Character']
);