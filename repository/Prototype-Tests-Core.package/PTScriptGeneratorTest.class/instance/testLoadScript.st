testing
testLoadScript
	self
		assert: [ :html | html document addLoadScript: (JSStream on: 'console.log("loaded")') ]
		gives: '<html><head><title></title></head><body><script type="text/javascript">document.observe("dom:loaded", function() {console.log("loaded");});</script></body></html>'