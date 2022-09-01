*Seaside-Pharo-Development
traverseWithMemory: aMemory seen: anIdentitySet
	"we only have two instance variables:
	- sender which we ignore because will always get niled out when the stack unwound so won't be captured but this will not have happened yet for contexts involved in the current request
	- pc with is a SmallInteger and therefore immediate"
	aMemory accumulate: self.
	anIdentitySet add: self