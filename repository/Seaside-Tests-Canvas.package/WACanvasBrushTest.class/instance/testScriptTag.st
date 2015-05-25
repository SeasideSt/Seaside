tests-tags
testScriptTag
	self
		assert: [ :html | html script: 'alert("<foo>")' ]
		gives: '<script type="text/javascript">/*<![CDATA[*/alert("<foo>")/*]]>*/</script>'.
	self
		assert: [ :html | html script: 'true & false' ]
		gives: '<script type="text/javascript">/*<![CDATA[*/true & false/*]]>*/</script>'.
	self
		assert: [ :html | html script defer; with: 'alert("<foo>")' ]
		gives: '<script defer="defer" type="text/javascript">/*<![CDATA[*/alert("<foo>")/*]]>*/</script>'