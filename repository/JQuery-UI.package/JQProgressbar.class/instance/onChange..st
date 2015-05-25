events-generated
onChange: anObject
	"This event is triggered when the value of the progressbar changes."

	self optionAt: 'change' put: anObject asFunction