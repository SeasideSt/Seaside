Class {
	#name : #WAStrictTransportSecurityFilterTest,
	#superclass : #TestCase,
	#instVars : [
		'filter'
	],
	#category : 'Seaside-Tests-Security'
}

{ #category : #private }
WAStrictTransportSecurityFilterTest >> newFilter [
	^ WAStrictTransportSecurityFilter new
]

{ #category : #running }
WAStrictTransportSecurityFilterTest >> setUp [
	super setUp.
	filter := self newFilter
]

{ #category : #testing }
WAStrictTransportSecurityFilterTest >> testAddHeaderWithSsl [
	| context request response |
	request := WARequest method: 'GET' uri: '/login.do?username=admin'.
	request url scheme: 'https'.
	request headers at: 'host' put: 'bank.com'.
	response := WABufferedResponse new.
	self assert: request isSsl.
	
	context := WARequestContext request: request response: response.
	filter setNext: WAEmptyHandler new.
	[  filter handleFiltered: context ]
		on: WAResponseNotification
		do: [ :notification | ].
		
	self assert: response status = WAResponse statusOk.
	self assert: (response headerAt: 'Strict-Transport-Security') = 'max-age=1209600'
]

{ #category : #testing }
WAStrictTransportSecurityFilterTest >> testRedirectNoSsl [
	| context request response |
	request := WARequest method: 'GET' uri: '/login.do?username=admin'.
	request headers at: 'host' put: 'bank.com'.
	response := WABufferedResponse new.
	self deny: request isSsl.
	
	context := WARequestContext request: request response: response.
	[  filter handleFiltered: context ]
		on: WAResponseNotification
		do: [ :notification | ].
		
	self assert: response status = WAResponse statusFound.
	self assert: ((response headerAt: 'Location') greaseString beginsWithSubCollection: 'https://')
]
