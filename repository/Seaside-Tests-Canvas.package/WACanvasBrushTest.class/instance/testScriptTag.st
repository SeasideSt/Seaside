tests-tags
testScriptTag
	self
		assert: [ :html | html script: 'alert("<foo>")' ]
		gives: '<script type="text/javascript">alert("<foo>")</script>'.
	self
		assert: [ :html | html script: 'true & false' ]
		gives: '<script type="text/javascript">true & false</script>'.
	self
		assert: [ :html | html script defer; with: 'alert("<foo>")' ]
		gives: '<script defer type="text/javascript">alert("<foo>")</script>'