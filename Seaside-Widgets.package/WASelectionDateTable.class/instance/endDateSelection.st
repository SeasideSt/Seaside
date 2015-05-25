private
endDateSelection
	^ dateSelectionStart isNil
		ifFalse: [ dateSelectionStart max: dateSelectionEnd ]