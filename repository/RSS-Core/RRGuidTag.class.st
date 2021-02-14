Class {
	#name : #RRGuidTag,
	#superclass : #WATagBrush,
	#category : 'RSS-Core-Tags'
}

{ #category : #attributes }
RRGuidTag >> beNoPermaLink [
	self isPermaLink: false
]

{ #category : #attributes }
RRGuidTag >> bePermaLink [
	self isPermaLink: true
]

{ #category : #attributes }
RRGuidTag >> isPermaLink: aBoolean [ 
	"the value really must be a string else seaside makes
	isPermaLink='isPermaLink'"
	self 
		attributeAt: 'isPermaLink'
		put: aBoolean greaseString
]

{ #category : #accessing }
RRGuidTag >> tag [
	^ 'guid'
]
