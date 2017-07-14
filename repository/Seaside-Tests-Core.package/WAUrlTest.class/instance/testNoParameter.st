testing-parsing
testNoParameter
	"https://github.com/SeasideSt/Seaside/issues/909"
	| string |
	string := '/Buchhaltung?_s=F4N82ZReQEV2M1cP&_k=spf8TDq4kzHfrPCi&48&searchText=kas'.
	url := WAUrl absolute: string.
	self assert: (url queryFields includesKey: '48').
	self assert: (url queryFields at: '48') isNil.
	self assert: url greaseString equals: string