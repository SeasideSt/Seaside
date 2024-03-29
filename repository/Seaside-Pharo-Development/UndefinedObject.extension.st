Extension { #name : 'UndefinedObject' }

{ #category : '*Seaside-Pharo-Development' }
UndefinedObject >> traverseWithMemory: aMemory seen: anIdentitySet [
	"nil is global, ignore counting it"
	anIdentitySet add: self
]
