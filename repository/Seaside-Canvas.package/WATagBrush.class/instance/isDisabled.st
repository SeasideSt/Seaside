attributes
isDisabled
	"answers whether the receiver is disabled"

	^ self attributes at: 'disabled' ifAbsent: [ false ]