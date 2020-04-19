private
testPath
	"answers 'tests/functional/WAUrlDecodingFunctionalTest'"
	| url path |
	url := self requestContext request url.
	"this method is also called in #runTest where the path is already added, we don't want this"
	path := url path first: (self application url path size + 1).
	^ String streamContents: [ :stream |
		path
			do: [ :each  | stream nextPutAll: each ]
			 separatedBy: [ stream nextPut: $/ ] ]