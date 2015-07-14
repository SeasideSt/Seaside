removing
removeKey: aKey ifAbsent: aBlock
	| value |
	value := byKey at: aKey ifAbsent: [ ^ aBlock value ].
	byKey removeKey: aKey.
	byValue removeKey: value.
	^ value