*Seaside-HotwireTurbo
isTurboStreamRequest

	^ self accept anySatisfy: [ :accept | accept value = WAMimeType textVndTurboStreamHtml ]
