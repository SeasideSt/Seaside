"
abstract class for all the elements that have a step, min and max attribute
"
Class {
	#name : #WAClosedRangeTag,
	#superclass : #WASteppedTag,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #attributes }
WAClosedRangeTag >> max: anInteger [
	self attributeAt: 'max' put: anInteger
]

{ #category : #attributes }
WAClosedRangeTag >> min: anInteger [
	self attributeAt: 'min' put: anInteger
]
