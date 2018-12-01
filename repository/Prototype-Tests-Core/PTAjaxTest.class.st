Class {
	#name : #PTAjaxTest,
	#superclass : #JSObjectTest,
	#category : 'Prototype-Tests-Core'
}

{ #category : #accessing }
PTAjaxTest >> request [
	^ PTRequest context: self renderContext
]

{ #category : #accessing }
PTAjaxTest >> responders [
	^ PTResponders context: self renderContext
]

{ #category : #tests }
PTAjaxTest >> testEvents [
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
]

{ #category : #tests }
PTAjaxTest >> testOptions [
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
]

{ #category : #tests }
PTAjaxTest >> testResponders [
	self
		assert: (self responders)
		equals: 'Ajax.Responders.register({})'.
	self
		assert: (self responders register)
		equals: 'Ajax.Responders.register({})'.
	self
		assert: (self responders unregister)
		equals: 'Ajax.Responders.unregister({})'.
	self
		assert: (self responders onCreate: 1)
		equals: 'Ajax.Responders.register({"onCreate":function(){1}})'.
	self
		assert: (self responders onComplete: 2)
		equals: 'Ajax.Responders.register({"onComplete":function(){2}})'
]
