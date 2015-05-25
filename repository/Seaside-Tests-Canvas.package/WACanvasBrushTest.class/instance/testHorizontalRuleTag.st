tests-tags
testHorizontalRuleTag
	self
		assert: [ :html | html horizontalRule ]
		gives: '<hr/>'