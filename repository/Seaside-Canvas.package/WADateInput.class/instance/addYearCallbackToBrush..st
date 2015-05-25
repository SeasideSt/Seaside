private callbacks
addYearCallbackToBrush: aBrush
	self hasCallback
		ifFalse: [ ^ self ].
	aBrush callback: [ :v | self year: v ]