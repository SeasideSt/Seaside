testing
testLoadScript
	self
		assert: [ :html | html document addLoadScript: (WAStubJsObject on: 'console.log("loaded")') ]
		gives: '<script type="text/javascript">(function(){console.log("loaded");})();</script>'