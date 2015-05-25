tests-custom
testCustomArray
	printer := [ :renderer | renderer render: #('aString1' ('aString2' 'aString3')) ].
	self assert: self equals: '["aString1", ["aString2", "aString3"]]'