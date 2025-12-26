accessing
argumentsDo: aBlock
	aBlock value: self url.
	self options
		at: 'data'
		ifPresent: [ :data | aBlock value: data ].
	self options
		at: 'success'
		ifPresent: [ :success | aBlock value: success ].
	self options
		at: 'dataType'
		ifPresent: [ :dataType | aBlock value: dataType ]