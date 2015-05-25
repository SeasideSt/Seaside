accessing
renderContext
	^ WARenderContext new
		actionUrl: (WAUrl absolute: 'http://www.seaside.st/?_s=1&_k=a');
		document: (WAHtmlDocument 
			on: (WriteStream on: String new)
			codec: self requestContext codec);
		yourself