*Seaside-HotwireTurbo-Core
findTurboStreamCallbackIn: aRequest
	
	aRequest fields keysDo: [ :key |
		callbacks at: key ifPresent: [ :callback |
			callback isTurboStreamCallback
				ifTrue: [ ^ callback ] ] ].
	^ nil
