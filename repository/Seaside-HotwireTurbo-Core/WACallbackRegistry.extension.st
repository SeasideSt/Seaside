Extension { #name : 'WACallbackRegistry' }

{ #category : '*Seaside-HotwireTurbo-Core' }
WACallbackRegistry >> findTurboStreamCallbackIn: aRequest [
	
	aRequest fields keysDo: [ :key |
		callbacks at: key ifPresent: [ :callback |
			callback isTurboStreamCallback
				ifTrue: [ ^ callback ] ] ].
	^ nil

]
