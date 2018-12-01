"
A WAFormDecoration places its component inside an html form tag. The buttons inst var must be set. The component that a WAFormDecoration decorates must implement the method ""defaultButton"", which returns the string/symbol of the default button (one selected by default) of the form. Don't place any decorators between WAFormDecoration and its component otherwise ""defaultButton"" method fails. For each string/symbol in the buttons inst var the decorated component must implement a method of the same name, which is called when the button is selected.

Instance Variables
	buttons:		<Collection of strings or symbols>

buttons
	- list of strings or symbols, each string/symbol is the label (first letter capitalized) for a button and the name of the callback method on component when button is pressed, 

"
Class {
	#name : #WAFormDecoration,
	#superclass : #WAWidgetDecoration,
	#instVars : [
		'buttons'
	],
	#category : 'Seaside-Widgets-Decorations'
}

{ #category : #accessing }
WAFormDecoration >> buttons [
	^ buttons
]

{ #category : #accessing }
WAFormDecoration >> buttons: selectorArray [
	buttons := selectorArray
]

{ #category : #actions }
WAFormDecoration >> defaultAction [
	self decoratedComponent perform: self decoratedComponent defaultButton
]

{ #category : #rendering }
WAFormDecoration >> renderButtonForSelector: aSymbol on: html [
	html submitButton on: aSymbol of: self decoratedComponent
]

{ #category : #rendering }
WAFormDecoration >> renderButtonsOn: html [
	html div class: 'dialog-buttons'; with: [
		self buttons do: [ :each |
			html  span
				class: 'dialog-button-', each;
				with: [ self renderButtonForSelector: each on: html ] ] ]
]

{ #category : #rendering }
WAFormDecoration >> renderContentOn: html [
	html form
		defaultAction: [ self defaultAction ];
		with: [
			html div: [
				self renderNextOn: html.
				self renderButtonsOn: html ] ]
]
