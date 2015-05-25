tests
testWithValue
	WADynamicVariable 
		use: 'value' 
		during: [ self assert: WADynamicVariable value = 'value' ]