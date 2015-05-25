tests-comparing
testEqual
	url host: 'seaside.st'; addField: 'foo' value: 'bar'. 
	self assert: url = url.
	self deny: url = WAUrl new.
	self deny: url = url printString.
	self deny: url = (url withoutQuery).
	self deny: url = (url withField: 'zork').
	self deny: url = (url withField: 'zork' value: 'zonk')