Class {
	#name : 'WABuilderWithComponentsCanvasTest',
	#superclass : 'WAContextTest',
	#category : 'Seaside-Tests-RenderLoop',
	#package : 'Seaside-Tests-RenderLoop'
}

{ #category : 'tests' }
WABuilderWithComponentsCanvasTest >> testBodyWithDecorations [
	| actual |
	actual := WAHtmlCanvas builder
		render: [ :html | 
			| component |
			component := WACanvasTestComponent new
				addDecoration: (WACanvasTestDecoration tagName: 'em');
				yourself.
			html render: component ].
	self assert: actual = '<em><p>I should be decorated.</p></em>'
]
