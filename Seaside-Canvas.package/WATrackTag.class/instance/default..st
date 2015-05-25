attributes
default: aBoolean
	"The default attribute, if specified, indicates that the track is to be enabled if the user's preferences do not indicate that another track would be more appropriate. There must not be more than one track element with the same parent node with the default attribute specified."
	self attributeAt: 'default' put: aBoolean