rendering
renderYearNavigationOn: html
	html table
		class: 'yearTable';
		cellspacing:0;
		with: [	
			html tableRow: [
				html tableData
					class: 'year';
					with: [
						html anchor
							callback: [ self previousYear ];
							onClick:	(html scriptaculous evaluator
										callback: [ :script |
											self previousYearUpdateOn: script ];
											return: false);
							with: (self year - 1) ].
				html tableData
					class: 'year';
					class: 'yearCurrent';
					with: (self year name).
				html tableData
					class: 'year';
					with: [
						html anchor
							callback: [ self nextYear ];
							onClick: ((html prototype evaluator)
										callback: [ :script | self nextYearUpdateOn: script ];
										return: false);
							with: (self year + 1) ] ] ]