tests
testRenderOn
	self 
		assert: [ :html | html html: (html javascript render: 123) ]
		renders: '123'.
	self 
		assert: [ :html | html html: (html javascript render: 'abc') ]
		renders: 'abc'.
	self 
		assert: [ :html | html html: (html javascript render: [ :h | h div ]) ]
		renders: '<div></div>'