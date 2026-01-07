Extension { #name : 'CompiledMethod' }

{ #category : '*Seaside-Pharo-Development' }
CompiledMethod >> traverseWithMemory: aMemory seen: anIdentitySet [
	"methods are stored in classes, ignore counting them"
	anIdentitySet add: self
]
