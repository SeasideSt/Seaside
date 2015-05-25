tests
testEvents
	self
		assert: (self request onCreate: 1)
		equals: 'new Ajax.Request("http://www.seaside.st/",{"parameters":["_s=1","_k=a","1"].join("&"),"onCreate":function(){1}})'.
	self
		assert: (self request onComplete: 2)
		equals: 'new Ajax.Request("http://www.seaside.st/",{"parameters":["_s=1","_k=a","1"].join("&"),"onComplete":function(){2}})'.
	self
		assert: (self request onException: 3)
		equals: 'new Ajax.Request("http://www.seaside.st/",{"parameters":["_s=1","_k=a","1"].join("&"),"onException":function(){3}})'.
	self
		assert: (self request onFailure: 4)
		equals: 'new Ajax.Request("http://www.seaside.st/",{"parameters":["_s=1","_k=a","1"].join("&"),"onFailure":function(){4}})'.
	self
		assert: (self request onInteractive: 5)
		equals: 'new Ajax.Request("http://www.seaside.st/",{"parameters":["_s=1","_k=a","1"].join("&"),"onInteractive":function(){5}})'.
	self
		assert: (self request onLoaded: 6)
		equals: 'new Ajax.Request("http://www.seaside.st/",{"parameters":["_s=1","_k=a","1"].join("&"),"onLoaded":function(){6}})'.
	self
		assert: (self request onLoading: 7)
		equals: 'new Ajax.Request("http://www.seaside.st/",{"parameters":["_s=1","_k=a","1"].join("&"),"onLoading":function(){7}})'.
	self
		assert: (self request onSuccess: 8)
		equals: 'new Ajax.Request("http://www.seaside.st/",{"parameters":["_s=1","_k=a","1"].join("&"),"onSuccess":function(){8}})'.
	self
		assert: (self request onUninitialized: 9)
		equals: 'new Ajax.Request("http://www.seaside.st/",{"parameters":["_s=1","_k=a","1"].join("&"),"onUninitialized":function(){9}})'.
	self
		assert: (self request onStatus: 202 do: 10)
		equals: 'new Ajax.Request("http://www.seaside.st/",{"parameters":["_s=1","_k=a","1"].join("&"),"on202":function(){10}})'