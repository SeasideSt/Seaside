triggers
triggerForm: aString
	"Serialize a complete from and trigger all its associated callbacks. Note that the callbacks of submit buttons are ignored to preserve consistency, use the normal callback to trigger specific code evaluation."

	self addParameter: (PTForm new
		id: aString;
		serialize)