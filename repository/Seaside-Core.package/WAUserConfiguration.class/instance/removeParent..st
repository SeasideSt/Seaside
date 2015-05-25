ancestry
removeParent: aConfiguration 
	self clearSearchContexts.
	parents 
		remove: aConfiguration
		ifAbsent: [ ]