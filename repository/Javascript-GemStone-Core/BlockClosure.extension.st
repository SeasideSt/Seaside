Extension { #name : 'BlockClosure' }

{ #category : '*Javascript-GemStone-Core' }
BlockClosure >> javascriptOn: aRenderer [

	self numArgs = 0
		ifTrue: [ self value ]
		ifFalse: [ self value: aRenderer ]
]
