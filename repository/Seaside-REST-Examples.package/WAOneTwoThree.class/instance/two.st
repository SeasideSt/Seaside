routes
two
	<get>
	<path: 'two'>
	<produces: 'text/html'>
	"pay attention to ^
	pay attention to <produces: 'text/html'>"
	^ WAHtmlCanvas builder
		fullDocument: true;
		render: [ :html |
			html render: WATwo new ]