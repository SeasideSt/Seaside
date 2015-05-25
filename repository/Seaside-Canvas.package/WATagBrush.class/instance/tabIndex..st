attributes-keyboard
tabIndex: aString
	"This attribute specifies the position of the current element in the tabbing order for the current document. This value must be a number between 0 and 32767.

	The tabbing order defines the order in which elements will receive focus when navigated by the user via the keyboard. The tabbing order may include elements nested within other elements.

	The following elements support the tabindex attribute: A, AREA, BUTTON, INPUT, OBJECT, SELECT, and TEXTAREA."

	self attributes at: 'tabindex' put: aString