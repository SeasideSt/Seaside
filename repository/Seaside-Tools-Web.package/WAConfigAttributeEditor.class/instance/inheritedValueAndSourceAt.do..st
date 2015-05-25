private
inheritedValueAndSourceAt: aSymbol do: aBlock
	self configuration ancestorsDo: [ :each |
		each expressionAt: aSymbol ifPresent: [ :exp |
			^ aBlock
				value: (each at: aSymbol)
				value: each ] ]