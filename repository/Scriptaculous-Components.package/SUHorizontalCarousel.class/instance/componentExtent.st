accessing-bounds
componentExtent
	| clipExtent |
	clipExtent := self clipExtent.
	^ Point x: clipExtent x + (navMargin * 2) + 3 y: clipExtent y