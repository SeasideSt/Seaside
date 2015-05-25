visiting
visitPainter: aPainter 
	| renderer |
	renderer := aPainter rendererClass context: self renderContext.
	aPainter renderContentOn: renderer.
	renderer flush