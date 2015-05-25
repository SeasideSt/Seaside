copying
copyEmpty
	"Create a copy with no values."
	
	^ self species new
		setExpiryPolicy: self expiryPolicy copy;
		setMissStrategy: self missStrategy copy;
		setRemovalAction: self removalAction copy;
		setReapingStrategy: self reapingStrategy copy;
		yourself