convenience
addStyle: aString
	"Add an additional CSS style definition aString to the receiver."

	self at: 'style' append: aString separator: ';'