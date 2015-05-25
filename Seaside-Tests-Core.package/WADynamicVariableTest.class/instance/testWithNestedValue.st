tests
testWithNestedValue
	WADynamicVariable 
		use: 'outer' 
		during: [
			WADynamicVariable 
				use: 'inner'
				during: [ self assert: WADynamicVariable value = 'inner' ].
			self assert: WADynamicVariable value = 'outer' ]