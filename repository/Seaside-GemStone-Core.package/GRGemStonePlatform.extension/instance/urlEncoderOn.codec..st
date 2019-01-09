*seaside-gemstone-core
urlEncoderOn: aStream codec: aCodec

	^ aCodec url encoderFor: (WAGsUrlEncoder on: aStream)