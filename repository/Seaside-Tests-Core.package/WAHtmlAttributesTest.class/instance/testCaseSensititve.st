tests-fixtures
testCaseSensititve
	self
		assert: [ :attr | attr at: 'lastBuildDate' put: 'Sat, 07 Sep 2002 09:42:31 GMT' ]
		gives: ' lastBuildDate="Sat, 07 Sep 2002 09:42:31 GMT"'