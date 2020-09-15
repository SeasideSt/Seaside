*Scriptaculous-Core
triggerSliderCallback: aBlock
	self
		callback: [ :value | aBlock value: value asNumber ]
		value: (JSStream argument: 0)