Extension { #name : #GRPharoPlatform }

{ #category : #'*Seaside-Squeak-Core' }
GRPharoPlatform >> urlEncoderOn: aStream [
	^ WAPharoUrlEncoder on: aStream
]

{ #category : #'*Seaside-Squeak-Core' }
GRPharoPlatform >> urlEncoderOn: aStream codec: aCodec [
	^ aCodec url encoderFor: (WAPharoUrlEncoder on: aStream)
]

{ #category : #'*Seaside-Squeak-Core' }
GRPharoPlatform >> xmlEncoderOn: aStream [
	^ WAPharoXmlEncoder on: aStream
]
