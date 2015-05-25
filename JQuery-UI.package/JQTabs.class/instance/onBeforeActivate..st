events-generated
onBeforeActivate: anObject
	"Triggered immediately before a tab is activated. Can be canceled to prevent the tab from activating. If the tabs are currently collapsed, ui.oldTab and ui.oldPanel will be empty jQuery objects. If the tabs are collapsing, ui.newTab and ui.newPanel will be empty jQuery objects."

	self optionAt: 'beforeActivate' put: anObject asFunction