"
A common superclass for all widgets that want to use WAHtmlCanvas as their renderer.
"
Class {
	#name : #WACanvasWidget,
	#superclass : #WAComponent,
	#category : 'Seaside-Widgets-Components'
}

{ #category : #rendering }
WACanvasWidget >> rendererClass [
	"Make sure we use WAHtmlCanvas even if a different renderer is default."
	^ WAHtmlCanvas
]
