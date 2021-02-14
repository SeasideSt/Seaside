Extension { #name : #GRPharoPlatform }

{ #category : #'*Seaside-Pharo-Core' }
GRPharoPlatform >> urlEncoderOn: aStream [
	^ WAPharoUrlEncoder on: aStream
]

{ #category : #'*Seaside-Pharo-Core' }
GRPharoPlatform >> urlEncoderOn: aStream codec: aCodec [
	^ aCodec url encoderFor: (WAPharoUrlEncoder on: aStream)
]

{ #category : #'*Seaside-Pharo-Core' }
GRPharoPlatform >> xmlEncoderOn: aStream [
	^ WAPharoXmlEncoder on: aStream
]
