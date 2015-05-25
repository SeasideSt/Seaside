instance creation
root: anObject path: anArray
	^ (self root: anObject)
		expandAll: anArray;
		selected: anArray last;
		yourself