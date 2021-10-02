setup
unregisterCorsAdaptorInGemStone
  | gemserver |
  gemserver := (Smalltalk at: #'GemServer') gemServerNamed: 'Seaside'.
  (gemserver ports includes: self corsAdaptorPort)
    ifTrue: [ 
      gemserver stopGems.
      gemserver ports: (gemserver ports copyWithout: self corsAdaptorPort).
      gemserver startGems ].
 (Smalltalk at: #System) commitTransaction 