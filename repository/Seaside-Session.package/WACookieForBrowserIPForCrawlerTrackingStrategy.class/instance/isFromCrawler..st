private
isFromCrawler: aRequestContext
	| userAgent |
	userAgent := aRequestContext request userAgent.
	^ userAgent notNil and: [ self crawlerSubStrings anySatisfy: [ :each |
			(userAgent indexOfSubCollection: each) > 0 ] ]