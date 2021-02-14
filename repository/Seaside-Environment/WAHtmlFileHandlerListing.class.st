"
I am a helper class to provide the web based listing of file libraries and included files.
"
Class {
	#name : #WAHtmlFileHandlerListing,
	#superclass : #WAFileHandlerListing,
	#category : 'Seaside-Environment'
}

{ #category : #responding }
WAHtmlFileHandlerListing >> responseForLibraries [
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
]

{ #category : #responding }
WAHtmlFileHandlerListing >> responseForLibrary: aLibrary [
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
]
