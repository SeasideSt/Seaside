rendering
renderContentOn: html

	html heading 
		level: 1; 
		with: count.
	html anchor
		callback: [ count := count + 1 ];
		with: '++'.
	html space.
	html anchor
		callback: [ count := count - 1 ];
		with: '--'.
	html space.
	html anchor
		callback: [ self answer: count ];
		with: 'Close'