instance creation
currentDo: aBlock
	| marker |
	marker := WAMarkerRequest signal
		ifNil: [ WAMarkerNotFound signal: 'Marker not found when capturing partial continuation.' ].
	^ aBlock value: (self from: thisContext sender to: marker)