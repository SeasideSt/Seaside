attributes
allAttributes
	| attributes |
	attributes := IdentityDictionary new.
	
	self ancestorsDo: [ :each |
		each localAttributesDo: [ :attr |
			attributes at: attr key put: attr ] ].
	
	^ attributes