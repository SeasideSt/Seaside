"
Performs an AJAX request and updates a container's contents based on the response text.
"
Class {
	#name : #PTUpdater,
	#superclass : #PTAjax,
	#instVars : [
		'id'
	],
	#category : 'Prototype-Core-Ajax'
}

{ #category : #private }
PTUpdater >> defaultArguments [
	^ (Array with: self id) , super defaultArguments
]

{ #category : #private }
PTUpdater >> defaultId [
	^ JSStream on: 'this'
]

{ #category : #private }
PTUpdater >> defaultPrototype [
	^ 'Ajax.Updater'
]

{ #category : #options }
PTUpdater >> evalScripts: aBoolean [
	"This determines whether <script> elements in the response text are evaluated or not. The default implementation of Prototypes does not evaluate script, however this implementation changes this odd behavior."

	self options at: 'evalScripts' put: aBoolean
]

{ #category : #accessing }
PTUpdater >> id [
	^ id ifNil: [ self defaultId ]
]

{ #category : #accessing }
PTUpdater >> id: aString [
	id := aString
]

{ #category : #initialization }
PTUpdater >> initialize [
	super initialize.
	self evalScripts: true
]

{ #category : #options }
PTUpdater >> insertion: anInsertion [
	"By default, Element.update is used, which replaces the whole contents of the container with the response text. You may want to instead insert the response text around existing contents. You just need to pass a valid Insertion object for this, such as Insertion.Bottom."

	self options at: 'insertion' put: anInsertion
]

{ #category : #processing }
PTUpdater >> processOn: aStream with: argumentString [
	callback isNil
		ifTrue: [ ^ self ].
	self 
		render: [ :html |
			callback argumentCount = 2
				ifTrue: [ callback valueWithArguments: (Array with: html with: argumentString) ]
				ifFalse: [ callback value: html ] ]
		on: aStream
]
