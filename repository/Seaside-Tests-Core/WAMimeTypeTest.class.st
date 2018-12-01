Class {
	#name : #WAMimeTypeTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-Core-HTTP'
}

{ #category : #tests }
WAMimeTypeTest >> testBasic [
	| mimeType |
	mimeType := WAMimeType fromString: 'image/jpeg'.
	self assert: mimeType main = 'image'.
	self assert: mimeType sub = 'jpeg'.
	self assert: mimeType parameters isEmpty.
	self assert: mimeType greaseString = 'image/jpeg'
]

{ #category : #tests }
WAMimeTypeTest >> testCharSet [
	| mimeType |
	mimeType := WAMimeType fromString: 'text/html'.
	mimeType charset: 'utf-8'.
	self assert: mimeType greaseString = 'text/html;charset=utf-8'
]

{ #category : #tests }
WAMimeTypeTest >> testConversion [
	| mimeType |
	mimeType := 'image/jpeg' seasideMimeType.
	self assert: (mimeType isKindOf: WAMimeType).
	self assert: mimeType main = 'image'.
	self assert: mimeType sub = 'jpeg'.
	self assert: mimeType parameters isEmpty.
	self assert: mimeType greaseString = 'image/jpeg'.
	mimeType := mimeType seasideMimeType.
	self assert: (mimeType isKindOf: WAMimeType)
]

{ #category : #tests }
WAMimeTypeTest >> testEquals [
	| first second |
	first := WAMimeType fromString: 'text/html'.
	second := WAMimeType fromString: 'text/html'.
	
	self assert: first = second.
	self assert: first hash = second hash.
	
	second charset: 'utf-8'.
	self assert: first = second.
	self assert: first hash = second hash.
	
	first charset: 'iso-8859-1'.
	self assert: first = second.
	self assert: first hash = second hash.
	
	second := WAMimeType fromString: 'text/xml'.
	self deny: first = second
	
	
	
]

{ #category : #tests }
WAMimeTypeTest >> testIsBinary [
	| notBinary binary |
	notBinary := #('text/plain' 'text/bar' 'application/x-javascript' 'application/xhml+xml' 'application/xml').
	notBinary do: [ :each |
		| mimeType |
		mimeType := WAMimeType fromString: each.
		self deny: mimeType isBinary ].
	
	binary := #('application/octet-stream' 'image/jpeg').
	binary do: [ :each |
		| mimeType |
		mimeType := WAMimeType fromString: each.
		self assert: mimeType isBinary ]
]

{ #category : #tests }
WAMimeTypeTest >> testIsNonStandard [
	| mimeType |
	mimeType := WAMimeType fromString: 'image/png'.
	self deny: mimeType isNonStandard.
	
	mimeType := WAMimeType fromString: 'image/x-icon'.
	self assert: mimeType isNonStandard.
	
	mimeType := WAMimeType fromString: 'image/X-icon'.
	self assert: mimeType isNonStandard.
	
	mimeType := WAMimeType fromString: 'x-icon/image'.
	self assert: mimeType isNonStandard.
	
	mimeType := WAMimeType fromString: 'X-icon/image'.
	self assert: mimeType isNonStandard
	
	
]

{ #category : #tests }
WAMimeTypeTest >> testIsVendorSpecifc [
	| mimeType |
	mimeType := WAMimeType fromString: 'image/png'.
	self deny: mimeType isVendorSpecific.
	
	mimeType := WAMimeType fromString: 'image/vnd.microsoft.icon'.
	self assert: mimeType isVendorSpecific.
	
	mimeType := WAMimeType fromString: 'vnd.microsoft.icon/image'.
	self deny: mimeType isVendorSpecific
	
	
]

{ #category : #tests }
WAMimeTypeTest >> testIssue655 [
	"Regression test for Issue 655 where java.net.HttpURLConnection would provide fucked up headers."
	| mimeType |
	mimeType := WAMimeType fromString: '*; q=.2'.
	self assert: mimeType main = '*'.
	self assert: mimeType sub = '*'.
	self assert: (mimeType parameters at: 'q') = '.2'.
	
	mimeType := WAMimeType fromString: '*'.
	self assert: mimeType main = '*'.
	self assert: mimeType sub = '*'.
	self assert: (mimeType parameters at: 'q' ifAbsent: [ nil ]) isNil
]

{ #category : #tests }
WAMimeTypeTest >> testJson [
	"regression test for
	http://code.google.com/p/seaside/issues/detail?id=759"
	self deny: (WAMimeType fromString: 'text/json') isBinary.
	self deny: (WAMimeType fromString: 'application/json') isBinary
]

{ #category : #tests }
WAMimeTypeTest >> testMatches [
	| pattern mimeType |
	pattern := WAMimeType fromString: 'image/png'.
	mimeType := WAMimeType fromString: 'image/png'.
	self assert: (mimeType matches: pattern).
	
	mimeType := WAMimeType fromString: 'image/gif'.
	self deny: (mimeType matches: pattern).
	
	pattern := WAMimeType fromString: 'image/*'.
	mimeType := WAMimeType fromString: 'image/png'.
	self assert: (mimeType matches: pattern).
	
	mimeType := WAMimeType fromString: 'text/html'.
	self deny: (mimeType matches: pattern).
	
	pattern := WAMimeType fromString: '*/*'.
	mimeType := WAMimeType fromString: 'image/png'.
	self assert: (mimeType matches: pattern)
]

{ #category : #tests }
WAMimeTypeTest >> testNoCharSet [
	| mimeType |
	mimeType := WAMimeType fromString: 'text/html'.
	self assert: mimeType charSet isNil
]

{ #category : #tests }
WAMimeTypeTest >> testParamters [
	^ #('text/html;charset=utf-8' 'text/html; charset=utf-8' ) do: [ :each | 
		| mimeType |
		mimeType := WAMimeType fromString: each.
		self assert: mimeType main = 'text'.
		self assert: mimeType sub = 'html'.
		self assert: mimeType parameters size = 1.
		self assert: (mimeType parameters at: 'charset') = 'utf-8'.
		self assert: mimeType greaseString = 'text/html;charset=utf-8' ]
]
