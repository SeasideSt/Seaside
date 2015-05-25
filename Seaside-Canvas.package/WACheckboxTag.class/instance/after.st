private
after
	super after.
	callback isNil ifTrue: [ ^ self ].
	canvas hiddenInput 
		callback: [
			callback value: value.
			value := false ]