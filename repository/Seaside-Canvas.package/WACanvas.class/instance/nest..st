private
nest: aBlock
	parentBrush := currentBrush.
	currentBrush := nil.
	self render: aBlock.
	self flush.
	parentBrush := parentBrush parent