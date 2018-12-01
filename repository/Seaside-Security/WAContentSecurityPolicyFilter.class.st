"
I disable inline JavaScript and CSS and allow content only from the current origin.

http://www.html5rocks.com/en/tutorials/security/content-security-policy/
"
Class {
	#name : #WAContentSecurityPolicyFilter,
	#superclass : #WARequestFilter,
	#category : 'Seaside-Security'
}

{ #category : #processing }
WAContentSecurityPolicyFilter >> handleFiltered: aRequestContext [
	aRequestContext response headerAt: 'Content-Security-Policy' put: 'default-src ''self'''.
	super handleFiltered: aRequestContext
]
