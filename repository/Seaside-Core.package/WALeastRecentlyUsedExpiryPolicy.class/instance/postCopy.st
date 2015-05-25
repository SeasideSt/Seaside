copying
postCopy
	super postCopy.
	ageTable := ageTable copy.
	ageTable keysAndValuesDo: [ :eachKey :eachValue | 
		ageTable at: eachKey put: (Array with: eachValue first) ]