private
isBinaryAt: aPath 
	^ self isBinary: (GRPlatform current localNameOf: aPath)