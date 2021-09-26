setup
registerCorsAdaptor
  (Smalltalk at: #'GemServer' ifAbsent: [ nil ])
    ifNil: [ self registerCorsAdaptorRegular ]
    ifNotNil: [ self registerCorsAdaptorInGemStone ]