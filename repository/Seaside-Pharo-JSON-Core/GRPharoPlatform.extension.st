Extension { #name : #GRPharoPlatform }

{ #category : #'*seaside-pharo-json-core' }
GRPharoPlatform >> jsonEncoderOn: aStream [
	^ WAPharoJsonEncoder on: aStream
]
