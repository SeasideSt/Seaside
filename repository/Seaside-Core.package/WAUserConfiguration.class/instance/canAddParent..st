ancestry
canAddParent: aConfiguration 
	^ (aConfiguration = self or: [ aConfiguration inheritsFrom: self ]) not