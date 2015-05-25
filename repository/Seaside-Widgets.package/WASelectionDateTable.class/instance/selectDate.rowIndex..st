private
selectDate: aDate rowIndex: rowIndex
	self hasSelection
		ifFalse: [ 
			dateSelectionStart := dateSelectionEnd := aDate.
			rowSelectionStart := rowSelectionEnd := rowIndex ]
		ifTrue: [ 
			dateSelectionEnd := aDate.
			rowSelectionEnd := rowIndex ]