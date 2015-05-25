private
createDocumentRoot
	^ RRRssRoot new
		charSet: self requestContext charSet;
		yourself