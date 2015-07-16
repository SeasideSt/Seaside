*jquery-ui-private
smalltalkForEvent: anArraySpec value: aString
	| stream result |
	stream := aString readStream.
	result := GRSmallDictionary new.
	anArraySpec do: [ :spec |
		(spec first = #number)
			ifTrue: [ result at: spec last put: (stream upTo: $,) greaseInteger ].
		(spec first = #string)
				ifTrue: [ result at: spec last put: (stream upTo: $,) ].
		(spec first = #passenger)
			ifTrue: [ result at: spec last put: (self renderContext callbacks passengerAt: (stream upTo: $,)) ].
		(spec first = #position)
			ifTrue: [ result at: spec last put: (GRSmallDictionary new add: 'top' -> (stream upTo: $,) greaseInteger; add: 'left' -> (stream upTo: $,) greaseInteger; yourself) ].
		(spec first = #size)
			ifTrue: [ result at: spec last put: (stream upTo: $,) greaseInteger @ (stream upTo: $,) greaseInteger ] ].
	^ result