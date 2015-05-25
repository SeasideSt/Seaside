printing
javascriptContentOn: aStream
	aStream nextPutAll: 'function('.
	self arguments do: [ :each | aStream nextPutAll: each ] separatedBy: [ aStream nextPut: $, ].
	aStream nextPutAll: '){'.
	statements isEmpty ifFalse:
			[ statements allButLast do:
					[ :each | 
					aStream
						javascript: each;
						nextPut: $; ].
			self return ifTrue: [ aStream nextPutAll: 'return ' ].
			aStream javascript: statements last ].
	aStream nextPut: $}