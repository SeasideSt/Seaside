tests
testQueryFields
	url queryFields 
		at: '1'
		put: nil.
	self assert: url greaseString = '/?1'.
	url queryFields 
		at: '2'
		put: 'foo'.
	self assert: url greaseString = '/?1&2=foo'.
	url queryFields 
		at: '3'
		put: 123.
	self assert: url greaseString = '/?1&2=foo&3=123'.
	url queryFields 
		at: '4'
		put: 'foo bar&zork'.
	self assert: url greaseString = '/?1&2=foo&3=123&4=foo%20bar%26zork'.
	url queryFields 
		at: '1'
		add: 'dupe'.
	self assert: url greaseString = '/?1&2=foo&3=123&4=foo%20bar%26zork&1=dupe'