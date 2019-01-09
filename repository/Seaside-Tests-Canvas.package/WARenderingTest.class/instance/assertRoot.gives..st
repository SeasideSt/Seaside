private
assertRoot: aBlock gives: aString
	| html |
	html := WAHtmlCanvas builder
		fullDocument: true;
		rootBlock: aBlock;
		render: [ :canvas | ].
	self assert: '<html><head>' , aString , '</head><body onload="onLoad()"><script type="text/javascript">function onLoad(){};</script></body></html>' = html