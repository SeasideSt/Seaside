tests
testComparison
	"Note that the major and minor numbers MUST be treated as separate
   integers and that each MAY be incremented higher than a single digit.
   Thus, HTTP/2.4 is a lower version than HTTP/2.13, which in turn is
   lower than HTTP/12.3. Leading zeros MUST be ignored by recipients and
   MUST NOT be sent."

	| v10 v11 v24 v213 v123 |
	v10 := WAHttpVersion major: 1 minor: 0.
	v11 := WAHttpVersion major: 1 minor: 1.
	v24 := WAHttpVersion major: 2 minor: 4.
	v213 := WAHttpVersion major: 2 minor: 13.
	v123 := WAHttpVersion major: 12 minor: 3.
	
	self assert: v10 < v11.
	self assert: v10 <= v11.
	self deny: v10 > v11.
	self deny: v10 >= v11.
	self assert: v11 > v10.
	self assert: v11 >= v10.
	self deny: v11 < v10.
	self deny: v11 <= v10.
	
	self assert: v24 < v213.
	self assert: v24 <= v213.
	self deny: v24 > v213.
	self deny: v24 >= v213.
	self assert: v213 > v24.
	self assert: v213 >= v24.
	self deny: v213 < v24.
	self deny: v213 <= v24.
		
	self assert: v213 < v123.
	self assert: v213 <= v123.
	self deny: v213 > v123.
	self deny: v213 >= v123.
	self assert: v123 > v213.
	self assert: v123 >= v213.
	self deny: v123 < v213.
	self deny: v123 <= v213.
	
	self assert: v24 < v123.
	self assert: v24 <= v123.
	self deny: v24 > v123.
	self deny: v24 >= v123.
	self assert: v123 > v24.
	self assert: v123 >= v24.
	self deny: v123 < v24.
	self deny: v123 <= v24