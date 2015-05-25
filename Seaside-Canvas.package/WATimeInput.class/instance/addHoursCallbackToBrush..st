private callbacks
addHoursCallbackToBrush: aBrush
	self hasCallback
		ifFalse: [ ^ self ].
	aBrush callback: [ :v | self hours: v ]