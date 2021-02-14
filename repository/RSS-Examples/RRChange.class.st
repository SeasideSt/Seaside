Class {
	#name : #RRChange,
	#superclass : #WAObject,
	#instVars : [
		'timestamp',
		'author',
		'title',
		'description',
		'changedClass',
		'changedSelector',
		'sourceCode'
	],
	#category : 'RSS-Examples'
}

{ #category : #api }
RRChange >> addParametersTo: aUrl [
	self hasChangedClass ifFalse: [ ^ self ].
	aUrl addField: 'class' value: self changedClassName.
	self hasChangedSelector ifTrue: [
		aUrl addField: 'method' value: self changedSelector ].
	self isMeta ifTrue: [
		aUrl addField: 'meta' ]

]

{ #category : #accessing }
RRChange >> author [
	^ author
]

{ #category : #accessing }
RRChange >> author: anObject [
	author := anObject
]

{ #category : #accessing }
RRChange >> changedClass [
	^ changedClass
]

{ #category : #accessing }
RRChange >> changedClass: anObject [
	changedClass := anObject
]

{ #category : #api }
RRChange >> changedClassName [
	self hasChangedClass ifFalse: [ ^ nil ].
	^ self changedClass theNonMetaClass fullName
]

{ #category : #accessing }
RRChange >> changedSelector [
	^ changedSelector
]

{ #category : #accessing }
RRChange >> changedSelector: aSymbol [
	changedSelector := aSymbol
]

{ #category : #accessing }
RRChange >> description [
	^ description ifNil: [ self sourceCode ]
]

{ #category : #accessing }
RRChange >> description: aString [
	description := aString
]

{ #category : #testing }
RRChange >> hasChangedClass [
	"Some VW changes are not about any specific class"

	^ self changedClass notNil
]

{ #category : #testing }
RRChange >> hasChangedSelector [
	^ self changedSelector notNil
]

{ #category : #testing }
RRChange >> isMeta [
	^ self changedClass isMeta
]

{ #category : #accessing }
RRChange >> sourceCode [
	^ sourceCode
]

{ #category : #accessing }
RRChange >> sourceCode: aString [
	sourceCode := aString
]

{ #category : #api }
RRChange >> sourceCodeLimitedTo: max [
	self sourceCode ifNil: [ ^ String new ].
	^ self sourceCode copyFrom: 1 to: (max min: self sourceCode size)
]

{ #category : #accessing }
RRChange >> timestamp [
	^ timestamp
]

{ #category : #accessing }
RRChange >> timestamp: aTimestamp [
	timestamp := aTimestamp
]

{ #category : #accessing }
RRChange >> title [
	^ title
]

{ #category : #accessing }
RRChange >> title: aString [
	title := aString
]
