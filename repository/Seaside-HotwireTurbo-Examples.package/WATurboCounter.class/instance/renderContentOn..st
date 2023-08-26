rendering
renderContentOn: html

	html heading: counter.
	html anchor
		callback: [ self increase ];
		with: '++'.
	html space.
	html anchor
		callback: [ self decrease ];
		with: '--'