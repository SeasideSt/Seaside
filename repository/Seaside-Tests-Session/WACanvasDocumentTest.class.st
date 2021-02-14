Class {
	#name : #WACanvasDocumentTest,
	#superclass : #WAAbstractCanvasBrushTest,
	#category : 'Seaside-Tests-Session'
}

{ #category : #configuration }
WACanvasDocumentTest >> createHandlers [
	| application session |
	application := WAApplication new
		cache: WAPredictableCache new;
		yourself.
	session := WASession new
		documentHandlers: WAPredictableCache new;
		yourself.
	application register: session.
	^ Array
		with: application
		with: session
]

{ #category : #'tests-tags-anchors' }
WACanvasDocumentTest >> testAnchorAttributesDocument [
	self
		assert: [ :html | html anchor document: 'income: 1$' mimeType: 'text/plain' fileName: 'taxes.txt' ]
		gives: '<a type="text/plain" href="/?_s=1&amp;_d=1"></a>'.
	self
		assert: [ :html | html anchor document: 'income: 2$' mimeType: 'text/plain' ]
		gives: '<a type="text/plain" href="/?_s=1&amp;_d=2"></a>'.
	self
		assert: [ :html | html anchor document: 'income: 3$' ]
		gives: '<a href="/?_s=1&amp;_d=3"></a>'

]
