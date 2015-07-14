parsing
parseAuthority: aString from: start to: end
	| atIndex hostStart |
	atIndex := aString indexOf: $@ startingAt: start.
	(atIndex > 0 and: [ atIndex < end ])
		ifTrue: [
			self parseUserPassword: aString from: start to: atIndex.
			hostStart := atIndex + 1 ]
		ifFalse: [
			hostStart := start ].
		
	self parseHostPort: aString from: hostStart to: end