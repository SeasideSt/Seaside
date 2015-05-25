tests
testLinkElementWithContent
	self
		assert: [ :html |
			html stylesheet
				add: 'div > em { color: blue; }'  ]
		gives: '<title></title><style type="text/css">/*<![CDATA[*/div > em { color: blue; }/*]]>*/</style>'.
	self
		assert: [ :html |
			html stylesheet
				add: 'E[foo$="bar"]'  ]
		gives: '<title></title><style type="text/css">/*<![CDATA[*/E[foo$="bar"]/*]]>*/</style>'
	