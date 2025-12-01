Class {
	#name : 'WACounterModel',
	#superclass : 'GRObject',
	#instVars : [
		'count'
	],
	#category : 'Seaside-WebSocket-Examples',
	#package : 'Seaside-WebSocket-Examples'
}

{ #category : 'accessing' }
WACounterModel >> count [
	^ count
]

{ #category : 'accessing' }
WACounterModel >> count: anInteger [
	count := anInteger
]

{ #category : 'actions' }
WACounterModel >> decrease [
	count := count - 1
]

{ #category : 'actions' }
WACounterModel >> increase [
	count := count + 1
]

{ #category : 'initialization' }
WACounterModel >> initialize [
	super initialize.
	count := 0
]
