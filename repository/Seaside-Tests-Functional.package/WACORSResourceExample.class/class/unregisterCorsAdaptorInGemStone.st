setup
unregisterCorsAdaptorInGemStone

	(Smalltalk at: #GemServer) ifNotNil: [ 
		((Smalltalk at: #GemServer) gemServerNamed: 'CORS') 
			ifNotNil: [ :gemserver | gemserver stopGems ] ]