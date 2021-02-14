Class {
	#name : #JQueryClassTest,
	#superclass : #JQueryTest,
	#category : 'JQuery-Tests-Core-Unit'
}

{ #category : #tests }
JQueryClassTest >> testAlias [
	| originalName |
	originalName := JQuery functionName.
	JQuery functionName: 'WhatElse'.
	[ self assert: self jQuery equals: 'WhatElse' ]
		ensure: [ JQuery functionName: originalName ]
]

{ #category : #'tests-creation' }
JQueryClassTest >> testAll [
	self
		assert: (self jQuery all)
		equals: self function , '("*")'
]

{ #category : #tests }
JQueryClassTest >> testBasic [
	self
		assert: self jQuery
		equals: self function
]

{ #category : #'tests-creation' }
JQueryClassTest >> testClass [
	self
		assert: (self jQuery class: 'foo')
		equals: self function , '(".foo")'
]

{ #category : #'tests-utilities' }
JQueryClassTest >> testContains [
	self
		assert: (self jQuery contains: 1 in: #(1 2 3))
		equals: self function , '.contains([1,2,3],1)'
]

{ #category : #'tests-creation' }
JQueryClassTest >> testDocument [
	self
		assert: (self jQuery document)
		equals: self function , '(document)'
]

{ #category : #'tests-utilities' }
JQueryClassTest >> testError [
	self
		assert: (self jQuery error: 'Doomsday Device')
		equals: self function , '.error("Doomsday Device")'
]

{ #category : #'tests-utilities' }
JQueryClassTest >> testEscapeSelector [
	self
		assert: (self jQuery escapeSelector: '#foobar')
		equals: self function , '.escapeSelector("#foobar")'
]

{ #category : #'tests-creation' }
JQueryClassTest >> testExpression [
	self
		assert: (self jQuery expression: '#foo')
		equals: self function , '("#foo")'.
	self
		assert: (self jQuery expression: 'div > p')
		equals: self function , '("div > p")'.
	self
		assert: (self jQuery expression: 'ul li.active')
		equals: self function , '("ul li.active")'

]

{ #category : #'tests-creation' }
JQueryClassTest >> testExpressionContext [
	self
		assert: (self jQuery expression: '#foo' context: 123)
		equals: self function , '("#foo",123)'
]

{ #category : #'tests-utilities' }
JQueryClassTest >> testHoldReady [
	self
		assert: (self jQuery holdReady: false)
		equals: self function , '.holdReady(false)'
]

{ #category : #'tests-creation' }
JQueryClassTest >> testHtml [
	self
		assert: (self jQuery html: [ :html | html div: 'foo' ])
		equals: self function , '("<div>foo</div>")'.
	self
		assert: (self jQuery html: [ :html | html div title: 'foo'; with: 'bar' ])
		equals: self function , '("<div title=\"foo\">bar</div>")'
]

{ #category : #'tests-creation' }
JQueryClassTest >> testId [
	self
		assert: (self jQuery id: 'foo')
		equals: self function , '("#foo")'
]

{ #category : #'tests-utilities' }
JQueryClassTest >> testIsEmptyObject [
	self
		assert: (self jQuery isEmptyObject: Dictionary new)
		equals: self function , '.isEmptyObject({})'
]

{ #category : #'tests-utilities' }
JQueryClassTest >> testIsPlainObject [
	self
		assert: (self jQuery isPlainObject: Dictionary new)
		equals: self function , '.isPlainObject({})'
]

{ #category : #'tests-utilities' }
JQueryClassTest >> testIsWindow [
	self
		assert: (self jQuery isWindow: Dictionary new)
		equals: self function , '.isWindow({})'
]

{ #category : #'tests-creation' }
JQueryClassTest >> testNew [
	self
		assert: (self jQuery new)
		equals: self function , '(this)'.
	self
		assert: (self jQuery new id: 'foo')
		equals: self function , '("#foo")'
]

{ #category : #'tests-accessing' }
JQueryClassTest >> testNoop [
	self
		assert: self jQuery noop
		equals: self function , '.noop'
]

{ #category : #'tests-utilities' }
JQueryClassTest >> testParseJSON [
	self
		assert: (self jQuery parseJSON: '{ foo: 12 }')
		equals: self function , '.parseJSON("{ foo: 12 }")'
]

{ #category : #'tests-creation' }
JQueryClassTest >> testReady [
	self
		assert: (self jQuery ready: (self javascript alert: 'Hello'))
		equals: self function , '(function(){alert("Hello")})'
]

{ #category : #'tests-creation' }
JQueryClassTest >> testScript [
	self assert: (self jQuery script: [ :s | ]) = ''.
	self assert: (self jQuery script: [ :s | s add: s jQuery ]) = self function.
	self assert: (self jQuery script: [ :s | s add: (s jQuery: 'a') ]) = (self function , '("a")')
]

{ #category : #'tests-agent' }
JQueryClassTest >> testSupport [
	self
		assert: self jQuery support
		equals: self function , '.support'
]

{ #category : #'tests-creation' }
JQueryClassTest >> testThis [
	self
		assert: (self jQuery this)
		equals: self function , '(this)'
]

{ #category : #'tests-utilities' }
JQueryClassTest >> testType [
	self
		assert: (self jQuery type: true)
		equals: self function , '.type(true)'
]

{ #category : #'tests-utilities' }
JQueryClassTest >> testUniqueSort [
	self
		assert: (self jQuery uniqueSort: #(1 2 2 3))
		equals: self function , '.uniqueSort([1,2,2,3])'
]

{ #category : #'tests-with' }
JQueryClassTest >> testWithBlock [
	self
		assert: (self jQuery: [ :html | html heading: 'jQuery' ])
		equals: self function , '("<h1>jQuery</h1>")'
]

{ #category : #'tests-with' }
JQueryClassTest >> testWithNil [
	self
		assert: (self jQuery: nil)
		equals: self function , '(this)'
]

{ #category : #'tests-with' }
JQueryClassTest >> testWithReady [
	self
		assert: (self jQuery: (self javascript alert: 'Hello'))
		equals: self function , '(function(){alert("Hello")})'
]

{ #category : #'tests-with' }
JQueryClassTest >> testWithString [
	self
		assert: (self jQuery: 'div > p')
		equals: self function , '("div > p")'
]

{ #category : #'tests-with' }
JQueryClassTest >> testWithSymbol [
	self
		assert: (self jQuery: #foo)
		equals: self function , '("#foo")'
]
