Class {
	#name : #WAHandlerNode,
	#superclass : #WANode,
	#instVars : [
		'handler'
	],
	#category : 'Seaside-Tools-OmniBrowser'
}

{ #category : #'instance creation' }
WAHandlerNode class >> on: aRequestHandler [
	^ self new setHandler: aRequestHandler; yourself
]

{ #category : #accessing }
WAHandlerNode >> attributes [
	^ handler configuration allAttributes collect: 
		[ :each | 
		WAAttributeNode 
			configuration: handler configuration
			attribute: each ]
]

{ #category : #testing }
WAHandlerNode >> canHaveChildren [
	^ false
]

{ #category : #accessing }
WAHandlerNode >> children [
	^ #()
]

{ #category : #accessing }
WAHandlerNode >> groupedAttributes [
	| groups attributes |
	groups := Dictionary new.
	attributes := OrderedCollection new.
	handler configuration allAttributes do: [ :each |
		(groups
			at: each group
			ifAbsentPut: [ SortedCollection sortBlock: [ :a :b | a key <= b key ] ])
				add: each ].
	groups keys sorted do: [ :key |
		(groups at: key) do: [ :each | attributes add: (WAAttributeNode configuration: handler configuration attribute: each) ] ].
	^ attributes
]

{ #category : #accessing }
WAHandlerNode >> handler [
	^ handler
]

{ #category : #testing }
WAHandlerNode >> isHandler [
	^ true
]

{ #category : #public }
WAHandlerNode >> name [
	^ handler name ifNil: [ '' ]
]

{ #category : #accessing }
WAHandlerNode >> setHandler: aRequestHandler [
	handler := aRequestHandler
]
