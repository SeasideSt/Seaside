*Seaside-HotwireTurbo-Core
isTurboStreamRequest

	^ self accept anySatisfy: [ :accept | accept value = WAMimeType textVndTurboStreamHtml ]
