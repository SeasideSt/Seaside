"
Unit tests for WAPlatform
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
