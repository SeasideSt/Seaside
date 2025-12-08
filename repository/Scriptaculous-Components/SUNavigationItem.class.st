Class {
	#name : 'SUNavigationItem',
	#superclass : 'SURenderableItem',
	#instVars : [
		'label'
	],
	#category : 'Scriptaculous-Components-Core',
	#package : 'Scriptaculous-Components',
	#tag : 'Core'
}

{ #category : 'accessing' }
SUNavigationItem >> label [
	^ label
]

{ #category : 'accessing' }
SUNavigationItem >> label: aString [
	label := aString
]
