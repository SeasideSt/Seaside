initialization
initializeFromString: aString
	| string index |
	self initialize.
	string := aString.
	index := string indexOf: $#.
	index > 0 ifTrue: [
		self parseFragment: (string copyFrom: index + 1 to: string size).
		string := string copyFrom: 1 to: index - 1 ].
	index := string indexOf: $?.
	index > 0 ifTrue: [
		self parseQuery: (string copyFrom: index + 1 to: string size).
		string := string copyFrom: 1 to: index - 1 ].
	index := string indexOfSubCollection: '://'.
	index > 0 ifTrue: [ 
		self scheme: (string copyFrom: 1 to: index - 1).
		string := string copyFrom: index + 3 to: string size.
		index := string indexOf: $/.
		string := index > 0
			ifFalse: [ 
				self parseAuthority: string.
				'' ]
			ifTrue: [
				self parseAuthority: (string copyFrom: 1 to: index - 1).
				string copyFrom: index + 1 to: string size ] ].
	self parsePath: string