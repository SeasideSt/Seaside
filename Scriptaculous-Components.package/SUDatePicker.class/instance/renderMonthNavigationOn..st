rendering
renderMonthNavigationOn: html
html table class: 'monthTable';
	cellspacing:0;
	with: [	
		html tableRow
			class: 'monthRow';
			with: [
				html tableData
					class: 'calendarPrevious';
					with: [
						html anchor
							callback: [ self previousMonth ];
							onClick: (html prototype evaluator
									callback: [ :script |
										self previousMonthUpdateOn: script ];
							return: false);
							with: '<<' ].
				html tableData class: 'monthCurrent'; with: (Date nameOfMonth: self monthIndex).
				html tableData
					class: 'calendarNext';
					with: [
						html anchor
							callback: [ self nextMonth ] ;
							onClick: (html prototype evaluator
										callback: [ :script | 
											self nextMonthUpdateOn: script ];
										return: false);
							with: '>>' ] ] ]