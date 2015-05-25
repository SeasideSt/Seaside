rendering
renderHeadingOn: html
	html div
		class: 'header';
		with: [
			html heading
				level1;
				class: 'welcome';
				with: self title.
			
			html heading
				level2;
				class: 'congrats';
				with: 'Congratulations, you have a working Seaside environment.' ]
