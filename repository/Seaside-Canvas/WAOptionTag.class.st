"
The option element defines an option in a drop-down list. 
"
Class {
	#name : #WAOptionTag,
	#superclass : #WATagBrush,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #callbacks }
WAOptionTag >> callback: aBlock [
	self value: (self storeCallback: (WAValueCallback on: aBlock))
]

{ #category : #attributes }
WAOptionTag >> label: aString [
	"This attribute allows authors to specify a shorter label for an option than the content of the OPTION element. When specified, user agents should use the value of this attribute rather than the content of the OPTION element as the option label."

	self attributes at: 'label' put: aString
]

{ #category : #attributes }
WAOptionTag >> selected: aBoolean [
	self attributes at: 'selected' put: aBoolean
]

{ #category : #accessing }
WAOptionTag >> tag [
	^ 'option'
]

{ #category : #attributes }
WAOptionTag >> value: aString [
	self attributes at: 'value' put: aString
]

{ #category : #attributes }
WAOptionTag >> value: anObject with: aListTag [
	self selected: (aListTag isSelected: anObject).
	self value: (aListTag valueFor: anObject)
	
]
