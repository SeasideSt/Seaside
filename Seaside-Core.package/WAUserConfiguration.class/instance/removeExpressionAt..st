values
removeExpressionAt: aSymbol
	^ self removeExpressionAt: aSymbol ifAbsent: [ nil ]