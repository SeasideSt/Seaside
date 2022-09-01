*Seaside-Pharo-Development
traverseWithMemory: aMemory seen: anIdentitySet
	| traversableInstVarIndexes traversableIndexableVarIndexes |
	anIdentitySet add: self.
	self isImmediateObject ifTrue: [
		"don't report immediates"
		^ self ].
	aMemory accumulate: self.
	traversableInstVarIndexes := self class instSize.
	1 to: traversableInstVarIndexes do: [ :index |
		aMemory 
			traverse: self
			value: (self instVarAt: index)
			seen: anIdentitySet ].
	traversableIndexableVarIndexes := self basicSize.
	1 to: traversableIndexableVarIndexes do: [ :index |
		aMemory 
			traverse: self 
			value: (self basicAt: index) 
			seen: anIdentitySet ]