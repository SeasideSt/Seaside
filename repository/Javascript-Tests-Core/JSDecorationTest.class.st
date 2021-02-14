Class {
	#name : #JSDecorationTest,
	#superclass : #JSObjectTest,
	#category : 'Javascript-Tests-Core'
}

{ #category : #tests }
JSDecorationTest >> testAccess [
	self
		assert: (self mock access: 'foo')
		equals: 'mock.foo'
]

{ #category : #tests }
JSDecorationTest >> testAlias [
	| mock |
	mock := self mock.
	mock alias: 'foo'.
	self assert: mock equals: 'foo'.
	mock alias: 'bar'; call: 'zork'.
	self assert: mock equals: 'bar.zork()'
]

{ #category : #tests }
JSDecorationTest >> testApply [
	self
		assert: (self mock apply: #())
		equals: 'mock()'.
	self
		assert: (self mock apply: #(1))
		equals: 'mock(1)'.
	self
		assert: (self mock apply: #(1 true))
		equals: 'mock(1,true)'
]

{ #category : #tests }
JSDecorationTest >> testAssign [
	self
		assert: (self mock assign: 1)
		equals: 'mock=1'
]

{ #category : #tests }
JSDecorationTest >> testAssignLocalTo [
	self
		assert: (self mock assignLocalTo: 'x')
		equals: 'var x=mock'
]

{ #category : #tests }
JSDecorationTest >> testAssignTo [
	self
		assert: (self mock assignTo: 'x')
		equals: 'x=mock'
]

{ #category : #tests }
JSDecorationTest >> testBinary [
	self
		assert: (self mock & false)
		equals: 'mock&&false'.
	self
		assert: (self mock | 1)
		equals: 'mock||1'
]

{ #category : #tests }
JSDecorationTest >> testCall [
	self
		assert: (self mock call: 'foo')
		equals: 'mock.foo()'.
	self
		assert: (self mock call: nil)
		equals: 'mock()'.
	self
		assert: (self mock call: '')
		equals: 'mock()'
]

{ #category : #tests }
JSDecorationTest >> testCallWith [
	self
		assert: (self mock call: 'foo' with: 1)
		equals: 'mock.foo(1)'.
	self
		assert: (self mock call: nil with: 1)
		equals: 'mock(1)'.
	self
		assert: (self mock call: '' with: 1)
		equals: 'mock(1)'
]

{ #category : #tests }
JSDecorationTest >> testCallWithArguments [
	self
		assert: (self mock call: 'foo' withArguments: #(1 2 3 4 5))
		equals: 'mock.foo(1,2,3,4,5)'.
	self
		assert: (self mock call: nil withArguments: #(1 2 3 4 5))
		equals: 'mock(1,2,3,4,5)'.
	self
		assert: (self mock call: '' withArguments: #(1 2 3 4 5))
		equals: 'mock(1,2,3,4,5)'
]

{ #category : #tests }
JSDecorationTest >> testCallWithWith [
	self
		assert: (self mock call: 'foo' with: 1 with: 2)
		equals: 'mock.foo(1,2)'.
	self
		assert: (self mock call: nil with: 1 with: 2)
		equals: 'mock(1,2)'.
	self
		assert: (self mock call: '' with: 1 with: 2)
		equals: 'mock(1,2)'
]

{ #category : #tests }
JSDecorationTest >> testCallWithWithWith [
	self
		assert: (self mock call: 'foo' with: 1 with: 2 with: 3)
		equals: 'mock.foo(1,2,3)'.
	self
		assert: (self mock call: nil with: 1 with: 2 with: 3)
		equals: 'mock(1,2,3)'.
	self
		assert: (self mock call: '' with: 1 with: 2 with: 3)
		equals: 'mock(1,2,3)'
]

{ #category : #tests }
JSDecorationTest >> testConcatenate [
	self
		assert: (self mock , 2 , 3)
		equals: 'mock;2;3'.
	self
		assert: (self mock , nil , self mock)
		equals: 'mock;null;mock'
]

{ #category : #tests }
JSDecorationTest >> testCondition [
	self
		assert: (self mock condition: true)
		equals: 'if(true){mock}'.
	self
		assert: (self mock condition: false)
		equals: 'if(false){mock}'
]

{ #category : #tests }
JSDecorationTest >> testConditionElse [
	self
		assert: (self mock condition: true else: false)
		equals: 'if(true){mock}else{false}'.
	self
		assert: (self mock condition: false else: true)
		equals: 'if(false){mock}else{true}'
]

{ #category : #tests }
JSDecorationTest >> testConfirm [
	self
		assert: (self mock confirm: 'Sure?')
		equals: 'if(confirm("Sure?")){mock}'
]

{ #category : #tests }
JSDecorationTest >> testCreate [
	self
		assert: self mock create
		equals: 'new mock'
]

{ #category : #tests }
JSDecorationTest >> testInterval [
	self
		assert: (self mock interval: 2 seconds)
		equals: 'setInterval(function(){mock},2000)'
]

{ #category : #tests }
JSDecorationTest >> testNot [
	self
		assert: self mock not
		equals: '!mock'.
	self
		assert: self mock not not
		equals: '!!mock'
]

{ #category : #tests }
JSDecorationTest >> testProperty [
	self
		assert: (self mock property: 'foo')
		equals: 'mock["foo"]'.
	self
		assert: (self mock property: 123)
		equals: 'mock[123]'.
	self
		assert: (self mock property: 'foo'; assign: 'bar')
		equals: 'mock["foo"]="bar"'
]

{ #category : #tests }
JSDecorationTest >> testReturn [
	self
		assert: (self mock return: 1)
		equals: 'mock;return 1'
]

{ #category : #tests }
JSDecorationTest >> testThenElse [
	| mock |
	mock := self mock.
	mock then: 1.
	self assert: mock equals: '(mock?1:null)'.

	mock := self mock.
	mock then: 1 else: 2.
	self assert: mock equals: '(mock?1:2)'
]

{ #category : #tests }
JSDecorationTest >> testTimeout [
	| mock |
	mock := self mock.
	mock setTimeout: 123.
	self assert: mock equals: 'setTimeout(function(){mock},123)'
]
