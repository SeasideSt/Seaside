tests
testMorph
	self
		assert: (self effect style: 'color: #f00;'; morph)
		equals: 'new Effect.Morph(this,{"style":"color: #f00;"})'.
	self
		assert: (self effect id: 'foo'; style: 'color: #f00;'; morph)
		equals: 'new Effect.Morph("foo",{"style":"color: #f00;"})'