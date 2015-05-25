initialization
initialize
	super initialize.
	expanded := IdentitySet new.
	self selectBlock: [ :node | self answer: node ].
	self childrenBlock: [ :node | Array new ].
	self labelBlock: [ :node | node greaseString ]