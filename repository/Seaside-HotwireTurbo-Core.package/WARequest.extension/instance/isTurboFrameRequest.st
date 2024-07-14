*Seaside-HotwireTurbo-Core
isTurboFrameRequest
	^ (self headerAt: 'turbo-frame') notNil
