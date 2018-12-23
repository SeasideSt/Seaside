*Seaside-Pharo-Welcome
startWelcomeSeasideAdaptor
	WAAdmin defaultServerManager adaptors
		ifEmpty: [ (Smalltalk includesKey: #ZnZincServerAdaptor)
				ifTrue: [ (Smalltalk at: #ZnZincServerAdaptor) startOn: 8080 ] ]