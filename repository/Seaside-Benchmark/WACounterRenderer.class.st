"
I'm a request handler that renders the HTML equivalent of a WACounter.
"
Class {
	#name : #WACounterRenderer,
	#superclass : #WARequestHandler,
	#category : 'Seaside-Benchmark'
}

{ #category : #'class initialization' }
WACounterRenderer class >> register [
	WADispatcher default
		register: self new at: 'fast-counter'
]

{ #category : #handling }
WACounterRenderer >> handleFiltered: aRequestContext [
	aRequestContext respond: [ :response |
		response
			contentType: WAMimeType textHtml;
			nextPutAll: self pageContent ]
]

{ #category : #private }
WACounterRenderer >> pageContent [
	^ WAHtmlCanvas builder
		fullDocument: true;
		rootBlock: [ :root | root title: 'counter' ];
		render: [ :html |
			html heading: 0.
			html anchor
				with: '++'.
			html space.
			html anchor
				with: '--' ]
]
