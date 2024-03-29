"
An abstract widget decoration
"
Class {
	#name : 'WAWidgetDecoration',
	#superclass : 'WADecoration',
	#category : 'Seaside-Widgets-Decorations',
	#package : 'Seaside-Widgets',
	#tag : 'Decorations'
}

{ #category : 'testing' }
WAWidgetDecoration class >> isAbstract [

	^ self == WAWidgetDecoration
]

{ #category : 'rendering' }
WAWidgetDecoration >> rendererClass [
	"Make sure we use WAHtmlCanvas even if a different renderer is default."
	^ WAHtmlCanvas
]
