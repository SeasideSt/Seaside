attributes
type: aString
	"The type  attribute indicates the kind of command: either a normal command with an associated action, or a state or option that can be toggled, or a selection of one item from a list of items.

The attribute's value must be either 'command', 'checkbox', or 'radio', denoting each of these three types of commands respectively. The attribute may also be omitted if the element is to represent the first of these types, a simple command. "
	self attributeAt: 'type' put: aString