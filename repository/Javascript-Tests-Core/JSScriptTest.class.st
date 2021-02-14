Class {
	#name : #JSScriptTest,
	#superclass : #JSObjectTest,
	#category : 'Javascript-Tests-Core'
}

{ #category : #accessing }
JSScriptTest >> function [
	^ JSFunction context: self renderContext
]

{ #category : #accessing }
JSScriptTest >> script [
	^ JSScript context: self renderContext
]

{ #category : #'tests-compose' }
JSScriptTest >> testAdd [
	| script element |
	script := self script.
	element := self stream nextPutAll: 'foo'.
	self assert: (script add: element) == element.
	self assert: script equals: 'foo'.
	element := self stream nextPutAll: 'bar'.
	self assert: (script add: element) == element.
	self assert: script equals: 'foo;bar'
]

{ #category : #'tests-compose' }
JSScriptTest >> testAddAll [
	| script elements |
	script := self script.
	elements := Array 
		with: (self stream nextPutAll: 'foo')
		with: (self stream nextPutAll: 'bar').
	self assert: (script addAll: elements) == elements.
	self assert: script equals: 'foo;bar'
]

{ #category : #'tests-utilities' }
JSScriptTest >> testAlert [
	self assert: (self script alert: 'Be Alert') equals: 'alert("Be Alert")'
]

{ #category : #'tests-function' }
JSScriptTest >> testArgument [
	| function |
	function := self function arguments: #(a b c).
	self assert: (function argument = #(a b c)).
	self assert: (function arguments = #(a b c))
]

{ #category : #'tests-function' }
JSScriptTest >> testArguments [
	self
		assert: (self function arguments: #(a))
		equals: 'function(a){}'.
	self
		assert: (self function arguments: #(a b))
		equals: 'function(a,b){}'
]

{ #category : #'tests-function' }
JSScriptTest >> testAsFunction [
	self
		assert: (self script asFunction: #(a))
		equals: 'function(a){}'.
	self
		assert: (self function asFunction: #(a b))
		equals: 'function(a,b){}'
]

{ #category : #'tests-utilities' }
JSScriptTest >> testCallback [
	self assert: (self script callback: [ ]) equals: 'window.location="http://www.seaside.st/?_s=1&_k=a&1"'
]

{ #category : #'tests-compose' }
JSScriptTest >> testComma [
	| script element |
	script := self script.
	element := self stream nextPutAll: 'foo'.
	self assert: (script , element) == script.
	self assert: script equals: 'foo'.
	element := self stream nextPutAll: 'bar'.
	self assert: (script , element) == script.
	self assert: script equals: 'foo;bar'
]

{ #category : #tests }
JSScriptTest >> testConvert [
	self
		assert: self function
		equals: 'function(){}'.
	self
		assert: self function asFunction
		equals: 'function(){}'.
	self 
		assert: 'alert("1")' asFunction
		equals: 'function(){alert("1")}'
]

{ #category : #tests }
JSScriptTest >> testEmpty [
	self assert: self script equals: ''
]

{ #category : #'tests-utilities' }
JSScriptTest >> testGoto [
	self assert: (self script goto: 'http://www.seaside.st') equals: 'window.location="http://www.seaside.st"'
]

{ #category : #'tests-utilities' }
JSScriptTest >> testLogger [
	self assert: (self script logger log: 'Hello Wold') equals: 'console.log("Hello Wold")'
]

{ #category : #'tests-utilities' }
JSScriptTest >> testRefresh [
	self assert: self script refresh equals: 'window.location="http://www.seaside.st/?_s=1&_k=a"'
]

{ #category : #'tests-function' }
JSScriptTest >> testReturn [
	| function |
	function := self function.
	function add: (self stream nextPutAll: 'foo').
	function add: (self stream nextPutAll: 'bar').
	function add: (self stream nextPutAll: 'baz').
	self assert: function equals: 'function(){foo;bar;baz}'.

	function := self function return: true.
	function add: (self stream nextPutAll: 'foo').
	function add: (self stream nextPutAll: 'bar').
	function add: (self stream nextPutAll: 'baz').
	self assert: function equals: 'function(){foo;bar;return baz}'
]

{ #category : #'tests-compose' }
JSScriptTest >> testShift [
	| script element |
	script := self script.
	element := self stream nextPutAll: 'foo'.
	self assert: (script << element) == element.
	self assert: script equals: 'foo'.
	element := self stream nextPutAll: 'bar'.
	self assert: (script << element) == element.
	self assert: script equals: 'foo;bar'
]
