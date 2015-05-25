private
setContentType: aResponse
	| contentType |
	contentType := WAMimeType applicationRssXml
		charset: self requestContext charSet;
		yourself.
	aResponse contentType: contentType