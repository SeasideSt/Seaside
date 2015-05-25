tests
testFullDocument
	| actual |
	actual := WAHtmlCanvas builder fullDocument: true; render: [ :html |
		html unorderedList: [
			html listItem: 'an item' ] ].
	self assert: actual = '<html><head><title></title></head><body onload="onLoad()"><ul><li>an item</li></ul><script type="text/javascript">/*<![CDATA[*/function onLoad(){};/*]]>*/</script></body></html>'