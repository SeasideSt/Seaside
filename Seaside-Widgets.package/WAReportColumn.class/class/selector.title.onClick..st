instance creation
selector: aSymbol title: aString onClick: aBlock
	^ self new
		title: aString;
		selector: aSymbol;
		clickBlock: aBlock;
		yourself