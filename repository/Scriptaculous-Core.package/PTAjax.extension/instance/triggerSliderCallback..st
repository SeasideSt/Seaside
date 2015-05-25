*scriptaculous-core-triggers
triggerSliderCallback: aBlock
	aBlock fixCallbackTemps.
	self
		callback: [ :value | aBlock value: value asNumber ]
		value: (JSStream argument: 0)