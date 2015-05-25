events-generated
onFocus: anObject
	"This event is triggered when the dialog gains focus."

	self optionAt: 'focus' put: anObject asFunction