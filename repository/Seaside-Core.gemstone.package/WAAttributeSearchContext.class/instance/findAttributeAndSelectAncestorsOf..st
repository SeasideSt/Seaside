private
findAttributeAndSelectAncestorsOf: aConfiguration
	| found |
	(attributeHolders includes: aConfiguration) ifTrue: [ ^ true ].
			
	aConfiguration localAttributeAt: self key ifPresent: [ :attr |
		attribute := attr.
		attributeHolders add: aConfiguration.
		^ true ].
		
	found := false.
	aConfiguration parents do: [ :each |
		found := found | (self findAttributeAndSelectAncestorsOf: each) ].
	
	found ifTrue: [ attributeInheritors add: aConfiguration ].
	
	^ found