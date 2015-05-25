private
selectionContainsDate: aDate rowIndex: aNumber
	^ ((aDate between: dateSelectionStart and: dateSelectionEnd)
		or: [ aDate between: dateSelectionEnd and: dateSelectionStart ])
		and: [ 
			(aNumber between: rowSelectionStart and: rowSelectionEnd)
				or: [ aNumber between: rowSelectionEnd and: rowSelectionStart ] ]