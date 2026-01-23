tests
testStringEscaping
	self assert: '''' equals: '"''"'.
	self assert: '"' equals: '"\""'.
	self assert: '\' equals: '"\\"'.
	self assert: '<' equals: '"<"'.
	self assert: '<script></script>' equals: '"\x3Cscript>\x3C/script>"'.
	self assert: '<!--' equals: '"\x3C!--"'.