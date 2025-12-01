Class {
	#name : 'WAWebSocketCounterExample',
	#superclass : 'WAComponent',
	#classVars : [
		'CounterModel',
		'Pusher'
	],
	#category : 'Seaside-WebSocket-Examples',
	#package : 'Seaside-WebSocket-Examples'
}

{ #category : 'class initialization' }
WAWebSocketCounterExample class >> initialize [
	| application |
	application := WAAdmin register: self asApplicationAt: 'examples/websockets/counter'.
	application addLibrary: JQDeploymentLibrary
]

{ #category : 'accessing' }
WAWebSocketCounterExample class >> model [
	^ CounterModel ifNil: [ CounterModel := WACounterModel new ]
]

{ #category : 'accessing' }
WAWebSocketCounterExample class >> pusher [
	^ Pusher ifNil: [ Pusher := WAWebSocketJSPusher new ]
]

{ #category : 'actions' }
WAWebSocketCounterExample >> decrease [

	self model decrease.
	self update: #decrease
]

{ #category : 'actions' }
WAWebSocketCounterExample >> increase [

	self model increase.
	self update: #increase
]

{ #category : 'accessing' }
WAWebSocketCounterExample >> model [
	^ self class model
]

{ #category : 'accessing' }
WAWebSocketCounterExample >> pusher [

	^ self class pusher
]

{ #category : 'rendering' }
WAWebSocketCounterExample >> renderContentOn: html [

	html document 
		addLoadScript: (html websocket pusher: self pusher).

	html heading
		id: #count;
		with: self model count.

	html paragraph: [
		html anchor
			onClick: (html jQuery ajax callback: [ self decrease ]);
			with: '--'.
		html space; space; space.
		html anchor
			onClick: (html jQuery ajax callback: [ self increase ]);
			with: '++' ].
]

{ #category : 'hooks' }
WAWebSocketCounterExample >> style [
	^ 'body {
	color: #222;
	font-size: 4em;
	line-height: 1.5;
	text-align: center;
	font-family: "Helvetica Neue", Helvetica, Verdana, Arial, sans-serif;
}
h1 { font-weight: bold; }
a {
	color: #555;
	cursor: pointer;
	text-decoration: none;	
}'
]

{ #category : 'updating' }
WAWebSocketCounterExample >> update: anAspect [
	"Update the counter in all connected web browsers. 
	Only the first 3 lines are really needed, the rest adds some eye-candy and can simply be removed if not needed."

	self pusher javascript: [ :script |
		script << (script jQuery: #count) 
			text: self model count;
			append: [ :html |
				html span: [
					html html: (anAspect = #increase
						ifTrue: [ '&uarr;' ]
						ifFalse: [ '&darr;' ]) ] ];
			find: 'span'; fadeOut: 'slow' ]
]
