Class {
	#name : #WAImageCallback,
	#superclass : #WAActionCallback,
	#category : 'Seaside-Core-Callbacks'
}

{ #category : #converting }
WAImageCallback >> convertKey: aString [
	^ aString , '.x'
]
