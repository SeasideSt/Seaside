as yet unclassified
newBoundary
	^ String
		streamContents: [ :s | 
			s nextPutAll: 'SeasideEmail'.
			s nextPutAll: (10000 to: 999999) atRandom greaseString ]