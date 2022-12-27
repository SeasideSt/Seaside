*Seaside-Pharo-Development
traverseWithMemory: aMemory seen: anIdentitySet
	"methods are stored in classes, ignore counting them"
	anIdentitySet add: self