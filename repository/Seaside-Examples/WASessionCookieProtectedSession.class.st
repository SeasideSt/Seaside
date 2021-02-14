"
I am a session with a WASessionCookieProtectionFilter.
"
Class {
	#name : #WASessionCookieProtectedSession,
	#superclass : #WASession,
	#category : 'Seaside-Examples'
}

{ #category : #initialization }
WASessionCookieProtectedSession >> initializeFilters [
	super initializeFilters.
	self addFilter: WASessionCookieProtectionFilter new
]
