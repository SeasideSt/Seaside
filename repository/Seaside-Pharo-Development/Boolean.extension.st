Extension { #name : 'Boolean' }

{ #category : '*Seaside-Pharo-Development' }
Boolean >> traverseWithMemory: aMemory seen: anIdentitySet [
	"booleans are singletons, ignore counting them"
	anIdentitySet add: self
]
