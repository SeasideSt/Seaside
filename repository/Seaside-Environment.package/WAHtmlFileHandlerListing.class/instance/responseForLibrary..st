responding
responseForLibrary: aLibrary
	| title contents |
	title := 'Index of ', aLibrary name.
	contents := WAHtmlCanvas builder
		fullDocument: true;
		rootBlock: [ :html | html title: title ];
		render: [ :html |
			html heading level: 1; with: title.
			html table: [
				html tableRow: [
					html tableHeading: 'Name'.
					html tableHeading: 'Size'.
					html tableHeading: 'Description' ].
				aLibrary fileSelectors do: [ :each |
					html tableRow: [
						html tableData: [
							html anchor
								url: (aLibrary urlOf: each);
								with: (aLibrary asFilename: each) ].
						html tableData: (aLibrary fileSizeOf: each).
						html tableData: (aLibrary mimetypeOf: each) ] ] ] ].
	context respond: [ :response |
		response
			contentType: WAMimeType textHtml;
			nextPutAll: contents ]