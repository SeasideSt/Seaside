events-generated
onBeforeStop: anObject
	"This event is triggered when sorting stops, but when the placeholder/helper is still available."

	self optionAt: 'beforeStop' put: anObject asFunction