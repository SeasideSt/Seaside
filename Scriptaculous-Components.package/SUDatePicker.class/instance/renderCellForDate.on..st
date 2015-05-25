rendering
renderCellForDate: aDate on: html
	html tableData
		class: 'day';
		class: 'daySelected' if: self date = aDate;
		with: [
			aDate monthIndex = self monthIndex ifTrue: [
					(self canSelect: aDate)
						ifTrue: [
							html anchor
								class: 'today' if: aDate = Date today;
								onClick: (self ajaxCallbackFor: aDate on: html);
								with: aDate dayOfMonth ]
						ifFalse: [ html text: aDate dayOfMonth ] ] ]