parsing
parseValue
	stream atEnd ifFalse: [ 
		| char |
		self whitespace.
		char := stream peek.
		char = ${
			ifTrue: [ ^ self parseObject ].
		char = $[
			ifTrue: [ ^ self parseArray ].
		char = $"
			ifTrue: [ ^ self parseString ].
		(char = $- or: [ char between: $0 and: $9 ])
			ifTrue: [ ^ self parseNumber ].
		(char = $t)
			ifTrue: [ self match: 'true' ifTrue: [ ^self createTrue ] ].
		(char = $f)
			ifTrue: [ self match: 'false' ifTrue: [ ^self createFalse ] ].
		(char = $n)
			ifTrue: [ self match: 'null' ifTrue: [ ^self createNull ] ] ].
	self error: 'invalid input'