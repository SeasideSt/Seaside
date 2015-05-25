accessing-bounds
clipExtent
	| xSize ySize |
	xSize := elementExtent x.
	ySize := elementExtent y + (2 * elementMargin).
	^ Point x: xSize + (2 * elementMargin) y: ySize * numVisible