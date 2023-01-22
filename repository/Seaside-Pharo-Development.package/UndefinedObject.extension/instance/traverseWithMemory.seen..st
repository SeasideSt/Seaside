*Seaside-Pharo-Development
traverseWithMemory: aMemory seen: anIdentitySet
	"nil is global, ignore counting it"
	anIdentitySet add: self