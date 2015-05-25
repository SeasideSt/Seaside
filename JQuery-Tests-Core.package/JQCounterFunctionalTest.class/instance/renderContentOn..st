rendering
renderContentOn: html
	html paragraph: [
		html anchor
			url: 'javascript:void(0)';
			onClick: ((html jQuery: #count) load
				html: [ :h | h render: (count := count - 1) ]);
			with: '--'.
		html span
			id: #count;
			with: count.
		html anchor
			url: 'javascript:void(0)';
			onClick: ((html jQuery: #count) load
				html: [ :h | h render: (count := count + 1) ]);
			with: '++' ]