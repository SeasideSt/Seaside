rendering
renderCellForDate: aDate on: html
	html tableData: [
		(aDate monthIndex = self monthIndex and: [ aDate year = self year ])
			ifTrue: [
				html span
					class: (self date = aDate ifTrue: [ 'calendarArchiveDate' ]);
					with: [
						(self canSelect: aDate) 
							ifTrue: [
								html anchor
									callback: [ self select: aDate ];
									with: aDate dayOfMonth ]
							ifFalse: [ html text: aDate dayOfMonth ] ] ] ]