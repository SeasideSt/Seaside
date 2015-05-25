accessing-bounds
clipExtent
	| xSize ySize |
	xSize := elementExtent x + (2 * elementMargin).
	ySize := elementExtent y.
	^ Point x: numVisible * xSize y: ySize + (2 * elementMargin)