events-generated
onFocus: anObject
	"Before focus is moved to an item (not selecting), ui.item refers to the focused item. The default action of focus is to replace the text field's value with the value of the focused item, though only if the focus event was triggered by a keyboard interaction. Canceling this event prevents the value from being updated, but does not prevent the menu item from being focused."

	self optionAt: 'focus' put: anObject asFunction