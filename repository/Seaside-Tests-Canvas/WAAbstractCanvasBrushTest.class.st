Class {
	#name : #WAAbstractCanvasBrushTest,
	#superclass : #WAContextTest,
	#category : 'Seaside-Tests-Canvas'
}

{ #category : #testing }
WAAbstractCanvasBrushTest class >> isAbstract [
	^ self name = #WAAbstractCanvasBrushTest
]

{ #category : #accessing }
WAAbstractCanvasBrushTest class >> packageNamesUnderTest [
	^ #('Seaside-Canvas')
]

{ #category : #private }
WAAbstractCanvasBrushTest >> assert: aBlock gives: aString [
	| html |
	html := self builder
		render: aBlock.
	self
		assert: html = aString
		description:	 'Expected: ', aString printString, ', Actual: ', html printString
		resumable: true
]

{ #category : #private }
WAAbstractCanvasBrushTest >> builder [
	^ WAHtmlCanvas builder
]
