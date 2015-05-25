initialization
setParent: aBrush canvas: aCanvas
	super setParent: aBrush canvas: aCanvas.
	self post; action: aCanvas actionUrl