events-generated
onResize: anObject
	"This event is triggered when the dialog is resized. [http://www.jsfiddle.net/Jp7TM/18/ demo]"

	self optionAt: 'resize' put: anObject asFunction