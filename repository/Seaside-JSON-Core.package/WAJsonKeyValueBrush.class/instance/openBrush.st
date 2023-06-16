private
openBrush
	super openBrush.
	key greaseString jsonOn: canvas.
	self document stream nextPutAll: ': '