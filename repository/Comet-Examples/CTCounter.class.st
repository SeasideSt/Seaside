Class {
	#name : #CTCounter,
	#superclass : #WAComponent,
	#classInstVars : [
		'model',
		'pusher'
	],
	#category : 'Comet-Examples'
}

{ #category : #initialization }
CTCounter class >> initialize [
	| application |
	application := WAAdmin register: self asApplicationAt: 'comet/counter'.
	application addLibrary: JQDeploymentLibrary; addLibrary: CTLibrary
]

{ #category : #accessing }
CTCounter class >> model [
	^ model ifNil: [ model := CTCounterModel new ]
]

{ #category : #accessing }
CTCounter class >> pusher [
	^ pusher ifNil: [ pusher := CTPusher new ]
]

{ #category : #actions }
CTCounter >> decrease [
	self model decrease.
	self update: #decrease
]

{ #category : #actions }
CTCounter >> increase [
	self model increase.
	self update: #increase
]

{ #category : #accessing }
CTCounter >> model [
	^ self class model
]

{ #category : #accessing }
CTCounter >> pusher [
	^ self class pusher
]

{ #category : #rendering }
CTCounter >> renderContentOn: html [
	html heading
		id: #count;
		with: self model count.
	html paragraph: [
		html anchor
			onClick: (html jQuery ajax
				callback: [ self decrease ]);
			with: 'dec'.
		html space; space; space.
		html anchor
			onClick: (html jQuery ajax
				callback: [ self increase ]);
			with: 'inc' ].
	html document 
		addLoadScript: (html comet
			pusher: self pusher;
			connect)
]

{ #category : #hooks }
CTCounter >> style [
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

{ #category : #private }
CTCounter >> update: anAspect [
	"Update the number in all connected web browser. Only the first 3 lines are really needed, the rest adds some eye-candy and can simply be removed if not needed."

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
