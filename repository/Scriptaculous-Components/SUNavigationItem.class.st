Class {
	#name : #SUNavigationItem,
	#superclass : #SURenderableItem,
	#instVars : [
		'label'
	],
	#category : 'Scriptaculous-Components-Core'
}

{ #category : #accessing }
SUNavigationItem >> label [
	^ label
]

{ #category : #accessing }
SUNavigationItem >> label: aString [
	label := aString
]
