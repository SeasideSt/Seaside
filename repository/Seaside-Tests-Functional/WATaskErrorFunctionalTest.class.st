Class {
	#name : #WATaskErrorFunctionalTest,
	#superclass : #WAFunctionalTaskTest,
	#category : 'Seaside-Tests-Functional'
}

{ #category : #running }
WATaskErrorFunctionalTest >> go [
	self confirm: 'Raise an exception?' onAnswer: [ :answer |
		[ answer ifTrue: [ self error: 'foo' ] ]
			on: Error
			do: [ :error | self inform: 'Caught: ', error description onAnswer: [ ] ] ]
]
