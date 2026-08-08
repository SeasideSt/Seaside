*Seaside-Squeak-Development
traverseWithMemory: aMemory seen: anIdentitySet
	"booleans are singletons, ignore counting them"
	anIdentitySet add: self