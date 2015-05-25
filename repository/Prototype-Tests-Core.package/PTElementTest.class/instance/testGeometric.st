tests
testGeometric
	self
		assert: (self element absolutize)
		equals: '$(this).absolutize()'.
	self
		assert: (self element clonePosition: 'foo')
		equals: '$(this).clonePosition("foo")'.
	self
		assert: (self element cumulativeOffset)
		equals: '$(this).cumulativeOffset()'.
	self
		assert: (self element cumulativeScrollOffset)
		equals: '$(this).cumulativeScrollOffset()'.
	self
		assert: (self element dimensions)
		equals: '$(this).getDimensions()'.
	self
		assert: (self element height)
		equals: '$(this).getHeight()'.
	self
		assert: (self element makeClipping)
		equals: '$(this).makeClipping()'.
	self
		assert: (self element makePositioned)
		equals: '$(this).makePositioned()'.
	self
		assert: (self element offsetParent)
		equals: '$(this).getOffsetParent()'.
	self
		assert: (self element positionedOffset)
		equals: '$(this).positionedOffset()'.
	self
		assert: (self element relativize)
		equals: '$(this).relativize()'.
	self
		assert: (self element undoClipping)
		equals: '$(this).undoClipping()'.
	self
		assert: (self element undoPositioned)
		equals: '$(this).undoPositioned()'.
	self
		assert: (self element viewportOffset)
		equals: '$(this).viewportOffset()'.
	self
		assert: (self element width)
		equals: '$(this).getWidth()'