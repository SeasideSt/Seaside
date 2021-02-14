Class {
	#name : #WAXmlCanvasTest,
	#superclass : #WAContextTest,
	#category : 'Seaside-Tests-Canvas'
}

{ #category : #private }
WAXmlCanvasTest >> assert: aBlock gives: aString [
	| xml |
	xml := WAXmlCanvas builder
		render: aBlock.
	self assert: aString = xml
]

{ #category : #tests }
WAXmlCanvasTest >> testBasic [
	self
		assert: [ :xml |
        xml
            tag: 'the-tag'
            with: 'the-content' ]
		gives: '<the-tag>the-content</the-tag>'
]
