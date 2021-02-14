"
WAPresenterGuides takes another WAPainterVisitor as a client. When asked to visit a Component, they will first visit its Decorations. Along the way, they will ask their client to visit each Painter they come across.

This allows us to separate the behaviour of the various Presenter-tree traversal methods from the behaviour to perform on each Presenter we visit.
"
Class {
	#name : #WAPresenterGuide,
	#superclass : #WAPainterVisitor,
	#instVars : [
		'client'
	],
	#category : 'Seaside-Component-Visitors'
}

{ #category : #'instance creation' }
WAPresenterGuide class >> client: aPainterVisitor [
	^ self basicNew initializeWithClient: aPainterVisitor; yourself
]

{ #category : #'instance creation' }
WAPresenterGuide class >> new [
	^ self client: WAPainterVisitor new
]

{ #category : #accessing }
WAPresenterGuide >> client [
	^ client
]

{ #category : #initialization }
WAPresenterGuide >> initializeWithClient: aPainterVisitor [
	self initialize.
	client := aPainterVisitor
]

{ #category : #copying }
WAPresenterGuide >> postCopyForRenderContext: aRenderContext [
	super postCopyForRenderContext: aRenderContext.
	client := client copyForRenderContext: aRenderContext
]

{ #category : #visiting }
WAPresenterGuide >> visit: aPainter [
	aPainter acceptDecorated: self
]

{ #category : #visiting }
WAPresenterGuide >> visitPainter: aPainter [
	self client visit: aPainter
]
