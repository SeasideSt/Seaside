"
I track sessions using the remote address of a client. Usually you don't want to use this because it causes troubles when multiple users share the same IP (eg. several users from the same company). That's why I'm marked as abstract.

There are some special cases like crawlers where it can work though.
"
Class {
	#name : #WAIPSessionTrackingStrategy,
	#superclass : #WAInvisibleSessionTrackingStrategy,
	#category : 'Seaside-Session'
}

{ #category : #testing }
WAIPSessionTrackingStrategy class >> isAbstract [
	^ true
]

{ #category : #private }
WAIPSessionTrackingStrategy >> remoteAddressFromRequest: aRequest [
	^ aRequest
			headerAt: 'x-forwarded-for'
			ifAbsent: [
				aRequest
					headerAt: 'forwarded-for'
					ifAbsent: [ aRequest remoteAddress ] ]
]

{ #category : #private }
WAIPSessionTrackingStrategy >> sessionIdFromContext: aRequestContext [
	^ self remoteAddressFromRequest: aRequestContext request
]
