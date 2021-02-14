"
The details element represents additional information or controls which the user can obtain on demand.

The first element child of a details element, if it is a legend element, represents the summary of the details.

If the first element is not a legend element, the UA should provide its own legend (e.g. ""Details""). 
"
Class {
	#name : #WADetailsTag,
	#superclass : #WATagBrush,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #attributes }
WADetailsTag >> open: aBoolean [
	"The open  content attribute is a boolean attribute. If present, it indicates that the details should be shown to the user. If the attribute is absent, the details should not be shown.

	If the attribute is removed, then the details should be hidden. If the attribute is added, the details should be shown."
	self attributeAt: 'open' put: aBoolean
]

{ #category : #accessing }
WADetailsTag >> tag [
	^ 'details'
]
