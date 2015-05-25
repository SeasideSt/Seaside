accessing-bounds
componentExtent
	| clipExtent |
	clipExtent := self clipExtent.
	^ Point x: clipExtent x y: clipExtent y + (navMargin * 2) + 3