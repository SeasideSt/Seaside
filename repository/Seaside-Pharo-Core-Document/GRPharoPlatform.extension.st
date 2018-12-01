Extension { #name : #GRPharoPlatform }

{ #category : #'*seaside-pharo-core' }
GRPharoPlatform >> urlEncoderOn: aStream [
	^ WAPharoUrlEncoder on: aStream
]

{ #category : #'*seaside-pharo-core' }
GRPharoPlatform >> urlEncoderOn: aStream codec: aCodec [
	^ aCodec url encoderFor: (WAPharoUrlEncoder on: aStream)
]

{ #category : #'*seaside-pharo-core' }
GRPharoPlatform >> xmlEncoderOn: aStream [
	^ WAPharoXmlEncoder on: aStream
]
