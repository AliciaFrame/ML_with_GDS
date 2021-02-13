//4. compare to tabular properties
CALL gds.alpha.ml.nodeClassification.train('marvel_model_data', {
   nodeLabels: ['Character'],
   modelName: 'xmen-model-properties',
   featureProperties: ['energy','speed','strength','durability','intelligence'], 
   targetProperty: 'is_xman', 
   metrics: ['F1_WEIGHTED','ACCURACY'], 
   holdoutFraction: 0.2, 
   validationFolds: 5, 
   randomSeed: 2,
   params: [
       {penalty: 0.0625, maxIterations: 1000},
       {penalty: 0.125, maxIterations: 1000}, 
       {penalty: 0.25, maxIterations: 1000}, 
       {penalty: 0.5, maxIterations: 1000},
       {penalty: 1.0, maxIterations: 1000},
       {penalty: 2.0, maxIterations: 1000}, 
       {penalty: 4.0, maxIterations: 1000}
       ]
    }) YIELD modelInfo
  RETURN
  modelInfo.bestParameters AS winningModel,
  modelInfo.metrics.F1_WEIGHTED.outerTrain AS trainGraphScore,
  modelInfo.metrics.F1_WEIGHTED.test AS testGraphScore