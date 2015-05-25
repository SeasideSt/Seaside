attributes
open: aBoolean
	"The open  content attribute is a boolean attribute. If present, it indicates that the details should be shown to the user. If the attribute is absent, the details should not be shown.

	If the attribute is removed, then the details should be hidden. If the attribute is added, the details should be shown."
	self attributeAt: 'open' put: aBoolean