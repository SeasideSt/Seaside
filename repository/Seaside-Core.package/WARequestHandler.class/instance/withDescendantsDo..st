parent/child
withDescendantsDo: aBlock
	"Evaluate aBlock for this request handler and recursively for each of
	its child handlers."
	
	aBlock value: self.
	self childrenDo: [ :each | each withDescendantsDo: aBlock ]