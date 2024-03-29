"
Abstract base class for all script generator tests.
"
Class {
	#name : 'WAScriptGeneratorTest',
	#superclass : 'WAContextTest',
	#category : 'Seaside-Tests-Canvas-Base',
	#package : 'Seaside-Tests-Canvas',
	#tag : 'Base'
}

{ #category : 'testing' }
WAScriptGeneratorTest class >> isAbstract [
	^ self name = #WAScriptGeneratorTest
]

{ #category : 'private' }
WAScriptGeneratorTest >> assert: aBlock gives: aString [
	| html |
	html := WAHtmlCanvas builder
		fullDocument: true;
		scriptGeneratorClass: self scriptGeneratorClass;
		render: aBlock.
	self assert: aString equals: html
]

{ #category : 'configuration' }
WAScriptGeneratorTest >> scriptGeneratorClass [
	self subclassResponsibility
]
