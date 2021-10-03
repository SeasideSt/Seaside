setup
unregisterCorsAdaptorInGemStone
  | gemserver |
  gemserver := (Smalltalk at: #'GemServer') gemServerNamed: 'Seaside'.
  (gemserver ports includes: self corsAdaptorPort)
    ifTrue: [ 
      gemserver stopGems.
      gemserver ports: (gemserver ports copyWithout: self corsAdaptorPort).
      gemserver startGems.
      (gemserver waitForStartGems: 20)
        ifFalse: [ 
          Transcript
            cr;
            show: 'Failed to start gemserver'.
          self assert: false ].
      (Delay forSeconds: 3) wait ]