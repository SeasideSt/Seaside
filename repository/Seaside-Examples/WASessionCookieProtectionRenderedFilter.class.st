"
I'm pretty much the same as my superclass, but when returning a forbidden response, the response is rendered using a WAHtmlCanvas.
"
Class {
	#name : 'WASessionCookieProtectionRenderedFilter',
	#superclass : 'WASessionCookieProtectionFilter',
	#category : 'Seaside-Examples-Sessions',
	#package : 'Seaside-Examples',
	#tag : 'Sessions'
}

{ #category : 'processing' }
WASessionCookieProtectionRenderedFilter >> renderCookiesRequiredStatementOn: html [

	html text: self cookiesRequiredStatement
]

{ #category : 'processing' }
WASessionCookieProtectionRenderedFilter >> respondCookiesRequired: aRequestContext [
	| dialog |
	dialog := WAHtmlCanvas builder
		fullDocument: true;
		rootBlock: [ :root | 
			root
				beHtml5;
				title: 'Cookies Required' ];
		render: [ :html | self renderCookiesRequiredStatementOn: html ].
	aRequestContext
		respond: [ :response | 
			response
				forbidden;
				contentType: WAMimeType textHtml;
				nextPutAll: dialog ]
]
