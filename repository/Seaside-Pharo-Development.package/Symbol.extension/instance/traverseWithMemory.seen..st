*Seaside-Pharo-Development
traverseWithMemory: aMemory seen: anIdentitySet
	"symbol are in the global table, ignore counting them"
	anIdentitySet add: self