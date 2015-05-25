options-generated
buttons: aDictionary
	"Specifies which buttons should be displayed on the dialog. The property key is the text of the button. The value is the callback function for when the button is clicked. The context of the callback is the dialog element; if you need access to the button, it is available as the target of the event object."

	self optionAt: 'buttons' put: aDictionary