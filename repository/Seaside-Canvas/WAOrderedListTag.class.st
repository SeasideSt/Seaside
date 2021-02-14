"
See superclass comment.
"
Class {
	#name : #WAOrderedListTag,
	#superclass : #WAListTag,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #attributes }
WAOrderedListTag >> reversed: aBoolean [
	"The reversed attribute is a boolean attribute. If present, it indicates that the list is a descending list (..., 3, 2, 1). If the attribute is omitted, the list is an ascending list (1, 2, 3, ...)."
	self attributes at: 'reversed' put: aBoolean
]

{ #category : #attributes }
WAOrderedListTag >> start: anInteger [
	"The start attribute, if present, must be a valid integer giving the ordinal value of the first list item.

If the start attribute is present, user agents must parse it as an integer, in order to determine the attribute's value. The default value, used if the attribute is missing or if the value cannot be converted to a number according to the referenced algorithm, is 1 if the element has no reversed attribute, and is the number of child li elements otherwise.

The first item in the list has the ordinal value given by the ol element's start attribute, unless that li element has a value attribute with a value that can be successfully parsed, in which case it has the ordinal value given by that value attribute.

Each subsequent item in the list has the ordinal value given by its value attribute, if it has one, or, if it doesn't, the ordinal value of the previous item, plus one if the reversed is absent, or minus one if it is present.
"
	self attributes at: 'start' put: anInteger
]

{ #category : #accessing }
WAOrderedListTag >> tag [
	^ 'ol'
]

{ #category : #attributes }
WAOrderedListTag >> type: aString [
	"The type attribute can be used to specify the kind of marker to use in the list, in the cases where that matters (e.g. because items are to be referened by their number/letter). The attribute, if specified, must have a value that is a case-sensitive match for one of the characters given in the first cell of one of the rows of the following table. The type attribute represents the state given in the cell in the second column of the row whose first cell matches the attribute's value; if none of the cells match, or if the attribute is omitted, then the attribute represents the decimal state.
Keyword 	State 	Description 	Examples for values 1-3 and 3999-4001
1 (U+0031) 	decimal 	Decimal numbers 	1. 	2. 	3. 	... 	3999. 	4000. 	4001. 	...
a (U+0061) 	lower-alpha 	Lowercase latin alphabet 	a. 	b. 	c. 	... 	ewu. 	ewv. 	eww. 	...
A (U+0041) 	upper-alpha 	Uppercase latin alphabet 	A. 	B. 	C. 	... 	EWU. 	EWV. 	EWW. 	...
i (U+0069) 	lower-roman 	Lowercase roman numerals 	i. 	ii. 	iii. 	... 	mmmcmxcix. 	iv. 	ivi. 	...
I (U+0049) 	upper-roman 	Uppercase roman numerals 	I. 	II. 	III. 	... 	MMMCMXCIX. 	IV. 	IVI. 	...

User agents should render the items of the list in a manner consistent with the state of the type attribute of the ol element. Numbers less than or equal to zero should always use the decimal system regardless of the type attribute."
	self attributes at: 'type' put: aString
]
