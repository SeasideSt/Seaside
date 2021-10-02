setup
registerCorsAdaptorInGemStone
  | gemserver |
  gemserver := (Smalltalk at: #'GemServer') gemServerNamed: 'Seaside'.
  (gemserver ports includes: self corsAdaptorPort)
    ifFalse: [ 
      gemserver ports: gemserver ports , {(self corsAdaptorPort)}.
      gemserver restartGems ].
	(Smalltalk at: #System) commitTransaction 