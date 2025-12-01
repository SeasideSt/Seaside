"
I revert to the old < 3.3.0 behavior which is easier for tests.
"
Class {
	#name : 'WARedirectingRegistry',
	#superclass : 'WARegistry',
	#category : 'Seaside-Tests-Core-RequestHandling',
	#package : 'Seaside-Tests-Core',
	#tag : 'RequestHandling'
}

{ #category : 'handling' }
WARedirectingRegistry >> handleExpired: aRequestContext [
	
	aRequestContext responseGenerator
		expiredRegistryKey;
		respond
]
