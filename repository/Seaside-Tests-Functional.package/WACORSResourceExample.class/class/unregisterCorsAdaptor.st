setup
unregisterCorsAdaptor
  (Smalltalk at: #'GemServer' ifAbsent:[ nil ])
    ifNil: [ self unregisterCorsAdaptorRegular ]
    ifNotNil: [ self unregisterCorsAdaptorInGemStone ]