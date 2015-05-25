values
expressionAt: aSymbol ifPresent: aBlock
	| expression |
	expression := self expressionAt: aSymbol ifAbsent: [ ^ nil ].
	^ aBlock value: expression