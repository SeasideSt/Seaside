"
WAWindowDecoration adds a simple title and close button in a bordered area at the top of the page. When closed button is selected nil is ""answer""ed. Useful for a quick & dirty dialog window. Used by WAPlugin and SCTestRunner.

Instance Variables:
	cssClass	<String>	String added to ""window-title "" to generate cssClass for the title
	title	<String>	title of page

"
Class {
	#name : #WAWindowDecoration,
	#superclass : #WAWidgetDecoration,
	#instVars : [
		'title',
		'cssClass'
	],
	#category : 'Seaside-Widgets-Decorations'
}

{ #category : #'instance creation' }
WAWindowDecoration class >> title: aTitle [
	^ self new
		title: aTitle;
		yourself
]

{ #category : #accessing }
WAWindowDecoration >> cssClass: aString [
	cssClass := aString
]

{ #category : #testing }
WAWindowDecoration >> isGlobal [
	^ true
]

{ #category : #rendering }
WAWindowDecoration >> renderCloseButtonOn: html [
	html anchor
		title: 'Close';
		callback: [ self decoratedComponent answer: nil ];
		with: [ html html: '&times;' ]
]

{ #category : #rendering }
WAWindowDecoration >> renderContentOn: html [
	html div class: 'window'; with: [
		html div class: 'window-titlebar'; with: [
			html div class: 'window-title'; class: cssClass; with: title.
			html div class: 'window-close'; with: [ self renderCloseButtonOn: html ] ].
		html div class: 'window-content'; with: [ self renderNextOn: html ] ]
]

{ #category : #accessing }
WAWindowDecoration >> title: aString [
	title := aString
]
