"
The protection filter ensures that the wrapped request handler only accepts requests from the same IP. Do add this filter to a WASession for example to avoid session hijacking, do not add it to static request handlers such as WAApplication or WADispatcher as this might restrict access to the handler if your IP changes.

Note that checking for IP addresses is not bullet proof and should never be used as the sole security measure for a web application as IP addresses can be easily spoofed.
"
Class {
	#name : #WAProtectionFilter,
	#superclass : #WARequestFilter,
	#instVars : [
		'remoteAddress'
	],
	#category : 'Seaside-Core-Filter'
}

{ #category : #processing }
WAProtectionFilter >> handleFiltered: aRequestContext [ 
	(self verifyRequest: aRequestContext request) 
		ifTrue: [ super handleFiltered: aRequestContext ]
		ifFalse: [ 
			aRequestContext responseGenerator
				forbidden;
				respond ]
]

{ #category : #private }
WAProtectionFilter >> remoteAddress [
	^ remoteAddress
]

{ #category : #private }
WAProtectionFilter >> remoteAddressFromRequest: aRequest [
	remoteAddress ifNil: [
		remoteAddress := aRequest
			headerAt: 'x-forwarded-for'
			ifAbsent: [
				aRequest
					headerAt: 'forwarded-for'
					ifAbsent: [
						aRequest remoteAddress ] ] ].
	^ aRequest remoteAddress
]

{ #category : #testing }
WAProtectionFilter >> verifyRequest: aRequest [
	^ (self remoteAddressFromRequest: aRequest) = self remoteAddress
]
