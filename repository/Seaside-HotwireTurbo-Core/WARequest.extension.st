Extension { #name : 'WARequest' }

{ #category : '*Seaside-HotwireTurbo-Core' }
WARequest >> isTurboFrameRequest [
	^ (self headerAt: 'turbo-frame') notNil

]

{ #category : '*Seaside-HotwireTurbo-Core' }
WARequest >> isTurboStreamRequest [

	^ self accept anySatisfy: [ :accept | accept value = WAMimeType textVndTurboStreamHtml ]

]

{ #category : '*Seaside-HotwireTurbo-Core' }
WARequest >> turboStreamCallbackIn: aRenderContext [
	
	| callbacks |
	callbacks := aRenderContext callbacks.
	self fields keysDo: [ :key |
		callbacks at: key ifPresent: [ :callback |
			callback isTurboStreamCallback
				ifTrue: [ ^ callback ] ] ].
	^ nil

]
