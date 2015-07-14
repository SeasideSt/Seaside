printing
encodeChildrenOn: aDocument
	self childrenDo: [ :each | each encodeOn: aDocument ]