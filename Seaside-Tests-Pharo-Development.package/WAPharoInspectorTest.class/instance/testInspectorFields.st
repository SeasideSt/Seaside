tests
testInspectorFields
	| values example fields association |
	self assert: Object new inspectorFields isEmpty.
	
	example := WAExampleClass new: 2.
	example first: 'Das Grosse Lernen'.
	example second: 'Die Analekten des Konfuzius'.
	example at: 1 put: 'Mitte und Mass'.
	example at: 2 put: 'Mengzi'.
	
	fields := example inspectorFields.
	self assert: fields size = 4.
	
	association := fields first.
	self assert: association key = #'first'.
	self assert: association value = 'Das Grosse Lernen'.
	
	association := fields second.
	self assert: association key = #'second'.
	self assert: association value = 'Die Analekten des Konfuzius'.
	
	association := fields third.
	self assert: association key = 1.
	self assert: association value = 'Mitte und Mass'.
	
	association := fields fourth.
	self assert: association key = 2.
	self assert: association value = 'Mengzi'.
	
	values := #('Das Grosse Lernen' 'Die Analekten des Konfuzius' 'Mitte und Mass' 'Mengzi').
	
	fields := values inspectorFields.
	self assert: fields size = 4.
	values keysAndValuesDo: [ :index :value |
		association := fields at: index.
		self assert: association key = index.
		self assert: association value = value ].
	
	example := Dictionary new.
	values keysAndValuesDo: [ :index :value |
		example at: index put: value ].
	
	fields := example inspectorFields.
	
	values keysAndValuesDo: [ :index :value |
		self assert: (fields at: index) value = value ]