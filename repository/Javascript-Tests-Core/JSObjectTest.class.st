Class {
	#name : #JSObjectTest,
	#superclass : #WAContextTest,
	#category : 'Javascript-Tests-Core'
}

{ #category : #testing }
JSObjectTest class >> isAbstract [
	^ self name = #JSObjectTest
]

{ #category : #accessing }
JSObjectTest class >> packageNamesUnderTest [
	^ #('Javascript-Core')
]

{ #category : #testing }
JSObjectTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #asserting }
JSObjectTest >> assert: anObject equals: aString [
	self
		assert: anObject asJavascript = aString
		description: anObject asJavascript printString , ' expected to be ' , aString printString
		resumable: true
]

{ #category : #utilities }
JSObjectTest >> assert: aBlock renders: aString [ 
	| html |
	html := WAHtmlCanvas builder
		documentClass: WAHtmlDocument;
		rootClass: WAHtmlRoot;
		fullDocument: false;
		render: aBlock.
	self 
		assert: html = aString
		description: 'Got ' , html printString , '; but expected ' , aString printString
]

{ #category : #configuration }
JSObjectTest >> createHandlers [
	^ Array with: WARequestHandler new
]

{ #category : #'accessing-javascript' }
JSObjectTest >> javascript [
	^ JSScript context: self renderContext
]

{ #category : #'accessing-javascript' }
JSObjectTest >> mock [
	^ JSStream on: 'mock'
]

{ #category : #accessing }
JSObjectTest >> renderContext [
	^ WARenderContext new
		actionUrl: (WAUrl absolute: 'http://www.seaside.st/?_s=1&_k=a');
		document: (WAHtmlDocument 
			on: (WriteStream on: String new)
			codec: self requestContext codec);
		yourself
]

{ #category : #'accessing-javascript' }
JSObjectTest >> stream [
	^ JSStream new
]
