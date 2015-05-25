generating-tags
generateBinaryFor: aCollection
	(aCollection size = 4 and: [ (self includesSelector: aCollection third) not ]) ifTrue: [
		self 
			compile: aCollection third, ' aBlock
	self ', aCollection second, ' with: aBlock'
			classified: aCollection fourth ]