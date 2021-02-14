"
A WAConditionalComment is an implementation of Downlevel-hidden Conditional Comments:
http://msdn2.microsoft.com/en-us/library/ms537512.aspx
These are only visible for the IE family of browsers.

See also WAOpeningConditionalComment and WAClosingConditionalComment.
"
Class {
	#name : #WAConditionalComment,
	#superclass : #WAObject,
	#instVars : [
		'condition',
		'root'
	],
	#category : 'Seaside-Core-Document-Elements'
}

{ #category : #'instance creation' }
WAConditionalComment class >> root: anHtmlRoot [
	^ self basicNew initializeWithRoot: anHtmlRoot
]

{ #category : #private }
WAConditionalComment >> addToCondition: aString [
	condition := condition , aString
]

{ #category : #private }
WAConditionalComment >> closingConditionClass [
	^ WAClosingConditionalComment
]

{ #category : #public }
WAConditionalComment >> do: aBlock [
	root add: (self openingConditionClass condition: condition).
	aBlock value.
	root add: (self closingConditionClass new)
]

{ #category : #operators }
WAConditionalComment >> equal [
	"implicit of nothing else"
]

{ #category : #operators }
WAConditionalComment >> greaterThan [
	self addToCondition: ' gt'
]

{ #category : #features }
WAConditionalComment >> ie [
	self addToCondition: ' IE'
]

{ #category : #features }
WAConditionalComment >> ie5 [
	self addToCondition: '5'
]

{ #category : #features }
WAConditionalComment >> ie50 [
	self addToCondition: '5.0'
]

{ #category : #features }
WAConditionalComment >> ie55 [
	self ie: '5.5'
]

{ #category : #features }
WAConditionalComment >> ie6 [
	self ie: '6'
]

{ #category : #features }
WAConditionalComment >> ie7 [
	self ie: '7'
]

{ #category : #features }
WAConditionalComment >> ie8 [
	self ie: '8'
]

{ #category : #features }
WAConditionalComment >> ie9 [
	self ie: '9'
]

{ #category : #features }
WAConditionalComment >> ie: aString [
	self addToCondition: ' IE ', aString
]

{ #category : #initialization }
WAConditionalComment >> initializeWithRoot: anHtmlRoot [
	self initialize.
	root := anHtmlRoot.
	condition := 'if'
]

{ #category : #operators }
WAConditionalComment >> lessThan [
	self addToCondition: ' lt'
]

{ #category : #operators }
WAConditionalComment >> not [
	self addToCondition: ' !'
]

{ #category : #private }
WAConditionalComment >> openingConditionClass [
	^ WAOpeningConditionalComment
]

{ #category : #operators }
WAConditionalComment >> orEqual [
	self addToCondition: 'e'
]
