tests-parameters
testAddParameterValue
	self
		assert: (self ajax addParameter: 'foo' -> 12)
		equals: self function , '.ajax({"data":"foo="+encodeURIComponent(12)})'.
	self
		assert: (self ajax addParameter: 'foo' -> true)
		equals: self function , '.ajax({"data":"foo="+encodeURIComponent(true)})'.
	self
		assert: (self ajax addParameter: 'foo' -> self mock)
		equals: self function , '.ajax({"data":"foo="+encodeURIComponent(mock)})'