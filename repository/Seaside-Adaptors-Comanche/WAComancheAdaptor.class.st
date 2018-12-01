"
I provide an adapter between Seaside and the Comanche web server. To start a new server on port 8080, evaluate

	WAComancheAdaptor startOn: 8080.
	
and to stop it, evaluate

	WAComancheAdaptor stop.

By default I don't do any input conversion at all, you will get the input in whatever encoding the client sent and are expected to deliver it in the same. Howerver this behavior can be changed by evaluating
WAComancheAdaptor default encoding: anEncoding
See the class comment of the superclass for a discussion on this topic.
"
Class {
	#name : #WAComancheAdaptor,
	#superclass : #WAComancheRequestConverter,
	#instVars : [
		'service'
	],
	#category : 'Seaside-Adaptors-Comanche'
}

{ #category : #private }
WAComancheAdaptor >> basicStart [
	service := self createService.
	service start
]

{ #category : #private }
WAComancheAdaptor >> basicStop [
	service isNil
		ifFalse: [ service unregister; waitForStop ].
	service := nil
]

{ #category : #private }
WAComancheAdaptor >> convertCookiesFrom: aWAResponse to: aKomResponse [
	| cookies |
	cookies := aWAResponse cookies.
	cookies isEmpty ifTrue: [ ^ self ].

	cookies do: [ :each |
		"user Seaside serialization for full features instead of Kom
		this is quite evil code that works only because it knows the exact implementation of this method in Kom"
		aKomResponse
			setCookieName: each key
			value: each rfc6265StringWithoutKey
			path: nil ]
]

{ #category : #private }
WAComancheAdaptor >> createService [
	^ (HttpService on: self port)
		name: 'seaside-' , self port greaseString;
		plug: self;
		yourself
]

{ #category : #testing }
WAComancheAdaptor >> isRunning [
	^ service notNil and: [ service isRunning ]
]

{ #category : #testing }
WAComancheAdaptor >> isStarting [
	^ service notNil and: [ service isStopped ]
]

{ #category : #testing }
WAComancheAdaptor >> isStopped [
	^ service isNil
]

{ #category : #testing }
WAComancheAdaptor >> isStopping [
	^ service notNil and: [ service isStopping ]
]

{ #category : #adapting }
WAComancheAdaptor >> processHttp [
	HttpResponse current: (self process: HttpRequest current).
	^ true
]

{ #category : #adapting }
WAComancheAdaptor >> processHttpRequest: aRequest [
	^ self process: aRequest
]

{ #category : #converting }
WAComancheAdaptor >> responseFor: aNativeRequest [
	"Answer a response object for aNativeRequest."
	| bufferedStream codecStream |
	bufferedStream := GRPlatform current writeCharacterStreamOn: (String new: 4096).
	codecStream := self codec encoderFor: bufferedStream. 
	^ WAComboResponse
		onBuffered: (GRCountingStream on: codecStream)
		external: aNativeRequest stream
]

{ #category : #converting }
WAComancheAdaptor >> responseFrom: aRequestContext [ 
	| nativeResponse seasideResponse |
	seasideResponse := aRequestContext response.
	seasideResponse isCommitted ifTrue: [
		seasideResponse flush; close.
		^ HttpCommittedResponse new ].
	nativeResponse := HttpResponse new.
	seasideResponse headers keysAndValuesDo: [ :key :value | 
		key = 'Content-Type' 
			ifTrue: [ nativeResponse contentType: value greaseString ]
			ifFalse: [
				nativeResponse 
					fieldAt: key
					put: value greaseString ] ].
	self 
		convertCookiesFrom: seasideResponse
		to: nativeResponse.
	nativeResponse status: (HttpResponse statusSymbolFor: seasideResponse status).
	nativeResponse contents: seasideResponse stream contents readStream.
	^ nativeResponse
]

{ #category : #mode }
WAComancheAdaptor >> setDebugMode [
	service setDebugMode
]

{ #category : #mode }
WAComancheAdaptor >> setDeploymentMode [
	service setDeploymentMode
]

{ #category : #mode }
WAComancheAdaptor >> setVerboseMode [
	service setVerboseMode
]

{ #category : #'accessing-readonly' }
WAComancheAdaptor >> statusString [
	^ self isRunning 
		ifTrue: [ service greaseString ]
		ifFalse: [ super statusString ]
]

{ #category : #adapting }
WAComancheAdaptor >> validateForStack: anArray [
]
