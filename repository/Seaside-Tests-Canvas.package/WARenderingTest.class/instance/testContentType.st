tests
testContentType
	self
		assertRoot: [ :html |
			html meta contentType: 'application/xhtml+xml' seasideMimeType  ]
		gives: '<title></title><meta http-equiv="Content-Type" content="application/xhtml+xml"/>'.
	self
		assertRoot: [ :html |
			html meta contentType: 'application/xhtml+xml'  ]
		gives: '<title></title><meta http-equiv="Content-Type" content="application/xhtml+xml"/>'