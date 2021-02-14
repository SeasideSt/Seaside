"
I revert to the old < 3.3.0 behavior which is easier for tests.
"
Class {
	#name : #WARedirectingApplication,
	#superclass : #WAApplication,
	#category : 'Seaside-Tests-Session'
}

{ #category : #handling }
WARedirectingApplication >> handleExpired: aRequestContext [
	
	aRequestContext responseGenerator
		expiredRegistryKey;
		respond
]
