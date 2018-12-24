testing
testEvent
	self
		assert: [ :html |
				html
					anchor
					onClick: 'console.log("clicked")';
					with: 'click' ]
		gives: '<html><head><title></title></head><body onload="onLoad()"><a onclick="console.log(&quot;clicked&quot;)">click</a><script type="text/javascript">function onLoad(){};</script></body></html>'