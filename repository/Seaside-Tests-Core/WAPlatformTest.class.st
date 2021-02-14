"
I contain unit tests for Seaside class extensions on GRPlatform.
"
Class {
	#name : #WAPlatformTest,
	#superclass : #GRPlatformTest,
	#category : 'Seaside-Tests-Core-Base'
}

{ #category : #tests }
WAPlatformTest >> testSeasideVersion [
	self assert: (self platform seasideVersion isKindOf: GRVersion)
]
