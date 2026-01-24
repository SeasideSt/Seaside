tests
testRenderUsingSameCanvasClass
"When rendering html from a jquery instance, the renderer class of the jQuery instance must be the same as the one used when rendering the renderable."
"This test changes the renderer class in the created instance and then checks that the same class is used in the renderable callback"

	| instance rendererSpecies | 

	instance := (self jQuery: 'div').
	
	instance rendererClass: WAXmlCanvas.
	
	instance html: [ :canvas | rendererSpecies := canvas species. canvas spaceEntity ].
	
	instance asJavascript. "Trigger the renderable callback".

	self 
		assert: rendererSpecies 
		equals: 'WAXmlCanvas'