accessing
argumentsDo: aBlock
	aBlock value: self selectorUrl.
	self options
		at: 'data'
		ifPresent: [ :data | aBlock value: data ].
	self options
		at: 'complete'
		ifPresent: [ :complete | aBlock value: complete ]