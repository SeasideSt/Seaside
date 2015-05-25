convenience-headers
inlineWithFileName: aString 
	aString notNil ifTrue: [
		self 
			headerAt: 'Content-Disposition'
			put: 'inline; filename="' , aString greaseString , '"' ]