*Seaside-Squeak-Core
urlEncoderOn: aStream codec: aCodec
	^ aCodec url encoderFor: (WAPharoUrlEncoder on: aStream)