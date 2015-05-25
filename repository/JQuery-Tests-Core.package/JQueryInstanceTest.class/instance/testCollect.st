tests-filtering
testCollect
	self
		assert: ((self jQuery: 'div') collect: [ :each | each parent ])
		equals: self function , '("div").map(function(){return ' , self function , '(this).parent()})'.
	self
		assert: ((self jQuery: 'div') collect: [ :each :index | each parents eq: index ])
		equals: self function , '("div").map(function(){return ' , self function , '(this).parents().eq(arguments[0])})'