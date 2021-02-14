"
An implementation of the Visitor pattern for Painter subclasses.
"
Class {
	#name : #WAPainterVisitor,
	#superclass : #WAVisitor,
	#category : 'Seaside-Core-Rendering'
}

{ #category : #copying }
WAPainterVisitor >> copyForRenderContext: aRenderContext [ 
	"Return a copy, making sure that references to a RenderContext are replaced
	with aRenderContext."
	
	^ self copy
		postCopyForRenderContext: aRenderContext;
		yourself
]

{ #category : #copying }
WAPainterVisitor >> postCopyForRenderContext: aRenderContext [
	"self is a shallow copy. Subclasses should copy fields as necessary to complete
	the full copy and ensure that all references to the old RenderContext are replaced
	with aRenderContext. Note that #postCopy is also called prior to this method being called."
]

{ #category : #visiting }
WAPainterVisitor >> visitPainter: aPainter [
]
