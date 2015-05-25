tests
testJavascript
	self
		assert: [ :html |
			html javascript
				add: 'true & false'  ]
		gives: '<title></title><script type="text/javascript">true & false</script>'