*seaside-gemstone-flow
seasideSuspendFlowDo: aBlock
  | result |
  result := self privateSeasideSuspendFlowDo: [ :cc | aBlock value: cc ].
  ^ result isProcessEnvironmentWrapper
    ifTrue: [ result restoreEnvironmentAndReturnValue ]
    ifFalse: [ result ]