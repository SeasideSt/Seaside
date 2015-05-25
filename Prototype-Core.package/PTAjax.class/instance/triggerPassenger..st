triggers
triggerPassenger: aBlock
	aBlock fixCallbackTemps.
	self
		callback: [ :value | aBlock value: (self renderContext callbacks passengerAt: value) ]
		value: (JSStream on: 'arguments[0].id')