protocol
isExpired: anObject key: aString
	^ (ageTable at: aString) first > self maximumAge