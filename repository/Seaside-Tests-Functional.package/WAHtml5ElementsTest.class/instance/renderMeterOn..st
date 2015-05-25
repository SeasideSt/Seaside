rendering
renderMeterOn: html
	html heading level2; with: '<meter>'.
	
	html meter
		min: 1;
		max: 100;
		value: 75;
		title: 'test pass rate';
		with: '75%'.
	html break.
	html meter
		min: 1;
		max: 100;
		low: 20;
		high: 80;
		optimum: 70;
		value: 66;
		title: 'humidity';
		with: '66%'