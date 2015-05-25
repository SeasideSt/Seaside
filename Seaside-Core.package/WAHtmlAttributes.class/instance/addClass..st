convenience
addClass: aString
	"Add an additional CSS class aString to the receiver."

	self at: 'class' append: aString separator: ' '