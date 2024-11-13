*Seaside-HotwireTurbo-Core
turboShow: aComponent

	aComponent addDecoration: (WATurboFrame newWithId: self turboframeDecoration id).
	^ self show: aComponent
