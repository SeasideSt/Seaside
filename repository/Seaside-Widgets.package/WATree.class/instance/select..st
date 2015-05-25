actions
select: aNode 
	(self canSelect: aNode) ifFalse: [ ^ self ].
	self selected: aNode.
	self selectBlock isNil ifFalse: [ self selectBlock value: aNode ]