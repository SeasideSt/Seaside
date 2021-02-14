Class {
	#name : #WAGsZincStreamingServerAdaptor,
	#superclass : #ZnZincStreamingServerAdaptor,
	#category : 'Seaside-GemStone-Adaptors-Zinc'
}

{ #category : #converting }
WAGsZincStreamingServerAdaptor >> contextFor: aNativeRequest [
	"Answer a request context for aNativeRequest."

	^ WAGemStoneRequestContext
		request: (self requestFor: aNativeRequest)
		response: (self responseFor: aNativeRequest)
		codec: self codec
]

{ #category : #converting }
WAGsZincStreamingServerAdaptor >> internalServerErrorMessage: message [
	| response responseContent |
	responseContent := '<html><head><title>Internal server malfunction</title></head>'
		, '<body><h1>Internal server malfunction</h1><h2 style="color: blue">'
		, message
		,
			'</h2><div style="font-family: sans-serif">You should contact the system administrator</div></body></html>'.
	response := ZnResponse new
		statusLine: ZnStatusLine internalServerError;
		headers: ZnHeaders defaultResponseHeaders;
		entity: (ZnEntity html: responseContent);
		yourself.
	GRPlatform current logError: message title: 'Internal Zinc'.
	^ response
]

{ #category : #converting }
WAGsZincStreamingServerAdaptor >> process: aNativeRequest [
	^ GRPlatform current
		seasideProcessRequest: aNativeRequest
		adaptor: self
		resultBlock: [ :aRequest | super process: aRequest ]
]

{ #category : #converting }
WAGsZincStreamingServerAdaptor >> start [
	"blocks main thread, does not return"
	self gemServerStart.
	[ true ] whileTrue: [ (Delay forSeconds: 10) wait ]
]
