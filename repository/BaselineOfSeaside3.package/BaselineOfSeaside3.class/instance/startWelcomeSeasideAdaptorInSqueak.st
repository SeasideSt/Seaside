doits
startWelcomeSeasideAdaptorInSqueak

	(Smalltalk globals at: #WAAdmin) defaultServerManager adaptors
		ifEmpty: [ (Smalltalk globals includesKey: #WAWebServerAdaptor)
				ifTrue: [ ((Smalltalk globals at: #WAWebServerAdaptor) port: 8080)
						codec: ((Smalltalk globals at: #GRCodec) forEncoding: 'utf-8');
						start ] ]