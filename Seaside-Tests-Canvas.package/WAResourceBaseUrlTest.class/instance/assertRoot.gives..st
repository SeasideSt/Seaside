private
assertRoot: aBlock gives: aString
	| html |
	html := self builder
		fullDocument: true;
		rootBlock: aBlock;
		render: [ :canvas | ].
	self assert: html = ('<html><head><title></title>', aString, '</head><body onload="onLoad()"><script type="text/javascript">/*<![CDATA[*/function onLoad(){};/*]]>*/</script></body></html>')