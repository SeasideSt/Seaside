accessing
arguments
	| arguments |
	arguments := OrderedCollection with: self url.
	self options
		at: 'data'
		ifPresent: [ :value | arguments add: value ].
	self options
		at: 'success'
		ifPresent: [ :value | arguments add: value ].
	self options
		at: 'dataType'
		ifPresent: [ :value | arguments add: value ].
	^ arguments