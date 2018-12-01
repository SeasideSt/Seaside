"
Opens a WAConditionalComment and encodes the condition.
"
Class {
	#name : #WAOpeningConditionalComment,
	#superclass : #WAObject,
	#instVars : [
		'condition'
	],
	#category : 'Seaside-Core-Document-Elements'
}

{ #category : #'instance creation' }
WAOpeningConditionalComment class >> condition: aString [
	^ self new
		condition: aString;
		yourself
]

{ #category : #accessing }
WAOpeningConditionalComment >> condition [
	^ condition
]

{ #category : #accessing }
WAOpeningConditionalComment >> condition: aString [
	condition := aString
]

{ #category : #printing }
WAOpeningConditionalComment >> encodeOn: aDocument [
	aDocument
		nextPutAll: '<!--[';
		nextPutAll: self condition;
		nextPutAll: ']>'
]
