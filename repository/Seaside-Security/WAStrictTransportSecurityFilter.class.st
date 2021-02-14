"
I implement strict transport security (STS) for Seaside. STS tries to prevent users from accidentially using non SSL versions of your application. 
 
http://www.imperialviolet.org/2010/01/26/sts.html
http://lists.w3.org/Archives/Public/www-archive/2009Sep/att-0051/draft-hodges-strict-transport-sec-05.plain.html
https://developer.mozilla.org/en-US/docs/Security/HTTP_Strict_Transport_Security
"
Class {
	#name : #WAStrictTransportSecurityFilter,
	#superclass : #WAConfiguredRequestFilter,
	#category : 'Seaside-Security'
}

{ #category : #configuration }
WAStrictTransportSecurityFilter >> defaultConfiguration [
	^ WAUserConfiguration new
		addParent: WAStrictTransportSecurityFilterConfiguration instance;
		yourself
]

{ #category : #processing }
WAStrictTransportSecurityFilter >> handleFiltered: aRequestContext [
	"Adds a Secure-Transport-Security header in case the application is transmitted over HTTPS."
	
	| request |
	request := aRequestContext request.
	request isSsl
		ifTrue: [
			aRequestContext response strictTransportSecurity: self maxAge includeSubDomains: self includeSubDomains.
			super handleFiltered: aRequestContext ]
		ifFalse: [
			| safeUrl |
			safeUrl := request url copy.
			safeUrl host: request host.
			safeUrl scheme: 'https'.
			aRequestContext redirectTo: safeUrl ]
]

{ #category : #configuration }
WAStrictTransportSecurityFilter >> includeSubDomains [
	^ self configuration at: #includeSubDomains
]

{ #category : #configuration }
WAStrictTransportSecurityFilter >> maxAge [
	^ self configuration at: #maxAge
]
