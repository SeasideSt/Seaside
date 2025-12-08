Class {
	#name : 'WACookieConversionRule',
	#superclass : 'GRReSlimeTransformationRule',
	#category : 'Seaside-Pharo110-Slime',
	#package : 'Seaside-Pharo110-Slime'
}

{ #category : 'accessing' }
WACookieConversionRule >> group [

	^ 'Seaside 3.2'
]

{ #category : 'initialization' }
WACookieConversionRule >> initialize [

	super initialize.
	self
		replace: '``@a oldNetscapeString' with: '``@a rfc6265String';
		replace: '``@a rfc2109String' with: '``@a rfc6265String';
		replace: '``@a rfc2965String' with: '``@a rfc6265String'
]

{ #category : 'accessing' }
WACookieConversionRule >> name [

	^ '#oldNetscapeString, #rfc2109String and #rfc2965String have been replaced with #rfc6265String'
]

{ #category : 'accessing' }
WACookieConversionRule >> rationale [

	^ '#oldNetscapeString, #rfc2109String and #rfc2965String have been replaced by #rfc6265String.'
]
