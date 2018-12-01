Class {
	#name : #WARequestFunctionalTest,
	#superclass : #WAFunctionalTest,
	#category : 'Seaside-Tests-Functional'
}

{ #category : #rendering }
WARequestFunctionalTest >> renderAcceptCharsetFor: aRequest on: html [
	html definitionTerm: 'Accept-Charset:'.
	self renderQualifiedValues: aRequest acceptCharset on: html
]

{ #category : #rendering }
WARequestFunctionalTest >> renderAcceptEncodingFor: aRequest on: html [
	html definitionTerm: 'Accept-Encoding:'.
	self renderQualifiedValues: aRequest acceptEncoding on: html
]

{ #category : #rendering }
WARequestFunctionalTest >> renderAcceptFor: aRequest on: html [
	html definitionTerm: 'Accept:'.
	self renderQualifiedValues: aRequest accept on: html
]

{ #category : #rendering }
WARequestFunctionalTest >> renderAcceptLanguageFor: aRequest on: html [
	html definitionTerm: 'Accept-Language:'.
	self renderQualifiedValues: aRequest acceptLanguage on: html
]

{ #category : #rendering }
WARequestFunctionalTest >> renderContentOn: html [
	| request |
	html paragraph: 'This tests whether the server delivers the remote address correctly and headers can be parsed correctly.'.
	request := self requestContext request.
	html definitionList: [
		self renderRemoteAddressFor: request on: html.
		self renderSslSessionIdFor: request on: html.
		self renderAcceptFor: request on: html.
		self renderAcceptCharsetFor: request on: html.
		self renderAcceptEncodingFor: request on: html.
		self renderAcceptLanguageFor: request on: html.
		self renderOtherHeadersFor: request on: html ]
]

{ #category : #rendering }
WARequestFunctionalTest >> renderOtherHeadersFor: aRequest on: html [
	aRequest headers keys sorted do: [ :each |
		(#('accept-charset' 'accept-encoding' 'accept' 'accept-language' 'cookie' '') includes: each) ifFalse: [
			html definitionTerm: each, ':'.
			html definitionData: (aRequest headerAt: each) ] ]
]

{ #category : #rendering }
WARequestFunctionalTest >> renderQualifiedValue: aQualifiedValue on: html [
	html listItem: [
		| quality |
		html render: aQualifiedValue value.
		quality := aQualifiedValue quality.
		quality = Float infinity
			ifTrue: [ html superscript: [ html html: '&infin;' ] ]
			ifFalse: [ html superscript: quality ] ]
]

{ #category : #rendering }
WARequestFunctionalTest >> renderQualifiedValues: aCollection on: html [
	html definitionData: [
		aCollection isNil
			ifTrue: [ html text: 'N/A' ]
			ifFalse: [
				html orderedList: [
					aCollection do: [ :each |
						self renderQualifiedValue: each on: html ] ] ] ]
]

{ #category : #rendering }
WARequestFunctionalTest >> renderRemoteAddressFor: aRequest on: html [
	html definitionTerm: 'Remote Address:'.
	html definitionData: aRequest remoteAddress
]

{ #category : #rendering }
WARequestFunctionalTest >> renderSslSessionIdFor: aRequest on: html [
	aRequest isSsl ifTrue: [
		html definitionTerm: 'SSL Session Id:'.
		html definitionData: aRequest sslSessionId ]
]
