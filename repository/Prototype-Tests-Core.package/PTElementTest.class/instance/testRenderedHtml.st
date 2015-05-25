tests-rendering
testRenderedHtml
	self 
		assert: [ :html | html div script: (html scriptaculous element update: [ :r | r span ]) ]
		renders: '<div id="id1"></div><script type="text/javascript">/*<![CDATA[*/$("id1").update("<span></span>");/*]]>*/</script>'