testing
testEvent
	self
		assert: [ :html |
				html
					anchor
					onClick: 'console.log("clicked")';
					with: 'click' ]
		gives: '<html><head><title></title></head><body><a id="id1">click</a><script type="text/javascript">document.observe("dom:loaded", function() {$("id1").observe("click",function(event){console.log("clicked")});});</script></body></html>'