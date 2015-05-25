parent/child
childrenDo: aBlock
	self cache keysAndValuesDo: [ :key :value | aBlock value: value ]