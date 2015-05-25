rendering
renderContentOn: html
	html heading
		id: #count;
		with: self model count.
	html paragraph: [
		html anchor
			onClick: (html jQuery ajax
				callback: [ self decrease ]);
			with: 'dec'.
		html space; space; space.
		html anchor
			onClick: (html jQuery ajax
				callback: [ self increase ]);
			with: 'inc' ].
	html document 
		addLoadScript: (html comet
			pusher: self pusher;
			connect)