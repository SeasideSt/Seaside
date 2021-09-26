setup
registerCorsAdaptor
  | gemserver |
  (Smalltalk at: #'GemServer')
    ifNil: [ self registerCorsAdaptorRegular ]
    ifNotNil: [ self registerCorsAdaptorInGemStone ]