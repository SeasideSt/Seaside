testing
testEvent
	self
		assert: [ :html |
				html
					anchor
					onClick: 'console.log("clicked")';
					with: 'click' ]
		gives: '<a onclick="console.log(&quot;clicked&quot;)">click</a>'