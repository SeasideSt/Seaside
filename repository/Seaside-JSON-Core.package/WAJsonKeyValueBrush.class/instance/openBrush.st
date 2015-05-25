private
openBrush
	super openBrush.
	key jsonOn: canvas.
	self document stream nextPutAll: ': '