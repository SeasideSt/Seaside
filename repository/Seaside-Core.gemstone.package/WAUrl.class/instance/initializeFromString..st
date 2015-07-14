initialization
initializeFromString: aString
	| fragmentIndex queryIndex schemeIndex pathStart stringSize pathEnd authorityStart authorityEnd startWithPath |
	self initialize.
	stringSize := aString size.
	fragmentIndex := aString indexOf: $#.
	fragmentIndex > 0 ifTrue: [
		self
			parseFragment: aString
			from: fragmentIndex + 1 ].
	queryIndex := aString indexOf: $?.
	(queryIndex > 0 and: [ fragmentIndex = 0 or: [ queryIndex < fragmentIndex ] ]) ifTrue: [
		self
			parseQuery: aString 
			from: queryIndex + 1
			to: (fragmentIndex = 0 ifTrue: [ stringSize + 1 ] ifFalse: [ fragmentIndex ]) ].
	schemeIndex := aString indexOfSubCollection: '://'.
	
	(schemeIndex > 0 and: [ fragmentIndex = 0 or: [ schemeIndex < fragmentIndex ] ])
		ifTrue: [
			startWithPath := false.
			self scheme: (aString copyFrom: 1 to: schemeIndex - 1).
			pathStart := aString indexOf: $/ startingAt: schemeIndex + 3.
			authorityStart := schemeIndex + 3 ]
		ifFalse: [
			startWithPath := true.
			pathStart := aString indexOf: $/ startingAt: 1.
			authorityStart := 0 ].
	
	pathStart > 0
		ifTrue: [
			(pathStart > fragmentIndex and: [ fragmentIndex > 0 ]) ifTrue: [
				WAInvalidUrlSyntaxError signal: aString ].
			(pathStart > queryIndex and: [ queryIndex > 0 ]) ifTrue: [
				WAInvalidUrlSyntaxError signal: aString ].
			authorityEnd := pathStart ]
		ifFalse: [
			(fragmentIndex > 0 or: [ queryIndex > 0 ]) ifTrue: [
				WAInvalidUrlSyntaxError signal: aString ].
			authorityEnd := stringSize + 1 ].
	
	authorityStart > 0 ifTrue: [
		self parseAuthority: aString from: authorityStart to: authorityEnd ].
	
	pathEnd := stringSize + 1.
	fragmentIndex > 0 ifTrue: [
		pathEnd := fragmentIndex ].
	(queryIndex > 0 and: [ fragmentIndex = 0 or: [ queryIndex < fragmentIndex ] ]) ifTrue: [
		pathEnd := queryIndex ].
	
	startWithPath
		ifTrue: [
			(stringSize > 0 and: [ (aString at: 1) = $/ ])
				ifTrue: [ self parsePath: aString absolute: true from: 2 to: pathEnd ]
				ifFalse: [ self parsePath: aString absolute: false from: 1 to: pathEnd ] ]
		ifFalse: [
			pathStart > 0 ifTrue: [
				self parsePath: aString absolute: true from: pathStart + 1 to: pathEnd ] ]