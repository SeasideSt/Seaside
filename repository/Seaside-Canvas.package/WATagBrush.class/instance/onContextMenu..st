attributes-events
onContextMenu: anObject
	"Fired at elements when the user requests their context menu."

	self document scriptGenerator
		event: 'contextmenu'
		do: anObject
		on: self