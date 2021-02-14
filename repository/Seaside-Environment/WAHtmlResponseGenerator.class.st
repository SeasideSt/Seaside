"
This subclass overrides certain generation methods to create prettier HTML responses, instead of plain text.
"
Class {
	#name : #WAHtmlResponseGenerator,
	#superclass : #WAResponseGenerator,
	#category : 'Seaside-Environment'
}

{ #category : #generation }
WAHtmlResponseGenerator >> forbidden [
	self ifResetPossible: [
		self response
			forbidden;
			contentType: WAMimeType textHtml ].
	self response
		nextPutAll: (WAHtmlCanvas builder
			fullDocument: true;
			rootBlock: [ :root | root title: 'Forbidden' ];
			render: [ :html |
				html heading: [
					html text: 'Error: you are forbidden to access "'.
					html render: self request url.
					html text: '"' ] ])
]

{ #category : #generation }
WAHtmlResponseGenerator >> notFound [
	self ifResetPossible: [
		self response
			notFound;
			contentType: WAMimeType textHtml ].
	self response
		nextPutAll: (WAHtmlCanvas builder
			fullDocument: true;
			rootBlock: [ :root | root title: 'Not Found' ];
			render: [ :html |
				html heading: [
					html text: 'Error: "'.
					html render: self request url.
					html text: '" not found' ] ])
]

{ #category : #generation }
WAHtmlResponseGenerator >> pageExpired [
	self ifResetPossible: [
		self response
			doNotCache;
			contentType: WAMimeType textHtml ].
	self response
		nextPutAll: (WAHtmlCanvas builder
			fullDocument: true;
			rootBlock: [ :root | root title: 'Page Expired' ];
			render: [ :html | 
				html heading: 'Page Expired'.
				html paragraph: 'This page has expired. Please use the back-button to navigate to the last valid page.' ])
]

{ #category : #generation }
WAHtmlResponseGenerator >> refreshAfter: aNumber location: aUrlOrString message: aString [
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
]
