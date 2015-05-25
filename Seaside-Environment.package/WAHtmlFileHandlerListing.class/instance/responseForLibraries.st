responding
responseForLibraries
	| title contents |
	title := 'Index of ', handler url pathStringUnencoded.
	contents := WAHtmlCanvas builder
		fullDocument: true;
		rootBlock: [ :html | html title: title ];
		render: [ :html |
			html heading: title.
			html unorderedList: [
				handler libraries do: [ :each |
					html listItem: [
						html anchor
							url: (each urlOf: '');
							with: each name ] ] ] ].
	context respond: [ :response |
		response
			contentType: WAMimeType textHtml;
			nextPutAll: contents ]