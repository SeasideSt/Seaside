Extension { #name : #GRPlatform }

{ #category : #'*comet-core' }
GRPlatform >> cometForkProcessDo: aBlock [
	self subclassResponsibility
]

{ #category : #'*comet-core' }
GRPlatform >> cometWait [
	"Pause the process for a period of time before pinging the instances again."

	self subclassResponsibility
]
