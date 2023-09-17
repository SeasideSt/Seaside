*Seaside-HotwireTurbo
turboStreamCallbackIn: aRenderContext
	
	| callbacks |
	callbacks := aRenderContext callbacks.
	self fields keysDo: [ :key |
		callbacks at: key ifPresent: [ :callback |
			callback isTurboStreamCallback
				ifTrue: [ ^ callback ] ] ].
	^ nil