path item object
externalReference: aString
	"Allows for an external definition of this path item. The referenced structure MUST be in the format of a Path Item Object. If there are conflicts between the referenced definition and this Path Item's definition, the behavior is undefined."
	self key: '$ref' value: aString