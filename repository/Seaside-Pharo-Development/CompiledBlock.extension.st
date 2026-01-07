Extension { #name : 'CompiledBlock' }

{ #category : '*Seaside-Pharo-Development' }
CompiledBlock >> traverseWithMemory: aMemory seen: anIdentitySet [
	"blocks can be stored in collections and instance variables
	Report but don't intropect them. This may miss reporting catured variables."
	aMemory accumulate: self.
	anIdentitySet add: self
]
