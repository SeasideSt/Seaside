*Scriptaculous-Core
triggerTree: aString callback: aBlock
	self
		callback: [ :values |
			aBlock value: (Array streamContents: [ :stream |
				GRPlatform subStringsIn: values splitBy: $, do: [ :token |
					| pair |
					pair := GRPlatform subStringsIn: token splitBy: $:
						collect: [ :each | self renderContext callbacks passengerAt: each ifAbsent: [ nil ] ].
					pair size = 2
						ifTrue: [ stream nextPut: pair first -> pair second ] ] ]) ]
		value: (SUSortable new 
			id: aString;
			tree)