Class {
	#name : #WANoSniffFilterTest,
	#superclass : #TestCase,
	#instVars : [
		'filter'
	],
	#category : 'Seaside-Tests-Security'
}

{ #category : #private }
WANoSniffFilterTest >> newFilter [
	^ WANoSniffFilter new
]

{ #category : #running }
WANoSniffFilterTest >> setUp [
	super setUp.
	filter := self newFilter
]

{ #category : #testing }
WANoSniffFilterTest >> testAddHeader [
	| context request response |
	request := WARequest method: 'GET' uri: '/login.do?username=admin'.
	response := WABufferedResponse new.
	
	context := WARequestContext request: request response: response.
	filter setNext: WAEmptyHandler new.
	[  filter handleFiltered: context ]
		on: WAResponseNotification
		do: [ :notification | ].
		
	self assert: response status = WAResponse statusOk.
	self assert: (response headerAt: 'X-Content-Type-Options') = 'nosniff'
]
