This is a convenience class which provides a result of a rendering operation as a string. It is expected to be used like this:

WAHtmlCanvas builder render: [ :html |
	html anchor
		url: 'htttp://www.seaside.st';
		with: 'Seaside Homepage' ]

See WABuilderCanvasTest for more examples.