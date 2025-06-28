accessing
saveMethodWith: sourceCode

	| method |
	method := block value.
	method methodClass compile: sourceCode withInternalLineEndings