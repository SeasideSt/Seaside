events-generated
onCreate: anObject
	"Triggered when the accordion is created. If the accordion is collapsed, ui.header and ui.panel will be empty jQuery objects"

	self optionAt: 'create' put: anObject asFunction