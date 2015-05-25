rendering
renderRow: anObject index: aNumber on: html
	self renderHeadingForRow: anObject on: html.
	self
		datesDo: [ :date | 
			self
				renderCellForDate: date
				row: anObject
				index: aNumber
				on: html ]
		separatedBy: [ self renderHeadingSpacerOn: html ]