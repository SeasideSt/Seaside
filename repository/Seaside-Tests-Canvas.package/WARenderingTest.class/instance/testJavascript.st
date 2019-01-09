tests
testJavascript
	self
		assertRoot: [ :html |
			html javascript
				add: 'true & false'  ]
		gives: '<title></title><script type="text/javascript">true & false</script>'