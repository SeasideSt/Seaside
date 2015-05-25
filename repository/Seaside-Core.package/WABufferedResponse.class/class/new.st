instance creation
new
	^ self on: (GRPlatform current writeCharacterStreamOn: (String new: 4096))