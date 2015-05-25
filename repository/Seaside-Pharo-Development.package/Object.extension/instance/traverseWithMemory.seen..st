*seaside-pharo-development-core
traverseWithMemory: aMemory seen: anIdentitySet
	aMemory accumulate: self.
	anIdentitySet add: self.
	self traversableInstVarIndexes do: [ :index |
		aMemory 
			traverse: self
			value: (self instVarAt: index)
			seen: anIdentitySet ].
	self traversableIndexableVarIndexes do: [ :index |
		aMemory 
			traverse: self 
			value: (self basicAt: index) 
			seen: anIdentitySet ]