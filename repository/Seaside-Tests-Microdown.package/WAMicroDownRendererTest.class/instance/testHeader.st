basic tests
testHeader

	self
		assertMicroDown: '# Heading 1'
		rendersTo: '<h1>Heading 1</h1>'.

	self
		assertMicroDown: '## Heading 2'
		rendersTo: '<h2>Heading 2</h2>'.

	self
		assertMicroDown: '### Heading 3'
		rendersTo: '<h3>Heading 3</h3>'.