*seaside-gemstone300-core
renderOn: aRenderer
	self numArgs == 0 
		ifTrue: [self value]
		ifFalse: [self value: aRenderer]