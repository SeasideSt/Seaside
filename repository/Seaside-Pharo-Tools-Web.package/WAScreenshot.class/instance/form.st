accessing
form
	| morph scaleFactor |
	morph := self morph.
	scaleFactor := self uiScaleFactor.
	^ scaleFactor = 1
		ifTrue: [ morph form ]
		ifFalse: [
			| formCanvas scalingCanvas |
			formCanvas := FormCanvas extent: morph extent * scaleFactor depth: 32.
			scalingCanvas := ScalingCanvas formCanvas: formCanvas scale: scaleFactor.
			morph fullDrawOn: scalingCanvas.
			formCanvas form ]