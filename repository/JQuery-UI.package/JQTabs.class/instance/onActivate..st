events-generated
onActivate: anObject
	"Triggered after a tab has been activated (after animation completes). If the tabs were previously collapsed, ui.oldTab and ui.oldPanel will be empty jQuery objects. If the tabs are collapsing, ui.newTab and ui.newPanel will be empty jQuery objects."

	self optionAt: 'activate' put: anObject asFunction