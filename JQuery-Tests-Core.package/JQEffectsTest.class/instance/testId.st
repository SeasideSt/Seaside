tests
testId
	self 
		assert: (self target animate width: 100; queue: false; id: 'foo')
		equals: self function , '("#foo").animate({"width":100},{"queue":false})'