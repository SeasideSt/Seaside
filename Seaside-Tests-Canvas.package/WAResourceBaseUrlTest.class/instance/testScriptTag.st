tests-tags
testScriptTag
	self
		assert: [ :html | html script resourceUrl: 'track.js' ]
		gives: '<script src="',self resourceBaseUrl,'track.js" type="text/javascript">/*<![CDATA[*//*]]>*/</script>'