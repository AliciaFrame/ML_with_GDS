//5.  train a link prediction model - without an embedding
CALL gds.alpha.ml.linkPrediction.train('marvel_linkpred_data', {
  trainRelationshipType: 'APPEARED_WITH_TRAINGRAPH',
  testRelationshipType: 'APPEARED_WITH_TESTGRAPH',
  modelName: 'lp-appearance-model-noEmbedding',
  featureProperties: ['strength','speed','intelligence','durability'],
  validationFolds: 5,
  classRatio: 1.33,
  randomSeed: 2,
  params: [
    {penalty: 0.24, maxIterations: 1000},
    {penalty: 0.5, maxIterations: 1000},
    {penalty: 1.0, maxIterations: 1000},
    {penalty: 0.0, maxIterations: 1000}
  ]
}) YIELD modelInfo
RETURN
  modelInfo.bestParameters AS winningModel,
  modelInfo.metrics.AUCPR.outerTrain AS trainGraphScore,
  modelInfo.metrics.AUCPR.test AS testGraphScore