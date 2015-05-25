private
startRowSelection
	^ rowSelectionStart isNil
		ifFalse: [ rows at: (rowSelectionStart min: rowSelectionEnd) ]