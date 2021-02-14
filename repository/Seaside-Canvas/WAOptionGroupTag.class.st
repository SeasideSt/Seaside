"
The OPTGROUP element allows authors to group choices logically. This is particularly helpful when the user must choose from a long list of options; groups of related choices are easier to grasp and remember than a single long list of options.

It has crappy browser support and noone as ever used it. See WAInputTest >> #renderOptionGroupOn: for examples.
"
Class {
	#name : #WAOptionGroupTag,
	#superclass : #WATagBrush,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #initialization }
WAOptionGroupTag >> initialize [
	super initialize.
	self label: ''
]

{ #category : #attributes }
WAOptionGroupTag >> label: aString [
	"This attribute specifies the label for the option group."

	self attributes at: 'label' put: aString
]

{ #category : #accessing }
WAOptionGroupTag >> tag [
	^ 'optgroup'
]
