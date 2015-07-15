private
convertMultipartFileField: part  
	| file |
	(file := WAFile new)
		fileName: part fileName;
		contentType: part contentType printString;
		contents: part contents.
	^ file