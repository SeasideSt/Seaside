rendering
renderContentOn: html

	html heading: counter.
	html anchor
		turboCallback: [ self increase ];
		with: '++'.
	html space.
	html anchor
		turboCallback: [ self decrease ];
		with: '--'