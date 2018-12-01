Class {
	#name : #SUEffectsTest,
	#superclass : #SUFunctionalTest,
	#category : 'Scriptaculous-Tests-Core-Functional'
}

{ #category : #accessing }
SUEffectsTest >> effects [
	^ #( appear fade puff blindDown blindUp switchOff slideDown slideUp dropOut shake pulsate squish fold grow shrink highlight )
]

{ #category : #rendering }
SUEffectsTest >> renderContentOn: html [
	html paragraph: [
		self effects do: [ :each |
			html anchor
				onClick: (html scriptaculous effect
					id: 'effect';
					perform: each);
				with: (self labelForSelector: each) ]
			separatedBy: [ html text: ', ' ] ].
	self renderBox: 'effect' on: html
]
