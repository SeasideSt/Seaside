file addition
addFileNamed: aFilename contents: aByteArrayOrString
	| selector |
	selector := self asSelector: aFilename.
	(self isBinary: aFilename)
		ifTrue: [ self compileBinary: aByteArrayOrString selector: selector ]
		ifFalse: [ self compileText: aByteArrayOrString selector: selector ]