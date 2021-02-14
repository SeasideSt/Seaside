Class {
	#name : #JSJsonTest,
	#superclass : #JSObjectTest,
	#category : 'Javascript-Tests-Core'
}

{ #category : #accessing }
JSJsonTest >> json [
	^ JSJson context: self renderContext
]

{ #category : #tests }
JSJsonTest >> testParse [
	self 
		assert: (self json parse: '[1,2]')
		equals: 'JSON.parse("[1,2]")'.
	self 
		assert: (self json parse: '[1,2]' reviver: 'return null')
		equals: 'JSON.parse("[1,2]",function(){return null})'
]

{ #category : #tests }
JSJsonTest >> testStringify [
	self 
		assert: (self json stringify: self mock)
		equals: 'JSON.stringify(mock)'.
	self 
		assert: (self json stringify: self mock space: 4)
		equals: 'JSON.stringify(mock,4)'.
	self 
		assert: (self json stringify: self mock replacer: #())
		equals: 'JSON.stringify(mock,[])'.
	self 
		assert: (self json stringify: self mock replacer: #() space: ' ')
		equals: 'JSON.stringify(mock,[]," ")'
]
