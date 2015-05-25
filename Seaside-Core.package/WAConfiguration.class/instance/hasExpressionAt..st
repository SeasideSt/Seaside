values
hasExpressionAt: aSymbol
	self expressionAt: aSymbol ifAbsent: [ ^ false ].
	^ true