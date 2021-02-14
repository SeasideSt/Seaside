Class {
	#name : #SUSliderTest,
	#superclass : #SUFunctionalTest,
	#instVars : [
		'position'
	],
	#category : 'Scriptaculous-Tests-Core-Functional'
}

{ #category : #initialization }
SUSliderTest >> initialize [
	super initialize.
	position := 50
]

{ #category : #rendering }
SUSliderTest >> renderContentOn: html [
	| trackId handleId positionId |
	trackId := html nextId.
	handleId := html nextId.
	positionId := html nextId.
	html paragraph: 'Slide between 0 and 100:'.
	html div id: trackId; class: 'track'; with: [ html div id: handleId; class: 'handle' ].
	html paragraph id: positionId; with: position.
	html script: (html scriptaculous slider
		handleId: handleId;
		trackId: trackId;
		value: position;
		range: (0 to: 100);
		onChange: (html scriptaculous updater
			id: positionId;
			triggerSliderCallback: [ :value | position := value rounded ];
			callback: [ :renderer | renderer render: position ]))
]

{ #category : #hooks }
SUSliderTest >> style [
	^ 'div.track {
	width: 200px; height: 5px;
	background-color: #eee;
}
div.handle {
	width: 5px; height: 10px;
	background-color: #e8a400;
	cursor: move;
}'
]
