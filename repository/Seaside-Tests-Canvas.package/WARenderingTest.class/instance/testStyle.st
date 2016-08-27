tests
testStyle
		self
			assertRoot: [ :html |
				html style: 'body{font-size:12px;}' ]
			gives: '<title></title><style>body{font-size:12px;}</style>'