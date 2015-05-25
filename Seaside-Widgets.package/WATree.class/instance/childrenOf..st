accessing-nodes
childrenOf: aNode
	| children |
	children := self childrenBlock value: aNode.
	^ children ifNil: [ Array new ]