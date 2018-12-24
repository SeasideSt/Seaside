testing
testLoadScript
	self
		assert: [ :html | html document addLoadScript: (WAStubJsObject on: 'console.log("loaded")') ]
		gives: '<html><head><title></title></head><body onload="onLoad()"><script type="text/javascript">function onLoad(){console.log("loaded");};</script></body></html>'