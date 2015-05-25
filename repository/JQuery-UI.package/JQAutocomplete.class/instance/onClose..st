events-generated
onClose: anObject
	"When the list is hidden - doesn't have to occur together with a change."

	self optionAt: 'close' put: anObject asFunction