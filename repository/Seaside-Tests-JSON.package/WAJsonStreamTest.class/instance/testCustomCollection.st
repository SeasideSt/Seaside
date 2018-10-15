tests-custom
testCustomCollection
	printer := [ :renderer | renderer render: (GRSmallOrderedSet withAll: #('aString2' 'aString3')) ].
	self assert: self equals: '["aString2", "aString3"]'