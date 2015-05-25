generating
generateFor: aPair
	(self includesSelector: aPair first) ifFalse: [
		self 
			compile: aPair first, '
	self with: ''', aPair last, ''''
			classified: self generatedCategory ]