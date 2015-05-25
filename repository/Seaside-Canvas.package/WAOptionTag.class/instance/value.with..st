attributes
value: anObject with: aListTag
	self selected: (aListTag isSelected: anObject).
	self value: (aListTag valueFor: anObject)
	