private
uiScaleFactor
	(Smalltalk hasClassNamed: #OSWorldRenderer) ifTrue: [
		| rendererClass |
		rendererClass := Smalltalk classNamed: #OSWorldRenderer.
		(rendererClass respondsTo: #canvasScaleFactor) ifTrue: [
			^  rendererClass canvasScaleFactor ] ].
	^ 1