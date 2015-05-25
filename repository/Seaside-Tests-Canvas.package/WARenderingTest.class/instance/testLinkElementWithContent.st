tests
testLinkElementWithContent
	self
		assert: [ :html |
			html stylesheet
				add: 'div > em { color: blue; }'  ]
		gives: '<title></title><style type="text/css">div > em { color: blue; }</style>'.
	self
		assert: [ :html |
			html stylesheet
				add: 'E[foo$="bar"]'  ]
		gives: '<title></title><style type="text/css">E[foo$="bar"]</style>'
	