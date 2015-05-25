*seaside-pharo-core
urlEncoderOn: aStream codec: aCodec
	^ aCodec url encoderFor: (WAPharoUrlEncoder on: aStream)