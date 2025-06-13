rendering
renderContentOn: html

	html paragraph: ('I am also wrapped in a turboframe. I display the counter {1}.' format: { count asString }).
	html anchor
		callback: [ self answer ];
		with: 'Clicking me should replace me with my caller'.
	html break.
	html anchor
		callback: [ count := count + 1 ];
		with: 'Clicking me should only increment my counter.'