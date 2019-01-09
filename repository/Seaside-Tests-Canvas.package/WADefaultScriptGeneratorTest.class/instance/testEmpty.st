testing
testEmpty
	self
		assert: [ :html | ]
		gives: '<html><head><title></title></head><body onload="onLoad()"><script type="text/javascript">function onLoad(){};</script></body></html>'