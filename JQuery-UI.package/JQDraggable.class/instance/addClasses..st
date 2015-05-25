options-generated
addClasses: aBoolean
	"If set to false, will prevent the ui-draggable class from being added. This may be desired as a performance optimization when calling .draggable() init on many hundreds of elements."

	self optionAt: 'addClasses' put: aBoolean