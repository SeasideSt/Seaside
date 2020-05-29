*seaside-gemstone-flow
seasideSuspendFlowDo: aBlock
  | result |
  result := self privateSeasideSuspendFlowDo: [ :cc | aBlock value: cc ].
  ^ result isDictionary
    ifTrue: [ 
      "The result is a dictionary when we  are here after the  the partial continuation was restored to continue evaluation at this point (see WAPartialContinuation>>value:)"
      Processor activeProcess environment: (result at: 'env').
      result at: 'value' ]
    ifFalse: [ result ]