Class {
	#name : #WADeprecationFunctionalTest,
	#superclass : #WAFunctionalTest,
	#category : 'Seaside-Tests-Functional'
}

{ #category : #private }
WADeprecationFunctionalTest >> deprecatedMethod [
	self
		greaseDeprecatedApi: 'this method is deprecated'
		details: 'use a different method instead'
]

{ #category : #rendering }
WADeprecationFunctionalTest >> renderContentOn: html [
	html text: 'a deprecation warning should pop up in the toolbar'.
	self deprecatedMethod
]
