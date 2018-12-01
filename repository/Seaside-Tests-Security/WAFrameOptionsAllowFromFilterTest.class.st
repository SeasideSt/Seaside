Class {
	#name : #WAFrameOptionsAllowFromFilterTest,
	#superclass : #TestCase,
	#instVars : [
		'filter'
	],
	#category : 'Seaside-Tests-Security'
}

{ #category : #private }
WAFrameOptionsAllowFromFilterTest >> newFilter [
	^ WAFrameOptionsAllowFromFilter new
]

{ #category : #running }
WAFrameOptionsAllowFromFilterTest >> setUp [
	super setUp.
	filter := self newFilter
]

{ #category : #testing }
WAFrameOptionsAllowFromFilterTest >> testAddHeader [
	| context request response |
	request := WARequest method: 'GET' uri: '/login.do?username=admin'.
	response := WABufferedResponse new.
	
	context := WARequestContext request: request response: response.
	filter setNext: WAEmptyHandler new.
	filter configuration at: #origin put: 'http://www.seaside.st'.
	[  filter handleFiltered: context ]
		on: WAResponseNotification
		do: [ :notification | ].
		
	self assert: response status = WAResponse statusOk.
	self assert: (response headerAt: 'X-Frame-Options') = 'ALLOW FROM http://www.seaside.st'
]
