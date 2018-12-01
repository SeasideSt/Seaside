Extension { #name : #GRPharoPlatform }

{ #category : #'*comet-pharo-core' }
GRPharoPlatform >> cometForkProcessDo: aBlock [
	^ aBlock forkAt: 20 named: 'ping'
]

{ #category : #'*comet-pharo-core' }
GRPharoPlatform >> cometWait [
	(Delay forSeconds: 15) wait
]
