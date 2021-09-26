setup
registerCorsAdaptorInGemStone
  | gemserver |
  gemserver := ((Smalltalk at: #'GemServer') gemServerNamed: 'CORS')
    ifNil: [ 
      (Smalltalk at: #'ZnSeasideGemServer')
        register: 'CORS'
        on: {(self corsAdaptorPort)} ].
  ^ gemserver restartGems