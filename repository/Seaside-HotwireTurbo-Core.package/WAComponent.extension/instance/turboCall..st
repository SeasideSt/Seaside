*Seaside-HotwireTurbo-Core
turboCall: aComponent

	aComponent addDecoration: (WATurboFrame newWithId: self turboframeDecoration id).
	^ self call: aComponent
