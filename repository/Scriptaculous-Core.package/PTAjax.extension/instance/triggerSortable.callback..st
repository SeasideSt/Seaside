*Scriptaculous-Core
triggerSortable: aString callback: aBlock
	aBlock fixCallbackTemps.
	self
		callback: [ :value |
			aBlock value: (GRPlatform subStringsIn: value splitBy: $,
				collect: [ :each | self renderContext callbacks passengerAt: each ]) ]
		value: (SUSortable new
			id: aString;
			sequence)