tests-encoding
testQueryString
	self assert: url queryString = ''.

	url addField: 'foo'.
	self assert: url queryString = 'foo'.
	url addField: 'foo' value: 'bar'.
	self assert: url queryString = 'foo&foo=bar'.
	url addField: 'foo#' value: 'bar#'.
	self assert: url queryString = 'foo&foo=bar&foo%23=bar%23'