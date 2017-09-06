rendering
renderContentOn: html
	html heading: count.
	html anchor
		extraPath: '..';
		extraPath: (self count + 1) greaseString;
		callback: [ self increase ];
		with: '++'.
	html space.
	html anchor
		extraPath: '..';
		extraPath: (self count - 1) greaseString;
		callback: [ self decrease ];
		with: '--'