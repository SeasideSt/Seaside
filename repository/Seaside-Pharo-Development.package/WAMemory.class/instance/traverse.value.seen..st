private
traverse: anObject value: aValue seen: anIdentitySet
	(aValue isNil or: [ aValue isLiteral or: [ aValue isBehavior or: [ (anIdentitySet includes: aValue) or: [ IgnoredClasses anySatisfy: [ :each | aValue isKindOf: each ] ] ] ] ])
		ifTrue: [ ^ self ].
	aValue traverseWithMemory: self seen: anIdentitySet