rendering
renderHeadingOn: html
	html heading class: 'logo'; with: [
		html anchor
			url: (WAUrl new 
				host: 'www.seaside.st';
				yourself);
			with: 'Seaside' ].
	html heading class: 'title'; with: [
		html anchor
			url: self dispatcher url;
			with: self title ]