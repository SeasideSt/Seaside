accessing
arguments
	| arguments |
	arguments := OrderedCollection with: self selectorUrl.
	self options
		at: 'data'
		ifPresent: [ :value | arguments add: value ].
	self options
		at: 'complete'
		ifPresent: [ :value | arguments add: value ].
	^ arguments