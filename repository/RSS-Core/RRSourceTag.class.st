Class {
	#name : 'RRSourceTag',
	#superclass : 'WATagBrush',
	#category : 'RSS-Core-Tags',
	#package : 'RSS-Core',
	#tag : 'Tags'
}

{ #category : 'accessing' }
RRSourceTag >> tag [
	^ 'source'
]

{ #category : 'attributes' }
RRSourceTag >> url: aString [
	self attributeAt: 'url' put: aString
]
