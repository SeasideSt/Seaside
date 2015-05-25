events-generated
onBeforeLoad: anObject
	"Triggered when a remote tab is about to be loaded, after the beforeActivate event. Can be canceled to prevent the tab panel from loading content; though the panel will still be activated. This event is triggered just before the Ajax request is made, so modifications can be made to ui.jqXHR and ui.ajaxSettings."

	self optionAt: 'beforeload' put: anObject asFunction