"
I disable a web application to be framed into other web pages. This helps preventing clickjacking attacks.
I only implement ALLOW FROM. If you want DENY or SAMEORIGIN you have to use WAFrameOptionsFilter.

https://developer.mozilla.org/en-US/docs/HTTP/X-Frame-Options
http://www.codinghorror.com/blog/2009/06/we-done-been-framed.html
"
Class {
	#name : #WAFrameOptionsAllowFromFilter,
	#superclass : #WAConfiguredRequestFilter,
	#category : 'Seaside-Security'
}

{ #category : #configuration }
WAFrameOptionsAllowFromFilter >> defaultConfiguration [
	^ WAUserConfiguration new
		addParent: WAFrameOptionsAllowFromFilterConfiguration instance;
		yourself
]

{ #category : #processing }
WAFrameOptionsAllowFromFilter >> handleFiltered: aRequestContext [
	| origin |
	origin := self origin.
	origin isEmptyOrNil ifFalse: [
		aRequestContext response frameOptions: 'ALLOW FROM ', origin ].
	super handleFiltered: aRequestContext
]

{ #category : #configuration }
WAFrameOptionsAllowFromFilter >> origin [
	^ self configuration at: #origin
]
