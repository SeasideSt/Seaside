Class {
	#name : #WAHaloVisitor,
	#superclass : #WAPainterVisitor,
	#instVars : [
		'toolDecoration',
		'renderContext',
		'visitor'
	],
	#category : 'Seaside-Development-Core'
}

{ #category : #'instance creation' }
WAHaloVisitor class >> decoration: aToolDecoration context: aRenderContext [
	^ self basicNew
		initializeWithToolDecoration: aToolDecoration renderContext: aRenderContext;
		yourself
]

{ #category : #initialization }
WAHaloVisitor >> initializeWithToolDecoration: aToolDecoration renderContext: aRenderContext [
	self initialize.
	toolDecoration := aToolDecoration.
	renderContext := aRenderContext
]

{ #category : #copying }
WAHaloVisitor >> postCopyForRenderContext: aRenderContext [
	super postCopyForRenderContext: aRenderContext.
	renderContext := aRenderContext.
	visitor := visitor copyForRenderContext: aRenderContext
]

{ #category : #accessing }
WAHaloVisitor >> renderContext [
	^ renderContext
]

{ #category : #accessing }
WAHaloVisitor >> toolDecoration [
	^ toolDecoration
]

{ #category : #visiting }
WAHaloVisitor >> visitPainter: aPainter [ 
	| halo |
	(self renderContext halosEnabled and: [ aPainter canHaveHalo ]) 
		ifTrue: [
			halo := self toolDecoration haloFor: aPainter.
			halo renderWithContext: self renderContext visitor: visitor ]
		ifFalse: [ visitor visit: aPainter ]
	
]

{ #category : #accessing }
WAHaloVisitor >> visitor [
	^ visitor
]

{ #category : #accessing }
WAHaloVisitor >> visitor: anObject [
	visitor := anObject
]
