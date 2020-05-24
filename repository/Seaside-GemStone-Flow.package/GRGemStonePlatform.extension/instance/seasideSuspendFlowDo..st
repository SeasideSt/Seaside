*seaside-gemstone-flow
seasideSuspendFlowDo: aBlock
  | dict |
  dict := self privateSeasideSuspendFlowDo: [ :cc | aBlock value: cc ].
  Processor activeProcess environment: (dict at: 'env').
  ^ dict at: 'value'