*Seaside-HotwireTurbo-Core
turboShow: aComponent onAnswer: aBlock

	aComponent addDecoration: (WATurboFrame newWithId: self turboframeDecoration id).
	^ self show: aComponent onAnswer: aBlock
