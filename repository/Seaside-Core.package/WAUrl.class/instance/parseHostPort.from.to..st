parsing
parseHostPort: aString from: start to: end
	| colonIndex |
	colonIndex := aString indexOf: $: startingAt: start.
	(colonIndex > 0 and: [ colonIndex < end ])
		ifTrue: [
			start < colonIndex ifTrue: [
				"don't set host when empty"
				self host: (self class decodePercent: aString from: start to: colonIndex) ].
			self port: (self parsePort: aString from: colonIndex + 1 to: end) ]
		ifFalse: [
			start < end ifTrue: [
				"don't set host when empty"
				self host: (self class decodePercent: aString from: start to: end) ] ]