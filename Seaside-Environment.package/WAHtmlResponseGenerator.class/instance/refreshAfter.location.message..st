generation
refreshAfter: aNumber location: aUrlOrString message: aString
	self ifResetPossible: [
	self response
		contentType: WAMimeType textHtml;
		refreshAfter: aNumber
			location: aUrlOrString ].
	self response
		nextPutAll: (WAHtmlCanvas builder
				fullDocument: true;
				render: [ :html | 
					html heading: aString.
					html paragraph: [
						html text: 'You are being redirected to '.
						html anchor
							url: aUrlOrString;
							with: aUrlOrString greaseString ] ])