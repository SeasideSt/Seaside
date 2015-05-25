tests
testSimple
	self assert: (self mark: [ self callcc: [ :cc | cc value: true ] ])