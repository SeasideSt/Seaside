*Seaside-HotwireTurbo
turboCallback: aNiladicValuable 
	aNiladicValuable argumentCount > 0 ifTrue: [ 
		GRInvalidArgumentCount signal: 'Submit buttons expect a niladic callback.' ].
	self name: (self storeCallback: (WATurboFrameActionCallback on: aNiladicValuable))