tests
testAddToScript
	self 
		assert: [ :html | html script: self mock ]
		renders: '<script type="text/javascript">/*<![CDATA[*/mock/*]]>*/</script>'