testing
testEvent
	self
		assert: [ :html |
				html
					anchor
					onClick: 'console.log("clicked")';
					with: 'click' ]
		gives: '<html><head><title></title></head><body><a onclick="console.log(&quot;clicked&quot;)">click</a></body></html>'