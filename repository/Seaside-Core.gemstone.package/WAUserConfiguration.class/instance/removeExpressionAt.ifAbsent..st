values
removeExpressionAt: aSymbol ifAbsent: aBlock
	self clearSearchContexts.
	^ expressions removeKey: aSymbol ifAbsent: aBlock