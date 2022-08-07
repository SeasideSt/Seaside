tests
testFormatString
	
	| stringToTest exporter formattedString |
	stringToTest := 's\o"me ', String lf, String tab, ' string'.
	exporter := WAGetTextExporter new.
	formattedString := exporter formatString: stringToTest.
	self assert:  's\\o\"me \r\t string' equals: formattedString.
	^ formattedString.