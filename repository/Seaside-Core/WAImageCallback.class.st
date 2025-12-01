Class {
	#name : 'WAImageCallback',
	#superclass : 'WAActionCallback',
	#category : 'Seaside-Core-Callbacks',
	#package : 'Seaside-Core',
	#tag : 'Callbacks'
}

{ #category : 'converting' }
WAImageCallback >> convertKey: aString [
	^ aString , '.x'
]
