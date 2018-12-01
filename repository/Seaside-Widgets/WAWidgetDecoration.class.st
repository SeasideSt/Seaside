Class {
	#name : #WAWidgetDecoration,
	#superclass : #WADecoration,
	#category : 'Seaside-Widgets-Decorations'
}

{ #category : #rendering }
WAWidgetDecoration >> rendererClass [
	"Make sure we use WAHtmlCanvas even if a different renderer is default."
	^ WAHtmlCanvas
]
