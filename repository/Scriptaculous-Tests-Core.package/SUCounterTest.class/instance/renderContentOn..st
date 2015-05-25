rendering
renderContentOn: html
	| id |
	html paragraph: [
		html span
			id: (id := html nextId);
			with: count.
		html space.
		html anchor
			onClick: (html scriptaculous updater
				id: id;
				callback: [ :render | self increase; renderCountOn: render ]);
			with: '++'.
		html space.
		html anchor
			onClick: (html scriptaculous updater
				id: id;
				callback: [ :render | self decrease; renderCountOn: render ]);
			with: '--' ]