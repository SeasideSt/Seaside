Class {
	#name : #WALegacyRedirectionHandlerTest,
	#superclass : #WAContextTest,
	#instVars : [
		'handler'
	],
	#category : 'Seaside-Tests-Environment'
}

{ #category : #configuration }
WALegacyRedirectionHandlerTest >> createHandlers [
	^ Array with: handler
]

{ #category : #configuration }
WALegacyRedirectionHandlerTest >> createRequest [
	^ WARequest
		method: 'GET'
		uri: '/seaside/pier/environment/pier.png?view=PRDownloadView'
		version: 1.1
		
]

{ #category : #running }
WALegacyRedirectionHandlerTest >> setUp [
	handler := WALegacyRedirectionHandler new
]

{ #category : #tests }
WALegacyRedirectionHandlerTest >> testKeepParameters [
	| responseUrl response |
	[ handler handleFiltered: self requestContext ]
		on: WAResponseNotification
		do: [ :notification | "ignore" ].
	response := self requestContext response.
	self assert: response status = 301.
	responseUrl := response headerAt: 'Location'.
	self assert: responseUrl greaseString = '/pier/environment/pier.png?view=PRDownloadView'
]
