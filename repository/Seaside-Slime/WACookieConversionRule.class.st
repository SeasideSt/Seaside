Class {
	#name : #WACookieConversionRule,
	#superclass : #GRSlimeTransformationRule,
	#category : 'Seaside-Slime'
}

{ #category : #accessing }
WACookieConversionRule >> group [
	^ 'Seaside 3.2'
]

{ #category : #initialization }
WACookieConversionRule >> initialize [
	super initialize.
	self rewriteRule
		replace: '``@a oldNetscapeString' with: '``@a rfc6265String';
		replace: '``@a rfc2109String' with: '``@a rfc6265String';
		replace: '``@a rfc2965String' with: '``@a rfc6265String'
]

{ #category : #accessing }
WACookieConversionRule >> name [
	^ '#oldNetscapeString, #rfc2109String and #rfc2965String have been replaced with #rfc6265String'
]

{ #category : #accessing }
WACookieConversionRule >> rationale [
	^ '#oldNetscapeString, #rfc2109String and #rfc2965String have been replaced by #rfc6265String.'
]
