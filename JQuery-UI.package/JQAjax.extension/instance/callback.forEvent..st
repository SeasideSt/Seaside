*jquery-ui-private
callback: aBlock forEvent: anArraySpec
	self 
		callback: [ :value | aBlock value: (self smalltalkForEvent: anArraySpec value: value) ]
		value: (self javascriptForEvent: anArraySpec)