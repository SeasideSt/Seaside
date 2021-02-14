"
Insertion provides a cross-browser solution to the dynamic insertion of HTML snippets (or plain text, obviously). Comes in four flavors: After, Before, Bottom and Top, which behave just as expected.
"
Class {
	#name : #PTInsertion,
	#superclass : #PTNamed,
	#category : 'Prototype-Core-Ajax'
}

{ #category : #accessing }
PTInsertion >> after [
	"Inserts the html into the page as the next sibling of element."

	self access: 'After'
]

{ #category : #actions }
PTInsertion >> after: aBlock [
	self after; with: aBlock
]

{ #category : #accessing }
PTInsertion >> before [
	"Inserts the html into the page as the previous sibling of element."

	self access: 'Before'
]

{ #category : #actions }
PTInsertion >> before: aBlock [
	self before; with: aBlock
]

{ #category : #accessing }
PTInsertion >> bottom [
	"Inserts the html into the page as the last child of element."

	self access: 'Bottom'
]

{ #category : #actions }
PTInsertion >> bottom: aBlock [
	self bottom; with: aBlock
]

{ #category : #private }
PTInsertion >> defaultArguments [
	^ nil
]

{ #category : #private }
PTInsertion >> defaultPrototype [
	^ 'Insertion'
]

{ #category : #accessing }
PTInsertion >> top [
	"Inserts the html into the page as the first child of element."

	self access: 'Top'
]

{ #category : #actions }
PTInsertion >> top: aBlock [
	self top; with: aBlock
]

{ #category : #public }
PTInsertion >> with: aBlock [
	self create; apply: (Array
		with: self id
		with: (self render: aBlock))
]
