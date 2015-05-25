tests-insertion
testInsertionWith
	self
		assert: (self insertion id: 'foo'; top: 'bar')
		equals: 'new Insertion.Top("foo","bar")'.
	self
		assert: (self insertion bottom: 'bar')
		equals: 'new Insertion.Bottom(this,"bar")'.
	self
		assert: (self insertion id: 'foo'; before: 'bar')
		equals: 'new Insertion.Before("foo","bar")'.
	self
		assert: (self insertion after: 'bar')
		equals: 'new Insertion.After(this,"bar")'