*jquery-ui-private
javascriptForEvent: anArraySpec
	| stream |
	stream := JSStream new.
	anArraySpec
		do: [ :spec |
			(spec first = #number)
				ifTrue: [ stream nextPutAll: 'arguments[1].'; nextPutAll: spec second ].
			(spec first = #passenger)
				ifTrue: [ stream nextPutAll: JQuery functionName; nextPut: $(; nextPutAll: 'arguments[1].'; nextPutAll: spec second; nextPutAll: ').attr("id")' ].
			(spec first = #position)
				ifTrue: [ stream nextPutAll: 'arguments[1].'; nextPutAll: spec second; nextPutAll: '.top'; nextPutAll: '+","+'; nextPutAll: 'arguments[1].'; nextPutAll: spec second; nextPutAll: '.left' ].
			(spec first = #size)
				ifTrue: [ stream nextPutAll: 'arguments[1].'; nextPutAll: spec second; nextPutAll: '.width'; nextPutAll: '+","+'; nextPutAll: 'arguments[1].'; nextPutAll: spec second; nextPutAll: '.height' ] ]
		separatedBy: [ stream nextPutAll: '+","+' ].
	^ stream