Extension { #name : #WAExpirySession }

{ #category : #'*seaside-tests-gemstone-functional' }
WAExpirySession >> initializeFilters [
	super initializeFilters.
	self addFilter: WAHandleAbortWouldLoseDataToolFilter new
]
