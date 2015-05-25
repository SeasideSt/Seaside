tests
testSpeed
	self
		assert: (self effect show; blind; speed: 2 seconds)
		equals: self function , '("div").show("blind",{},2000)'.
	self
		assert: (self effect show; blind; slow)
		equals: self function , '("div").show("blind",{},"slow")'.
	self
		assert: (self effect show; blind; normal)
		equals: self function , '("div").show("blind",{},"normal")'.
	self
		assert: (self effect show; blind; fast)
		equals: self function , '("div").show("blind",{},"fast")'