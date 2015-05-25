accessing
authorName
	^ authorName ifNil: [ authorName := 'FirstnameLastname' ]