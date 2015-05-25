accessing
brushSelectors
	^ brushSelectors ifNil: [ brushSelectors := self findBrushSelectors ]