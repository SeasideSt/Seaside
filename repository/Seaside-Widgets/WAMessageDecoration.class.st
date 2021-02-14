"
I add a string message on top of the WAComponent I decorate. For example if change WACounter>>initialize as below the text ""Counter Example"" will appear on above the counter when rendered.

WACounter>>initialize
	super initialize.
	self count: 0.
	self addMessage: 'Counter Example'	""added line""


"
Class {
	#name : #WAMessageDecoration,
	#superclass : #WAWidgetDecoration,
	#instVars : [
		'message'
	],
	#category : 'Seaside-Widgets-Decorations'
}

{ #category : #accessing }
WAMessageDecoration >> message: aString [
	message := aString
]

{ #category : #rendering }
WAMessageDecoration >> renderContentOn: html [
	html heading level3; with: message.
	self renderNextOn: html
]
