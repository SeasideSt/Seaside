tests-observers
testFormObserver
	self 
		assert: self formObserver
		equals: 'new Form.Observer(this,1,function(){})'.
	self 
		assert: (self formObserver 
			id: 'foo';
			frequency: 2;
			function: (JSFunction context: self renderContext) refresh)
		equals: 'new Form.Observer("foo",2,function(element,value){window.location="http://www.seaside.st/?_s=1&_k=a"})'