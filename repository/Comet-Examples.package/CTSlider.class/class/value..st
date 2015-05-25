accessing
value: aNumber
	value := aNumber.
	self pusher javascript: [ :script |
		script << (script jQuery: #slider) slider
			action: 'value'
			arguments: (Array with: value) ]