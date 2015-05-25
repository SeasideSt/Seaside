instance creation
items: aCollection link: linkSelector text: textSelector
	^ self new
		items: aCollection;
		linkSelector: linkSelector;
		textSelector: textSelector;
		yourself