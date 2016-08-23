tests
testStyle
		self
			assert: [ :html |
				html style: 'body{font-size:12px;}' ]
			gives: '<title></title><style>body{font-size:12px;}</style>'