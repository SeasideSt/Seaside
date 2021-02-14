"
Make the selected elements progressbar.
"
Class {
	#name : #JQProgressbar,
	#superclass : #JQWidget,
	#category : 'JQuery-UI-Widgets'
}

{ #category : #actions }
JQProgressbar >> getValue [
	"This method gets the current value of the progressbar."

	self action: 'value'
]

{ #category : #accessing }
JQProgressbar >> method [
	^ 'progressbar'
]

{ #category : #'events-generated' }
JQProgressbar >> onChange: anObject [
	"This event is triggered when the value of the progressbar changes."

	self optionAt: 'change' put: anObject asFunction
]

{ #category : #actions }
JQProgressbar >> setValue: aNumber [
	"This method sets the current value of the progressbar."

	self action: 'value' arguments: (Array with: aNumber)
]

{ #category : #'options-generated' }
JQProgressbar >> value: aNumber [
	"The value of the progressbar."

	self optionAt: 'value' put: aNumber
]
