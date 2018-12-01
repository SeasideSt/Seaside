Class {
	#name : #JQueryTest,
	#superclass : #JSObjectTest,
	#category : 'JQuery-Tests-Core-Unit'
}

{ #category : #testing }
JQueryTest class >> isAbstract [
	^ self name = #JQueryTest
]

{ #category : #accessing }
JQueryTest class >> packageNamesUnderTest [
	^ #('JQuery-Core')
]

{ #category : #accessing }
JQueryTest >> function [
	"Answers the name of the jQuery function. This can be either '$' or 'jQuery' or any other user chosen name. This makes sure the tests run in any case."

	^ JQuery functionName
]

{ #category : #accessing }
JQueryTest >> jQuery [
	^ JQueryClass context: self renderContext
]

{ #category : #accessing }
JQueryTest >> jQuery: anObject [
	^ self jQuery with: anObject
]
