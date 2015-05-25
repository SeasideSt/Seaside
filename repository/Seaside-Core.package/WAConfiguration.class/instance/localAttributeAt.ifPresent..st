attributes
localAttributeAt: aSymbol ifPresent: aBlock
	| value |
	value := self localAttributeAt: aSymbol ifAbsent: [ ^ nil ].
	^ aBlock value: value