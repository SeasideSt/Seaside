convenience
redirectAfter: seconds to: aString 
	self responseHeaderName: 'refresh'.
	self content: seconds greaseString , ';URL=' , aString