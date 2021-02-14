Class {
	#name : #CTSlider,
	#superclass : #WAComponent,
	#classInstVars : [
		'value',
		'pusher'
	],
	#category : 'Comet-Examples'
}

{ #category : #initialization }
CTSlider class >> initialize [
	| application |
	application := WAAdmin register: self asApplicationAt: 'comet/slider'.
	application 
		addLibrary: JQDevelopmentLibrary;
		addLibrary: JQUiDevelopmentLibrary;
		addLibrary: JQSmoothnessTheme;
		addLibrary: CTLibrary
]

{ #category : #accessing }
CTSlider class >> pusher [
	^ pusher ifNil: [ pusher := CTPusher new ]
]

{ #category : #accessing }
CTSlider class >> value [
	^ value ifNil: [ value := 50 ]
]

{ #category : #accessing }
CTSlider class >> value: aNumber [
	value := aNumber.
	self pusher javascript: [ :script |
		script << (script jQuery: #slider) slider
			action: 'value'
			arguments: (Array with: value) ]
]

{ #category : #rendering }
CTSlider >> renderContentOn: html [
	html div
		id: #slider;
		script: (html jQuery new slider
			value: self class value;
			onStop: (html jQuery ajax
				callback: [ :value | self class value: value asNumber ]
				value: (html jQuery this slider getValue))).
	html document
		addLoadScript: (html comet
			pusher: self class pusher;
			connect)
]
