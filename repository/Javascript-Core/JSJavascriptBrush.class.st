"
A brush to generate JSON
"
Class {
	#name : 'JSJavascriptBrush',
	#superclass : 'WABrush',
	#category : 'Javascript-Core-Brushes',
	#package : 'Javascript-Core',
	#tag : 'Brushes'
}

{ #category : 'testing' }
JSJavascriptBrush class >> isAbstract [ 

	^ self == JSJavascriptBrush
]

{ #category : 'private' }
JSJavascriptBrush >> closeBrush [
	self subclassResponsibility
]

{ #category : 'accessing' }
JSJavascriptBrush >> document [
	^ canvas document
]

{ #category : 'private' }
JSJavascriptBrush >> openBrush [
	self subclassResponsibility
]

{ #category : 'public' }
JSJavascriptBrush >> with: anObject [

	self openBrush.
	super with: [
		canvas render: anObject ].
	self closeBrush
]
