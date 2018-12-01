"
WAChoiceDialog produces a form with select tag (dropdown menu) on a collection of options and ""Ok"" and ""Cancel"" buttons. Options can be any object. Returns actual object selected or nil if user select ""Cancel"". WAChoiceDialog is used to implement the chooseFrom:caption: convenience method in WAComponent.

	| selection |
	selection := WAChoiceDialog options: #('Smalltalk' 'Perl' 'Python' 'Ruby' 9).
	result := self call: selection.
	self inform: result printString

Instance Variables:
	options	<Collection of Objects> objects in list
	selection	<Object>	object selected by user or nil if user cancels


"
Class {
	#name : #WAChoiceDialog,
	#superclass : #WAFormDialog,
	#instVars : [
		'options',
		'selection'
	],
	#category : 'Seaside-Widgets-Components'
}

{ #category : #examples }
WAChoiceDialog class >> exampleComponent [
	^ self options: #('Perl' 'Python' 'Ruby' 'Smalltalk') selection: 'Smalltalk'
]

{ #category : #'instance creation' }
WAChoiceDialog class >> options: aCollection [
	^ self options: aCollection selection: nil
]

{ #category : #'instance creation' }
WAChoiceDialog class >> options: aCollection selection: anObject [
	^ self new
		options: aCollection;
		selection: anObject;
		yourself
		
]

{ #category : #accessing }
WAChoiceDialog >> buttons [
	^ #(ok cancel)
]

{ #category : #actions }
WAChoiceDialog >> cancel [
	self answer: nil
]

{ #category : #actions }
WAChoiceDialog >> ok [
	self answer: self selection
]

{ #category : #accessing }
WAChoiceDialog >> options [
	^ options
]

{ #category : #accessing }
WAChoiceDialog >> options: aCollection [
	options := aCollection
]

{ #category : #rendering }
WAChoiceDialog >> renderContentOn: html [
	html select
		list: self options;
		selected: self selection;
		callback: [ :value | self selection: value ]
]

{ #category : #accessing }
WAChoiceDialog >> selection [
	^ selection
]

{ #category : #accessing }
WAChoiceDialog >> selection: anObject [
	selection := anObject
]
