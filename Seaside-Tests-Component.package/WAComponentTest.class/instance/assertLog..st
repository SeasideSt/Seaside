private
assertLog: anArray
	self
		assert: log asArray = anArray
		description: 'Expected ' , anArray printString , ', but got ' , log asArray printString.
	log := OrderedCollection new