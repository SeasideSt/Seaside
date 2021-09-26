setup
unregisterCorsAdaptorInGemStone
  (GemServer gemServerNamed: 'CORS')
    ifNotNil: [ :gemserver | gemserver stopGems ]