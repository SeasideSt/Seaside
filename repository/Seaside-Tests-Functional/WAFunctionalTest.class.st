Class {
	#name : #WAFunctionalTest,
	#superclass : #WAComponent,
	#category : 'Seaside-Tests-Functional'
}

{ #category : #testing }
WAFunctionalTest class >> isFunctionalTest [
	^ self name ~= #WAFunctionalTest
]

{ #category : #updating }
WAFunctionalTest >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: self class name greaseString
]
