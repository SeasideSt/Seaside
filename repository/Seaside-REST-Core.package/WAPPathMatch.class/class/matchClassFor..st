private
matchClassFor: aString
	aString isEmpty ifTrue: [ ^ WAExactPathMatch  ].
	aString first = ${
		ifTrue: [
			| index |
			index := aString indexOf: $} startingAt: 2.
			index = aString size
				"{name}"
				ifTrue: [ ^ WAFullPlaceholderPathMatch ].
			index isZero
				"{name}suffix"
				ifFalse: [ ^ WASuffixPlaceholderPathMatch ] ].
	"prefix{name}"
	(aString last = $}
		and: [ (aString indexOf: ${) isZero not ])
			ifTrue: [ ^ WAPrefixPlaceholderPathMatch ].
	"[option1|option2]"
	(aString first = $[
		and: [ aString last = $]
		and: [ aString includes: $| ] ])
			ifTrue: [ ^ WAOrPathMatch ].
	"*name*"
	(aString first = $*
		and: [ aString last = $* ])
			ifTrue: [ ^ WAMultiPlaceholderPathMatch ].
	^ WAExactPathMatch