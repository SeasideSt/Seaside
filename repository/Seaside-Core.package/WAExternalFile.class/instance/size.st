accessing
size
	^ self exists
		ifTrue: [ GRPlatform current sizeOfFile: self fullyQualifiedFilePath ]
		ifFalse: [ 0 ]