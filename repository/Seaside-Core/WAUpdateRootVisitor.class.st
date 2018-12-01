"
A visitor which asks Painters to update a WARoot subclass using #updateRoot:.

This is used to update the root of the Document stored on a WARenderContext.
"
Class {
	#name : #WAUpdateRootVisitor,
	#superclass : #WAPainterVisitor,
	#instVars : [
		'root'
	],
	#category : 'Seaside-Core-Rendering'
}

{ #category : #'instance creation' }
WAUpdateRootVisitor class >> new [
	^ self root: WARoot new
]

{ #category : #'instance creation' }
WAUpdateRootVisitor class >> root: aRoot [
	^ self basicNew initializeWithRoot: aRoot; yourself
]

{ #category : #initialization }
WAUpdateRootVisitor >> initializeWithRoot: aRoot [
	self initialize.
	root := aRoot
]

{ #category : #accessing }
WAUpdateRootVisitor >> root [
	^ root
]

{ #category : #visiting }
WAUpdateRootVisitor >> visitPainter: aPainter [
	aPainter updateRoot: self root
]
