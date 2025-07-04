rendering
renderContentOn: html

	html heading: counter.
	html anchor
		turboAction: 'replace';
		callback: [ self increase ];
		with: '++'.
	html space.
	html anchor
		turboAction: 'replace';
		callback: [ self decrease ];
		with: '--'