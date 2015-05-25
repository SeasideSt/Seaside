tests-rendering
testRenderedHtmlWithScripts
	self
		assert: [ :html |
			html div script: (html scriptaculous element remove).
			html div script: (html scriptaculous element update: [ :r | r span ]) ]
		renders: '<div id="id1"></div><div id="id2"></div><script type="text/javascript">/*<![CDATA[*/$("id1").remove();$("id2").update("<span></span>");/*]]>*/</script>'