"
A visitor that renders Painters. It creates an instance of the #rendererClass specified by each Painter it visits and passes it to the Painter with #renderContentOn:.
"
Class {
	#name : #WARenderVisitor,
	#superclass : #WAPainterVisitor,
	#instVars : [
		'renderContext'
	],
	#category : 'Seaside-Core-Rendering'
}

{ #category : #'instance creation' }
WARenderVisitor class >> context: aRenderContext [
	^ self basicNew
		initializeWithContext: aRenderContext;
		yourself
]

{ #category : #initialization }
WARenderVisitor >> initializeWithContext: aRenderContext [
	self initialize.
	renderContext := aRenderContext
]

{ #category : #copying }
WARenderVisitor >> postCopyForRenderContext: aRenderContext [
	super postCopyForRenderContext: aRenderContext.
	renderContext := aRenderContext
]

{ #category : #accessing }
WARenderVisitor >> renderContext [
	^ renderContext
]

{ #category : #visiting }
WARenderVisitor >> visitPainter: aPainter [ 
	| renderer |
	renderer := aPainter rendererClass context: self renderContext.
	aPainter renderContentOn: renderer.
	renderer flush
]
