testing
canSelect: aNode
	^ self selectBlock notNil and: [ self canSelectBlock isNil or: [ self canSelectBlock value: aNode ] ]