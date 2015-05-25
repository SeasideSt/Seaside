instance creation
renderBlock: aBlock title: aString
	^ self new
		title: aString;
		valueBlock: aBlock;
		yourself