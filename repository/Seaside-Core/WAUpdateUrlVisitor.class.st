"
A visitor which asks Painters to update a WAUrl subclass using #updateRoot:.

This is used to update the base URL stored on a WARenderContext.
"
Class {
	#name : #WAUpdateUrlVisitor,
	#superclass : #WAPainterVisitor,
	#instVars : [
		'url'
	],
	#category : 'Seaside-Core-Rendering'
}

{ #category : #'instance creation' }
WAUpdateUrlVisitor class >> new [
	^ self url: WAUrl new
]

{ #category : #'instance creation' }
WAUpdateUrlVisitor class >> url: aUrl [
	^ self basicNew initializeWithUrl: aUrl; yourself
]

{ #category : #initialization }
WAUpdateUrlVisitor >> initializeWithUrl: aUrl [
	self initialize.
	url := aUrl
]

{ #category : #accessing }
WAUpdateUrlVisitor >> url [
	^ url
]

{ #category : #visiting }
WAUpdateUrlVisitor >> visitPainter: aPainter [
	aPainter updateUrl: self url
]
