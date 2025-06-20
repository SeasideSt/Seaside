*Seaside-HotwireTurbo-Core
turboSubmitsWith: aString
	"Specifies text to display when submitting a form. Can be used on input or button elements.
	While the form is submitting the text of the element will show the value of data-turbo-submits-with. 
	After the submission, the original text will be restored. 
	Useful for giving user feedback by showing a message like “Saving…” while an operation is in progress."

	self dataAttributeAt: 'turbo-submits-with' put: aString