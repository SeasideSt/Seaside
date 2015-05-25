tests-tags
testBreakTag
	self
		assert: [ :html | html break ]
		gives: '<br/>'