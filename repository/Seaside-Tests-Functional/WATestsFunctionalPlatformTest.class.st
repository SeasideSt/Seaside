Class {
	#name : #WATestsFunctionalPlatformTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-Functional'
}

{ #category : #tests }
WATestsFunctionalPlatformTest >> testGarbageCollect [
	self 
		shouldnt: [ GRPlatform current seasideGarbageCollect ]
		raise: MessageNotUnderstood
]
