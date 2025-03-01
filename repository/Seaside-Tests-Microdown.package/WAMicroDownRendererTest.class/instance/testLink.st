basic tests
testLink

	self
		assertMicroDown: '[Programmatic HTML generation](https://github.com/SeasideSt/Seaside/wiki/Generating-HTML)'
		rendersTo: '<p><a href="https://github.com/SeasideSt/Seaside/wiki/Generating-HTML">Programmatic HTML generation</a></p>'