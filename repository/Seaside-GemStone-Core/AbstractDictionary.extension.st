Extension { #name : #AbstractDictionary }

{ #category : #'*Seaside-GemStone-Core' }
AbstractDictionary >> restoreFromSnapshot: aDictionary [
	self keys do: [ :key | self removeKey: key ].
	aDictionary keysAndValuesDo: [ :key :value | self at: key put: value ]
]

{ #category : #'*Seaside-GemStone-Core' }
AbstractDictionary >> snapshotCopy [
	| n |
	n := self class new: self tableSize.
	self keysAndValuesDo: [:k :v | n at: k put: v].
	^n
]

{ #category : #'*Seaside-GemStone-Core' }
AbstractDictionary >> valuesCollect: aBlock [
	| result |
	result := self species new: self size.
	self keysAndValuesDo: [ :key :value |
		result at: key put: (aBlock value: value) ].
	^ result
]
