generating-tags
generateBinaryFor: aCollection

	(aCollection size = 4 and: [ 
		 (self includesSelector: aCollection third) not ]) ifTrue: [ 
		GRPlatform current
			compile: aCollection third , ' aBlock
	self ' , aCollection second , ' with: aBlock'
			into: self
			classified: aCollection fourth ]