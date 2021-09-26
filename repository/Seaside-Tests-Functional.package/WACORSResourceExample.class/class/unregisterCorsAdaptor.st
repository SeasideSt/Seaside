setup
unregisterCorsAdaptor
  | gemserver |
  (Smalltalk at: #'GemServer')
    ifNil: [ self unregisterCorsAdaptorRegular ]
    ifNotNil: [ self unregisterCorsAdaptorInGemStone ]