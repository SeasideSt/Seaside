events-generated
onCreate: anObject
	"Triggered when the tabs are created. If the tabs are collapsed, ui.tab and ui.panel will be empty jQuery objects."

	self optionAt: 'create' put: anObject asFunction