Class {
	#name : #WAAcceptTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-Core-HTTP'
}

{ #category : #private }
WAAcceptTest >> assert: anArray at: anInteger charset: aString quality: aFloat [
	| value |
	value := (anArray at: anInteger).
	self assert: (value isKindOf: WAQualifiedValue).
	self assert: value quality = aFloat.
	
	self assert: value value = aString
]

{ #category : #private }
WAAcceptTest >> assert: anArray at: anInteger encoding: aString quality: aFloat [
	self assert: anArray at: anInteger charset: aString quality: aFloat
]

{ #category : #private }
WAAcceptTest >> assert: anArray at: anInteger language: aLanguageString country: aCountryString quality: aFloat [
	| value mimeType |
	value := (anArray at: anInteger).
	self assert: (value isKindOf: WAQualifiedValue).
	self assert: value quality = aFloat.
	
	mimeType := value value.
	self assert: (mimeType isKindOf: WALocale).
	self assert: (mimeType language = aLanguageString).
	self assert: (mimeType country = aCountryString)
]

{ #category : #private }
WAAcceptTest >> assert: anArray at: anInteger main: aMainString sub: aSubString quality: aFloat [
	| value mimeType |
	value := (anArray at: anInteger).
	self assert: (value isKindOf: WAQualifiedValue).
	self assert: value quality = aFloat.
	
	mimeType := value value.
	self assert: (mimeType isKindOf: WAMimeType).
	self assert: (mimeType main = aMainString).
	self assert: (mimeType sub = aSubString)
]

{ #category : #tests }
WAAcceptTest >> testIe6 [
	| accept acceptLanguage acceptEncoding |
	accept := WAAccept fromString: 'image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, application/vnd.ms-excel, application/msword, application/vnd.ms-powerpoint, application/x-shockwave-flash, */*'.
	self assert: accept size = 9.
	self assert: accept at: 1 main: 'image' sub: 'gif' quality: 1.0.
	self assert: accept at: 2 main: 'image' sub: 'x-xbitmap' quality: 1.0.
	self assert: accept at: 3 main: 'image' sub: 'jpeg' quality: 1.0.
	self assert: accept at: 4 main: 'image' sub: 'pjpeg' quality: 1.0.
	self assert: accept at: 5 main: 'application' sub: 'vnd.ms-excel' quality: 1.0.
	self assert: accept at: 6 main: 'application' sub: 'msword' quality: 1.0.
	self assert: accept at: 7 main: 'application' sub: 'vnd.ms-powerpoint' quality: 1.0.
	self assert: accept at: 8 main: 'application' sub: 'x-shockwave-flash' quality: 1.0.
	self assert: accept at: 9 main: '*' sub: '*' quality: 1.0.
	
	acceptEncoding := WAAcceptEncoding fromString: 'gzip, deflate'.
	self assert: acceptEncoding size = 2.
	self assert: acceptEncoding at: 1 encoding: 'gzip' quality: 1.0.
	self assert: acceptEncoding at: 2 encoding: 'deflate' quality: 1.0.
	
	acceptLanguage := WAAcceptLanguage fromString: 'de-ch'.
	self assert: acceptLanguage size = 1.
	self assert: acceptLanguage at: 1 language: 'de' country: 'ch' quality: 1.0
]

{ #category : #tests }
WAAcceptTest >> testIssue655 [
	| accept |
	accept := WAAccept fromString: 'text/html, image/gif, image/jpeg, *; q=.2, */*; q=.2'.
	self assert: accept size = 5.
	self assert: accept at: 1 main: 'text' sub: 'html' quality: 1.0.
	self assert: accept at: 2 main: 'image' sub: 'gif' quality: 1.0.
	self assert: accept at: 3 main: 'image' sub: 'jpeg' quality: 1.0.
	self assert: accept at: 4 main: '*' sub: '*' quality: 0.2.
	self assert: accept at: 5 main: '*' sub: '*' quality: 0.2
]

{ #category : #tests }
WAAcceptTest >> testMozilla [
	| accept accpetLanguage acceptCharset acceptEncoding |
	accept := WAAccept fromString: 'text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5'.
	self assert: accept size = 7.
	self assert: accept at: 1 main: 'text' sub: 'xml' quality: 1.0.
	self assert: accept at: 2 main: 'application' sub: 'xml' quality: 1.0.
	self assert: accept at: 3 main: 'application' sub: 'xhtml+xml' quality: 1.0.
	self assert: accept at: 4 main: 'text' sub: 'html' quality: 0.9.
	self assert: accept at: 5 main: 'text' sub: 'plain' quality: 0.8.
	self assert: accept at: 6 main: 'image' sub: 'png' quality: 1.0.
	self assert: accept at: 7 main: '*' sub: '*' quality: 0.5.
	
	acceptCharset := WAAcceptCharset fromString: 'ISO-8859-1,utf-8;q=0.7,*;q=0.7'.
	self assert: acceptCharset size = 3.
	self assert: acceptCharset at: 1 charset: 'ISO-8859-1' quality: 1.0.
	self assert: acceptCharset at: 2 charset: 'utf-8' quality: 0.7.
	self assert: acceptCharset at: 3 charset: '*' quality: 0.7.
	
	acceptEncoding := WAAcceptEncoding fromString: 'gzip,deflate'.
	self assert: acceptEncoding size = 2.
	self assert: acceptEncoding at: 1 encoding: 'gzip' quality: 1.0.
	self assert: acceptEncoding at: 2 encoding: 'deflate' quality: 1.0.
	
	accpetLanguage := WAAcceptLanguage fromString: 'de-de,de;q=0.8,en-us;q=0.5,en;q=0.3'.
	self assert: accpetLanguage size = 4.
	self assert: accpetLanguage at: 1 language: 'de' country: 'de' quality: 1.0.
	self assert: accpetLanguage at: 2 language: 'de' country: nil quality: 0.8.
	self assert: accpetLanguage at: 3 language: 'en' country: 'us' quality: 0.5.
	self assert: accpetLanguage at: 4 language: 'en' country: nil quality: 0.3
]

{ #category : #tests }
WAAcceptTest >> testRfc1 [
	"http://tools.ietf.org/html/rfc2616#section-14.1"
	| accept |
	accept := WAAccept fromString: 'audio/*; q=0.2, audio/basic'.
	self assert: accept size = 2.
	self assert: accept at: 1 main: 'audio' sub: '*' quality: 0.2.
	self assert: accept at: 2 main: 'audio' sub: 'basic' quality: 1.0
]

{ #category : #tests }
WAAcceptTest >> testRfc2 [
	"http://tools.ietf.org/html/rfc2616#section-14.1"
	| accept |
	accept := WAAccept fromString: 'text/plain; q=0.5, text/html, text/x-dvi; q=0.8, text/x-c'.
	self assert: accept size = 4.
	self assert: accept at: 1 main: 'text' sub: 'plain' quality: 0.5.
	self assert: accept at: 2 main: 'text' sub: 'html' quality: 1.0.
	self assert: accept at: 3 main: 'text' sub: 'x-dvi' quality: 0.8.
	self assert: accept at: 4 main: 'text' sub: 'x-c' quality: 1.0
]

{ #category : #tests }
WAAcceptTest >> testRfc3 [
	"http://tools.ietf.org/html/rfc2616#section-14.1"
	| accept |
	accept := WAAccept fromString: 'text/*, text/html, text/html;level=1, */*'.
	self assert: accept size = 4.
	self assert: accept at: 1 main: 'text' sub: '*' quality: 1.0.
	self assert: accept at: 2 main: 'text' sub: 'html' quality: 1.0.
	self assert: accept at: 3 main: 'text' sub: 'html' quality: 1.0.
	self assert: accept at: 4 main: '*' sub: '*' quality: 1.0
]

{ #category : #tests }
WAAcceptTest >> testRfc4 [
	"http://tools.ietf.org/html/rfc2616#section-14.1"
	| accept |
	accept := WAAccept fromString: 'text/*;q=0.3, text/html;q=0.7, text/html;level=1, text/html;level=2;q=0.4, */*;q=0.5'.
	self assert: accept size = 5.
	self assert: accept at: 1 main: 'text' sub: '*' quality: 0.3.
	self assert: accept at: 2 main: 'text' sub: 'html' quality: 0.7.
	self assert: accept at: 3 main: 'text' sub: 'html' quality: 1.0.
	self assert: accept at: 4 main: 'text' sub: 'html' quality: 0.4.
	self assert: accept at: 5 main: '*' sub: '*' quality: 0.5.
	
	self assert: ((accept at: 3) value parameters at: 'level') = '1'.
	self assert: ((accept at: 4) value parameters at: 'level') = '2'
]
