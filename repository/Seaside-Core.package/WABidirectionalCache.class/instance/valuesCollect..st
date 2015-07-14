public
valuesCollect: aBlock
	| result |
	result := self species new.
	self keysAndValuesDo: [ :key :value |
		result at: key put: (aBlock value: value) ].
	^ result