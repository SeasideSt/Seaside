parsing
parseUserPassword: aString from: start to: end
	| colonIndex |
	colonIndex := aString indexOf: $: startingAt: start.
	(colonIndex > 0 and: [ colonIndex < end ])
		ifTrue: [
			self user: (self class decodePercent: aString from: start to: colonIndex).
			self password: (self class decodePercent: aString from: colonIndex + 1 to: end) ]
		ifFalse: [
			self user: (self class decodePercent: aString from: start to: end) ]