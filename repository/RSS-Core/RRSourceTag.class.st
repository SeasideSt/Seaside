Class {
	#name : #RRSourceTag,
	#superclass : #WATagBrush,
	#category : 'RSS-Core-Tags'
}

{ #category : #accessing }
RRSourceTag >> tag [
	^ 'source'
]

{ #category : #attributes }
RRSourceTag >> url: aString [
	self attributeAt: 'url' put: aString
]
