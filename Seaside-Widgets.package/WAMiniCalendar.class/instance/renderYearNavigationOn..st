rendering
renderYearNavigationOn: html
	html span
		class: 'calendarPrevious';
		with: [
			html anchor
				callback: [ self year: self year - 1 ];
				with: self year - 1 ].
	html space.
	html span
		class: 'calendarNext';
		with: [
			html anchor
				callback: [ self year: self year + 1 ];
				with: self year + 1 ]