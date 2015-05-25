tests-events
testOnComplete
	self
		assert: (self jQuery ajax onComplete: (self javascript alert: 'loaded'))
		equals: self function , '.ajax({"complete":function(){alert("loaded")}})'.
	self
		assert: ((self jQuery: 'li') load onComplete: (self javascript alert: 'loaded'))
		equals: self function , '("li").load("/",function(){alert("loaded")})'