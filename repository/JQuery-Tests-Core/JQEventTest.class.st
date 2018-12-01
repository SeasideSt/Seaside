Class {
	#name : #JQEventTest,
	#superclass : #JQueryTest,
	#category : 'JQuery-Tests-Core-Unit'
}

{ #category : #accessing }
JQEventTest >> clickEvent [
	^ self jQuery event: 'click'
]

{ #category : #accessing }
JQEventTest >> newEvent [
	^ self jQuery event
]

{ #category : #'tests-accessing' }
JQEventTest >> testCurrentTarget [
	self
		assert: self newEvent currentTarget
		equals: 'arguments[0].currentTarget'.
	self
		assert: self clickEvent currentTarget
		equals: self function , '.Event("click").currentTarget'
]

{ #category : #'tests-accessing' }
JQEventTest >> testData [
	self
		assert: self newEvent data
		equals: 'arguments[0].data'.
	self
		assert: self clickEvent data
		equals: self function , '.Event("click").data'
]

{ #category : #'tests-testing' }
JQEventTest >> testIsDefaultPrevented [
	self
		assert: self newEvent isDefaultPrevented
		equals: 'arguments[0].isDefaultPrevented()'.
	self
		assert: self clickEvent isDefaultPrevented
		equals: self function , '.Event("click").isDefaultPrevented()'
]

{ #category : #'tests-testing' }
JQEventTest >> testIsImmediatePropagationStopped [
	self
		assert: self newEvent isImmediatePropagationStopped
		equals: 'arguments[0].isImmediatePropagationStopped()'.
	self
		assert: self clickEvent isImmediatePropagationStopped
		equals: self function , '.Event("click").isImmediatePropagationStopped()'
]

{ #category : #'tests-testing' }
JQEventTest >> testIsPropagationStopped [
	self
		assert: self newEvent isPropagationStopped
		equals: 'arguments[0].isPropagationStopped()'.
	self
		assert: self clickEvent isPropagationStopped
		equals: self function , '.Event("click").isPropagationStopped()'
]

{ #category : #'tests-accessing' }
JQEventTest >> testNamespace [
	self
		assert: self newEvent namespace
		equals: 'arguments[0].namespace'.
	self
		assert: self clickEvent namespace
		equals: self function , '.Event("click").namespace'
]

{ #category : #'tests-accessing' }
JQEventTest >> testPageX [
	self
		assert: self newEvent pageX
		equals: 'arguments[0].pageX'.
	self
		assert: self clickEvent pageX
		equals: self function , '.Event("click").pageX'
]

{ #category : #'tests-accessing' }
JQEventTest >> testPageY [
	self
		assert: self newEvent pageY
		equals: 'arguments[0].pageY'.
	self
		assert: self clickEvent pageY
		equals: self function , '.Event("click").pageY'
]

{ #category : #tests }
JQEventTest >> testPlain [
	self
		assert: self newEvent
		equals: 'arguments[0]'.
	self
		assert: self clickEvent
		equals: self function , '.Event("click")'
]

{ #category : #'tests-actions' }
JQEventTest >> testPreventDefault [
	self
		assert: self newEvent preventDefault
		equals: 'arguments[0].preventDefault()'.
	self
		assert: self clickEvent preventDefault
		equals: self function , '.Event("click").preventDefault()'
]

{ #category : #'tests-accessing' }
JQEventTest >> testRelatedTarget [
	self
		assert: self newEvent relatedTarget
		equals: 'arguments[0].relatedTarget'.
	self
		assert: self clickEvent relatedTarget
		equals: self function , '.Event("click").relatedTarget'
]

{ #category : #'tests-accessing' }
JQEventTest >> testResult [
	self
		assert: self newEvent result
		equals: 'arguments[0].result'.
	self
		assert: self clickEvent result
		equals: self function , '.Event("click").result'
]

{ #category : #'tests-actions' }
JQEventTest >> testStopImmediatePropagation [
	self
		assert: self newEvent stopImmediatePropagation
		equals: 'arguments[0].stopImmediatePropagation()'.
	self
		assert: self clickEvent stopImmediatePropagation
		equals: self function , '.Event("click").stopImmediatePropagation()'
]

{ #category : #'tests-actions' }
JQEventTest >> testStopPropagation [
	self
		assert: self newEvent stopPropagation
		equals: 'arguments[0].stopPropagation()'.
	self
		assert: self clickEvent stopPropagation
		equals: self function , '.Event("click").stopPropagation()'
]

{ #category : #'tests-accessing' }
JQEventTest >> testTarget [
	self
		assert: self newEvent target
		equals: 'arguments[0].target'.
	self
		assert: self clickEvent target
		equals: self function , '.Event("click").target'
]

{ #category : #'tests-accessing' }
JQEventTest >> testTimeStamp [
	self
		assert: self newEvent timeStamp
		equals: 'arguments[0].timeStamp'.
	self
		assert: self clickEvent timeStamp
		equals: self function , '.Event("click").timeStamp'
]

{ #category : #'tests-accessing' }
JQEventTest >> testType [
	self
		assert: self newEvent type
		equals: 'arguments[0].type'.
	self
		assert: self clickEvent type
		equals: self function , '.Event("click").type'
]
