rendering
renderBodyOn: html
	html table
		cellspacing: 0;
		class: 'main';
		with: [ self renderCalendarOn: html ]

			