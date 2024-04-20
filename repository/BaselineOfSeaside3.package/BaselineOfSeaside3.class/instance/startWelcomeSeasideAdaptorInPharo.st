doits
startWelcomeSeasideAdaptorInPharo

	(Smalltalk globals at: #WAAdmin) defaultServerManager adaptors
		ifEmpty: [ (Smalltalk globals includesKey: #ZnZincServerAdaptor)
				ifTrue: [ (Smalltalk globals at: #ZnZincServerAdaptor) startOn: 8080 ] ]