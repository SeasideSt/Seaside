*scriptaculous-core-triggers
triggerSortable: aString callback: aBlock
	aBlock fixCallbackTemps.
	self
		callback: [ :value |
			aBlock value: ((value subStrings: ',') 
				collect: [ :each | self renderContext callbacks passengerAt: each ]) ]
		value: (SUSortable new
			id: aString;
			sequence)