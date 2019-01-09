instance creation
currentDo: aBlock markerBlock: markerBlock
	| marker |
	marker := markerBlock value
		ifNil: [ WAMarkerNotFound signal: 'Marker not found when capturing partial continuation.' ].
	^ aBlock value: (self to: marker offset: 1 markerBlock: markerBlock)