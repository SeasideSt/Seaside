testing-parsing
testParseWithSlash
	"regression test for https://github.com/SeasideSt/Seaside/issues/424"
	| urlsWithSlash |
	urlsWithSlash := #(
		'http://seaside.st/foo/'
		'http://seaside.st/foo/?key=value'
		'http://seaside.st/foo/#x'
		'http://seaside.st/foo/?key=value#x'
	).
	urlsWithSlash do: [ :each |
		 url := WAUrl absolute: each.
		self assert: url slash.
		self assert: url greaseString = each ]