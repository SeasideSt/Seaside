routes
one
	<get>
	<path: 'one'>
	<produces: 'text/html'>
	"pay attention to ^
	pay attention to <produces: 'text/html'>"
	^ WAHtmlCanvas builder
		fullDocument: true;
		render: [ :html |
			html heading: 'One'.
			html anchor
				url: self requestContext request url;
				extraPath: '..';
				extraPath: 'two';
				with: 'two' ]