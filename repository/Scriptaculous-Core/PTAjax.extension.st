Extension { #name : #PTAjax }

{ #category : #'*Scriptaculous-Core-triggers' }
PTAjax >> triggerAutocompleter: aBlock [
	"Triggers an autocompleter, not that you need to define a passanger for the list items to make this work."

	self
		callback: [ :value | aBlock value: (self renderContext callbacks passengerAt: value) ]
		value: (JSStream on: 'arguments[1].id')
]

{ #category : #'*Scriptaculous-Core' }
PTAjax >> triggerSliderCallback: aBlock [
	self
		callback: [ :value | aBlock value: value asNumber ]
		value: (JSStream argument: 0)
]

{ #category : #'*Scriptaculous-Core' }
PTAjax >> triggerSortable: aString callback: aBlock [
	self
		callback: [ :value |
			aBlock value: (GRPlatform subStringsIn: value splitBy: $,
				collect: [ :each | self renderContext callbacks passengerAt: each ]) ]
		value: (SUSortable new
			id: aString;
			sequence)
]

{ #category : #'*Scriptaculous-Core' }
PTAjax >> triggerTree: aString callback: aBlock [
	self
		callback: [ :values |
			aBlock value: (Array streamContents: [ :stream |
				GRPlatform subStringsIn: values splitBy: $, do: [ :token |
					| pair |
					pair := GRPlatform subStringsIn: token splitBy: $:
						collect: [ :each | self renderContext callbacks passengerAt: each ifAbsent: [ nil ] ].
					pair size = 2
						ifTrue: [ stream nextPut: pair first -> pair second ] ] ]) ]
		value: (SUSortable new 
			id: aString;
			tree)
]
