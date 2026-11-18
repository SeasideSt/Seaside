tests
testUtilityCallbacks
	self
		assert: (self jQuery each: #(1 2 3) do: self mock)
		equals: self function , '.each([1,2,3],function(){mock})'.
	self
		assert: (self jQuery grep: #(1 2 3) select: self mock)
		equals: self function , '.grep([1,2,3],function(){mock})'.
	self
		assert: (self jQuery map: #(1 2 3) transform: self mock)
		equals: self function , '.map([1,2,3],function(){mock})'