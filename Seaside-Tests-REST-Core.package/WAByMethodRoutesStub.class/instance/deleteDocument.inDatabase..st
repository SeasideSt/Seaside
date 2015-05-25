stubs
deleteDocument: aFirstString inDatabase: aSecondString
	selector := #deleteDocument:inDatabase:.
	arguments := Array with: aFirstString with: aSecondString