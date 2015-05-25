*seaside-pharo20-core
urlEncoderOn: aStream codec: aCodec
	^ aCodec url encoderFor: (WAPharoUrlEncoder on: aStream)