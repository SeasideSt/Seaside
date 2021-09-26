setup
registerCorsAdaptorInGemStone
  | gemserver |
  gemserver := (GemServer gemServerNamed: 'CORS')
    ifNil: [ 
      (Smalltalk at: #'ZnSeasideGemServer')
        register: 'CORS'
        on: {(self corsAdaptorPort)} ].
  ^ gemserver restartGems