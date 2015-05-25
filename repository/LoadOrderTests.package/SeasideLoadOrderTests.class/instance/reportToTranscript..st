load and test
reportToTranscript: aString

	| list flag |
	list := aString subStrings: (Array with: $().
	list := list collect: [:each | each withBlanksTrimmed].
	list := list reject: [:each | each isEmpty].
	list := list reject: [:each | 
		16 < each size and: [ (each copyFrom: each size - 14 to: each size) = ' is Undeclared)'].
	].
	list isEmpty ifTrue: [^self].
	flag := true.
	1 to: list size - 1 by: 2 do: [:i | 
		flag := flag and: [(list at: i) = 'a MCClassDefinition'].
	].
	flag ifTrue: [^self].
	Transcript nextPutAll: aString.
	