events-generated
beforeActivate: anObject
	"Triggered directly before a panel is activated. Can be canceled to prevent the panel from activating. If the accordion is currently collapsed, ui.oldHeader and ui.oldPanel will be empty jQuery objects. If the accordion is collapsing, ui.newHeader and ui.newPanel will be empty jQuery objects."

	self optionAt: 'beforeActivate' put: anObject asFunction