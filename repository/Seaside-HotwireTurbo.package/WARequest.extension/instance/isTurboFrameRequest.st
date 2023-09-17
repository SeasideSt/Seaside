*Seaside-HotwireTurbo
isTurboFrameRequest
	^ (self headerAt: 'turbo-frame') notNil