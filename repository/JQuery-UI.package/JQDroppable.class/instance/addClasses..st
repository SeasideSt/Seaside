options-generated
addClasses: aBoolean
	"If set to false, will prevent the ui-droppable class from being added. This may be desired as a performance optimization when calling .droppable() init on many hundreds of elements."

	self optionAt: 'addClasses' put: aBoolean