convenience-headers
attachmentWithFileName: aString 
	aString notNil ifTrue:  [
		self 
			headerAt: 'Content-Disposition'
			put: 'attachment; filename="' , aString greaseString , '"' ]