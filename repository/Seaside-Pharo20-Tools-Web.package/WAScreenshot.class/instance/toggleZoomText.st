accessing
toggleZoomText
	^ zoom
		ifTrue: [ 'Zoom out' ]
		ifFalse: [ 'Zoom in' ]