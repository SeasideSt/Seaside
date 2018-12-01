Extension { #name : #PTAjax }

{ #category : #'*scriptaculous-core-triggers' }
PTAjax >> triggerAutocompleter: aBlock [
	"Triggers an autocompleter, not that you need to define a passanger for the list items to make this work."

	aBlock fixCallbackTemps.
	self
		callback: [ :value | aBlock value: (self renderContext callbacks passengerAt: value) ]
		value: (JSStream on: 'arguments[1].id')
]

{ #category : #'*scriptaculous-core-triggers' }
PTAjax >> triggerSliderCallback: aBlock [
	aBlock fixCallbackTemps.
	self
		callback: [ :value | aBlock value: value asNumber ]
		value: (JSStream argument: 0)
]

{ #category : #'*scriptaculous-core-triggers' }
PTAjax >> triggerSortable: aString callback: aBlock [
	aBlock fixCallbackTemps.
	self
		callback: [ :value |
			aBlock value: ((value substrings: ',') 
				collect: [ :each | self renderContext callbacks passengerAt: each ]) ]
		value: (SUSortable new
			id: aString;
			sequence)
]

{ #category : #'*scriptaculous-core-triggers' }
PTAjax >> triggerTree: aString callback: aBlock [
	aBlock fixCallbackTemps.
	self
		callback: [ :values |
			aBlock value: (Array streamContents: [ :stream |
				(values substrings: ',') do: [ :token |
					| pair |
					pair := (token subStrings: ':')
						collect: [ :each | self renderContext callbacks passengerAt: each ifAbsent: [ nil ] ].
					pair size = 2
						ifTrue: [ stream nextPut: pair first -> pair second ] ] ]) ]
		value: (SUSortable new 
			id: aString;
			tree)
]
