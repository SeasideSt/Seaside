tests
testHash
	| oneOneZero oneDotOne |
	oneOneZero := WAHttpVersion http10.
	oneDotOne := WAHttpVersion http11.
	
	self deny: oneDotOne hash = oneOneZero hash