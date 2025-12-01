Class {
	#name : 'WAWebSocketTurboExample',
	#superclass : 'WAComponent',
	#instVars : [
		'pusher'
	],
	#category : 'Seaside-WebSocket-Examples',
	#package : 'Seaside-WebSocket-Examples'
}

{ #category : 'accessing' }
WAWebSocketTurboExample class >> description [
	^ 'WebSocket turbo stream'
]

{ #category : 'class initialization' }
WAWebSocketTurboExample class >> initialize [

	(WAAdmin register: self asApplicationAt: 'examples/websockets/turbo')
		addLibrary: JQDeploymentLibrary;
		preferenceAt: #actionPhaseContinuationClass put: WATurboCallbackProcessingActionContinuation;
		preferenceAt: #renderPhaseContinuationClass put: WATurboRenderPhaseContinuation
]

{ #category : 'accessing' }
WAWebSocketTurboExample >> pusher [
	^ pusher ifNil: [ pusher := WAWebSocketTurboStreamPusher new ]
]

{ #category : 'rendering' }
WAWebSocketTurboExample >> renderContentOn: html [
	
	| input |
	
	html paragraph: 'A websocket is setup with a turbostream on this page. Click the buttons to append, preprend or replace the text in the paragraph below'.

	html render: (WAWebSocketTurboStreamSource new pusher: self pusher).
	
	html basicForm: [
		html textInput
			callback: [ :value | input := value ];
			placeholder: 'Enter some text'.
		html button
			onClick: (html jQuery ajax serializeForm; callback: [ self pusher turboStream: [ :ts | ts append: #text with: input ] ]);
			with: 'Append'.
		html button
			onClick: (html jQuery ajax serializeForm; callback: [ self pusher turboStream: [ :ts | ts prepend: #text with: input ] ]);
			with: 'Prepend'.
		html button
			onClick: (html jQuery ajax serializeForm; callback: [ self pusher turboStream: [ :ts | ts replace: #text with: [:inner | inner paragraph id: #text; with: input ] ] ]);
			with: 'Replace'  ].
	
	html paragraph 
		id: #text;
		with: 'Turbostreams are awesome over websockets.'
]

{ #category : 'updating' }
WAWebSocketTurboExample >> updateRoot: aRoot [
	super updateRoot: aRoot.
	aRoot javascript
		type: 'module';
		"url: 'https://cdn.jsdelivr.net/npm/@hotwired/turbo@latest/dist/turbo.es2017-esm.min.js'."
		url: WATurboFileLibrary / #turboes2017esmminJs 
]
