initialization
setParent: aBrush canvas: aCanvas 
	super 
		setParent: aBrush
		canvas: aCanvas.
	(aBrush isKindOf: WAImageMapTag) ifTrue: [ 
		"in case the parent is an image map we need to set this attribute"
		self attributes 
			at: 'ismap'
			put: true ]