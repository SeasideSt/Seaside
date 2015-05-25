private
attributes: anAttributes
	anAttributes ifNil: [ ^ self ].
	anAttributes keysAndValuesDo: [ :key :value |
		self attribute: key with: value ]