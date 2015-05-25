private
addCallback
	self hasCallback ifFalse: [
		canvas flush.
		^ self ].
	canvas hiddenInput
		callback: [ callbackBlock value: self setValueWithNewDate ];
		 with: nil