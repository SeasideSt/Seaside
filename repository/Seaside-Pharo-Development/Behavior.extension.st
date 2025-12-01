Extension { #name : 'Behavior' }

{ #category : '*Seaside-Pharo-Development' }
Behavior >> traverseWithMemory: aMemory seen: anIdentitySet [
	"classes are in the global pool, ignore counting them"
	anIdentitySet add: self
]
