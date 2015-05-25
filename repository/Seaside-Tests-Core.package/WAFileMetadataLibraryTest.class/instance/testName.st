tests
testName
	"Issue 620: 	WAFileLibrary>>name answers a Symbol, but used in places where String should be used
	http://code.google.com/p/seaside/issues/detail?id=620
	
	Issue 186: 	WAFileLibrary>>deployFiles fail if folder already exists
	http://code.google.com/p/glassdb/issues/detail?id=186
	
	Avoid having a Symbol because otherwise deploying the files on GemStone fails because equality checks with exsiting files always anser false."
	| library |
	library := WATestingMetadataFileLibrary default.
	self assert: library name = 'WATestingMetadataFileLibrary'.
	self assert: library name isString.
	self deny: library name isSymbol