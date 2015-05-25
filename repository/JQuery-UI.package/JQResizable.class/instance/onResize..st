events-generated
onResize: anObject
	"This event is triggered during the resize, on the drag of the resize handler."

	self optionAt: 'resize' put: anObject asFunction