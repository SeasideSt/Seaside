accessing
visibleItems
	^ items copyFrom: offset to: (self lastOffset min: items size)