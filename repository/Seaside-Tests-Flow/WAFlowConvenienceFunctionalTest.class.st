Class {
	#name : #WAFlowConvenienceFunctionalTest,
	#superclass : #WAFunctionalTaskTest,
	#instVars : [
		'cheese'
	],
	#category : 'Seaside-Tests-Flow-Functional'
}

{ #category : #controlling }
WAFlowConvenienceFunctionalTest >> chooseCheese [
	cheese := self
		chooseFrom: #('Greyerzer' 'Tilsiter' 'Sbrinz')
		caption: 'What''s your favorite Cheese?'.
	cheese isNil ifTrue: [ self chooseCheese ]
]

{ #category : #controlling }
WAFlowConvenienceFunctionalTest >> confirmCheese [
	^ self confirm: 'Is ' , cheese , ' your favorite cheese?'
]

{ #category : #running }
WAFlowConvenienceFunctionalTest >> go [
	[ self chooseCheese.
	  self confirmCheese ] whileFalse.
	self informCheese
]

{ #category : #controlling }
WAFlowConvenienceFunctionalTest >> informCheese [
	self inform: 'Your favorite cheese is ', cheese, '.'
]

{ #category : #hooks }
WAFlowConvenienceFunctionalTest >> states [
	^ Array with: self
]
