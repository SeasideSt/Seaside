rendering
renderContentOn: html

	html document 
		addLoadScript: (html websocket pusher: self pusher).

	html heading
		id: #count;
		with: self model count.

	html paragraph: [
		html anchor
			onClick: (html jQuery ajax callback: [ self decrease ]);
			with: '--'.
		html space; space; space.
		html anchor
			onClick: (html jQuery ajax callback: [ self increase ]);
			with: '++' ].