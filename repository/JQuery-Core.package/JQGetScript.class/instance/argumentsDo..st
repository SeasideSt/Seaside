accessing
argumentsDo: aBlock
	aBlock value: self javascriptUrl.
	self options
		at: 'success'
		ifPresent: [ :success | aBlock value: success ]