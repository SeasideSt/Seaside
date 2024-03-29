Class {
	#name : 'WAObjectUnderstandingUnregistered',
	#superclass : 'WAObject',
	#instVars : [
		'hasReceivedUnregistered'
	],
	#category : 'Seaside-Tests-Core-Cache',
	#package : 'Seaside-Tests-Core',
	#tag : 'Cache'
}

{ #category : 'accessing' }
WAObjectUnderstandingUnregistered >> hasReceivedUnregistered [
	^ hasReceivedUnregistered
]

{ #category : 'initialization' }
WAObjectUnderstandingUnregistered >> initialize [
	super initialize.
	hasReceivedUnregistered := false
]

{ #category : 'registration' }
WAObjectUnderstandingUnregistered >> unregistered [
	hasReceivedUnregistered := true
]
