private
startDateSelection
	^ dateSelectionStart isNil
		ifFalse: [ dateSelectionStart min: dateSelectionEnd ]