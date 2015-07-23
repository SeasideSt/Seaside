tests
testFullDocumentWithBlock
	| actual |
	actual := WAHtmlCanvas builder fullDocument: true;
		rootBlock: [ :root |
			root title: 'title'.
			root stylesheet add: 'body{font-size:12px;}'.
			root javascript add: 'alert("loaded")' ];
		render: [ :html |
			html unorderedList: [
				html listItem: 'an item' ] ].
	self assert: actual =  '<html><head><title>title</title><style type="text/css">body{font-size:12px;}</style><script type="text/javascript">alert("loaded")</script></head><body onload="onLoad()"><ul><li>an item</li></ul><script type="text/javascript">function onLoad(){};</script></body></html>'