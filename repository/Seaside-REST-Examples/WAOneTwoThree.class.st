"
I demonstrate how to use different rendering options with Seaside-REST including:
- rendering directly with a canvas #one
- rendering with a painter #two
- starting a session #three
"
Class {
	#name : #WAOneTwoThree,
	#superclass : #WARestfulComponentFilter,
	#category : 'Seaside-REST-Examples'
}

{ #category : #registration }
WAOneTwoThree class >> register [
	(WAAdmin register: WAComponent asApplicationAt: '123')
		addFilter: WAOneTwoThree new
]

{ #category : #routes }
WAOneTwoThree >> one [
	<get>
	<path: 'one'>
	<produces: 'text/html'>
	"pay attention to ^
	pay attention to <produces: 'text/html'>"
	^ WAHtmlCanvas builder
		fullDocument: true;
		render: [ :html |
			html heading: 'One'.
			html anchor
				url: self requestContext request url;
				extraPath: '..';
				extraPath: 'two';
				with: 'two' ]
]

{ #category : #routes }
WAOneTwoThree >> root [
	<get>
	<path: '/'>
	self requestContext redirectTo: (self requestContext request url with: 'one')
]

{ #category : #routes }
WAOneTwoThree >> three [
	<get>
	<path: 'three'>
	"pay attention no ^
	pay attention no <produces: 'text/html'>"
	self startSessionWithRoot: WAThree new
]

{ #category : #routes }
WAOneTwoThree >> two [
	<get>
	<path: 'two'>
	<produces: 'text/html'>
	"pay attention to ^
	pay attention to <produces: 'text/html'>"
	^ WAHtmlCanvas builder
		fullDocument: true;
		render: [ :html |
			html render: WATwo new ]
]
