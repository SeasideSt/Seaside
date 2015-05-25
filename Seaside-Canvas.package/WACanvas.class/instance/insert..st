private
insert: aBlock
	| oldBrush |
	oldBrush := currentBrush.
	currentBrush := nil.
	aBlock value.
	self flush.
	currentBrush := oldBrush