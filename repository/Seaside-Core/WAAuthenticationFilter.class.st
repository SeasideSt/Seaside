"
WAAuthenticationFilter protects a request handler with username and password using the standard HTTP basic authentication. This passes username and password in clear-text, unless used over an encripted HTTPS connection. You should set the authenticator, and object that is able to validate usernames and passwords by implementing #verifyPassword:forUser:.
"
Class {
	#name : #WAAuthenticationFilter,
	#superclass : #WARequestFilter,
	#instVars : [
		'authenticator',
		'realm'
	],
	#category : 'Seaside-Core-Filter'
}

{ #category : #accessing }
WAAuthenticationFilter >> authenticator [
	"Answer the object used for authentication. Defaults to the owning handler."

	^ authenticator ifNil: [ self handler ]
]

{ #category : #accessing }
WAAuthenticationFilter >> authenticator: anObject [
	authenticator := anObject
]

{ #category : #processing }
WAAuthenticationFilter >> handleFiltered: aRequestContext [ 
	(self verifyRequest: aRequestContext request) 
		ifTrue: [ super handleFiltered: aRequestContext ]
		ifFalse: [
			aRequestContext responseGenerator
				authenticate: self realm;
				respond ]
]

{ #category : #accessing }
WAAuthenticationFilter >> realm [
	"Answer the realm to be displayed in the authentication dialog."
	
	^ realm ifNil: [ realm := 'Seaside' ]
]

{ #category : #accessing }
WAAuthenticationFilter >> realm: anObject [
	realm := anObject
]

{ #category : #testing }
WAAuthenticationFilter >> verifyRequest: aRequest [
	^ self authenticator verifyPassword: aRequest password forUser: aRequest user
]
