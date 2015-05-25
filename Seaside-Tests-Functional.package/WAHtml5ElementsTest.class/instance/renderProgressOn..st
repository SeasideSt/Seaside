rendering
renderProgressOn: html
	html heading level2; with: '<progress>'.
	
	html progress: 'Loading'.
	html break.
	html progress
		value: 2;
		max: 3;
		with: '66 %'