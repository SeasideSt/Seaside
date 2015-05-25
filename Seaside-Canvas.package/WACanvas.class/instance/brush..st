public
brush: aBrush
	self flush.
	currentBrush := aBrush.
	aBrush setParent: parentBrush canvas: self.
	^ aBrush