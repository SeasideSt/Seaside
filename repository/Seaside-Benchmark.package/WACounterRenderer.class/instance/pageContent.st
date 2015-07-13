private
pageContent
	^ WAHtmlCanvas builder
		fullDocument: true;
		rootBlock: [ :root | root title: 'counter' ];
		render: [ :html |
			html heading: 0.
			html anchor
				with: '++'.
			html space.
			html anchor
				with: '--' ]