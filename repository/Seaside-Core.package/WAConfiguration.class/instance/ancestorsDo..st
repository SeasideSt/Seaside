ancestry
ancestorsDo: aBlock 
	| set |
	set := IdentitySet new.
	self 
		ancestorsDo: aBlock
		seen: set.
	^ set