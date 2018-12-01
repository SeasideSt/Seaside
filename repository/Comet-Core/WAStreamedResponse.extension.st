Extension { #name : #WAStreamedResponse }

{ #category : #'*comet-core' }
WAStreamedResponse >> flushComet [
	^ externalStream flushComet
]
