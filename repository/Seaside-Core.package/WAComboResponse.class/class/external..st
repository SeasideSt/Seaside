instance creation
external: anExternalStream
	^ self
		onStream: anExternalStream
		bufferSize: 4096
		codec: GRNullCodec new