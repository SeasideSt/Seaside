Class {
	#name : 'WAWebSocketSliderExample',
	#superclass : 'WAComponent',
	#classVars : [
		'Pusher',
		'Value'
	],
	#category : 'Seaside-WebSocket-Examples',
	#package : 'Seaside-WebSocket-Examples'
}

{ #category : 'accessing' }
WAWebSocketSliderExample class >> initialize [
	| application |
	application := WAAdmin register: self asApplicationAt: 'examples/websockets/slider'.
	application 
		addLibrary: JQDevelopmentLibrary;
		addLibrary: JQUiDevelopmentLibrary;
		addLibrary: JQSmoothnessTheme
]

{ #category : 'accessing' }
WAWebSocketSliderExample class >> pusher [
	^ Pusher ifNil: [ Pusher := WAWebSocketJSPusher new ]
]

{ #category : 'accessing' }
WAWebSocketSliderExample class >> value [
	^ Value ifNil: [ Value := 50 ]
]

{ #category : 'accessing' }
WAWebSocketSliderExample class >> value: aNumber [
	Value := aNumber.
	self pusher javascript: [ :script |
		script << (script jQuery: #slider) slider
			action: 'value'
			arguments: (Array with: Value) ]
]

{ #category : 'rendering' }
WAWebSocketSliderExample >> renderContentOn: html [
	html div
		id: #slider;
		script: (html jQuery new slider
			value: self class value;
			onStop: (html jQuery ajax
				callback: [ :value | self class value: value asNumber ]
				value: (html jQuery this slider getValue))).
	html document
		addLoadScript: (html websocket pusher: self class pusher)
]
