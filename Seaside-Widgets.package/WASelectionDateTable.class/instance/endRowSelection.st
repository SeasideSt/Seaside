private
endRowSelection
	^ rowSelectionStart isNil
		ifFalse: [ rows at: (rowSelectionStart max: rowSelectionEnd) ]