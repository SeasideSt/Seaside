attributes
start: anInteger
	"The start attribute, if present, must be a valid integer giving the ordinal value of the first list item.

If the start attribute is present, user agents must parse it as an integer, in order to determine the attribute's value. The default value, used if the attribute is missing or if the value cannot be converted to a number according to the referenced algorithm, is 1 if the element has no reversed attribute, and is the number of child li elements otherwise.

The first item in the list has the ordinal value given by the ol element's start attribute, unless that li element has a value attribute with a value that can be successfully parsed, in which case it has the ordinal value given by that value attribute.

Each subsequent item in the list has the ordinal value given by its value attribute, if it has one, or, if it doesn't, the ordinal value of the previous item, plus one if the reversed is absent, or minus one if it is present.
"
	self attributes at: 'start' put: anInteger