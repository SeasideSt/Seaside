rendering
renderTableRowsOn: html
	self rows do: [ :ea | 
		ea = #-
			ifTrue: [ self renderSpacerRowOn: html ]
			ifFalse: [ self renderRowForSelector: ea on: html ] ]