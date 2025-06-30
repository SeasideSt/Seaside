handling
handleFiltered: aRequestContext

	aRequestContext response
		contentType: (WAMimeType main: 'image' sub: 'x-icon');
		binary;
		nextPutAll: WAToolFiles basicNew faviconIco