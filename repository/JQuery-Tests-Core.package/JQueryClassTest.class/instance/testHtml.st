tests-creation
testHtml
	self
		assert: (self jQuery html: [ :html | html div: 'foo' ])
		equals: self function , '("<div>foo<\/div>")'.
	self
		assert: (self jQuery html: [ :html | html div title: 'foo'; with: 'bar' ])
		equals: self function , '("<div title=\"foo\">bar<\/div>")'