events-generated
onSelect: anObject
	"Triggered when an item is selected from the menu; ui.item refers to the selected item. The default action of select is to replace the text field's value with the value of the selected item. Canceling this event prevents the value from being updated, but does not prevent the menu from closing."

	self optionAt: 'select' put: anObject asFunction