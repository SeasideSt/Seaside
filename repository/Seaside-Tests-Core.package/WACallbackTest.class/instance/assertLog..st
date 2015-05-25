utilities
assertLog: aCollection
	self
		assert: log asArray = aCollection asArray
		description: 'Expected ' , aCollection asArray printString , ', but got ' , log asArray printString.
	log := OrderedCollection new