private
privateAt: aKey put: aValue
	aValue ifNil: [ ^ nil ].
	^ super privateAt: aKey put: aValue