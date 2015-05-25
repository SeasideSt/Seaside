running
setUp
	super setUp.
	log := OrderedCollection new.
	root := WAComponentStub new.
	decoration1 := WADecorationStub new.
	decoration2 := WADecorationStub new.
	child1 := WAComponentStub new.
	child2 := WAComponentStub new.
	child3 := WAComponentStub new.
	child4 := WAComponentStub new