tests-custom
testCustomCollection
	printer := [ :renderer | renderer render: (GRSmallOrderedSet withAll: #('aString2' 'aString3')) ].
	self assert: self gives: '["aString2", "aString3"]'