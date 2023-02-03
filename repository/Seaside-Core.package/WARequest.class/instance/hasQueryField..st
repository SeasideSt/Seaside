testing
hasQueryField: aString

	^ (self queryFields includesKey: aString) or: [ 
		  self postFields includesKey: aString ]