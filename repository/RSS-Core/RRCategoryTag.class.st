Class {
	#name : #RRCategoryTag,
	#superclass : #WATagBrush,
	#category : 'RSS-Core-Tags'
}

{ #category : #attributes }
RRCategoryTag >> category: aString [
	self attributeAt: 'category' put: aString
]

{ #category : #accessing }
RRCategoryTag >> tag [
	^ 'category'
]
