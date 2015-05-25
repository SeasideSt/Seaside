tests
testComplete
	self
		assert: (self effect hide; blind; onComplete: (self javascript alert: 'Done'))
		equals: self function , '("div").hide("blind",{},null,function(){alert("Done")})'.
	self
		assert: (self effect show; blind; normal; onComplete: (self javascript alert: 'Done'))
		equals: self function , '("div").show("blind",{},"normal",function(){alert("Done")})'
