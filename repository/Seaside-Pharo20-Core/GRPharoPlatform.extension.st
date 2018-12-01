Extension { #name : #GRPharoPlatform }

{ #category : #'*seaside-pharo20-core' }
GRPharoPlatform >> urlEncoderOn: aStream [
	^ WAPharoUrlEncoder on: aStream
]

{ #category : #'*seaside-pharo20-core' }
GRPharoPlatform >> urlEncoderOn: aStream codec: aCodec [
	^ aCodec url encoderFor: (WAPharoUrlEncoder on: aStream)
]

{ #category : #'*seaside-pharo20-core' }
GRPharoPlatform >> xmlEncoderOn: aStream [
	^ WAPharoXmlEncoder on: aStream
]
