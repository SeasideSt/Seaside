setup
registerCorsAdaptorInGemStone
  | gemserver |
  gemserver := (Smalltalk at: #'GemServer') gemServerNamed: 'Seaside'.
  (gemserver ports includes: self corsAdaptorPort)
    ifFalse: [ 
      gemserver ports: gemserver ports , {(self corsAdaptorPort)}.
      gemserver restartGems.
      (gemserver waitForStartGems: 20)
        ifFalse: [ 
          Transcript
            cr;
            show: 'Failed to start gemserver'.
          self assert: false ].
      (Delay forSeconds: 3) wait ]