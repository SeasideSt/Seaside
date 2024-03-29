"
A JSON key value
"
Class {
	#name : 'WAJsonKeyValueBrush',
	#superclass : 'WAJsonElementBrush',
	#instVars : [
		'key'
	],
	#classVars : [
		'StringKeysOnly'
	],
	#category : 'Seaside-JSON-Core-Brushes',
	#package : 'Seaside-JSON-Core',
	#tag : 'Brushes'
}

{ #category : 'instance creation' }
WAJsonKeyValueBrush class >> key: aString [
	^ self basicNew initializeWithKey: aString
]

{ #category : 'accessing' }
WAJsonKeyValueBrush class >> stringKeysOnly [
	^ StringKeysOnly ifNil: [ false ]
]

{ #category : 'accessing' }
WAJsonKeyValueBrush class >> stringKeysOnly: aBoolean [
	StringKeysOnly := aBoolean
]

{ #category : 'initialization' }
WAJsonKeyValueBrush >> initializeWithKey: aString [
	self initialize.
	key := aString
]

{ #category : 'private' }
WAJsonKeyValueBrush >> openBrush [
	super openBrush.
	self class stringKeysOnly
		ifTrue: [ key jsonKeyOn: canvas ]
		ifFalse: [ key jsonOn: canvas ].
	self document stream nextPutAll: ': '
]
