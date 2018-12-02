"
I display deprecation warnings.
"
Class {
	#name : #WADeprecationToolPlugin,
	#superclass : #WAToolPlugin,
	#instVars : [
		'filter'
	],
	#category : 'Seaside-Development-Plugins'
}

{ #category : #actions }
WADeprecationToolPlugin >> execute [
	self open: (WADeprecation on: filter)
]

{ #category : #initialization }
WADeprecationToolPlugin >> initializeRequestor: aRequestorObject [
	super initializeRequestor: aRequestorObject.
	filter := self session filters
		detect: [ :each | each isKindOf: WADeprecatedToolFilter ]
		ifNone: [ self session addFilter: WADeprecatedToolFilter new ]
]

{ #category : #testing }
WADeprecationToolPlugin >> isActive [
	^ filter notifications notEmpty
]

{ #category : #accessing }
WADeprecationToolPlugin >> label [
	^ 'Deprecated (' , filter notifications size printString , ')'
]

{ #category : #accessing }
WADeprecationToolPlugin >> priority [
	^ 700
]
