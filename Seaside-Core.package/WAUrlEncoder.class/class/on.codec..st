instance creation
on: aStream codec: aCodec
	^ aCodec url encoderFor: (self on: aStream table: table)