*Seaside-Squeak-Development
traverseWithMemory: aMemory seen: anIdentitySet
	"classes are in the global pool, ignore counting them"
	anIdentitySet add: self