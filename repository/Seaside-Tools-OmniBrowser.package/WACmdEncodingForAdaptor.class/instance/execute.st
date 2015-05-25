execution
execute
	| codec |
	codec := OBChoiceRequest
		prompt: 'Select encoding'
		labels: (self codecs 
			collect: [ :each | each name ]) 
		values: self codecs.
	codec isNil
		ifTrue: [ ^ self ].
	target adaptor codec: codec.
	requestor browser signalRefresh