file addition
addFileAt: aPath contents: aByteArrayOrString 
	self 
		addFileNamed: (GRPlatform current localNameOf: aPath)
		contents: aByteArrayOrString