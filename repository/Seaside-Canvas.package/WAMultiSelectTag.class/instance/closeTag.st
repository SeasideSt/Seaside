private
closeTag
	super closeTag.
	self hasCallback ifFalse: [ ^ self ].
	canvas hiddenInput
		callback: [ self triggerCallback ].
	canvas flush