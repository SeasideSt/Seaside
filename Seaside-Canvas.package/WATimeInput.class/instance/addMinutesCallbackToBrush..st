private callbacks
addMinutesCallbackToBrush: aBrush
	self hasCallback
		ifFalse: [ ^ self ].
	aBrush callback: [ :v | self minutes: v ]