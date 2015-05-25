instance creation
external: anExternalStream
	^ self
		onBuffered: (GRPlatform current writeCharacterStreamOn: (String new: 4096))
		external: anExternalStream