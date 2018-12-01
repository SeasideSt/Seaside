Class {
	#name : #RREnclosureTag,
	#superclass : #WATagBrush,
	#category : 'RSS-Core-Tags'
}

{ #category : #attributes }
RREnclosureTag >> length: anInteger [
	self attributeAt: 'length' put: anInteger
]

{ #category : #accessing }
RREnclosureTag >> tag [
	^ 'enclosure'
]

{ #category : #attributes }
RREnclosureTag >> type: aString [
	self attributeAt: 'type' put: aString
]

{ #category : #attributes }
RREnclosureTag >> url: aString [
	self attributeAt: 'url' put: aString
]
