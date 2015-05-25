tests
testOptions
	self
		assert: (self request asynchronous: false)
		equals: 'new Ajax.Request("http://www.seaside.st/",{"parameters":["_s=1","_k=a","1"].join("&"),"asynchronous":false})'.
	self
		assert: (self request contentType: 'text/xml')
		equals: 'new Ajax.Request("http://www.seaside.st/",{"parameters":["_s=1","_k=a","1"].join("&"),"contentType":"text/xml"})'.
	self
		assert: (self request encoding: 'iso-8660')
		equals: 'new Ajax.Request("http://www.seaside.st/",{"parameters":["_s=1","_k=a","1"].join("&"),"encoding":"iso-8660"})'.
	self
		assert: (self request method: 'get')
		equals: 'new Ajax.Request("http://www.seaside.st/",{"parameters":["_s=1","_k=a","1"].join("&"),"method":"get"})'.
	self
		assert: (self request evalJs: false)
		equals: 'new Ajax.Request("http://www.seaside.st/",{"parameters":["_s=1","_k=a","1"].join("&"),"evalJS":false})'.
	self
		assert: (self request evalJson: false)
		equals: 'new Ajax.Request("http://www.seaside.st/",{"parameters":["_s=1","_k=a","1"].join("&"),"evalJSON":false})'.
	self
		assert: (self request sanitizeJson: true)
		equals: 'new Ajax.Request("http://www.seaside.st/",{"parameters":["_s=1","_k=a","1"].join("&"),"sanitizeJSON":true})'.
	self
		assert: (self request requestHeaders: Dictionary new)
		equals: 'new Ajax.Request("http://www.seaside.st/",{"parameters":["_s=1","_k=a","1"].join("&"),"requestHeaders":{}})'