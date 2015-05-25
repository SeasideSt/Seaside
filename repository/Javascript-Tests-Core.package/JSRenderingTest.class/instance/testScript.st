tests
testScript
	self 
		assert: [ :html | html div script: self mock ]
		renders: '<div></div><script type="text/javascript">/*<![CDATA[*/mock;/*]]>*/</script>'