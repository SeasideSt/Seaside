private
isFileSelector: aSymbol
	| isContentMethod |
	
	isContentMethod := aSymbol endsWithSubCollection: #Content.
	^ isContentMethod not  and:  [ super isFileSelector: aSymbol ]