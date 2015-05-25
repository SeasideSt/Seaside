events-generated
onChange: anObject
	"Triggered when the field is blurred, if the value has changed; ui.item refers to the selected item."

	self optionAt: 'change' put: anObject asFunction