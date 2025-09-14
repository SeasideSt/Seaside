actions
saveMethodWith: sourceCode

	| method |
	method := methodRetrievalBlock value.
	method methodClass compile: sourceCode withInternalLineEndings