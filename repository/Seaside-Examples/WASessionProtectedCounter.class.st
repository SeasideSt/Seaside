"
A counter that is protected by WASessionCookieProtectionFilter.
"
Class {
	#name : 'WASessionProtectedCounter',
	#superclass : 'WAExampleComponent',
	#instVars : [
		'counter'
	],
	#category : 'Seaside-Examples-Misc',
	#package : 'Seaside-Examples',
	#tag : 'Misc'
}

{ #category : 'accessing' }
WASessionProtectedCounter class >> handlerName [
	^ 'examples/sessionprotected-counter'
]

{ #category : 'initialization' }
WASessionProtectedCounter class >> initialize [
	| app |
	app := WAAdmin register: self asApplicationAt: self handlerName.
	app sessionClass: WASessionCookieProtectedSession
]

{ #category : 'initialization' }
WASessionProtectedCounter >> initialize [
	super initialize.
	counter := WACounter new
]

{ #category : 'rendering' }
WASessionProtectedCounter >> renderContentOn: html [
	counter renderOn: html.
	html paragraph: 'I am the Counter example using WASessionCookieProtectionFilter so you cannot copy/paste the url in another browser to hijack my session. See the class comment of WASessionCookieProtectionFilter for more information.'
]
