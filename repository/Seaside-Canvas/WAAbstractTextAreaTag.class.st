"
An abstract class to describe the HTML elements that allow the user to enter text.
"
Class {
	#name : #WAAbstractTextAreaTag,
	#superclass : #WAFormInputTag,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #private }
WAAbstractTextAreaTag >> allValuesCallbackClass [
	^ WAAllValuesCallback
]

{ #category : #private }
WAAbstractTextAreaTag >> beMultiple [
	"The multiple attribute is a boolean attribute that indicates whether the user is to be allowed to specify more than one value."
	self attributeAt: 'multiple' put: true
]

{ #category : #callbacks }
WAAbstractTextAreaTag >> callback: aBlock [
	self name: (self storeCallback: (WAValueCallback on: aBlock)).
	self value: self value
]

{ #category : #attributes }
WAAbstractTextAreaTag >> listId: aString [
	"aString is the id of a datalist"
	self attributeAt: 'list' put: aString
]

{ #category : #callbacks }
WAAbstractTextAreaTag >> multipleValuesCallback: aBlock [
	self beMultiple.
	self name: (self storeCallback: (self allValuesCallbackClass on: aBlock)).
	self value: self value
]

{ #category : #attributes }
WAAbstractTextAreaTag >> pattern: aString [
	"no known browser support
	
	For the text, password, email, and url types of the input element, and for the textarea element, the pattern attribute specifies a pattern that the control value must match. 

When specified, the pattern attribute contains a regular expression that the control's value must match before the form may be submitted.

	The regular expression language used for this attribute is the same as that defined in [ECMA262], except that the pattern attribute must match the entire value, not just any subset (somewhat as if it implied a ^(?: at the start of the pattern and a )$ at the end). The pattern must be compiled with the global, ignoreCase, and multiline flags disabled (see ECMA262, sections 15.10.7.2 through 15.10.7.4). If the attribute is omitted then the control has no pattern restriction.
	
	The / character is not special in the pattern attribute. The two attributes pattern='/etc/.+' and pattern='\/etc\/.+' are therefore equivalent. 

	In the case of the email and url types, the pattern attribute specifies a pattern that must be matched in addition to the value matching the generic pattern relevant for the control."
	self attributeAt: 'pattern' put: aString
]

{ #category : #attributes }
WAAbstractTextAreaTag >> placeholder: aString [
	"The placeholder  attribute represents a short hint (a word or short phrase) intended to aid the user with data entry. A hint could be a sample value or a brief description of the expected format. The attribute, if specified, must have a value that contains no U+000A LINE FEED (LF) or U+000D CARRIAGE RETURN (CR) characters."
	self attributeAt: 'placeholder' put: aString
]
