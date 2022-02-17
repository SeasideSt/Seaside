generating
generateFor: aPair

	(self includesSelector: aPair first) ifFalse: [ 
		GRPlatform current
			compile: aPair first , '
	self with: ''' , aPair last , ''''
			into: self
			classified: self generatedCategory ]