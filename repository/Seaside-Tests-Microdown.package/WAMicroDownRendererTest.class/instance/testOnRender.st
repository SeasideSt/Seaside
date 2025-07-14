basic tests
testOnRender

	| microDownString renderedString |
	microDownString := '[Programmatic HTML generation](https://github.com/SeasideSt/Seaside/wiki/Generating-HTML)'.
	renderedString := WAHtmlCanvas builder render:[ :html | WAMicroDownRenderer on: html render: microDownString ].
	self assert: renderedString equals: '<p><a href="https://github.com/SeasideSt/Seaside/wiki/Generating-HTML">Programmatic HTML generation</a></p>'