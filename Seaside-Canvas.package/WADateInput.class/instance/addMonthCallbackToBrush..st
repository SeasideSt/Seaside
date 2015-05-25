private callbacks
addMonthCallbackToBrush: aBrush
	self hasCallback
		ifFalse: [ ^ self ].
	aBrush callback: [ :v | self month: v ]